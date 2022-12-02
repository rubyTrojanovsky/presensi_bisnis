import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presensi_bisnis/controller/absen_controller.dart';
import 'package:presensi_bisnis/screens/beranda.dart';

import '../components/button.dart';

class SuksesPage extends StatelessWidget {
  const SuksesPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async => false
     ,
      child: Scaffold(
        appBar: AppBar(
            title: Text('Sukses'),
            centerTitle: true,
            backgroundColor: Color.fromARGB(255, 29, 133, 69),
            automaticallyImplyLeading: false,
          ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.check_circle, color: Color.fromARGB(255, 29, 133, 69), size: size.width*0.6,),
              SizedBox(
                height: size.height*0.01,
              ),
              Text('Data presensi telah tercatat dalam database',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w400
                  )),
              SizedBox(
                height: size.height*0.05,
              ),
              Button(buttonTap: () {
                  Get.offAll(() => Beranda());
                  Get.delete<AbsenController>();
                } , buttonDesc: 'Kembali ke Beranda')
            ],
          ),
        ),
      ),
    );
  }
}