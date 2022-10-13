
import 'dart:convert';

tRZipperModel tRCuffModelFromJson(String str) => tRZipperModel.fromJson(json.decode(str));
String tRCuffModelToJson(tRZipperModel data) => json.encode(data.toJson());
class tRZipperModel {
  String? ZipperName;
  String? ZipperTypeId;


  tRZipperModel({
    this.ZipperName,
    this.ZipperTypeId,
  });

  tRZipperModel.fromJson(dynamic json) {

    ZipperName= json["Zipper_Name"];
    ZipperTypeId= json["Zipper_Type_ID"];

  }
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Zipper_Name'] = ZipperName;
    map['Zipper_Type_ID'] = ZipperTypeId;
    return map;
  }


}