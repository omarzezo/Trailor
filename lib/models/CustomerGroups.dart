import 'dart:convert';

CustomerGroups customerGroupsFromJson(String str) => CustomerGroups.fromJson(json.decode(str));
String customerGroupsToJson(CustomerGroups data) => json.encode(data.toJson());
class CustomerGroups {
  CustomerGroups({
      this.id, 
      this.name, 
      this.percent,});

  CustomerGroups.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    percent = json['percent'];
  }
  String? id;
  String? name;
  String? percent;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['percent'] = percent;
    return map;
  }

}