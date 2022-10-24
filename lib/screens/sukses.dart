import 'package:flutter/material.dart';

import '../components/button.dart';

class SuksesPage extends StatelessWidget {
  const SuksesPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 48, 16, 18),
        child: Column(
          children: [
            Center(
                child: Text('Aplikasi Presensi Kelas 4IA01 sukses',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                    ))),
          ],
        ),
      ),
    );
  }
}