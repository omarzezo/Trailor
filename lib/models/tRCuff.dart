
import 'dart:convert';

tRCuffModel tRCuffModelFromJson(String str) => tRCuffModel.fromJson(json.decode(str));
String tRCuffModelToJson(tRCuffModel data) => json.encode(data.toJson());
class tRCuffModel {
  String? CuffName;
  String? CuffTypeId;


  tRCuffModel({
    this.CuffName,
    this.CuffTypeId,
  });

   tRCuffModel.fromJson(dynamic json) {

      CuffName= json["Cuff_Name"];
      CuffTypeId= json["Cuff_Type_ID"];

  }
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Cuff_Name'] = CuffName;
    map['Cuff_Type_ID'] = CuffTypeId;
    return map;
  }


}