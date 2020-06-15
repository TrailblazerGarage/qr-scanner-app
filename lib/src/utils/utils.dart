import 'package:flutter/material.dart';
import 'package:qr_scanner_app/src/models/scan_model.dart';
import 'package:url_launcher/url_launcher.dart';

launchURL(BuildContext context, ScanModel scan ) async {

  if( scan.type == 'http' ){
    if( await canLaunch(scan.content)) {
      await launch(scan.content);
    } else { throw 'Could not launch ${ scan.content }'; }
  }else{
    Navigator.pushNamed(context, 'map', arguments: scan);
  }
}