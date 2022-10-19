import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presensi_bisnis/controller/absen_controller.dart';

class ScanQR extends StatelessWidget {
  const ScanQR({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AbsenController controller = Get.put(AbsenController());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 48, 16, 18),
        child: Scaffold(
          body: Column(
            children: [
              Text("matkul " + controller.matkul.string),
              Text("tanggal " + controller.tanggal.string)
            ],
          ),
        ),
      ),
    );
  }
}