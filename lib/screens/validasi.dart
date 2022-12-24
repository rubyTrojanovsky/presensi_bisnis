import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presensi_bisnis/controller/absen_controller.dart';
import 'package:presensi_bisnis/services/api_provider.dart';
import 'package:presensi_bisnis/screens/scan_qr.dart';
import 'package:presensi_bisnis/screens/sukses.dart';

import '../components/button.dart';

class Validasi extends StatelessWidget {
  const Validasi({Key? key,}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    AbsenController validasiController = Get.put(AbsenController());
    final validator = Get.put(MhsController());
    return WillPopScope(
      onWillPop: () async {
        // Do something here
        Get.offAll(() => ScanQR());
        return false;
      },
      child:Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
            title: Text('Konfirmasi'),
            centerTitle: true,
            backgroundColor: Color.fromARGB(255, 29, 133, 69)),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Apakah data-data berikut sudah benar?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                  )),
              SizedBox(
                height: 20,
              ),
              Icon(
                Icons.pending_actions, size: size.width * 0.5, color: Color.fromARGB(255, 29, 133, 69)
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: size.height * 0.2,
                width: size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DataMhs(datamhs: "NPM : "+ validasiController.npm.value),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DataMhs(datamhs: "Nama : "),
                          Flexible(child: DataMhs(datamhs: validasiController.namaMhs.value))
                        ],
                      ),Row(
                        children: [
                          DataMhs(datamhs: "Mata Kuliah : "),
                          DataMhs(datamhs: validasiController.matkul.toString())
                        ],
                      ),Row(
                        children: [
                          DataMhs(datamhs: "Minggu ke : "),
                          DataMhs(datamhs: validasiController.tanggal.toString())
                        ],
                      ),
                      SizedBox(
                  height: 5,
              ),
                      
                    ],
                  ),
                ),
              ),
              Button(
                  buttonDesc: 'Presensi',
                  buttonTap: () {
                    validator.postAbsensi();
                    Get.to(() => SuksesPage());
                  },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DataMhs extends StatelessWidget {
  const DataMhs({Key? key, required this.datamhs}) : super(key: key);

  final String datamhs;

  @override
  Widget build(BuildContext context) {
    return Text(datamhs, style: TextStyle(fontSize: 17), maxLines: 2,);
  }
}