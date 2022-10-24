import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presensi_bisnis/controller/absen_controller.dart';
import 'package:presensi_bisnis/screens/beranda.dart';
import 'package:presensi_bisnis/screens/validasi.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanQR extends StatefulWidget {
  ScanQR({ Key? key }) : super(key: key);

  @override
  State<ScanQR> createState() => _ScanQRState();
}

class _ScanQRState extends State<ScanQR> {
  final qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;

  @override
  void reassemble() async {
    super.reassemble();
    if (Platform.isAndroid) {
      await controller!.pauseCamera();
    } else if (Platform.isIOS) {
      await controller!.resumeCamera();
    }
  }

  @override
  void initState() {
    controller?.resumeCamera();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // QRController camControl = Get.put(QRController());
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        // Do something here
        Get.offAll(() => Beranda());
        return false;
     },
      child: Scaffold(
        body: Container(
          child: SingleChildScrollView(
            child: Column(
                children: [
                  // Text("matkul " + controller.matkul.string),
                  // Text("tanggal " + controller.tanggal.string),
                  SizedBox(
                    height: size.height * 0.6,
                    child: buildQrView(context),
                  ),
              //     Center(
              //   child: (result != null)
              //       ? Text(
              //           'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}')
              //       : Text('Scan a code'),
              // ),
                  
                ],
              ),
            ),
        ),
        
      ),
    );
  }

  Widget buildQrView(BuildContext) => QRView(
    key: qrKey,
    onQRViewCreated: _onQRViewCreated,
    overlay: QrScannerOverlayShape(),);

  void onQRViewCreated(QRViewController controller){
    setState(() => {
      this.controller = controller,
    }
    ); 
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.resumeCamera();
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
        Get.to(() => Validasi(npm: result!.code.toString(),));
        controller.pauseCamera();
      });
    });
  }
}