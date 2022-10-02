import 'dart:convert';

PriceGroups priceGroupsFromJson(String str) => PriceGroups.fromJson(json.decode(str));
String priceGroupsToJson(PriceGroups data) => json.encode(data.toJson());
class PriceGroups {
  PriceGroups({
      this.id, 
      this.name,});

  PriceGroups.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }
  String? id;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }

}