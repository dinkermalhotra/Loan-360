

class MobileReceiptLimitResponse {
  String? login;
  int? limitAmount;
  bool? blocked;
  String? blockedOn;
  String? limitSetOn;
  int? maxReceiptCount;
  int? maxReceiptAmount;

  MobileReceiptLimitResponse(
      {this.login,
        this.limitAmount,
        this.blocked,
        this.blockedOn,
        this.limitSetOn,
        this.maxReceiptCount,
        this.maxReceiptAmount});

  MobileReceiptLimitResponse.fromJson(Map<String, dynamic> json) {
    login = json['login'];
    limitAmount = json['limitAmount'];
    blocked = json['blocked'];
    blockedOn = json['blockedOn'];
    limitSetOn = json['limitSetOn'];
    maxReceiptCount = json['maxReceiptCount'];
    maxReceiptAmount = json['maxReceiptAmount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['login'] = this.login;
    data['limitAmount'] = this.limitAmount;
    data['blocked'] = this.blocked;
    data['blockedOn'] = this.blockedOn;
    data['limitSetOn'] = this.limitSetOn;
    data['maxReceiptCount'] = this.maxReceiptCount;
    data['maxReceiptAmount'] = this.maxReceiptAmount;
    return data;
  }
}