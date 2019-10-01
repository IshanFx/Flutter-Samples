import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);



  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _scanBarcode ="";

  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.

      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          "#42f5ef", "Cancel", true, ScanMode.QR);
      print(barcodeScanRes);

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(_scanBarcode),
            QrImage(
              data: "QR Code",
              version: QrVersions.auto,
              size: 200.0,
              backgroundColor:  Color.fromARGB(255, 200, 100, 100),
              foregroundColor: Color.fromARGB(255, 200, 25, 25),
              embeddedImage: AssetImage('assets/images/logo.png'),
                embeddedImageStyle : QrEmbeddedImageStyle(
                  size: Size.square(30),
                  color: Color.fromARGB(100, 10, 10, 10)
                )
            ),
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: scanBarcodeNormal,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
