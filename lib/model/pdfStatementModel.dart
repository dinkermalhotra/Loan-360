
/*

class PdfStatementModel {
  String? reportPath;


  PdfStatementModel(
      {this.reportPath, });

  PdfStatementModel.fromJson(Map<String, dynamic> json) {
    reportPath = json['reportPath'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['reportPath'] = this.reportPath;

    return data;
  }
}*/
/*

class PdfStatementModel {
  String? reportPath;

  PdfStatementModel({this.reportPath});

  PdfStatementModel.fromJson(Map<String, dynamic> json) {
    reportPath = json['reportPath'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['reportPath'] = this.reportPath;
    return data;
  }
}
*/


import 'dart:convert';

PdfStatementModel PdfStatementFromJson(String str) => PdfStatementModel.fromJson(json.decode(str));

String PdfStatementToJson(PdfStatementModel data) => json.encode(data.toJson());

class PdfStatementModel {
  PdfStatementModel({
    this.reportPath,
  });

  String? reportPath;

  factory PdfStatementModel.fromJson(Map<String, dynamic> json) => PdfStatementModel(
    reportPath: json["reportPath"],
  );

  Map<String, dynamic> toJson() => {
    "reportPath": reportPath,
  };
}
