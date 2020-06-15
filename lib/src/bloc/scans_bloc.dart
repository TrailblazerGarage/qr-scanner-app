import 'dart:async';

import 'package:qr_scanner_app/src/providers/db_provider.dart';

class ScansBloc {

  static final ScansBloc _singleton = new ScansBloc._internal();

  factory ScansBloc() {
    return _singleton;
  }

  ScansBloc._internal() {
    obtainScans();
  }

  final _scansStreamController = StreamController<List<ScanModel>>.broadcast();

  Stream<List<ScanModel>> get scansStream => _scansStreamController.stream;

  dispose(){
    // ?. ensure that object is not null before call close()
    _scansStreamController?.close();
  }

  obtainScans() async {
    _scansStreamController.sink.add( await DBProvider.db.getAllScans() );
  }

  addScan( ScanModel scan ) async {
    await DBProvider.db.newScan(scan);
    obtainScans();
  }

  removeScan( int id ) async {
    await DBProvider.db.deleteScan(id);
    obtainScans();
  }

  removeScanAll() async {
    await DBProvider.db.deleteAll();
    obtainScans();
    // Instead of obtainScans _scansStreamController.sink.add([]);
  }
}