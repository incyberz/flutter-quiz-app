// To parse this JSON data, do
//
//     final questionModel = questionModelFromJson(jsonString);

import 'dart:convert';

QuestionModel questionModelFromJson(String str) => QuestionModel.fromJson(json.decode(str));

String questionModelToJson(QuestionModel data) => json.encode(data.toJson());

class QuestionModel {
  List<Datum> data;

  QuestionModel({
    required this.data,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) => QuestionModel(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  int id;
  String soal;
  String opsiA;
  String opsiB;
  String opsiC;
  String opsiD;
  String pembahasan;
  String kj;

  Datum({
    required this.id,
    required this.soal,
    required this.opsiA,
    required this.opsiB,
    required this.opsiC,
    required this.opsiD,
    required this.pembahasan,
    required this.kj,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    soal: json["soal"],
    opsiA: json["opsi_a"],
    opsiB: json["opsi_b"],
    opsiC: json["opsi_c"],
    opsiD: json["opsi_d"],
    pembahasan: json["pembahasan"],
    kj: json["kj"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "soal": soal,
    "opsi_a": opsiA,
    "opsi_b": opsiB,
    "opsi_c": opsiC,
    "opsi_d": opsiD,
    "pembahasan": pembahasan,
    "kj": kj,
  };
}
