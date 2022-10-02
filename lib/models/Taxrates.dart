import 'dart:convert';

Taxrates taxratesFromJson(String str) => Taxrates.fromJson(json.decode(str));
String taxratesToJson(Taxrates data) => json.encode(data.toJson());
class Taxrates {
  Taxrates({
      this.api, 
      this.categoryId, 
      this.code, 
      this.id, 
      this.name, 
      this.rate, 
      this.taxActive, 
      this.taxDefault, 
      this.type,});

  Taxrates.fromJson(dynamic json) {
    api = json['api'];
    categoryId = json['category_id'];
    code = json['code'];
    id = json['id'];
    name = json['name'];
    rate = json['rate'];
    taxActive = json['tax_active'];
    taxDefault = json['tax_default'];
    type = json['type'];
  }
  String? api;
  String? categoryId;
  String? code;
  String? id;
  String? name;
  String? rate;
  String? taxActive;
  String? taxDefault;
  String? type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['api'] = api;
    map['category_id'] = categoryId;
    map['code'] = code;
    map['id'] = id;
    map['name'] = name;
    map['rate'] = rate;
    map['tax_active'] = taxActive;
    map['tax_default'] = taxDefault;
    map['type'] = type;
    return map;
  }

}