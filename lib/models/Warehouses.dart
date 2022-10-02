import 'dart:convert';

Warehouses warehousesFromJson(String str) => Warehouses.fromJson(json.decode(str));
String warehousesToJson(Warehouses data) => json.encode(data.toJson());
class Warehouses {
  Warehouses({
      this.maxOfflinePosId, 
      this.address, 
      this.code, 
      this.email, 
      this.id, 
      this.mapUrl, 
      this.name, 
      this.phone, 
      this.priceGroupId,});

  Warehouses.fromJson(dynamic json) {
    maxOfflinePosId = json['Max_Offline_Pos_id'];
    address = json['address'];
    code = json['code'];
    email = json['email'];
    id = json['id'];
    mapUrl = json['map_url'];
    name = json['name'];
    phone = json['phone'];
    priceGroupId = json['price_group_id'];
  }
  String? maxOfflinePosId;
  String? address;
  String? code;
  String? email;
  String? id;
  dynamic mapUrl;
  String? name;
  String? phone;
  String? priceGroupId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Max_Offline_Pos_id'] = maxOfflinePosId;
    map['address'] = address;
    map['code'] = code;
    map['email'] = email;
    map['id'] = id;
    map['map_url'] = mapUrl;
    map['name'] = name;
    map['phone'] = phone;
    map['price_group_id'] = priceGroupId;
    return map;
  }

}