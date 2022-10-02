import 'dart:convert';

PaymentType paymentTypeFromJson(String str) => PaymentType.fromJson(json.decode(str));
String paymentTypeToJson(PaymentType data) => json.encode(data.toJson());
class PaymentType {
  PaymentType({
      this.code, 
      this.icon, 
      this.id, 
      this.isActive, 
      this.isCC, 
      this.isCredit, 
      this.ischeque, 
      this.name, 
      this.secondName,});

  PaymentType.fromJson(dynamic json) {
    code = json['code'];
    icon = json['icon'];
    id = json['id'];
    isActive = json['isActive'];
    isCC = json['isCC'];
    isCredit = json['isCredit'];
    ischeque = json['ischeque'];
    name = json['name'];
    secondName = json['second_name'];
  }
  String? code;
  String? icon;
  String? id;
  String? isActive;
  String? isCC;
  String? isCredit;
  String? ischeque;
  String? name;
  String? secondName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    map['icon'] = icon;
    map['id'] = id;
    map['isActive'] = isActive;
    map['isCC'] = isCC;
    map['isCredit'] = isCredit;
    map['ischeque'] = ischeque;
    map['name'] = name;
    map['second_name'] = secondName;
    return map;
  }

}