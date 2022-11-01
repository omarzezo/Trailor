class SizeInformationModel {
  List<SizesData>? sizesData;
  int? limit;
  int? start;
  int? total;

  SizeInformationModel({this.sizesData, this.limit, this.start, this.total});

  SizeInformationModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      sizesData = <SizesData>[];
      json['data'].forEach((v) {
        sizesData!.add(new SizesData.fromJson(v));
      });
    }
    limit = json['limit'];
    start = json['start'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.sizesData != null) {
      data['data'] = this.sizesData!.map((v) => v.toJson()).toList();
    }
    data['limit'] = this.limit;
    data['start'] = this.start;
    data['total'] = this.total;
    return data;
  }
}

class SizesData {
  String? id;
  String? referenceNo;
  String? customerId;
  String? customer;
  String? date;
  String? deliveryDate;
  String? saleStatus;
  String? balance;
  List<Items>? items;
  List<Payments>? payments;
  List<MeasurementItem>? measurement;

  SizesData(
      {this.id,
        this.referenceNo,
        this.customerId,
        this.customer,
        this.date,
        this.deliveryDate,
        this.saleStatus,
        this.balance,
        this.items,
        this.payments,
        this.measurement});

  SizesData.fromJson(Map<String, dynamic> json) {
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
    if (json['payments'] != null) {
      payments = <Payments>[];
      json['payments'].forEach((v) {
        payments!.add(new Payments.fromJson(v));
      });
    }
    if (json['Measurement'] != null) {
      measurement = <MeasurementItem>[];
      json['Measurement'].forEach((v) {
        measurement!.add(new MeasurementItem.fromJson(v));
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
    if (this.payments != null) {
      data['payments'] = this.payments!.map((v) => v.toJson()).toList();
    }
    if (this.measurement != null) {
      data['Measurement'] = this.measurement!.map((v) => v.toJson()).toList();
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

class Payments {
  String? id;
  String? date;
  String? saleId;
  Null? returnId;
  Null? purchaseId;
  String? referenceNo;
  Null? transactionId;
  String? paidBy;
  String? chequeNo;
  String? ccNo;
  String? ccHolder;
  String? ccMonth;
  String? ccYear;
  String? ccType;
  String? amount;
  Null? currency;
  String? createdBy;
  Null? attachment;
  String? type;
  String? note;
  String? posPaid;
  String? posBalance;
  Null? approvalCode;
  String? currencyRate;
  String? glPaymentMethodId;
  String? commercialDiscount;
  Null? commercialDiscountId;

  Payments(
      {this.id,
        this.date,
        this.saleId,
        this.returnId,
        this.purchaseId,
        this.referenceNo,
        this.transactionId,
        this.paidBy,
        this.chequeNo,
        this.ccNo,
        this.ccHolder,
        this.ccMonth,
        this.ccYear,
        this.ccType,
        this.amount,
        this.currency,
        this.createdBy,
        this.attachment,
        this.type,
        this.note,
        this.posPaid,
        this.posBalance,
        this.approvalCode,
        this.currencyRate,
        this.glPaymentMethodId,
        this.commercialDiscount,
        this.commercialDiscountId});

  Payments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    saleId = json['sale_id'];
    returnId = json['return_id'];
    purchaseId = json['purchase_id'];
    referenceNo = json['reference_no'];
    transactionId = json['transaction_id'];
    paidBy = json['paid_by'];
    chequeNo = json['cheque_no'];
    ccNo = json['cc_no'];
    ccHolder = json['cc_holder'];
    ccMonth = json['cc_month'];
    ccYear = json['cc_year'];
    ccType = json['cc_type'];
    amount = json['amount'];
    currency = json['currency'];
    createdBy = json['created_by'];
    attachment = json['attachment'];
    type = json['type'];
    note = json['note'];
    posPaid = json['pos_paid'];
    posBalance = json['pos_balance'];
    approvalCode = json['approval_code'];
    currencyRate = json['currency_rate'];
    glPaymentMethodId = json['gl_payment_method_id'];
    commercialDiscount = json['commercial_discount'];
    commercialDiscountId = json['commercial_discount_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date'] = this.date;
    data['sale_id'] = this.saleId;
    data['return_id'] = this.returnId;
    data['purchase_id'] = this.purchaseId;
    data['reference_no'] = this.referenceNo;
    data['transaction_id'] = this.transactionId;
    data['paid_by'] = this.paidBy;
    data['cheque_no'] = this.chequeNo;
    data['cc_no'] = this.ccNo;
    data['cc_holder'] = this.ccHolder;
    data['cc_month'] = this.ccMonth;
    data['cc_year'] = this.ccYear;
    data['cc_type'] = this.ccType;
    data['amount'] = this.amount;
    data['currency'] = this.currency;
    data['created_by'] = this.createdBy;
    data['attachment'] = this.attachment;
    data['type'] = this.type;
    data['note'] = this.note;
    data['pos_paid'] = this.posPaid;
    data['pos_balance'] = this.posBalance;
    data['approval_code'] = this.approvalCode;
    data['currency_rate'] = this.currencyRate;
    data['gl_payment_method_id'] = this.glPaymentMethodId;
    data['commercial_discount'] = this.commercialDiscount;
    data['commercial_discount_id'] = this.commercialDiscountId;
    return data;
  }
}

class MeasurementItem {
  String? id;
  String? saleId;
  String? itemCode;
  String? itemName;
  String? frontLength;
  String? backLength;
  String? shoulderWidth;
  String? shoulderSlope;
  String? sleeve;
  String? sleeveTop;
  String? wrist;
  String? plainCuffLength;
  String? cuffLength;
  String? cuffWidth;
  String? middleWidth;
  String? chestFront;
  String? chestBack;
  String? bottomHeight;
  String? bottomWidth;
  String? collarWidth;
  String? collarHeight;
  String? zipperHeight;
  String? zipperWidth;
  String? chestPocketHeight;
  String? chestPocketWidth;
  String? mobilePocketHeight;
  String? walletPocketHeight;
  String? walletPocketWidth;
  String? haunchWidth;
  String? buttonNo;
  String? embroideryNo;
  String? estimatedLength;
  String? tailorId;
  String? sample;
  String? urgent;
  String? shoulderChestLength;
  String? sleeveMiddle;
  String? sidePocketLength;
  String? takhalees;
  String? collarTypeID;
  String? cuffTypeID;
  String? modelTypeID;
  String? pocketTypeID;
  String? fillingTypeID;
  Null? zipperTypeID;
  String? note;

  MeasurementItem(
      {this.id,
        this.saleId,
        this.itemCode,
        this.itemName,
        this.frontLength,
        this.backLength,
        this.shoulderWidth,
        this.shoulderSlope,
        this.sleeve,
        this.sleeveTop,
        this.wrist,
        this.plainCuffLength,
        this.cuffLength,
        this.cuffWidth,
        this.middleWidth,
        this.chestFront,
        this.chestBack,
        this.bottomHeight,
        this.bottomWidth,
        this.collarWidth,
        this.collarHeight,
        this.zipperHeight,
        this.zipperWidth,
        this.chestPocketHeight,
        this.chestPocketWidth,
        this.mobilePocketHeight,
        this.walletPocketHeight,
        this.walletPocketWidth,
        this.haunchWidth,
        this.buttonNo,
        this.embroideryNo,
        this.estimatedLength,
        this.tailorId,
        this.sample,
        this.urgent,
        this.shoulderChestLength,
        this.sleeveMiddle,
        this.sidePocketLength,
        this.takhalees,
        this.collarTypeID,
        this.cuffTypeID,
        this.modelTypeID,
        this.pocketTypeID,
        this.fillingTypeID,
        this.zipperTypeID,
        this.note});

  MeasurementItem.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    saleId = json['sale_id'];
    itemCode = json['Item_Code'];
    itemName = json['Item_Name'];
    frontLength = json['Front_Length'];
    backLength = json['Back_Length'];
    shoulderWidth = json['Shoulder_Width'];
    shoulderSlope = json['Shoulder_Slope'];
    sleeve = json['Sleeve'];
    sleeveTop = json['Sleeve_Top'];
    wrist = json['Wrist'];
    plainCuffLength = json['Plain_Cuff_Length'];
    cuffLength = json['Cuff_Length'];
    cuffWidth = json['Cuff_Width'];
    middleWidth = json['Middle_Width'];
    chestFront = json['Chest_Front'];
    chestBack = json['Chest_Back'];
    bottomHeight = json['Bottom_Height'];
    bottomWidth = json['Bottom_Width'];
    collarWidth = json['Collar_Width'];
    collarHeight = json['Collar_Height'];
    zipperHeight = json['Zipper_Height'];
    zipperWidth = json['Zipper_Width'];
    chestPocketHeight = json['Chest_Pocket_Height'];
    chestPocketWidth = json['Chest_Pocket_Width'];
    mobilePocketHeight = json['Mobile_Pocket_Height'];
    walletPocketHeight = json['Wallet_Pocket_Height'];
    walletPocketWidth = json['Wallet_Pocket_Width'];
    haunchWidth = json['Haunch_Width'];
    buttonNo = json['Button_No'];
    embroideryNo = json['Embroidery_No'];
    estimatedLength = json['Estimated_Length'];
    tailorId = json['Tailor_id'];
    sample = json['sample'];
    urgent = json['urgent'];
    shoulderChestLength = json['shoulder_chest_length'];
    sleeveMiddle = json['sleeve_middle'];
    sidePocketLength = json['Side_Pocket_Length'];
    takhalees = json['takhalees'];
    collarTypeID = json['Collar_Type_ID'];
    cuffTypeID = json['Cuff_Type_ID'];
    modelTypeID = json['Model_Type_ID'];
    pocketTypeID = json['Pocket_Type_ID'];
    fillingTypeID = json['Filling_Type_ID'];
    zipperTypeID = json['Zipper_Type_ID'];
    note = json['Note'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['sale_id'] = this.saleId;
    data['Item_Code'] = this.itemCode;
    data['Item_Name'] = this.itemName;
    data['Front_Length'] = this.frontLength;
    data['Back_Length'] = this.backLength;
    data['Shoulder_Width'] = this.shoulderWidth;
    data['Shoulder_Slope'] = this.shoulderSlope;
    data['Sleeve'] = this.sleeve;
    data['Sleeve_Top'] = this.sleeveTop;
    data['Wrist'] = this.wrist;
    data['Plain_Cuff_Length'] = this.plainCuffLength;
    data['Cuff_Length'] = this.cuffLength;
    data['Cuff_Width'] = this.cuffWidth;
    data['Middle_Width'] = this.middleWidth;
    data['Chest_Front'] = this.chestFront;
    data['Chest_Back'] = this.chestBack;
    data['Bottom_Height'] = this.bottomHeight;
    data['Bottom_Width'] = this.bottomWidth;
    data['Collar_Width'] = this.collarWidth;
    data['Collar_Height'] = this.collarHeight;
    data['Zipper_Height'] = this.zipperHeight;
    data['Zipper_Width'] = this.zipperWidth;
    data['Chest_Pocket_Height'] = this.chestPocketHeight;
    data['Chest_Pocket_Width'] = this.chestPocketWidth;
    data['Mobile_Pocket_Height'] = this.mobilePocketHeight;
    data['Wallet_Pocket_Height'] = this.walletPocketHeight;
    data['Wallet_Pocket_Width'] = this.walletPocketWidth;
    data['Haunch_Width'] = this.haunchWidth;
    data['Button_No'] = this.buttonNo;
    data['Embroidery_No'] = this.embroideryNo;
    data['Estimated_Length'] = this.estimatedLength;
    data['Tailor_id'] = this.tailorId;
    data['sample'] = this.sample;
    data['urgent'] = this.urgent;
    data['shoulder_chest_length'] = this.shoulderChestLength;
    data['sleeve_middle'] = this.sleeveMiddle;
    data['Side_Pocket_Length'] = this.sidePocketLength;
    data['takhalees'] = this.takhalees;
    data['Collar_Type_ID'] = this.collarTypeID;
    data['Cuff_Type_ID'] = this.cuffTypeID;
    data['Model_Type_ID'] = this.modelTypeID;
    data['Pocket_Type_ID'] = this.pocketTypeID;
    data['Filling_Type_ID'] = this.fillingTypeID;
    data['Zipper_Type_ID'] = this.zipperTypeID;
    data['Note'] = this.note;
    return data;
  }
}