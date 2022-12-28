



class CompanyByLoginModel {
  String? code='';
  String? name='';

  CompanyByLoginModel({this.code, this.name});

  CompanyByLoginModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['name'] = this.name;
    return data;
  }
}





class FinancialLoginModel {
  String? code='';
  String? name='';

  FinancialLoginModel({this.code, this.name});

  FinancialLoginModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['name'] = this.name;
    return data;
  }
}