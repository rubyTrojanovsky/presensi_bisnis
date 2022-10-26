import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presensi_bisnis/components/button.dart';
import 'package:presensi_bisnis/components/dropdown.dart';
import 'package:presensi_bisnis/screens/daftar_hadir.dart';
import 'package:presensi_bisnis/screens/input_manual.dart';
import 'package:presensi_bisnis/screens/scan_qr.dart';

class Beranda extends StatelessWidget {
  const Beranda({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 48, 16, 18),
        child: Column(
          children: [
            Center(
                child: Text('Aplikasi Presensi Kelas 4IA01',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                    ))),
            DropdownMatkul(),
            DropdownTanggal(),
            Button(
              buttonDesc: 'Presensi menggunakan QR Code',
              buttonTap: () {
                Get.to(() => ScanQR());
              },
            ),
            Button(
              buttonDesc: 'Lihat daftar absen',
              buttonTap: () {
                Get.to(() => DaftarHadir());
              },
            )
          ],
        ),
      ),
    );
  }
}
