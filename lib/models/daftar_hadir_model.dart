// To parse this JSON data, do
//
//     final listDaftarHadir = listDaftarHadirFromJson(jsonString);

import 'dart:convert';

ListDaftarHadir listDaftarHadirFromJson(String str) => ListDaftarHadir.fromJson(json.decode(str));

String listDaftarHadirToJson(ListDaftarHadir data) => json.encode(data.toJson());

class ListDaftarHadir {
    ListDaftarHadir({
        required this.message,
        required this.data,
    });

    final String message;
    final DaftarHadirModel data;

    factory ListDaftarHadir.fromJson(Map<String, dynamic> json) => ListDaftarHadir(
        message: json["message"],
        data: DaftarHadirModel.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": data.toJson(),
    };
}

class DaftarHadirModel {
    DaftarHadirModel({
        this.matkul,
        this.minggu,
        this.mahasiswa,
    });

    String? matkul;
    int? minggu;
    List<ListMahasiswa>? mahasiswa;

    factory DaftarHadirModel.fromJson(Map<String, dynamic> json) => DaftarHadirModel(
        matkul: json["matkul"],
        minggu: json["minggu"],
        mahasiswa: List<ListMahasiswa>.from(json["mahasiswa"].map((x) => ListMahasiswa.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "matkul": matkul,
        "minggu": minggu,
        "mahasiswa": List<dynamic>.from(mahasiswa!.map((x) => x.toJson())),
    };
}

class ListMahasiswa {
    ListMahasiswa({
        this.nama,
        this.npm,
    });

    String? nama;
    String? npm;

    factory ListMahasiswa.fromJson(Map<String, dynamic> json) => ListMahasiswa(
        nama: json["nama"],
        npm: json["npm"],
    );

    Map<String, dynamic> toJson() => {
        "nama": nama,
        "npm": npm,
    };
}
