import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AbsenController extends GetxController {
  static List<String> listMatkul = <String>[
    'Bisnis Informatika', 'PPPL', 'Pengolahan Citra', 'RPL 2',
    'Jaringan Komputer', 'Permodelan dan Simulasi', 'Teknik Kompilasi',
    'Bahasa Inggris Bisnis'];
  RxString _matkul = "Bisnis Informatika".obs;
  RxString get matkul => this._matkul;

  static List<String> listTanggal = <String>[
    'Minggu 1', 'Minggu 2', 'Minggu 3', 'Minggu 4',
    'Minggu 5', 'Minggu 6', 'Minggu 7', 'Minggu 8',
    'Minggu 9', 'Minggu 10' ,'Minggu 11', 'Minggu 12', 'Minggu 13', 'Minggu 14'];
  RxString _tanggal = "Minggu 1".obs;
  RxString get tanggal => this._tanggal;

  RxString _npm = '50419135'.obs;
  RxString get npm => this._npm;

  RxString _namaMhs= ''.obs;
  RxString get namaMhs => this._namaMhs;

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

  void setNama(String value) {
    namaMhs.value = value;
    print(value);
  }
}