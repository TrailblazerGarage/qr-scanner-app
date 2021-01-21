# QR Scanner App

This App uses [QR Barcode Scanner](https://github.com/dm77/barcodescanner), MapBox, SQLite3 for storage.

![](screenshots/screenshot_home.jpg)
![](screenshots/screenshot_scanner.jpg)
![](screenshots/screenshot_map.jpg)

#### Run the Applicaion

```
Open Emulator or connect your device
flutter devices (Check that Device Emulator is running)
flutter run (to run the application)
```

#### How it works?

With QR Scanner you can get http links or geo location info by reading a QR code using your camera device.
When the data collected is a http link then it will be saved on the directions tab and open it on a new browser window.
When the data collected is a geo location (lat, long) then it will be saved on the maps tab and a Mapbox map will open with the mark on the exactly geo location collected. 

#### Tecnnical Notes

Supported Formats
```
BarcodeFormat.UPC_A
BarcodeFormat.UPC_E
BarcodeFormat.EAN_13
BarcodeFormat.EAN_8
BarcodeFormat.RSS_14
BarcodeFormat.CODE_39
BarcodeFormat.CODE_93
BarcodeFormat.CODE_128
BarcodeFormat.ITF
BarcodeFormat.CODABAR
BarcodeFormat.QR_CODE
BarcodeFormat.DATA_MATRIX
BarcodeFormat.PDF_417
```
