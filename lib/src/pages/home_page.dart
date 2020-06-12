import 'package:flutter/material.dart';
import 'package:qr_scanner_app/src/pages/directions_page.dart';
import 'package:qr_scanner_app/src/pages/maps_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _callPage(0),
      bottomNavigationBar: _createBottomNavigationBar()
    );
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
      currentIndex: 0,
      onTap: (index) {},
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
