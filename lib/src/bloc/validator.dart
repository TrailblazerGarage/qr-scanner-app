import 'dart:async';

import 'package:qr_scanner_app/src/models/scan_model.dart';

class Validators {
  /// StreamTransformer<TypeOfDataIn, TypeOfDataOut>
  final validateGeo =
      StreamTransformer<List<ScanModel>, List<ScanModel>>.fromHandlers(
          handleData: (scans, sink) {
    final geoScans = scans.where((s) => s.type == 'geo').toList();
    sink.add(geoScans);
  });

  final validateHttp =
      StreamTransformer<List<ScanModel>, List<ScanModel>>.fromHandlers(
          handleData: (scans, sink) {
    final geoScans = scans.where((s) => s.type == 'http').toList();
    sink.add(geoScans);
  });
}
