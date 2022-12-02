import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presensi_bisnis/components/button.dart';
import 'package:presensi_bisnis/components/dropdown.dart';
import 'package:presensi_bisnis/models/api_provider.dart';
import 'package:presensi_bisnis/screens/daftar_hadir.dart';
import 'package:presensi_bisnis/screens/scan_qr.dart';

class Beranda extends StatelessWidget {
  const Beranda({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final validator = Get.put(MhsController());
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 5, 78, 33),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 48, 16, 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Aplikasi Presensi Kelas 4IA01',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white
                )),
            SizedBox(
              width:size.width * 0.4,
              height:size.height *0.25,
              child: Image(image: AssetImage('assets/icons/beranda.png')),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InputHint(hint: 'Mata Kuliah'),
                SizedBox(height: 5,),
                DropdownMatkul(),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InputHint(hint: 'Jadwal'),
                SizedBox(height: 5,),
                DropdownTanggal(),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Button(
              buttonDesc: 'Presensi Scan QR Code',
              buttonTap: () {
                Get.to(() => ScanQR());
              },
            ),
            SizedBox(
              height: 20,
            ),
            Button(
              buttonDesc: 'Lihat daftar hadir',
              buttonTap: () {
                validator.getSpecificMhs();
                Get.to(() => DaftarHadir(),);
              },
            )
          ],
        ),
      ),
    );
  }
}
