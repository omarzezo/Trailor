import 'dart:convert';

Products productsFromJson(String str) => Products.fromJson(json.decode(str));
String productsToJson(Products data) => json.encode(data.toJson());
class Products {
  Products({
      this.alertQuantity, 
      this.api, 
      this.barcodeSymbology, 
      this.brand, 
      this.categoryId, 
      this.cf1, 
      this.cf2, 
      this.cf3, 
      this.cf4, 
      this.cf5, 
      this.cf6, 
      this.code, 
      this.cost, 
      this.currencyCode, 
      this.details, 
      this.endDate, 
      this.expiry, 
      this.featured, 
      this.file, 
      this.hide, 
      this.hidePos, 
      this.hsnCode, 
      this.id, 
      this.image, 
      this.imageUrl, 
      this.name, 
      this.price, 
      this.productDetails, 
      this.productNumber, 
      this.promoPrice, 
      this.promotion, 
      this.purchaseUnit, 
      this.quantity, 
      this.saleUnit, 
      this.secondName, 
      this.slug, 
      this.startDate, 
      this.subcategoryId, 
      this.supplier1, 
      this.supplier1PartNo, 
      this.supplier1price, 
      this.supplier2, 
      this.supplier2PartNo, 
      this.supplier2price, 
      this.supplier3, 
      this.supplier3PartNo, 
      this.supplier3price, 
      this.supplier4, 
      this.supplier4PartNo, 
      this.supplier4price, 
      this.supplier5, 
      this.supplier5PartNo, 
      this.supplier5price, 
      this.taxMethod, 
      this.taxRate, 
      this.trackQuantity, 
      this.type, 
      this.type2, 
      this.unit, 
      this.views, 
      this.warehouse, 
      this.weight,});

  Products.fromJson(dynamic json) {
    alertQuantity = json['alert_quantity'];
    api = json['api'];
    barcodeSymbology = json['barcode_symbology'];
    brand = json['brand'];
    categoryId = json['category_id'];
    cf1 = json['cf1'];
    cf2 = json['cf2'];
    cf3 = json['cf3'];
    cf4 = json['cf4'];
    cf5 = json['cf5'];
    cf6 = json['cf6'];
    code = json['code'];
    cost = json['cost'];
    currencyCode = json['currency_code'];
    details = json['details'];
    endDate = json['end_date'];
    expiry = json['expiry'];
    featured = json['featured'];
    file = json['file'];
    hide = json['hide'];
    hidePos = json['hide_pos'];
    hsnCode = json['hsn_code'];
    id = json['id'];
    image = json['image'];
    imageUrl = json['image_url'];
    name = json['name'];
    price = json['price'];
    productDetails = json['product_details'];
    productNumber = json['product_number'];
    promoPrice = json['promo_price'];
    promotion = json['promotion'];
    purchaseUnit = json['purchase_unit'];
    quantity = json['quantity'];
    saleUnit = json['sale_unit'];
    secondName = json['second_name'];
    slug = json['slug'];
    startDate = json['start_date'];
    subcategoryId = json['subcategory_id'];
    supplier1 = json['supplier1'];
    supplier1PartNo = json['supplier1_part_no'];
    supplier1price = json['supplier1price'];
    supplier2 = json['supplier2'];
    supplier2PartNo = json['supplier2_part_no'];
    supplier2price = json['supplier2price'];
    supplier3 = json['supplier3'];
    supplier3PartNo = json['supplier3_part_no'];
    supplier3price = json['supplier3price'];
    supplier4 = json['supplier4'];
    supplier4PartNo = json['supplier4_part_no'];
    supplier4price = json['supplier4price'];
    supplier5 = json['supplier5'];
    supplier5PartNo = json['supplier5_part_no'];
    supplier5price = json['supplier5price'];
    taxMethod = json['tax_method'];
    taxRate = json['tax_rate'];
    trackQuantity = json['track_quantity'];
    type = json['type'];
    type2 = json['type2'];
    unit = json['unit'];
    views = json['views'];
    warehouse = json['warehouse'];
    weight = json['weight'];
  }
  String? alertQuantity;
  String? api;
  String? barcodeSymbology;
  String? brand;
  String? categoryId;
  String? cf1;
  String? cf2;
  String? cf3;
  String? cf4;
  String? cf5;
  String? cf6;
  String? code;
  dynamic cost;
  String? currencyCode;
  String? details;
  dynamic endDate;
  String? expiry;
  dynamic featured;
  String? file;
  String? hide;
  String? hidePos;
  dynamic hsnCode;
  String? id;
  String? image;
  String? imageUrl;
  String? name;
  String? price;
  String? productDetails;
  String? productNumber;
  dynamic promoPrice;
  dynamic promotion;
  String? purchaseUnit;
  dynamic quantity;
  String? saleUnit;
  String? secondName;
  String? slug;
  dynamic startDate;
  dynamic subcategoryId;
  String? supplier1;
  String? supplier1PartNo;
  dynamic supplier1price;
  dynamic supplier2;
  dynamic supplier2PartNo;
  dynamic supplier2price;
  dynamic supplier3;
  dynamic supplier3PartNo;
  dynamic supplier3price;
  dynamic supplier4;
  dynamic supplier4PartNo;
  dynamic supplier4price;
  dynamic supplier5;
  dynamic supplier5PartNo;
  dynamic supplier5price;
  String? taxMethod;
  String? taxRate;
  String? trackQuantity;
  String? type;
  String? type2;
  String? unit;
  String? views;
  dynamic warehouse;
  String? weight;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['alert_quantity'] = alertQuantity;
    map['api'] = api;
    map['barcode_symbology'] = barcodeSymbology;
    map['brand'] = brand;
    map['category_id'] = categoryId;
    map['cf1'] = cf1;
    map['cf2'] = cf2;
    map['cf3'] = cf3;
    map['cf4'] = cf4;
    map['cf5'] = cf5;
    map['cf6'] = cf6;
    map['code'] = code;
    map['cost'] = cost;
    map['currency_code'] = currencyCode;
    map['details'] = details;
    map['end_date'] = endDate;
    map['expiry'] = expiry;
    map['featured'] = featured;
    map['file'] = file;
    map['hide'] = hide;
    map['hide_pos'] = hidePos;
    map['hsn_code'] = hsnCode;
    map['id'] = id;
    map['image'] = image;
    map['image_url'] = imageUrl;
    map['name'] = name;
    map['price'] = price;
    map['product_details'] = productDetails;
    map['product_number'] = productNumber;
    map['promo_price'] = promoPrice;
    map['promotion'] = promotion;
    map['purchase_unit'] = purchaseUnit;
    map['quantity'] = quantity;
    map['sale_unit'] = saleUnit;
    map['second_name'] = secondName;
    map['slug'] = slug;
    map['start_date'] = startDate;
    map['subcategory_id'] = subcategoryId;
    map['supplier1'] = supplier1;
    map['supplier1_part_no'] = supplier1PartNo;
    map['supplier1price'] = supplier1price;
    map['supplier2'] = supplier2;
    map['supplier2_part_no'] = supplier2PartNo;
    map['supplier2price'] = supplier2price;
    map['supplier3'] = supplier3;
    map['supplier3_part_no'] = supplier3PartNo;
    map['supplier3price'] = supplier3price;
    map['supplier4'] = supplier4;
    map['supplier4_part_no'] = supplier4PartNo;
    map['supplier4price'] = supplier4price;
    map['supplier5'] = supplier5;
    map['supplier5_part_no'] = supplier5PartNo;
    map['supplier5price'] = supplier5price;
    map['tax_method'] = taxMethod;
    map['tax_rate'] = taxRate;
    map['track_quantity'] = trackQuantity;
    map['type'] = type;
    map['type2'] = type2;
    map['unit'] = unit;
    map['views'] = views;
    map['warehouse'] = warehouse;
    map['weight'] = weight;
    return map;
  }

}