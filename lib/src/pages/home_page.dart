import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';

import 'package:qr_scanner_app/src/pages/directions_page.dart';
import 'package:qr_scanner_app/src/pages/maps_page.dart';


class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

  class _HomePageState extends State<HomePage>{

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Scanner'),
        actions: <Widget>[
          IconButton(
            icon: Icon( Icons.delete_forever ),
            onPressed: (){},
          )
        ]
      ),
      body: _callPage(currentIndex),
      bottomNavigationBar: _createBottomNavigationBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon( Icons.filter_center_focus ),
        onPressed: _scanQR,
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }

  _scanQR() async {

    // TODO Scan URL FutureString String: http://9dappsqa-env.eba-qr3rivfk.us-east-2.elasticbeanstalk.com/
    // TODO Scan Google Maps Future String: geo:40.78742919553978,-73.96268263300784

    dynamic futureString = '';

    try{
      futureString = await BarcodeScanner.scan();
    }catch(e) {
      futureString = e.toString();
    }

    print('Future String: ${futureString.rawContent}');

    if( futureString != null ){
      print('QR Data obtained');
    }
  }

  Widget _callPage( int currentPage ){
    switch( currentPage ) {
      case 0: return MapsPage();
      case 1: return DirectionsPage();

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
        BottomNavigationBarItem(
          icon: Icon( Icons.map ),
          title: Text('Mapas')
        ),
        BottomNavigationBarItem(
            icon: Icon( Icons.brightness_5 ),
            title: Text('Direcciones')
        ),
      ],
    );

  }
}
