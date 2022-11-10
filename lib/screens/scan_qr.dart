import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presensi_bisnis/components/button.dart';
import 'package:presensi_bisnis/controller/absen_controller.dart';
import 'package:presensi_bisnis/screens/beranda.dart';
import 'package:presensi_bisnis/screens/input_manual.dart';
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
  late String npm;

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
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        // Do something here
        Get.offAll(() => Beranda());
        return false;
     },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Scan QR'),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 29, 133, 69)
        ),
        body: Container(
          child: Column(
              children: [
                // Text("matkul " + controller.matkul.string),
                // Text("tanggal " + controller.tanggal.string),
                SizedBox(
                  height: size.height * 0.6,
                  child: buildQrView(context),
                ),
                SizedBox(height: 20,),
                Button(
              buttonTap: () {
                controller!.pauseCamera();
                Get.to(() => InputManual());
              },
              buttonDesc: 'Presensi manual'),
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
        npm = result!.code.toString();
        if (GetUtils.isNum(npm) && npm.length == 8) {
          Get.to(() => Validasi(npm: npm,));
          controller.pauseCamera();
        } else {
          print('format tidak sesuai');
        }
      });
    });
  }
}