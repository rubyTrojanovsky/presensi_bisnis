import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presensi_bisnis/components/button.dart';
import 'package:presensi_bisnis/controller/absen_controller.dart';
import 'package:presensi_bisnis/models/mahasiswa_model.dart';
import 'package:presensi_bisnis/screens/scan_qr.dart';
import 'package:presensi_bisnis/screens/validasi.dart';

import '../services/api_provider.dart';

class InputManual extends StatelessWidget {
  const InputManual({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final validator = Get.put(MhsController());
    int npmTemp = 0;
    bool validateNPM = false;
    AbsenController npmController = Get.put(AbsenController());
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
    return WillPopScope(
        onWillPop: () async {
          // Do something here
          Get.off(() => ScanQR());
          return false;
        },
        child: Scaffold(
          appBar: AppBar(
              title: Text('Input Manual'),
              centerTitle: true,
              backgroundColor: Color.fromARGB(255, 29, 133, 69)),
          body: Padding(
            padding: const EdgeInsets.fromLTRB(16, 48, 16, 18),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Masukkan NPM'),
                        SizedBox(
                          height: 14,
                        ),
                        TextField(
                          decoration:
                              InputDecoration(border: OutlineInputBorder()),
                          controller: npmController.inputNPM,
                          onChanged: ((value) =>
                              npmTemp),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Button(
                      buttonTap: () {
                        npmController.setNPM(npmTemp.toString());
                        validator.getSpecificMhs();
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return loading;
                          },
                        );
                        validateNPM = true;
                        if (GetUtils.isNum(npmController.npm.value) &&
                            npmController.npm.value.length == 8 &&
                            validateNPM == true) {
                          Timer(Duration(seconds: 2), () {
                            Get.to(() => Validasi());
                          });
                        } else {
                          print('format tidak sesuai');
                        }
                      },
                      buttonDesc: 'Validasi')
                ],
              ),
            ),
          ),
        ));
  }
}
