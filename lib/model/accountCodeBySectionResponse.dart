class AccountCodeBySectionResponse {
  String? code;
  String? name;
  String? visible;
  String? section;
  String? vtype;

  AccountCodeBySectionResponse({this.code, this.name, this.visible, this.section, });

  AccountCodeBySectionResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    name = json['name'];
    visible = json['visible'];
    section = json['section'];
    vtype = json['vtype']!=null?json['vtype']:"";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['name'] = this.name;
    data['visible'] = this.visible;
    data['section'] = this.section;
    data['vtype'] = this.vtype;
    return data;
  }
}


