import 'dart:convert';

tRModelModel tRModelModelFromJson(String str) => tRModelModel.fromJson(json.decode(str));
String tRModelModelToJson(tRModelModel data) => json.encode(data.toJson());

class tRModelModel {
  String? modelName;
  String? modelTypeID;

  tRModelModel({
    this.modelName,
    this.modelTypeID,
  });

   tRModelModel.fromJson(dynamic json) {

      modelName= json["Model_Name"];
      modelTypeID= json["Model_Type_ID"];

  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Model_Name'] = modelName;
    map['Model_Type_ID'] = modelTypeID;

    return map;
  }


}