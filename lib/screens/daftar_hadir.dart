import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presensi_bisnis/controller/absen_controller.dart';
import 'package:presensi_bisnis/models/daftar_hadir_model.dart';
import 'package:presensi_bisnis/services/api_provider.dart';

class DaftarHadir extends StatelessWidget {
  DaftarHadir({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AbsenController controller = Get.put(AbsenController());
    final api = Get.put(MhsController());
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
          title: Text('Daftar Hadir'),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 29, 133, 69)),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 48, 16, 18),
        child: Container(
          height: size.height *0.8,
          width: size.width,
          child: Column(
            children: [
              Text("Mata kuliah: " + controller.matkul.value),
              Text("Minggu ke-" + controller.tanggal.value.toString()),
              Container(
                height: size.height *0.7,
                child: FutureBuilder<DaftarHadirModel>(future: api.getDaftarHadir(),
            builder: (context, snapshot) {
                if (snapshot.hasData) {
                return (ListView.builder(
                    itemCount: snapshot.data!.mahasiswa!.length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: size.height*0.025,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(snapshot.data!.mahasiswa![index].npm.toString()),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(snapshot.data!.mahasiswa![index].nama.toString()),
                              ],
                            )
                          ],

                        ),
                      );
                })
                );}
                else if (snapshot.hasError) {
                return const Center(
                    child: Text(
                        "Terjadi masalah saat menghubungkan ke server, coba ulangi lagi"));
                }
                 return const Center(child: CircularProgressIndicator()); 
  }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
