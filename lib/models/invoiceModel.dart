class InvoiceModel {
  List<InvoiceData>? invoiceData;
  int? limit;
  int? start;
  int? total;

  InvoiceModel({this.invoiceData, this.limit, this.start, this.total});

  InvoiceModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      invoiceData = <InvoiceData>[];
      json['data'].forEach((v) {
        invoiceData!.add(new InvoiceData.fromJson(v));
      });
    }
    limit = json['limit'];
    start = json['start'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.invoiceData != null) {
      data['data'] = this.invoiceData!.map((v) => v.toJson()).toList();
    }
    data['limit'] = this.limit;
    data['start'] = this.start;
    data['total'] = this.total;
    return data;
  }
}

class InvoiceData {
  String? id;
  String? referenceNo;
  String? customerId;
  String? customer;
  String? date;
  String? deliveryDate;
  String? saleStatus;
  String? balance;
  List<Items>? items;

  InvoiceData(
      {this.id,
        this.referenceNo,
        this.customerId,
        this.customer,
        this.date,
        this.deliveryDate,
        this.saleStatus,
        this.balance,
        this.items});

  InvoiceData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    referenceNo = json['reference_no'];
    customerId = json['customer_id'];
    customer = json['customer'];
    date = json['date'];
    deliveryDate = json['delivery_date'];
    saleStatus = json['sale_status'];
    balance = json['balance'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['reference_no'] = this.referenceNo;
    data['customer_id'] = this.customerId;
    data['customer'] = this.customer;
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
  Null? optionId;
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
  Null? saleItemId;
  String? productUnitId;
  String? productUnitCode;
  String? unitQuantity;
  Null? comment;
  Null? gst;
  Null? cgst;
  Null? sgst;
  Null? igst;
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