class SubjectPromiseModel {
  String? section;
  String? stage;
  String? code;
  String? name;
  String? createdOn;
  String? updatedOn;
  bool? inactive;
 // Null? inactiveOn;

  SubjectPromiseModel(
      {this.section,
        this.stage,
        this.code,
        this.name,
        this.createdOn,
        this.updatedOn,
        this.inactive,
      //  this.inactiveOn

      });

  SubjectPromiseModel.fromJson(Map<String, dynamic> json) {
    section = json['section'];
    stage = json['stage'];
    code = json['code'];
    name = json['name'];
    createdOn = json['createdOn'];
    updatedOn = json['updatedOn'];
    inactive = json['inactive'];
  //  inactiveOn = json['inactiveOn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['section'] = this.section;
    data['stage'] = this.stage;
    data['code'] = this.code;
    data['name'] = this.name;
    data['createdOn'] = this.createdOn;
    data['updatedOn'] = this.updatedOn;
    data['inactive'] = this.inactive;
  //  data['inactiveOn'] = this.inactiveOn;
    return data;
  }
}