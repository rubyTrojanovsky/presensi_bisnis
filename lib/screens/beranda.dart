import 'package:flutter/material.dart';
import 'package:presensi_bisnis/components/button.dart';
import 'package:presensi_bisnis/components/dropdown.dart';

class Beranda extends StatelessWidget {
  const Beranda({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 48, 16, 18),
        child: Column(
          children: [
            Center(child: Text('Aplikasi Presensi Kelas 4IA01',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize:30,
              ))),
              DropdownMatkul(),
              DropdownTanggal(),
              Button()
          ],
        ),
      ),
    );
  }
}
