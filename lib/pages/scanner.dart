import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/pages/mainpage.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:url_launcher/url_launcher_string.dart';

// import 'package:example_qr_coed_reader/scanner.dart';
class Scanner extends StatefulWidget {
  @override
  _ScannerState createState() => _ScannerState();
}

class _ScannerState extends State<Scanner> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  dynamic controller;

//open camera and scan

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("Scanner"),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Column(
            children: <Widget>[
              Expanded(
                flex: 5,
                child: Stack(
                  children: [
                    QRView(
                      key: qrKey,
                      onQRViewCreated: _onQRViewCreated,
                    ),
                    Center(
                      child: Container(
                        width: 300,
                        height: 300,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.red,
                            width: 4,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Center(
                  child: Text('Scan a code'),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) async {
    // Access Firestore instance
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    this.controller = controller;
    controller.scannedDataStream.listen((scanData) async {
      controller.pauseCamera();
      DocumentReference documentReference =
          firestore.collection('uuuu').doc(scanData.code.toString());
      DocumentSnapshot docSnapshot = await documentReference.get();
      var data = docSnapshot.data() as Map<String, dynamic>?;
      if (await canLaunchUrlString(scanData.code.toString())) {
        await launchUrlString(scanData.code.toString());
        controller.resumeCamera();
      } else {
        var Price; // Declare Price variable outside the if block
        if (data != null) {
          Price = data['Prix'] as String?;
        }
        if (Price != null) {
          
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('This is a match'),
                content: SingleChildScrollView(
                  child: ListBody(
                    children: <Widget>[
                      Text('Article: ${scanData.code}'),
                      Text('Prix: ${Price}'),
                    ],
                  ),
                ),
                actions: <Widget>[
                  TextButton(
                    child: Text('Ajouter à votre panier'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MainPage(initialData:[Price])
                        ),
                      );
                    },
                  ),
                ],
              );
            },
          ).then((value) => controller.resumeCamera());
        } else {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Could not find the Article'),
                content: SingleChildScrollView(
                  child: ListBody(
                    children: <Widget>[
                      Text('Data: ${scanData.code}'),
                    ],
                  ),
                ),
                actions: <Widget>[
                  TextButton(
                    child: Text('Ok'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              );
            },
          ).then((value) => controller.resumeCamera());
        }
      }
    });
  }
}
