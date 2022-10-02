import 'dart:convert';

Units unitsFromJson(String str) => Units.fromJson(json.decode(str));
String unitsToJson(Units data) => json.encode(data.toJson());
class Units {
  Units({
      this.api, 
      this.baseUnit, 
      this.code, 
      this.id, 
      this.name, 
      this.operationValue, 
      this.operator, 
      this.unitValue,});

  Units.fromJson(dynamic json) {
    api = json['api'];
    baseUnit = json['base_unit'];
    code = json['code'];
    id = json['id'];
    name = json['name'];
    operationValue = json['operation_value'];
    operator = json['operator'];
    unitValue = json['unit_value'];
  }
  String? api;
  dynamic baseUnit;
  String? code;
  String? id;
  String? name;
  dynamic operationValue;
  dynamic operator;
  dynamic unitValue;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['api'] = api;
    map['base_unit'] = baseUnit;
    map['code'] = code;
    map['id'] = id;
    map['name'] = name;
    map['operation_value'] = operationValue;
    map['operator'] = operator;
    map['unit_value'] = unitValue;
    return map;
  }

}