
import 'dart:convert';

tRTailorModel tRCuffModelFromJson(String str) => tRTailorModel.fromJson(json.decode(str));
String tRCuffModelToJson(tRTailorModel data) => json.encode(data.toJson());
class tRTailorModel {
  String? TailorName;
  String? TailorId;


  tRTailorModel({
    this.TailorName,
    this.TailorId,
  });

  tRTailorModel.fromJson(dynamic json) {

    TailorName= json["tailor_name"];
    TailorId= json["tailor_id"];

  }
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['tailor_name'] = TailorName;
    map['tailor_id'] = TailorId;
    return map;
  }


}