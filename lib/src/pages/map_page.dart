import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
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
      body: _createFlutterMap(scan)
    );
  }

  Widget _createFlutterMap( ScanModel scan ) {
    return new FlutterMap(
      options: new MapOptions(
        center: scan.getLatLng(),
        zoom: 15
      ),
      layers: [
        _createMap(),
        _createMarks( scan )
      ],
    );
  }

  _createMap() {
    return TileLayerOptions(
        urlTemplate: 'https://api.mapbox.com/styles/v1/mapbox/{id}/tiles'
            '/{z}/{x}/{y}?access_token={accessToken}',
        additionalOptions: {
          'accessToken':'pk.eyJ1IjoidHJhaWxibGF6ZXJzLWpob255dmlkYWwiLCJhIjoiY2tiZ3NqYzA3MThtZTJvbXVpdjA5NXVpbCJ9.AJuhjHqVqF49bO6JAqEpfg',
          'id': 'streets-v11'
          // streets, dark,light, outdoors, satellite
        }
    );
  }

  _createMarks( ScanModel scan ) {
    return MarkerLayerOptions(
      markers: <Marker>[
        Marker(
          width: 100.0,
          height: 100.0,
          point: scan.getLatLng(),
          builder: ( context ) => Container(
            child: Icon(
              Icons.location_on,
              size: 70.0,
              color: Theme.of(context).primaryColor,
            ),
          )
        )
      ]
    );
  }
}
