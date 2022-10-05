
import 'dart:convert';

tRCollarModel tRCollarModelFromJson(String str) => tRCollarModel.fromJson(json.decode(str));
String tRCollarModelToJson(tRCollarModel data) => json.encode(data.toJson());

class tRCollarModel {
  String? CollarName;
  String? CollarTypeId;

  tRCollarModel({
    this.CollarName,
    this.CollarTypeId,
  });
  tRCollarModel.fromJson(dynamic json) {
    CollarName= json["Collar_Name"];
    CollarTypeId= json["Collar_Type_ID"];

  }
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Collar_Name'] = CollarName;
    map['Collar_Type_ID'] = CollarTypeId;
    return map;
  }


}