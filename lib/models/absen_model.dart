// To parse this JSON data, do
//
//     final daftarMahasiswa = daftarMahasiswaFromJson(jsonString);

import 'dart:convert';

DaftarMahasiswa daftarMahasiswaFromJson(String str) => DaftarMahasiswa.fromJson(json.decode(str));

String daftarMahasiswaToJson(DaftarMahasiswa data) => json.encode(data.toJson());

class DaftarMahasiswa {
    DaftarMahasiswa({
        required this.message,
        required this.data,
    });

    final String message;
    final MahasiswaModel data;

    factory DaftarMahasiswa.fromJson(Map<String, dynamic> json) => DaftarMahasiswa(
        message: json["message"],
        data: MahasiswaModel.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": data.toMap(),
    };
}

class MahasiswaModel {
    MahasiswaModel({
        this.id,
        this.npm,
        this.nama,
    });

    int? id;
    String? npm;
    String? nama;

    factory MahasiswaModel.fromJson(Map<String, dynamic> json) => MahasiswaModel(
        id: json["id"]?? 0,
        npm: json["npm"]?? '',
        nama: json["nama"]?? '',
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "npm": npm,
        "nama": nama,
    };
}
