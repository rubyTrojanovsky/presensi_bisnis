import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presensi_bisnis/components/button.dart';

import 'package:presensi_bisnis/controller/absen_controller.dart';
import 'package:presensi_bisnis/models/mahasiswa_model.dart';
import 'package:presensi_bisnis/services/api_provider.dart';
import 'package:presensi_bisnis/screens/beranda.dart';
import 'package:presensi_bisnis/screens/input_manual.dart';
import 'package:presensi_bisnis/screens/validasi.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanQR extends StatefulWidget {
  ScanQR({Key? key}) : super(key: key);

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
    Size size = MediaQuery.of(context).size;
    AbsenController npmController = Get.put(AbsenController());
    final validator = Get.put(MhsController());
    validator.getSpecificMhs();
    return WillPopScope(
      onWillPop: () async {
        // Do something here
        Get.off(() => Beranda());
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
            title: Text('Scan QR'),
            centerTitle: true,
            backgroundColor: Color.fromARGB(255, 29, 133, 69)),
        body: Container(
          child: Column(
            children: [
              // Text("matkul " + controller.matkul.string),
              // Text("tanggal " + controller.tanggal.string),
              SizedBox(
                height: size.height * 0.6,
                child: buildQrView(context),
              ),
              SizedBox(
                height: 20,
              ),
              Button(
                  buttonTap: () {
                    controller!.stopCamera();
                    ;
                    Get.to(() => InputManual());
                  },
                  buttonDesc: 'Presensi manual'),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Column(
                        children: [
                          Text(
                            "INFORMASI DATA PRESENSI",
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            "Mata kuliah: " + npmController.matkul.value,
                            style: TextStyle(fontSize: 14),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            "Minggu ke-" +
                                npmController.tanggal.value.toString(),
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildQrView(BuildContext) => QRView(
        key: qrKey,
        onQRViewCreated: _onQRViewCreated,
        overlay: QrScannerOverlayShape(),
      );

  void onQRViewCreated(QRViewController controller) {
    setState(() => {
          this.controller = controller,
        });
  }

  void _onQRViewCreated(QRViewController controller) {
    final npmController = Get.put(AbsenController());
    final validator = Get.put(MhsController());
    this.controller = controller;
    controller.resumeCamera();
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
        npmController.npm.value = result!.code.toString();
      });

      controller.stopCamera();
      validator.getSpecificMhs();
      AlertDialog loading = AlertDialog(
                        content: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                      children: [
                          CircularProgressIndicator(),
                          SizedBox(
                            width: 20,
                          ),
                          Text("Mohon tunggu")
                      ],
                    ),
                        ));
      showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return loading;
                      },
                    );
      // MahasiswaModel newDataMhs = validator.dataMahasiswa;
      // npmController.setNama(newDataMhs.nama!.toString());
      print('=======================' + npmController.namaMhs.value);
      print('=======================' + npmController.npm.value);

      // if (GetUtils.isNum(npmController.npm.value) && npmController.npm.value == 8) {
      if (validator.dataMahasiswa != null) {
        Timer(Duration(seconds: 2), () {
          Get.to(() => Validasi());
        });
      } else {
        print('data tidak ditemukan');
        controller.resumeCamera();
      }
    });
  }
}
