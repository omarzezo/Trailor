import 'dart:convert';

ExpenseCategories expenseCategoriesFromJson(String str) => ExpenseCategories.fromJson(json.decode(str));
String expenseCategoriesToJson(ExpenseCategories data) => json.encode(data.toJson());
class ExpenseCategories {
  ExpenseCategories({
      this.api, 
      this.code, 
      this.id, 
      this.name,});

  ExpenseCategories.fromJson(dynamic json) {
    api = json['api'];
    code = json['code'];
    id = json['id'];
    name = json['name'];
  }
  String? api;
  String? code;
  String? id;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['api'] = api;
    map['code'] = code;
    map['id'] = id;
    map['name'] = name;
    return map;
  }

}