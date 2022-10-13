
import 'dart:convert';

tRPocketModel tRCuffModelFromJson(String str) => tRPocketModel.fromJson(json.decode(str));
String tRCuffModelToJson(tRPocketModel data) => json.encode(data.toJson());
class tRPocketModel {
  String? PocketName;
  String? PocketTypeId;


  tRPocketModel({
    this.PocketName,
    this.PocketTypeId,
  });

  tRPocketModel.fromJson(dynamic json) {

    PocketName= json["Pocket_Name"];
    PocketTypeId= json["Pocket_Type_ID"];

  }
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Pocket_Name'] = PocketName;
    map['Pocket_Type_ID'] = PocketTypeId;
    return map;
  }


}