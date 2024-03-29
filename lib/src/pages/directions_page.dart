import 'package:flutter/material.dart';
import 'package:qr_scanner_app/src/bloc/scans_bloc.dart';
import 'package:qr_scanner_app/src/models/scan_model.dart';
import 'package:qr_scanner_app/src/utils/utils.dart' as utils;

class DirectionsPage extends StatelessWidget {
  final scansBloc = new ScansBloc();

  @override
  Widget build(BuildContext context) {
    scansBloc.obtainScans();

    return StreamBuilder<List<ScanModel>>(
      stream: scansBloc.scansStreamHttp,
      builder: (BuildContext context, AsyncSnapshot<List<ScanModel>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        final scans = snapshot.data;

        if (scans.length == 0) {
          return Center(
            child: Text('No information available.'),
          );
        }

        return ListView.builder(
            itemCount: scans.length,
            itemBuilder: (context, i) => Dismissible(
                  key: UniqueKey(),
                  background: Container(color: Colors.deepPurple),
                  onDismissed: (direction) => scansBloc.removeScan(scans[i].id),
                  child: ListTile(
                      leading: Icon(Icons.cloud_queue,
                          color: Theme.of(context).primaryColor),
                      title: Text(scans[i].content),
                      onTap: () => utils.launchURL(context, scans[i]),
                      subtitle: Text('ID: ${scans[i].id}'),
                      trailing:
                          Icon(Icons.keyboard_arrow_right, color: Colors.grey)),
                ));
      },
    );
  }
}
