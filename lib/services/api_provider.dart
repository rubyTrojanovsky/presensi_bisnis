import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:presensi_bisnis/controller/absen_controller.dart';
import 'package:presensi_bisnis/models/absensi_model.dart';
import 'package:presensi_bisnis/models/daftar_hadir_model.dart';
import 'package:presensi_bisnis/models/mahasiswa_model.dart';

class MhsController extends GetxController {
  String BaseUrl = 'https://absensi-4ia01-api-production.up.railway.app/api';

  late MahasiswaModel dataMahasiswa;
  late AbsenModel dataAbsen;
  late DaftarHadirModel dataDaftarHadir;
  AbsenController controller = Get.put(AbsenController());
  
  // late MahasiswaModel modelMahasiswa;

  Future<MahasiswaModel> getSpecificMhs() async {
    print('getSpecificMhs called');
    final response = await http.get(Uri.parse(BaseUrl + '/mahasiswa/' + controller.npm.toString()));
    if (response.statusCode == 200) {
      print(response.body);
      dataMahasiswa = MahasiswaModel.fromJson(json.decode(response.body)['data']);
      controller.namaMhs.value = dataMahasiswa.nama.toString();
      return dataMahasiswa;
    } else {
      throw Exception('mhs tidak ditemukan');
    }
  }

  Future<AbsenModel> postAbsensi() async {
    print('postAbsensi called');
    var req_body = new Map();
    req_body['npm']=controller.npm.value.toString();
    req_body['minggu']=controller.tanggal.value;
    req_body['matkul']=controller.matkul.value;
    final response = await http.post(Uri.parse(BaseUrl + '/presensi/'),
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode(req_body));
    if (response.statusCode == 201) {
      print(response.body);
      dataAbsen = AbsenModel.fromJson(json.decode(response.body)['data']);
      return dataAbsen;
    } else {
      throw Exception('gagal post absensi');
    }
  }

Future<DaftarHadirModel> getDaftarHadir() async {
    print('getDaftarHadir called');
    final queryParameters = {
      'minggu' : controller.tanggal.value.toString(),
      'matkul' : controller.matkul.value
    };
    final uri = Uri.https('absensi-4ia01-api-production.up.railway.app', '/api/presensi/', queryParameters);
    final headers = {HttpHeaders.contentTypeHeader: 'application/json'};
    final response = await http.get(uri, headers: headers);
    
    if (response.statusCode == 201) {
      print(await response.body);
      dataDaftarHadir = DaftarHadirModel.fromJson(json.decode(response.body)['data']);
      return dataDaftarHadir;
    } else {
      throw Exception('daftar hadir tidak ditemukan');
    }
  }
}
