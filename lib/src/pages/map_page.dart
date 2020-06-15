import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:qr_scanner_app/src/models/scan_model.dart';


class MapPage extends StatefulWidget {

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {

  final map = new MapController();
  String typeStyleMap = 'streets-v11';

  @override
  Widget build(BuildContext context) {

    final ScanModel scan = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('QR Geolocation'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.my_location),
            onPressed: (){
              map.move(scan.getLatLng(), 15);
            },
          )
        ]
      ),
      body: _createFlutterMap(scan),
      floatingActionButton: _createBottomFloat( context ),
    );
  }

  Widget _createBottomFloat( BuildContext context) {
    /// Types of styles provided by MapBox
    /// https://docs.mapbox.com/api/maps/#styles
    /// streets-v11,outdoors-v11,light-v10,dark-v10,satellite-streets-v11,satellite-v9
    return FloatingActionButton(
      child: Icon( Icons.repeat ),
      backgroundColor: Theme.of(context).primaryColor,
      onPressed: () {
        /// TODO the style of current portion of map is not changed onPressed only the parts around it
        typeStyleMap = (typeStyleMap == 'streets-v11' )
                        ? typeStyleMap = 'dark-v10'
                        : typeStyleMap = 'streets-v11';
        setState((){});
      },
    );
  }

  Widget _createFlutterMap( ScanModel scan ) {
    return new FlutterMap(
      mapController: map,
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
        urlTemplate: 'https://api.mapbox.com/styles/v1/mapbox/'
            '{id}/tiles/{z}/{x}/{y}?access_token={accessToken}',
        additionalOptions: {
          'accessToken':'pk.eyJ1IjoidHJhaWxibGF6ZXJzLWpob255dmlkYWwiLCJhIjoiY2tiZ3NqYzA3MThtZTJvbXVpdjA5NXVpbCJ9.AJuhjHqVqF49bO6JAqEpfg',
          'id': '$typeStyleMap'
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
