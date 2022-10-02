import 'dart:convert';

WarehousesProducts warehousesProductsFromJson(String str) => WarehousesProducts.fromJson(json.decode(str));
String warehousesProductsToJson(WarehousesProducts data) => json.encode(data.toJson());
class WarehousesProducts {
  WarehousesProducts({
      this.api, 
      this.avgCost, 
      this.code, 
      this.id, 
      this.productId, 
      this.quantity, 
      this.rack, 
      this.warehouseCode, 
      this.warehouseId,});

  WarehousesProducts.fromJson(dynamic json) {
    api = json['api'];
    avgCost = json['avg_cost'];
    code = json['code'];
    id = json['id'];
    productId = json['product_id'];
    quantity = json['quantity'];
    rack = json['rack'];
    warehouseCode = json['warehouse_code'];
    warehouseId = json['warehouse_id'];
  }
  String? api;
  String? avgCost;
  String? code;
  String? id;
  String? productId;
  String? quantity;
  dynamic rack;
  String? warehouseCode;
  String? warehouseId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['api'] = api;
    map['avg_cost'] = avgCost;
    map['code'] = code;
    map['id'] = id;
    map['product_id'] = productId;
    map['quantity'] = quantity;
    map['rack'] = rack;
    map['warehouse_code'] = warehouseCode;
    map['warehouse_id'] = warehouseId;
    return map;
  }

}