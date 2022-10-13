
import 'dart:convert';

tRFillingModel tRCuffModelFromJson(String str) => tRFillingModel.fromJson(json.decode(str));
String tRCuffModelToJson(tRFillingModel data) => json.encode(data.toJson());
class tRFillingModel {
  String? FillingName;
  String? FillingTypeId;


  tRFillingModel({
    this.FillingName,
    this.FillingTypeId,
  });

  tRFillingModel.fromJson(dynamic json) {

     FillingName= json["Filling_Name"];
     FillingTypeId= json["Filling_Type_ID"];

  }
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Filling_Name'] = FillingName;
    map['Filling_Type_ID'] = FillingTypeId;
    return map;
  }


}