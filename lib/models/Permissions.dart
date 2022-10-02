import 'dart:convert';

Permissions permissionsFromJson(String str) => Permissions.fromJson(json.decode(str));
String permissionsToJson(Permissions data) => json.encode(data.toJson());
class Permissions {
  Permissions({
      this.groupId, 
      this.id, 
      this.salesReports,});

  Permissions.fromJson(dynamic json) {
    groupId = json['group_id'];
    id = json['id'];
    salesReports = json['sales_reports'];
  }
  String? groupId;
  String? id;
  String? salesReports;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['group_id'] = groupId;
    map['id'] = id;
    map['sales_reports'] = salesReports;
    return map;
  }

}