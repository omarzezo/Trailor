// class Details {
//   final String status;
//   final dynamic dateOfDelivery;
//   final dynamic dateOfInvoice;
//   final String client;
//   final double phone;
//   final double code;
//   final double ref;
//   final double num;
//
//   const Details({
//     required this.status,
//     required this.dateOfDelivery,
//     required this.dateOfInvoice,
//     required this.client,
//     required this.phone,
//     required this.code,
//     required this.ref,
//     required this.num,
//   });
//
//   factory Details.fromJson(Map<String, dynamic> json) {
//     return Details(
//       status: json["status"],
//       dateOfDelivery: json["dateOfDelivery"],
//       dateOfInvoice: json["dateOfInvoice"],
//       client: json["client"],
//       phone: double.parse(json["phone"]),
//       code: double.parse(json["code"]),
//       ref: double.parse(json["reference_no"]),
//       num: double.parse(json["num"]),
//     );
//   }
// //
//
// }
// class Details {
//   final String status;
//   final dynamic dateOfDelivery;
//   final dynamic dateOfInvoice;
//   final String client;
//   final double phone;
//   final double code;
//   final String refNumber;
//   final double num;
//
//   const Details({
//     required this.status,
//     required this.dateOfDelivery,
//     required this.dateOfInvoice,
//     required this.client,
//     required this.phone,
//     required this.code,
//     required this.refNumber,
//     required this.num,
//   });
//
//   factory Details.fromJson(Map<String, dynamic> json) {
//     return Details(
//       status: json["sale_status"],
//       dateOfDelivery: json["supply_date"],
//       dateOfInvoice: json["date"],
//       client: json["customer"],
//       phone: double.parse(json["phone"]),
//       code: double.parse(json["code"]),
//       refNumber: json["reference_no"],
//       num: double.parse(json["num"]),
//     );
//   }
// //
//
// }
// class PillsDetails {
//   List<Data>? data;
//   int? limit;
//   int? start;
//   int? total;
//
//   PillsDetails({this.data, this.limit, this.start, this.total});
//
//   PillsDetails.fromJson(Map<String, dynamic> json) {
//     if (json['data'] != null) {
//       data = <Data>[];
//       json['data'].forEach((v) {
//         data!.add( Data.fromJson(v));
//       });
//     }
//     limit = json['limit'];
//     start = json['start'];
//     total = json['total'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data =  Map<String, dynamic>();
//     if (this.data != null) {
//       data['data'] = this.data!.map((v) => v.toJson()).toList();
//     }
//     data['limit'] = limit;
//     data['start'] = start;
//     data['total'] = total;
//     return data;
//   }
// }
//
// class Data {
//   String? id;
//   String? referenceNo;
//   String? customerId;
//   String? customer;
//   String? date;
//   String? saleStatus;
//
//   Data(
//       {this.id,
//         this.referenceNo,
//         this.customerId,
//         this.customer,
//         this.date,
//         this.saleStatus});
//
//   Data.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     referenceNo = json['reference_no'];
//     customerId = json['customer_id'];
//     customer = json['customer'];
//     date = json['date'];
//     saleStatus = json['sale_status'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = id;
//     data['reference_no'] = referenceNo;
//     data['customer_id'] = customerId;
//     data['customer'] = customer;
//     data['date'] = date;
//     data['sale_status'] = saleStatus;
//     return data;
//   }
// }
// class PillsDetails {
//   List<PillsDetailsData>? data;
//   int? limit;
//   int? start;
//   int? total;
//
//   PillsDetails({this.data, this.limit, this.start, this.total});
//
//   PillsDetails.fromJson(Map<String, dynamic> json) {
//     if (json['data'] != null) {
//       data = <PillsDetailsData>[];
//       json['data'].forEach((v) {
//         data!.add(new PillsDetailsData.fromJson(v));
//       });
//     }
//     limit = json['limit'];
//     start = json['start'];
//     total = json['total'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.data != null) {
//       data['data'] = this.data!.map((v) => v.toJson()).toList();
//     }
//     data['limit'] = this.limit;
//     data['start'] = this.start;
//     data['total'] = this.total;
//     return data;
//   }
// }

// class PillsDetailsData {
//   String? id;
//   String? referenceNo;
//   String? phone;
//   String? customerId;
//   String? customer;
//   String? date;
//   String? deliveryDate;
//   String? saleStatus;
//   String? balance;
//
//   PillsDetailsData(
//       {this.id,
//         this.referenceNo,
//         this.customerId,
//         this.phone,
//         this.customer,
//         this.date,
//         this.deliveryDate,
//         this.saleStatus,
//         this.balance});
//
//   PillsDetailsData.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     referenceNo = json['reference_no'];
//     customerId = json['customer_id'];
//     customer = json['customer'];
//     phone = json['phone'];
//     date = json['date'];
//     deliveryDate = json['delivery_date'];
//     saleStatus = json['sale_status'];
//     balance = json['balance'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['reference_no'] = this.referenceNo;
//     data['customer_id'] = this.customerId;
//     data['customer'] = this.customer;
//     data['phone'] = this.phone;
//     data['date'] = this.date;
//     data['delivery_date'] = this.deliveryDate;
//     data['sale_status'] = this.saleStatus;
//     data['balance'] = this.balance;
//     return data;
//   }
// }
class PillsDetails {
  List<PillsDetailsData>? data;
  int? limit;
  int? start;
  int? total;

  PillsDetails({this.data, this.limit, this.start, this.total});

  PillsDetails.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {

      data = <PillsDetailsData>[];
      json['data'].forEach((v) {
        data!.add(new PillsDetailsData.fromJson(v));
      });
    }
    limit = json['limit'];
    start = json['start'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['limit'] = this.limit;
    data['start'] = this.start;
    data['total'] = this.total;
    return data;
  }
}

class PillsDetailsData {
  String? id;
  String? referenceNo;
  String? customerId;
  String? customer;
  String? phone;
  String? date;
  String? deliveryDate;
  String? saleStatus;
  String? balance;
  List<Items>? items;

  PillsDetailsData(
      {this.id,
        this.referenceNo,
        this.customerId,
        this.customer,
        this.phone,
        this.date,
        this.deliveryDate,
        this.saleStatus,
        this.balance,
        this.items});

  PillsDetailsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    referenceNo = json['reference_no'];
    customerId = json['customer_id'];
    customer = json['customer'];
    phone = json['phone'];
    date = json['date'];
    deliveryDate = json['delivery_date'];
    saleStatus = json['sale_status'];
    balance = json['balance'];
    if (json['items'] != null&&json['items']!=false) {

      try{
        items = <Items>[];
        json['items'].forEach((v) {
          items!.add(new Items.fromJson(v));
        });
      }catch(e){

      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['reference_no'] = this.referenceNo;
    data['customer_id'] = this.customerId;
    data['customer'] = this.customer;
    data['phone'] = this.phone;
    data['date'] = this.date;
    data['delivery_date'] = this.deliveryDate;
    data['sale_status'] = this.saleStatus;
    data['balance'] = this.balance;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  String? id;
  String? saleId;
  String? productId;
  String? productCode;
  String? productName;
  String? productType;
  String? optionId;
  String? netUnitPrice;
  String? unitPrice;
  String? quantity;
  String? warehouseId;
  String? itemTax;
  String? taxRateId;
  String? tax;
  String? discount;
  String? itemDiscount;
  String? subtotal;
  String? serialNo;
  String? realUnitPrice;
  String? saleItemId;
  String? productUnitId;
  String? productUnitCode;
  String? unitQuantity;
  String? comment;
  String? gst;
  String? cgst;
  String? sgst;
  String? igst;
  String? itemCostValue;
  String? avgCost;
  String? overselling;
  String? quantityOverselling;
  String? promoFree;

  Items(
      {this.id,
        this.saleId,
        this.productId,
        this.productCode,
        this.productName,
        this.productType,
        this.optionId,
        this.netUnitPrice,
        this.unitPrice,
        this.quantity,
        this.warehouseId,
        this.itemTax,
        this.taxRateId,
        this.tax,
        this.discount,
        this.itemDiscount,
        this.subtotal,
        this.serialNo,
        this.realUnitPrice,
        this.saleItemId,
        this.productUnitId,
        this.productUnitCode,
        this.unitQuantity,
        this.comment,
        this.gst,
        this.cgst,
        this.sgst,
        this.igst,
        this.itemCostValue,
        this.avgCost,
        this.overselling,
        this.quantityOverselling,
        this.promoFree});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    saleId = json['sale_id'];
    productId = json['product_id'];
    productCode = json['product_code'];
    productName = json['product_name'];
    productType = json['product_type'];
    optionId = json['option_id'];
    netUnitPrice = json['net_unit_price'];
    unitPrice = json['unit_price'];
    quantity = json['quantity'];
    warehouseId = json['warehouse_id'];
    itemTax = json['item_tax'];
    taxRateId = json['tax_rate_id'];
    tax = json['tax'];
    discount = json['discount'];
    itemDiscount = json['item_discount'];
    subtotal = json['subtotal'];
    serialNo = json['serial_no'];
    realUnitPrice = json['real_unit_price'];
    saleItemId = json['sale_item_id'];
    productUnitId = json['product_unit_id'];
    productUnitCode = json['product_unit_code'];
    unitQuantity = json['unit_quantity'];
    comment = json['comment'];
    gst = json['gst'];
    cgst = json['cgst'];
    sgst = json['sgst'];
    igst = json['igst'];
    itemCostValue = json['item_cost_value'];
    avgCost = json['avg_cost'];
    overselling = json['overselling'];
    quantityOverselling = json['quantity_overselling'];
    promoFree = json['promo_free'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sale_id'] = this.saleId;
    data['product_id'] = this.productId;
    data['product_code'] = this.productCode;
    data['product_name'] = this.productName;
    data['product_type'] = this.productType;
    data['option_id'] = this.optionId;
    data['net_unit_price'] = this.netUnitPrice;
    data['unit_price'] = this.unitPrice;
    data['quantity'] = this.quantity;
    data['warehouse_id'] = this.warehouseId;
    data['item_tax'] = this.itemTax;
    data['tax_rate_id'] = this.taxRateId;
    data['tax'] = this.tax;
    data['discount'] = this.discount;
    data['item_discount'] = this.itemDiscount;
    data['subtotal'] = this.subtotal;
    data['serial_no'] = this.serialNo;
    data['real_unit_price'] = this.realUnitPrice;
    data['sale_item_id'] = this.saleItemId;
    data['product_unit_id'] = this.productUnitId;
    data['product_unit_code'] = this.productUnitCode;
    data['unit_quantity'] = this.unitQuantity;
    data['comment'] = this.comment;
    data['gst'] = this.gst;
    data['cgst'] = this.cgst;
    data['sgst'] = this.sgst;
    data['igst'] = this.igst;
    data['item_cost_value'] = this.itemCostValue;
    data['avg_cost'] = this.avgCost;
    data['overselling'] = this.overselling;
    data['quantity_overselling'] = this.quantityOverselling;
    data['promo_free'] = this.promoFree;
    return data;
  }
}
