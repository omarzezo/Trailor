import 'dart:convert';

ResturantEmpTypes resturantEmpTypesFromJson(String str) => ResturantEmpTypes.fromJson(json.decode(str));
String resturantEmpTypesToJson(ResturantEmpTypes data) => json.encode(data.toJson());
class ResturantEmpTypes {
  ResturantEmpTypes({
      this.id, 
      this.name, 
      this.title,});

  ResturantEmpTypes.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    title = json['title'];
  }
  String? id;
  String? name;
  String? title;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['title'] = title;
    return map;
  }

}