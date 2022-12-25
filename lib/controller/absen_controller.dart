import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AbsenController extends GetxController {
  static List<String> listMatkul = <String>[
    'Bisnis Informatika', 'PPPL', 'Pengolahan Citra', 'RPL 2',
    'Jaringan Komputer', 'Permodelan dan Simulasi', 'Teknik Kompilasi',
    'Bahasa Inggris Bisnis'];
  RxString _matkul = "Bisnis Informatika".obs;
  RxString get matkul => this._matkul;

  static List<int> listTanggal = <int>[
    1, 2, 3, 4,
    5, 6, 7, 8,
    9, 10 ,11, 12, 13, 14];
  RxInt _tanggal = 1.obs;
  RxInt get tanggal => this._tanggal;

  RxString _npm = '50419135'.obs;
  RxString get npm => this._npm;

  RxString _npmTemp = '0'.obs;
  RxString get npmTemp => this._npmTemp;

  RxString _namaMhs= ''.obs;
  RxString get namaMhs => this._namaMhs;

  final inputNPM = TextEditingController();

  @override
  void onInit() {
    inputNPM;
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

  void setTanggal(int value) {
    tanggal.value = value;
    print(value);
  }

  void setNPMTemp(String value) {
    npmTemp.value = value;
    print(value);
  }

  void setNPM(String value) {
    npm.value = value;
    print(value);
  }

  void setNama(String value) {
    namaMhs.value = value;
    print(value);
  }
}