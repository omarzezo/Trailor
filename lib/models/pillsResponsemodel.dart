class PillsResponseModel {
  List<Data>? data;
  int? limit;
  int? start;
  int? total;

  PillsResponseModel({this.data, this.limit, this.start, this.total});

  PillsResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
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

class Data {
  String? id;
  String? date;
  String? referenceNo;
  String? customerId;
  String? customer;
  String? billerId;
  String? biller;
  String? warehouseId;
  String? note;
  String? staffNote;
  String? total;
  String? productDiscount;
  String? orderDiscountId;
  String? totalDiscount;
  String? orderDiscount;
  String? productTax;
  String? orderTaxId;
  String? orderTax;
  String? totalTax;
  String? shipping;
  String? grandTotal;
  String? saleStatus;
  String? paymentStatus;
  String? paymentTerm;
  Null? dueDate;
  String? createdBy;
  Null? updatedBy;
  Null? updatedAt;
  String? totalItems;
  String? pos;
  String? paid;
  Null? returnId;
  String? surcharge;
  Null? attachment;
  Null? returnSaleRef;
  Null? saleId;
  String? returnSaleTotal;
  String? rounding;
  Null? suspendNote;
  String? api;
  String? shop;
  Null? addressId;
  Null? reserveId;
  String? hash;
  Null? manualPayment;
  Null? cgst;
  Null? sgst;
  Null? igst;
  Null? paymentMethod;
  String? orderType;
  String? offlinePosId;
  String? supplyDate;
  String? dept;
  String? tableNo;
  String? empType;
  String? empId;
  Null? plateNo;
  Null? exitDate;
  String? currencyCode;
  String? currencyRate;
  String? discountAllowance;
  Null? uuid;
  Null? poNo;
  Null? costCenterId;
  Null? costCenterAmount;
  List<Items>? items;

  Data(
      {this.id,
        this.date,
        this.referenceNo,
        this.customerId,
        this.customer,
        this.billerId,
        this.biller,
        this.warehouseId,
        this.note,
        this.staffNote,
        this.total,
        this.productDiscount,
        this.orderDiscountId,
        this.totalDiscount,
        this.orderDiscount,
        this.productTax,
        this.orderTaxId,
        this.orderTax,
        this.totalTax,
        this.shipping,
        this.grandTotal,
        this.saleStatus,
        this.paymentStatus,
        this.paymentTerm,
        this.dueDate,
        this.createdBy,
        this.updatedBy,
        this.updatedAt,
        this.totalItems,
        this.pos,
        this.paid,
        this.returnId,
        this.surcharge,
        this.attachment,
        this.returnSaleRef,
        this.saleId,
        this.returnSaleTotal,
        this.rounding,
        this.suspendNote,
        this.api,
        this.shop,
        this.addressId,
        this.reserveId,
        this.hash,
        this.manualPayment,
        this.cgst,
        this.sgst,
        this.igst,
        this.paymentMethod,
        this.orderType,
        this.offlinePosId,
        this.supplyDate,
        this.dept,
        this.tableNo,
        this.empType,
        this.empId,
        this.plateNo,
        this.exitDate,
        this.currencyCode,
        this.currencyRate,
        this.discountAllowance,
        this.uuid,
        this.poNo,
        this.costCenterId,
        this.costCenterAmount,
        this.items});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    referenceNo = json['reference_no'];
    customerId = json['customer_id'];
    customer = json['customer'];
    billerId = json['biller_id'];
    biller = json['biller'];
    warehouseId = json['warehouse_id'];
    note = json['note'];
    staffNote = json['staff_note'];
    total = json['total'];
    productDiscount = json['product_discount'];
    orderDiscountId = json['order_discount_id'];
    totalDiscount = json['total_discount'];
    orderDiscount = json['order_discount'];
    productTax = json['product_tax'];
    orderTaxId = json['order_tax_id'];
    orderTax = json['order_tax'];
    totalTax = json['total_tax'];
    shipping = json['shipping'];
    grandTotal = json['grand_total'];
    saleStatus = json['sale_status'];
    paymentStatus = json['payment_status'];
    paymentTerm = json['payment_term'];
    dueDate = json['due_date'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    updatedAt = json['updated_at'];
    totalItems = json['total_items'];
    pos = json['pos'];
    paid = json['paid'];
    returnId = json['return_id'];
    surcharge = json['surcharge'];
    attachment = json['attachment'];
    returnSaleRef = json['return_sale_ref'];
    saleId = json['sale_id'];
    returnSaleTotal = json['return_sale_total'];
    rounding = json['rounding'];
    suspendNote = json['suspend_note'];
    api = json['api'];
    shop = json['shop'];
    addressId = json['address_id'];
    reserveId = json['reserve_id'];
    hash = json['hash'];
    manualPayment = json['manual_payment'];
    cgst = json['cgst'];
    sgst = json['sgst'];
    igst = json['igst'];
    paymentMethod = json['payment_method'];
    orderType = json['order_type'];
    offlinePosId = json['Offline_Pos_id'];
    supplyDate = json['supply_date'];
    dept = json['dept'];
    tableNo = json['table_no'];
    empType = json['emp_type'];
    empId = json['emp_id'];
    plateNo = json['plate_no'];
    exitDate = json['exit_date'];
    currencyCode = json['currency_code'];
    currencyRate = json['currency_rate'];
    discountAllowance = json['discount_allowance'];
    uuid = json['uuid'];
    poNo = json['po_no'];
    costCenterId = json['costCenterId'];
    costCenterAmount = json['costCenterAmount'];
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
    data['date'] = this.date;
    data['reference_no'] = this.referenceNo;
    data['customer_id'] = this.customerId;
    data['customer'] = this.customer;
    data['biller_id'] = this.billerId;
    data['biller'] = this.biller;
    data['warehouse_id'] = this.warehouseId;
    data['note'] = this.note;
    data['staff_note'] = this.staffNote;
    data['total'] = this.total;
    data['product_discount'] = this.productDiscount;
    data['order_discount_id'] = this.orderDiscountId;
    data['total_discount'] = this.totalDiscount;
    data['order_discount'] = this.orderDiscount;
    data['product_tax'] = this.productTax;
    data['order_tax_id'] = this.orderTaxId;
    data['order_tax'] = this.orderTax;
    data['total_tax'] = this.totalTax;
    data['shipping'] = this.shipping;
    data['grand_total'] = this.grandTotal;
    data['sale_status'] = this.saleStatus;
    data['payment_status'] = this.paymentStatus;
    data['payment_term'] = this.paymentTerm;
    data['due_date'] = this.dueDate;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    data['updated_at'] = this.updatedAt;
    data['total_items'] = this.totalItems;
    data['pos'] = this.pos;
    data['paid'] = this.paid;
    data['return_id'] = this.returnId;
    data['surcharge'] = this.surcharge;
    data['attachment'] = this.attachment;
    data['return_sale_ref'] = this.returnSaleRef;
    data['sale_id'] = this.saleId;
    data['return_sale_total'] = this.returnSaleTotal;
    data['rounding'] = this.rounding;
    data['suspend_note'] = this.suspendNote;
    data['api'] = this.api;
    data['shop'] = this.shop;
    data['address_id'] = this.addressId;
    data['reserve_id'] = this.reserveId;
    data['hash'] = this.hash;
    data['manual_payment'] = this.manualPayment;
    data['cgst'] = this.cgst;
    data['sgst'] = this.sgst;
    data['igst'] = this.igst;
    data['payment_method'] = this.paymentMethod;
    data['order_type'] = this.orderType;
    data['Offline_Pos_id'] = this.offlinePosId;
    data['supply_date'] = this.supplyDate;
    data['dept'] = this.dept;
    data['table_no'] = this.tableNo;
    data['emp_type'] = this.empType;
    data['emp_id'] = this.empId;
    data['plate_no'] = this.plateNo;
    data['exit_date'] = this.exitDate;
    data['currency_code'] = this.currencyCode;
    data['currency_rate'] = this.currencyRate;
    data['discount_allowance'] = this.discountAllowance;
    data['uuid'] = this.uuid;
    data['po_no'] = this.poNo;
    data['costCenterId'] = this.costCenterId;
    data['costCenterAmount'] = this.costCenterAmount;
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
  Null? discount;
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