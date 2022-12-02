import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:presensi_bisnis/controller/absen_controller.dart';
import 'package:presensi_bisnis/models/absen_model.dart';

class MhsController extends GetxController {
  String BaseUrl = 'http://35.219.90.159:32022/api';

  late MahasiswaModel dataMahasiswa;
  // late MahasiswaModel idMahasiswa;
  // late MahasiswaModel npmMahasiswa;
  // late MahasiswaModel modelMahasiswa;

  Future<MahasiswaModel> getSpecificMhs() async {
  print('getSpecificMhs called');
  AbsenController controller = Get.put(AbsenController());
  final response = await http.get(Uri.parse(BaseUrl + '/mahasiswa/'+ controller.npm.toString()));
  if (response.statusCode == 200) {
    print(response.body);
    // modelMahasiswa = MahasiswaModel.fromJson(json.decode(response.body));
    dataMahasiswa = MahasiswaModel.fromJson(json.decode(response.body)['data']);
    // idMahasiswa = MahasiswaModel.fromJson(json.decode(response.body)['id']);
    // npmMahasiswa = MahasiswaModel.fromJson(json.decode(response.body)['npm']); 
    // print('${namaMahasiswa}'+'${idMahasiswa}'+'${npmMahasiswa}');
    return dataMahasiswa;
  } else {
    throw Exception('mhs tidak ditemukan');
    }
  }

}