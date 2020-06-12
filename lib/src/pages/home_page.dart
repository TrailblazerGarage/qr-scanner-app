import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Home Page'),
      ),
      bottomNavigationBar: _createBottomNavigationBar()
    );
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
