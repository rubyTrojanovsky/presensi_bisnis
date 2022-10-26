import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AbsenController extends GetxController {
  static List<String> listMatkul = <String>['Bisnis Informatika', 'PPPL', 'Pengolahan Citra', 'RPL 2'];
  RxString _matkul = "Bisnis Informatika".obs;
  RxString get matkul => this._matkul;

  static List<String> listTanggal = <String>['10 November 2022', '11 November 2022', '12 November 2022', '13 November 2022'];
  RxString _tanggal = "10 November 2022".obs;
  RxString get tanggal => this._tanggal;

  RxString _npm = ''.obs;
  RxString get npm => this._npm;

  final inputNPM = TextEditingController();

  @override
  void onInit() {
    matkul;
    super.onInit();
  }

  @override
  void onClose() {
    inputNPM.dispose();
    super.dispose();
  }

  void setMatkul(String value) {
    matkul.value = value;
    print(value);
  }

  void setTanggal(String value) {
    tanggal.value = value;
    print(value);
  }

  void setNPM(String value) {
    npm.value = value;
    print(value);
  }


}