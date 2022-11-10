import 'package:flutter/material.dart';

class DaftarHadir extends StatelessWidget {
  const DaftarHadir({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Daftar Hadir'),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 29, 133, 69)
        ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 48, 16, 18),
        child: Column(children: [Text("daftar hadir")],),
      ),
    );
  }
}