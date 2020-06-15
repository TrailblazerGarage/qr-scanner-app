import 'package:flutter/material.dart';
import 'package:qr_scanner_app/src/models/scan_model.dart';

class MapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final ScanModel scan = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('QR Geolocation'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.my_location),
            onPressed: (){},
          )
        ]
      ),
      body: Center(
        child: Text( scan.content),
      )
    );
  }
}
