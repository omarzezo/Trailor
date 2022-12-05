class PillRequestModel{
 final List<ProductModel>? productList;
 final List<dynamic>? customerList;
 final List<dynamic>? categoryList;
 final List<dynamic>? posRegisterList;
 final List<salesModel>? salesList;
 final List<dynamic>? payment;
 final List<dynamic>? expensesList;

 const PillRequestModel({
    required this.productList,
    required this.customerList,
    required this.categoryList,
    required this.posRegisterList,
    required this.salesList,
    required this.payment,
    required this.expensesList,
  });

 Map<String, dynamic> toJson() {
    return {
      "product": productList!.map((v) => v.toJson()).toList(),
      "customer": customerList,
      "category": categoryList,
      "pos_register": posRegisterList,
      "sales":  salesList!.map((v) => v.toJson()).toList(),
      "payment": payment,
      "expenses": expensesList,
    };
  }
}
class ProductModel {

  final int? id;
  final String? code;
  final String? name;
  final int? category_id;
  final int? unit;
  final double? price;
  final int? tax_rate;
  final bool? tax_method;
  final int? warehouse;

  const ProductModel({
    required this.id,
    required this.code,
    required this.name,
    required this.category_id,
    required this.unit,
    required this.price,
    required this.tax_rate,
    required this.tax_method,
    required this.warehouse,
  });

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "code": code,
      "name": name,
      "category_id": category_id,
      "unit": unit,
      "price": price,
      "tax_rate": tax_rate,
      "tax_method": tax_method,
      "warehouse": warehouse,
    };
  }
}
class salesModel {
  String? date;
  String? referenceNo;
  int? customerId;
  String? dueDate;
  String? hash;
  String? customer;
  String? biller;
  int? billerId;
  double? total;
  double? discountAllowance;
  Null? returnSaleRef;
  Null? returnId;
  String? saleStatus;
  Null? saleId;
  String? paymentStatus;
  String? warehouseCode;
  int? warehouseId;
  double? grandTotal;
  bool? pos;
  double? surcharge;
  double? returnSaleTotal;
  double? paid;
  double? totalTax;
  Null? note;
  Null? staffNote;
  Null? productDiscount;
  Null? orderDiscountId;
  double? orderDiscount;
  double? totalDiscount;
  Null? productTax;
  Null? orderTaxId;
  double? orderTax;
  double? shipping;
  int? totalItems;
  Null? paymentTerm;
  Null? rounding;
  int? createdBy;
  int? orderType;
  int? tableNo;
  int? dept;
  Null? empId;
  Null? empType;
  Null? plateNo;
  String? exitDate;
  List<Payment>? payment;
  List<Items>? items;
  List<Measurement>? measurement;

  salesModel(
      {
        required this.date,
        required  this.referenceNo,
        required  this.customerId,
        required   this.dueDate,
        required   this.hash,
        required    this.customer,
        required    this.biller,
        required     this.billerId,
        required    this.total,
        required      this.discountAllowance,
        required      this.returnSaleRef,
        required       this.returnId,
        required    this.saleStatus,
        required      this.saleId,
        required     this.paymentStatus,
        required     this.warehouseCode,
        required     this.warehouseId,
        required     this.grandTotal,
        required   this.pos,
        required    this.surcharge,
        required     this.returnSaleTotal,
        required   this.paid,
        required   this.totalTax,
        required   this.note,
        required this.staffNote,
        required  this.productDiscount,
        required  this.orderDiscountId,
        required   this.orderDiscount,
        required   this.totalDiscount,
        required    this.productTax,
        required     this.orderTaxId,
        required     this.orderTax,
        required   this.shipping,
        required    this.totalItems,
        required     this.paymentTerm,
        required     this.rounding,
        required     this.createdBy,
        required     this.orderType,
        required   this.tableNo,
        required    this.dept,
        required     this.empId,
        required     this.empType,
        required     this.plateNo,
        required     this.exitDate,
        required     this.payment,
        required   this.items,
        required     this.measurement});

  salesModel.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    referenceNo = json['reference_no'];
    customerId = json['customer_id'];
    dueDate = json['due_date'];
    hash = json['hash'];
    customer = json['customer'];
    biller = json['biller'];
    billerId = json['biller_id'];
    total = json['total'];
    discountAllowance = json['discount_allowance'];
    returnSaleRef = json['return_sale_ref'];
    returnId = json['return_id'];
    saleStatus = json['sale_status'];
    saleId = json['sale_id'];
    paymentStatus = json['payment_status'];
    warehouseCode = json['warehouse_code'];
    warehouseId = json['warehouse_id'];
    grandTotal = json['grand_total'];
    pos = json['pos'];
    surcharge = json['surcharge'];
    returnSaleTotal = json['return_sale_total'];
    paid = json['paid'];
    totalTax = json['total_tax'];
    note = json['note'];
    staffNote = json['staff_note'];
    productDiscount = json['product_discount'];
    orderDiscountId = json['order_discount_id'];
    orderDiscount = json['order_discount'];
    totalDiscount = json['total_discount'];
    productTax = json['product_tax'];
    orderTaxId = json['order_tax_id'];
    orderTax = json['order_tax'];
    shipping = json['shipping'];
    totalItems = json['total_items'];
    paymentTerm = json['payment_term'];
    rounding = json['rounding'];
    createdBy = json['created_by'];
    orderType = json['order_type'];
    tableNo = json['table_no'];
    dept = json['dept'];
    empId = json['emp_id'];
    empType = json['emp_type'];
    plateNo = json['plate_no'];
    exitDate = json['exit_date'];
    if (json['payment'] != null) {
      payment = <Payment>[];
      json['payment'].forEach((v) {
        payment!.add(new Payment.fromJson(v));
      });
    }
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
    if (json['Measurement'] != null) {
      measurement = <Measurement>[];
      json['Measurement'].forEach((v) {
        measurement!.add(new Measurement.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['reference_no'] = this.referenceNo;
    data['customer_id'] = this.customerId;
    data['due_date'] = this.dueDate;
    data['hash'] = this.hash;
    data['customer'] = this.customer;
    data['biller'] = this.biller;
    data['biller_id'] = this.billerId;
    data['total'] = this.total;
    data['discount_allowance'] = this.discountAllowance;
    data['return_sale_ref'] = this.returnSaleRef;
    data['return_id'] = this.returnId;
    data['sale_status'] = this.saleStatus;
    data['sale_id'] = this.saleId;
    data['payment_status'] = this.paymentStatus;
    data['warehouse_code'] = this.warehouseCode;
    data['warehouse_id'] = this.warehouseId;
    data['grand_total'] = this.grandTotal;
    data['pos'] = this.pos;
    data['surcharge'] = this.surcharge;
    data['return_sale_total'] = this.returnSaleTotal;
    data['paid'] = this.paid;
    data['total_tax'] = this.totalTax;
    data['note'] = this.note;
    data['staff_note'] = this.staffNote;
    data['product_discount'] = this.productDiscount;
    data['order_discount_id'] = this.orderDiscountId;
    data['order_discount'] = this.orderDiscount;
    data['total_discount'] = this.totalDiscount;
    data['product_tax'] = this.productTax;
    data['order_tax_id'] = this.orderTaxId;
    data['order_tax'] = this.orderTax;
    data['shipping'] = this.shipping;
    data['total_items'] = this.totalItems;
    data['payment_term'] = this.paymentTerm;
    data['rounding'] = this.rounding;
    data['created_by'] = this.createdBy;
    data['order_type'] = this.orderType;
    data['table_no'] = this.tableNo;
    data['dept'] = this.dept;
    data['emp_id'] = this.empId;
    data['emp_type'] = this.empType;
    data['plate_no'] = this.plateNo;
    data['exit_date'] = this.exitDate;
    if (this.payment != null) {
      data['payment'] = this.payment!.map((v) => v.toJson()).toList();
    }
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    if (this.measurement != null) {
      data['Measurement'] = this.measurement!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Payment {
  int? id;
  String? date;
  double? amount;
  String? paidBy;
  double? commercialDiscount;
  Null? commercialDiscountId;
  dynamic? chequeNo;
  int? glPaymentMethodId;
  Null? ccNo;
  Null? ccHolder;
  Null? ccMonth;
  Null? ccYear;
  Null? ccType;
  int? createdBy;
  String? type;
  Null? note;
  double? posPaid;
  double? posBalance;

  Payment(
      {
     required   this.id,
        required   this.date,
        required   this.amount,
        required   this.paidBy,
        required    this.commercialDiscount,
        required   this.commercialDiscountId,
        required   this.chequeNo,
        required  this.glPaymentMethodId,
        required   this.ccNo,
        required    this.ccHolder,
        required    this.ccMonth,
        required   this.ccYear,
        required     this.ccType,
        required     this.createdBy,
        required      this.type,
        required       this.note,
        required       this.posPaid,
        required       this.posBalance});

  Payment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    amount = json['amount'];
    paidBy = json['paid_by'];
    commercialDiscount = json['commercial_discount'];
    commercialDiscountId = json['commercial_discount_id'];
    chequeNo = json['cheque_no'];
    glPaymentMethodId = json['gl_payment_method_id'];
    ccNo = json['cc_no'];
    ccHolder = json['cc_holder'];
    ccMonth = json['cc_month'];
    ccYear = json['cc_year'];
    ccType = json['cc_type'];
    createdBy = json['created_by'];
    type = json['type'];
    note = json['note'];
    posPaid = json['pos_paid'];
    posBalance = json['pos_balance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date'] = this.date;
    data['amount'] = this.amount;
    data['paid_by'] = this.paidBy;
    data['commercial_discount'] = this.commercialDiscount;
    data['commercial_discount_id'] = this.commercialDiscountId;
    data['cheque_no'] = this.chequeNo;
    data['gl_payment_method_id'] = this.glPaymentMethodId;
    data['cc_no'] = this.ccNo;
    data['cc_holder'] = this.ccHolder;
    data['cc_month'] = this.ccMonth;
    data['cc_year'] = this.ccYear;
    data['cc_type'] = this.ccType;
    data['created_by'] = this.createdBy;
    data['type'] = this.type;
    data['note'] = this.note;
    data['pos_paid'] = this.posPaid;
    data['pos_balance'] = this.posBalance;
    return data;
  }
}

class Items {
  int? productId;
  String? productName;
  String? productCode;
  String? productType;
  Null? optionId;
  double? netUnitPrice;
  double? unitPrice;
  double? unitQuantity;
  double? realUnitPrice;
  int? productUnitId;
  String? productUnitCode;
  double? quantity;
  double? subtotal;
  int? warehouseId;
  String? warehouseCode;
  double? itemTax;
  int? taxRateId;
  String? tax;
  dynamic discount;
  Null? serialNo;
  double? itemDiscount;
  bool? promoFree;

  Items(
      {
        required this.productId,
        required  this.productName,
        required  this.productCode,
        required   this.productType,
        required   this.optionId,
        required   this.netUnitPrice,
        required    this.unitPrice,
        required   this.unitQuantity,
        required  this.realUnitPrice,
        required   this.productUnitId,
        required  this.productUnitCode,
        required     this.quantity,
        required      this.subtotal,
        required      this.warehouseId,
        required      this.warehouseCode,
        required     this.itemTax,
        required     this.taxRateId,
        required   this.tax,
        required    this.discount,
        required    this.serialNo,
        required     this.itemDiscount,
        required     this.promoFree});

  Items.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    productName = json['product_name'];
    productCode = json['product_code'];
    productType = json['product_type'];
    optionId = json['option_id'];
    netUnitPrice = json['net_unit_price'];
    unitPrice = json['unit_price'];
    unitQuantity = json['unit_quantity'];
    realUnitPrice = json['real_unit_price'];
    productUnitId = json['product_unit_id'];
    productUnitCode = json['product_unit_code'];
    quantity = json['quantity'];
    subtotal = json['subtotal'];
    warehouseId = json['warehouse_id'];
    warehouseCode = json['warehouse_code'];
    itemTax = json['item_tax'];
    taxRateId = json['tax_rate_id'];
    tax = json['tax'];
    discount = json['discount'];
    serialNo = json['serial_no'];
    itemDiscount = json['item_discount'];
    promoFree = json['promo_free'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['product_name'] = this.productName;
    data['product_code'] = this.productCode;
    data['product_type'] = this.productType;
    data['option_id'] = this.optionId;
    data['net_unit_price'] = this.netUnitPrice;
    data['unit_price'] = this.unitPrice;
    data['unit_quantity'] = this.unitQuantity;
    data['real_unit_price'] = this.realUnitPrice;
    data['product_unit_id'] = this.productUnitId;
    data['product_unit_code'] = this.productUnitCode;
    data['quantity'] = this.quantity;
    data['subtotal'] = this.subtotal;
    data['warehouse_id'] = this.warehouseId;
    data['warehouse_code'] = this.warehouseCode;
    data['item_tax'] = this.itemTax;
    data['tax_rate_id'] = this.taxRateId;
    data['tax'] = this.tax;
    data['discount'] = this.discount;
    data['serial_no'] = this.serialNo;
    data['item_discount'] = this.itemDiscount;
    data['promo_free'] = this.promoFree;
    return data;
  }
}

class Measurement {
  String? itemName;
  String? itemCode;
  double? frontLength;
  double? backLength;
  double? shoulderWidth;
  double? shoulderSlope;
  double? sleeve;
  double? sleeveTop;
  double? wrist;
  double? plainCuffLength;
  double? cuffLength;
  double? cuffWidth;
  double? middleWidth;
  double? chestFront;
  double? chestBack;
  double? bottomHeight;
  double? bottomWidth;
  double? collarWidth;
  double? collarHeight;
  double? zipperHeight;
  double? zipperWidth;
  double? chestPocketHeight;
  double? chestPocketWidth;
  double? mobilePocketHeight;
  double? walletPocketHeight;
  double? walletPocketWidth;
  double? haunchWidth;
  int? buttonNo;
  int? embroideryNo;
  double? estimatedLength;
  int? tailorId;
  int? sample;
  int? urgent;
  double? shoulderChestLength;
  double? sleeveMiddle;
  double? sidePocketLength;
  String? takhalees;
  int? collarTypeID;
  int? cuffTypeID;
  int? modelTypeID;
  int? pocketTypeID;
  int? fillingTypeID;
  int? zipperTypeID;
  String? note;

  Measurement(
      {
        required this.itemName,
        required this.itemCode,
        required  this.frontLength,
        required  this.backLength,
        required   this.shoulderWidth,
        required    this.shoulderSlope,
        required    this.sleeve,
        required    this.sleeveTop,
        required    this.wrist,
        required    this.plainCuffLength,
        required    this.cuffLength,
        required this.cuffWidth,
        required  this.middleWidth,
        required   this.chestFront,
        required    this.chestBack,
        required    this.bottomHeight,
        required    this.bottomWidth,
        required  this.collarWidth,
        required    this.collarHeight,
        required     this.zipperHeight,
        required     this.zipperWidth,
        required     this.chestPocketHeight,
        required     this.chestPocketWidth,
        required      this.mobilePocketHeight,
        required  this.walletPocketHeight,
        required  this.walletPocketWidth,
        required   this.haunchWidth,
        required this.buttonNo,
        required  this.embroideryNo,
        required  this.estimatedLength,
        required  this.tailorId,
        required this.sample,
        required   this.urgent,
        required    this.shoulderChestLength,
        required    this.sleeveMiddle,
        required     this.sidePocketLength,
        required     this.takhalees,
        required      this.collarTypeID,
        required      this.cuffTypeID,
        required     this.modelTypeID,
        required     this.pocketTypeID,
        required      this.fillingTypeID,
        required      this.zipperTypeID,
        required      this.note});

  Measurement.fromJson(Map<String, dynamic> json) {
    itemName = json['Item_Name'];
    itemCode = json['Item_Code'];
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
    data['Item_Name'] = this.itemName;
    data['Item_Code'] = this.itemCode;
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














