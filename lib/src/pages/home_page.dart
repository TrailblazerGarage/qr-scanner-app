import 'dart:io';
import 'package:flutter/material.dart';

import 'package:barcode_scan/barcode_scan.dart';
import 'package:qr_scanner_app/src/bloc/scans_bloc.dart';
import 'package:qr_scanner_app/src/models/scan_model.dart';

import 'package:qr_scanner_app/src/pages/directions_page.dart';
import 'package:qr_scanner_app/src/pages/maps_page.dart';
import 'package:qr_scanner_app/src/utils/utils.dart' as utils;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scansBloc = new ScansBloc();

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('QR Scanner'), actions: <Widget>[
        IconButton(
          icon: Icon(Icons.delete_forever),
          onPressed: scansBloc.removeScanAll,
        )
      ]),
      body: _callPage(currentIndex),
      bottomNavigationBar: _createBottomNavigationBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.filter_center_focus),
        onPressed: _scanQR,
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }

  _scanQR() async {
    dynamic futureString;

    /// For local troubleshooting/development
    /// comment the try/catch block and uncomment one of the lines
    /// dynamic futureString = 'http://9dappsqa-env.eba-qr3rivfk.us-east-2.elasticbeanstalk.com/';
    /// dynamic futureString = 'geo:40.78742919553978,-73.96268263300784');
    try {
      futureString = await BarcodeScanner.scan();
    } catch (e) {
      futureString = e.toString();
    }

    if (futureString.rawContent != null) {
      final scan = ScanModel(content: futureString.rawContent);
      scansBloc.addScan(scan);

      /// Delay necessary on iOS devices
      if (Platform.isIOS) {
        Future.delayed(Duration(milliseconds: 750), () {
          utils.launchURL(context, scan);
        });
      } else {
        utils.launchURL(context, scan);
      }
    }
  }

  Widget _callPage(int currentPage) {
    switch (currentPage) {
      case 0:
        return MapsPage();
      case 1:
        return DirectionsPage();

      default:
        return MapsPage();
    }
  }

  Widget _createBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) {
        setState(() {
          currentIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.map), title: Text('Mapas')),
        BottomNavigationBarItem(
            icon: Icon(Icons.brightness_5), title: Text('Direcciones')),
      ],
    );
  }
}
