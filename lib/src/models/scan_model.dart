import 'package:latlong/latlong.dart';

class ScanModel {

  int id;
  String type;
  String content;

  ScanModel({
    this.id,
    this.type,
    this.content,
  }){
    this.type = (this.content.contains('http'))
                ? this.type = 'http'
                : this.type = 'geo';
  }

  factory ScanModel.fromJson(Map<String, dynamic> json) => new ScanModel(
    id    : json["id"],
    type  : json["type"],
    content : json["content"],
  );

  Map<String, dynamic> toJson() => {
    "id"    : id,
    "type"  : type,
    "content" : content,
  };

  LatLng getLatLng() {
    // geo:40.78742919553978,-73.96268263300784
    final latlng = content.substring(4).split(',');
    final lat = double.parse( latlng[0] );
    final lng = double.parse( latlng[1] );

    return LatLng( lat, lng );
  }  
}
