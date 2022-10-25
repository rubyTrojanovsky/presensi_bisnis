import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presensi_bisnis/controller/absen_controller.dart';
import 'package:presensi_bisnis/screens/scan_qr.dart';
import 'package:presensi_bisnis/screens/sukses.dart';

import '../components/button.dart';

class Validasi extends StatelessWidget {
  const Validasi({Key? key, required this.npm}) : super(key: key);
  final npm;

  @override
  Widget build(BuildContext context) {
    AbsenController validasiController = Get.put(AbsenController());
    return WillPopScope(
      onWillPop: () async {
        // Do something here
        Get.to(() => ScanQR());
        return false;
     },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.fromLTRB(16, 48, 16, 18),
          child: Column(
            children: [
              Center(
                  child: Text('Apakah data-data berikut sudah benar?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                      ))),
              Column(
                children: [
                  Text("npm "+ npm),
                  Text("nama "),
                  Text("Matkul "+ validasiController.matkul.value),
                  Text("Jadwal "+ validasiController.tanggal.value),
                  Button(
              buttonDesc: 'Lihat daftar absen',
              buttonTap: () {
                Get.to(() => SuksesPage());
              },
            )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
