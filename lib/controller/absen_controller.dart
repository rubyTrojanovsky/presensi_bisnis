import 'package:get/get.dart';

class AbsenController extends GetxController {
  static List<String> listMatkul = <String>['Bisnis Informatika', 'PPPL', 'Pengolahan Citra', 'RPL 2'];
  final matkul = "Bisnis Informatika".obs;

  static List<String> listTanggal = <String>['10 November 2022', '11 November 2022', '12 November 2022', '13 November 2022'];
  final tanggal = "10 November 2022".obs;

  void setMatkul(String value) {
    matkul.value = value;
    print(value);
  }

  void setTanggal(String value) {
    tanggal.value = value;
    print(value);
  }
}