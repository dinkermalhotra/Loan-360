class ReceivedAmountModel {
  String? accountCode;
  String? balance;
  String? accountHead;

  ReceivedAmountModel({this.accountCode, this.balance, this.accountHead});

  ReceivedAmountModel.fromJson(Map<String, dynamic> json) {
    accountCode = json['accountCode']!=null? json['accountCode']:"";
    balance = (json['balance']  is  double ? json['balance'].toString().startsWith("-")?json['balance'].toString().split('-')[1].trim().toString():json['balance'].toString(): json['balance'] is  int ? json['balance'].toString().startsWith("-")?json['balance'].toString().split('-')[1].trim().toString():json['balance'].toString(): json['balance'].toString());
    accountHead = json['accountHead']!=null?json['accountHead']:"";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accountCode'] = this.accountCode;
    data['balance'] = this.balance;
    data['accountHead'] = this.accountHead;
    return data;
  }
}