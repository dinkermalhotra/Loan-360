class ReceiptAutoData {
  String? key;
  String? value;

  ReceiptAutoData({this.key, this.value});

  ReceiptAutoData.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key'] = this.key;
    data['value'] = this.value;
    return data;
  }
}