import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presensi_bisnis/components/button.dart';
import 'package:presensi_bisnis/controller/absen_controller.dart';
import 'package:presensi_bisnis/screens/scan_qr.dart';
import 'package:presensi_bisnis/screens/validasi.dart';

class InputManual extends StatelessWidget {
  const InputManual({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AbsenController npmController = Get.put(AbsenController());
    return WillPopScope(
      onWillPop: () async {
        // Do something here
        Get.to(() => ScanQR());
        return false;
     },
    child: Scaffold(
      appBar: AppBar(
          title: Text('Input Manual'),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 29, 133, 69)
        ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 48, 16, 18),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Masukkan NPM'),
              SizedBox(
                height: 14,
              ),
              TextField(
                decoration: InputDecoration(border: OutlineInputBorder()),
                controller: npmController.inputNPM,
                onChanged: ((value) => npmController.setNPM(value.toString())),
              ),
              Button(
                  buttonTap: () {
                    if (GetUtils.isNum(npmController.npm.value) &&
                        npmController.npm.value.length == 8) {
                      Get.to(() => Validasi(
                            npm: npmController.npm.value,
                          ));
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
