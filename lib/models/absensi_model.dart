// To parse this JSON data, do
//
//     final mataKuliah = mataKuliahFromJson(jsonString);

import 'dart:convert';

MataKuliah mataKuliahFromJson(String str) => MataKuliah.fromJson(json.decode(str));

String mataKuliahToJson(MataKuliah data) => json.encode(data.toJson());

class MataKuliah {
    MataKuliah({
        required this.message,
        required this.data,
    });

    final String message;
    final AbsenModel data;

    factory MataKuliah.fromJson(Map<String, dynamic> json) => MataKuliah(
        message: json["message"],
        data: AbsenModel.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": data.toJson(),
    };
}

class AbsenModel {
    AbsenModel({
        this.id,
        this.npm,
        this.matkul,
        this.minggu,
    });

    int? id;
    String? npm;
    String? matkul;
    int? minggu;

    factory AbsenModel.fromJson(Map<String, dynamic> json) => AbsenModel(
        id: json["id"],
        npm: json["npm"],
        matkul: json["matkul"],
        minggu: json["minggu"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "npm": npm,
        "matkul": matkul,
        "minggu": minggu,
    };
}
