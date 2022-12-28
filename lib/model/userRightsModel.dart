class UserRightModel {
  bool? reprint;
  List<Rights>? rights;
  User? user;
  int? userId;

  UserRightModel({this.reprint, this.rights, this.user, this.userId});

  UserRightModel.fromJson(Map<String, dynamic> json) {
    reprint = json['reprint'];
    if (json['rights'] != null) {
      rights = <Rights>[];
      json['rights'].forEach((v) {
        rights!.add(new Rights.fromJson(v));
      });
    }
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['reprint'] = this.reprint;
    if (this.rights != null) {
      data['rights'] = this.rights!.map((v) => v.toJson()).toList();
    }
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['userId'] = this.userId;
    return data;
  }
}

class Rights {
  int? id;
  String? menuCode;
  String? roleCode;
  String? login;
  bool? viewRight;
  bool? addRight;
  bool? editRight;
  bool? deleteRight;
  Null? printRight;
  String? code;
  String? name;
  String? url;
  String? parentCode;
  String? menuType;
  String? description;
  String? modules;
  int? itemOrder;
  String? parentUrl;
  bool? mobile;
  String? hotKey;
  Null? export;

  Rights(
      {this.id,
        this.menuCode,
        this.roleCode,
        this.login,
        this.viewRight,
        this.addRight,
        this.editRight,
        this.deleteRight,
        this.printRight,
        this.code,
        this.name,
        this.url,
        this.parentCode,
        this.menuType,
        this.description,
        this.modules,
        this.itemOrder,
        this.parentUrl,
        this.mobile,
        this.hotKey,
        this.export});

  Rights.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    menuCode = json['menu_code'];
    roleCode = json['role_code'];
    login = json['login'];
    viewRight = json['view_right'];
    addRight = json['add_right'];
    editRight = json['edit_right'];
    deleteRight = json['delete_right'];
    printRight = json['print_right'];
    code = json['code'];
    name = json['name'];
    url = json['url'];
    parentCode = json['parent_code'];
    menuType = json['menu_type'];
    description = json['description'];
    modules = json['modules'];
    itemOrder = json['item_order'];
    parentUrl = json['parent_url'];
    mobile = json['mobile'];
    hotKey = json['hot_key'];
    export = json['export'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['menu_code'] = this.menuCode;
    data['role_code'] = this.roleCode;
    data['login'] = this.login;
    data['view_right'] = this.viewRight;
    data['add_right'] = this.addRight;
    data['edit_right'] = this.editRight;
    data['delete_right'] = this.deleteRight;
    data['print_right'] = this.printRight;
    data['code'] = this.code;
    data['name'] = this.name;
    data['url'] = this.url;
    data['parent_code'] = this.parentCode;
    data['menu_type'] = this.menuType;
    data['description'] = this.description;
    data['modules'] = this.modules;
    data['item_order'] = this.itemOrder;
    data['parent_url'] = this.parentUrl;
    data['mobile'] = this.mobile;
    data['hot_key'] = this.hotKey;
    data['export'] = this.export;
    return data;
  }
}

class User {
  String? login;
  Null? alias;
  Null? password;
  String? firstName;
  String? lastName;
  Null? email;
  String? langKey;
  List<String>? roles;
  String? assistants;
  String? notification;
  Null? mobile;
  String? defaultBranchCode;
  Null? designation;
  Null? defaultCompanyCode;
  String? employeeCode;
  Null? newsReadOn;
  String? passwordUpdatedOn;
  bool? postNews;
  Null? analytics;
  Null? manager;
  String? loginType;
  String? organisationRights;
  String? lastPing;
  String? tokenId;
  String? lastAttemptedOn;
  Null? id;
  Null? activated;
  Null? isAdmin;
  List<Authorities>? authorities;
  bool? superAdmin;

  User(
      {this.login,
        this.alias,
        this.password,
        this.firstName,
        this.lastName,
        this.email,
        this.langKey,
        this.roles,
        this.assistants,
        this.notification,
        this.mobile,
        this.defaultBranchCode,
        this.designation,
        this.defaultCompanyCode,
        this.employeeCode,
        this.newsReadOn,
        this.passwordUpdatedOn,
        this.postNews,
        this.analytics,
        this.manager,
        this.loginType,
        this.organisationRights,
        this.lastPing,
        this.tokenId,
        this.lastAttemptedOn,
        this.id,
        this.activated,
        this.isAdmin,
        this.authorities,
        this.superAdmin});

  User.fromJson(Map<String, dynamic> json) {
    login = json['login'];
    alias = json['alias'];
    password = json['password'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    langKey = json['langKey'];
    roles = json['roles'].cast<String>();
    assistants = json['assistants'];
    notification = json['notification'];
    mobile = json['mobile'];
    defaultBranchCode = json['defaultBranchCode'];
    designation = json['designation'];
    defaultCompanyCode = json['defaultCompanyCode'];
    employeeCode = json['employeeCode'];
    newsReadOn = json['newsReadOn'];
    passwordUpdatedOn = json['passwordUpdatedOn'];
    postNews = json['postNews'];
    analytics = json['analytics'];
    manager = json['manager'];
    loginType = json['loginType'];
    organisationRights = json['organisationRights'];
    lastPing = json['lastPing'];
    tokenId = json['tokenId'];
    lastAttemptedOn = json['lastAttemptedOn'];
    id = json['id'];
    activated = json['activated'];
    isAdmin = json['isAdmin'];
    if (json['authorities'] != null) {
      authorities = <Authorities>[];
      json['authorities'].forEach((v) {
        authorities!.add(new Authorities.fromJson(v));
      });
    }
    superAdmin = json['superAdmin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['login'] = this.login;
    data['alias'] = this.alias;
    data['password'] = this.password;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['langKey'] = this.langKey;
    data['roles'] = this.roles;
    data['assistants'] = this.assistants;
    data['notification'] = this.notification;
    data['mobile'] = this.mobile;
    data['defaultBranchCode'] = this.defaultBranchCode;
    data['designation'] = this.designation;
    data['defaultCompanyCode'] = this.defaultCompanyCode;
    data['employeeCode'] = this.employeeCode;
    data['newsReadOn'] = this.newsReadOn;
    data['passwordUpdatedOn'] = this.passwordUpdatedOn;
    data['postNews'] = this.postNews;
    data['analytics'] = this.analytics;
    data['manager'] = this.manager;
    data['loginType'] = this.loginType;
    data['organisationRights'] = this.organisationRights;
    data['lastPing'] = this.lastPing;
    data['tokenId'] = this.tokenId;
    data['lastAttemptedOn'] = this.lastAttemptedOn;
    data['id'] = this.id;
    data['activated'] = this.activated;
    data['isAdmin'] = this.isAdmin;
    if (this.authorities != null) {
      data['authorities'] = this.authorities!.map((v) => v.toJson()).toList();
    }
    data['superAdmin'] = this.superAdmin;
    return data;
  }
}

class Authorities {
  String? name;

  Authorities({this.name});

  Authorities.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    return data;
  }
}