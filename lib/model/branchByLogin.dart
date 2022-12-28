class BranchByLoginModel {
  String? code;
  String? name;
  bool? inactive;
  String? inactiveOn;
  bool? headOffice;

  BranchByLoginModel(
      {this.code, this.name, this.inactive, this.inactiveOn, this.headOffice});

  BranchByLoginModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    name = json['name'];
    inactive = json['inactive']!=null?json['inactive']:false;
    inactiveOn = json['inactiveOn']!=null?json['inactiveOn']:'';
    headOffice = json['headOffice']!=null?json['headOffice']:false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['name'] = this.name;
    data['inactive'] = this.inactive;
    data['inactiveOn'] = this.inactiveOn;
    data['headOffice'] = this.headOffice;
    return data;
  }
}