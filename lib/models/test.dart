// class AllInvoicesDetails {
//   AllInvoicesDetails({
//     required this.invoiceData,
//     required this.limit,
//     required this.start,
//     required this.total,
//   });
//   late final List<InvoiceData> invoiceData;
//   late final int limit;
//   late final int start;
//   late final int total;
//
//   AllInvoicesDetails.fromJson(Map<String, dynamic> json){
//     invoiceData = List.from(json['data']).map((e)=>InvoiceData.fromJson(e)).toList();
//     limit = json['limit'];
//     start = json['start'];
//     total = json['total'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['data'] = invoiceData.map((e)=>e.toJson()).toList();
//     _data['limit'] = limit;
//     _data['start'] = start;
//     _data['total'] = total;
//     return _data;
//   }
// }
//
// class InvoiceData {
//   InvoiceData({
//     required this.id,
//     required this.referenceNo,
//     required this.customerId,
//     required this.customer,
//     required this.phone,
//     required this.date,
//     required this.deliveryDate,
//     required this.saleStatus,
//     required this.balance,
//     required this.items,
//     required this.payments,
//     required this.measurement,
//   });
//   late final String id;
//   late final String referenceNo;
//   late final String customerId;
//   late final String customer;
//   late final String phone;
//   late final String date;
//   late final String deliveryDate;
//   late final String saleStatus;
//   late final String balance;
//   late final List<Items> items;
//   late final List<Payments> payments;
//   late final List<Measurement> measurement;
//
//   InvoiceData.fromJson(Map<String, dynamic> json){
//     id = json['id'];
//     referenceNo = json['reference_no'];
//     customerId = json['customer_id'];
//     customer = json['customer'];
//     phone = json['phone'];
//     date = json['date'];
//     deliveryDate = json['delivery_date'];
//     saleStatus = json['sale_status'];
//     balance = json['balance'];
//     items = List.from(json['items']).map((e)=>Items.fromJson(e)).toList();
//     payments = List.from(json['payments']).map((e)=>Payments.fromJson(e)).toList();
//     measurement = List.from(json['Measurement']).map((e)=>Measurement.fromJson(e)).toList();
//     // payments = json['payments'];
//     // measurement = json['Measurement'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['id'] = id;
//     _data['reference_no'] = referenceNo;
//     _data['customer_id'] = customerId;
//     _data['customer'] = customer;
//     _data['phone'] = phone;
//     _data['date'] = date;
//     _data['delivery_date'] = deliveryDate;
//     _data['sale_status'] = saleStatus;
//     _data['balance'] = balance;
//     _data['items'] = items.map((e)=>e.toJson()).toList();
//     _data['payments'] = payments.map((e)=>e.toJson()).toList();
//     _data['Measurement'] = measurement.map((e)=>e.toJson()).toList();
//     // _data['payments'] = payments;
//     // _data['Measurement'] = Measurement;
//     return _data;
//   }
// }
//
// class Items {
//   Items({
//     required this.id,
//     required this.saleId,
//     required this.productId,
//     required this.productCode,
//     required this.productName,
//     required this.productType,
//     this.optionId,
//     required this.netUnitPrice,
//     required this.unitPrice,
//     required this.quantity,
//     required this.warehouseId,
//     required this.itemTax,
//     required this.taxRateId,
//     required this.tax,
//     this.discount,
//     required this.itemDiscount,
//     required this.subtotal,
//     required this.serialNo,
//     required this.realUnitPrice,
//     this.saleItemId,
//     required this.productUnitId,
//     required this.productUnitCode,
//     required this.unitQuantity,
//     this.comment,
//     this.gst,
//     this.cgst,
//     this.sgst,
//     this.igst,
//     required this.itemCostValue,
//     required this.avgCost,
//     required this.overselling,
//     required this.quantityOverselling,
//     required this.promoFree,
//   });
//   late final String id;
//   late final String saleId;
//   late final String productId;
//   late final String productCode;
//   late final String productName;
//   late final String productType;
//   late final Null optionId;
//   late final String netUnitPrice;
//   late final String unitPrice;
//   late final String quantity;
//   late final String warehouseId;
//   late final String itemTax;
//   late final String taxRateId;
//   late final String tax;
//   late final String? discount;
//   late final String itemDiscount;
//   late final String subtotal;
//   late final String serialNo;
//   late final String realUnitPrice;
//   late final Null saleItemId;
//   late final String productUnitId;
//   late final String productUnitCode;
//   late final String unitQuantity;
//   late final Null comment;
//   late final Null gst;
//   late final Null cgst;
//   late final Null sgst;
//   late final Null igst;
//   late final String itemCostValue;
//   late final String avgCost;
//   late final String overselling;
//   late final String quantityOverselling;
//   late final String promoFree;
//
//   Items.fromJson(Map<String, dynamic> json){
//     id = json['id'];
//     saleId = json['sale_id'];
//     productId = json['product_id'];
//     productCode = json['product_code'];
//     productName = json['product_name'];
//     productType = json['product_type'];
//     optionId = null;
//     netUnitPrice = json['net_unit_price'];
//     unitPrice = json['unit_price'];
//     quantity = json['quantity'];
//     warehouseId = json['warehouse_id'];
//     itemTax = json['item_tax'];
//     taxRateId = json['tax_rate_id'];
//     tax = json['tax'];
//     discount = null;
//     itemDiscount = json['item_discount'];
//     subtotal = json['subtotal'];
//     serialNo = json['serial_no'];
//     realUnitPrice = json['real_unit_price'];
//     saleItemId = null;
//     productUnitId = json['product_unit_id'];
//     productUnitCode = json['product_unit_code'];
//     unitQuantity = json['unit_quantity'];
//     comment = null;
//     gst = null;
//     cgst = null;
//     sgst = null;
//     igst = null;
//     itemCostValue = json['item_cost_value'];
//     avgCost = json['avg_cost'];
//     overselling = json['overselling'];
//     quantityOverselling = json['quantity_overselling'];
//     promoFree = json['promo_free'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['id'] = id;
//     _data['sale_id'] = saleId;
//     _data['product_id'] = productId;
//     _data['product_code'] = productCode;
//     _data['product_name'] = productName;
//     _data['product_type'] = productType;
//     _data['option_id'] = optionId;
//     _data['net_unit_price'] = netUnitPrice;
//     _data['unit_price'] = unitPrice;
//     _data['quantity'] = quantity;
//     _data['warehouse_id'] = warehouseId;
//     _data['item_tax'] = itemTax;
//     _data['tax_rate_id'] = taxRateId;
//     _data['tax'] = tax;
//     _data['discount'] = discount;
//     _data['item_discount'] = itemDiscount;
//     _data['subtotal'] = subtotal;
//     _data['serial_no'] = serialNo;
//     _data['real_unit_price'] = realUnitPrice;
//     _data['sale_item_id'] = saleItemId;
//     _data['product_unit_id'] = productUnitId;
//     _data['product_unit_code'] = productUnitCode;
//     _data['unit_quantity'] = unitQuantity;
//     _data['comment'] = comment;
//     _data['gst'] = gst;
//     _data['cgst'] = cgst;
//     _data['sgst'] = sgst;
//     _data['igst'] = igst;
//     _data['item_cost_value'] = itemCostValue;
//     _data['avg_cost'] = avgCost;
//     _data['overselling'] = overselling;
//     _data['quantity_overselling'] = quantityOverselling;
//     _data['promo_free'] = promoFree;
//     return _data;
//   }
// }
//
// class Payments {
//   Payments({
//     required this.id,
//     required this.date,
//     required this.saleId,
//     this.returnId,
//     this.purchaseId,
//     required this.referenceNo,
//     this.transactionId,
//     required this.paidBy,
//     required this.chequeNo,
//     required this.ccNo,
//     required this.ccHolder,
//     required this.ccMonth,
//     required this.ccYear,
//     required this.ccType,
//     required this.amount,
//     this.currency,
//     required this.createdBy,
//     this.attachment,
//     required this.type,
//     required this.note,
//     required this.posPaid,
//     required this.posBalance,
//     this.approvalCode,
//     required this.currencyRate,
//     required this.glPaymentMethodId,
//     required this.commercialDiscount,
//     this.commercialDiscountId,
//   });
//   late final String id;
//   late final String date;
//   late final String saleId;
//   late final Null returnId;
//   late final Null purchaseId;
//   late final String referenceNo;
//   late final Null transactionId;
//   late final String paidBy;
//   late final String chequeNo;
//   late final String ccNo;
//   late final String ccHolder;
//   late final String ccMonth;
//   late final String ccYear;
//   late final String ccType;
//   late final String amount;
//   late final Null currency;
//   late final String createdBy;
//   late final Null attachment;
//   late final String type;
//   late final String note;
//   late final String posPaid;
//   late final String posBalance;
//   late final Null approvalCode;
//   late final String currencyRate;
//   late final String glPaymentMethodId;
//   late final String commercialDiscount;
//   late final Null commercialDiscountId;
//
//   Payments.fromJson(Map<String, dynamic> json){
//     id = json['id'];
//     date = json['date'];
//     saleId = json['sale_id'];
//     returnId = null;
//     purchaseId = null;
//     referenceNo = json['reference_no'];
//     transactionId = null;
//     paidBy = json['paid_by'];
//     chequeNo = json['cheque_no'];
//     ccNo = json['cc_no'];
//     ccHolder = json['cc_holder'];
//     ccMonth = json['cc_month'];
//     ccYear = json['cc_year'];
//     ccType = json['cc_type'];
//     amount = json['amount'];
//     currency = null;
//     createdBy = json['created_by'];
//     attachment = null;
//     type = json['type'];
//     note = json['note'];
//     posPaid = json['pos_paid'];
//     posBalance = json['pos_balance'];
//     approvalCode = null;
//     currencyRate = json['currency_rate'];
//     glPaymentMethodId = json['gl_payment_method_id'];
//     commercialDiscount = json['commercial_discount'];
//     commercialDiscountId = null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['id'] = id;
//     _data['date'] = date;
//     _data['sale_id'] = saleId;
//     _data['return_id'] = returnId;
//     _data['purchase_id'] = purchaseId;
//     _data['reference_no'] = referenceNo;
//     _data['transaction_id'] = transactionId;
//     _data['paid_by'] = paidBy;
//     _data['cheque_no'] = chequeNo;
//     _data['cc_no'] = ccNo;
//     _data['cc_holder'] = ccHolder;
//     _data['cc_month'] = ccMonth;
//     _data['cc_year'] = ccYear;
//     _data['cc_type'] = ccType;
//     _data['amount'] = amount;
//     _data['currency'] = currency;
//     _data['created_by'] = createdBy;
//     _data['attachment'] = attachment;
//     _data['type'] = type;
//     _data['note'] = note;
//     _data['pos_paid'] = posPaid;
//     _data['pos_balance'] = posBalance;
//     _data['approval_code'] = approvalCode;
//     _data['currency_rate'] = currencyRate;
//     _data['gl_payment_method_id'] = glPaymentMethodId;
//     _data['commercial_discount'] = commercialDiscount;
//     _data['commercial_discount_id'] = commercialDiscountId;
//     return _data;
//   }
// }
//
// class Measurement {
//   Measurement({
//     required this.Id,
//     required this.saleId,
//     required this.ItemCode,
//     required this.ItemName,
//     required this.FrontLength,
//     required this.BackLength,
//     required this.ShoulderWidth,
//     required this.ShoulderSlope,
//     required this.Sleeve,
//     required this.SleeveTop,
//     required this.Wrist,
//     required this.PlainCuffLength,
//     required this.CuffLength,
//     required this.CuffWidth,
//     required this.MiddleWidth,
//     required this.ChestFront,
//     required this.ChestBack,
//     required this.BottomHeight,
//     required this.BottomWidth,
//     required this.CollarWidth,
//     required this.CollarHeight,
//     required this.ZipperHeight,
//     required this.ZipperWidth,
//     required this.ChestPocketHeight,
//     required this.ChestPocketWidth,
//     required this.MobilePocketHeight,
//     required this.WalletPocketHeight,
//     required this.WalletPocketWidth,
//     required this.HaunchWidth,
//     required this.ButtonNo,
//     required this.EmbroideryNo,
//     required this.EstimatedLength,
//     required this.TailorId,
//     required this.sample,
//     required this.urgent,
//     required this.shoulderChestLength,
//     required this.sleeveMiddle,
//     required this.SidePocketLength,
//     required this.takhalees,
//     required this.CollarTypeID,
//     required this.CuffTypeID,
//     required this.ModelTypeID,
//     required this.PocketTypeID,
//     required this.FillingTypeID,
//     this.ZipperTypeID,
//     required this.Note,
//   });
//   late final String Id;
//   late final String saleId;
//   late final String ItemCode;
//   late final String ItemName;
//   late final String FrontLength;
//   late final String BackLength;
//   late final String ShoulderWidth;
//   late final String ShoulderSlope;
//   late final String Sleeve;
//   late final String SleeveTop;
//   late final String Wrist;
//   late final String PlainCuffLength;
//   late final String CuffLength;
//   late final String CuffWidth;
//   late final String MiddleWidth;
//   late final String ChestFront;
//   late final String ChestBack;
//   late final String BottomHeight;
//   late final String BottomWidth;
//   late final String CollarWidth;
//   late final String CollarHeight;
//   late final String ZipperHeight;
//   late final String ZipperWidth;
//   late final String ChestPocketHeight;
//   late final String ChestPocketWidth;
//   late final String MobilePocketHeight;
//   late final String WalletPocketHeight;
//   late final String WalletPocketWidth;
//   late final String HaunchWidth;
//   late final String ButtonNo;
//   late final String EmbroideryNo;
//   late final String EstimatedLength;
//   late final String TailorId;
//   late final bool sample;
//   late final bool urgent;
//   late final String shoulderChestLength;
//   late final String sleeveMiddle;
//   late final String SidePocketLength;
//   late final String takhalees;
//   late final String CollarTypeID;
//   late final String CuffTypeID;
//   late final String ModelTypeID;
//   late final String PocketTypeID;
//   late final String FillingTypeID;
//   late final Null ZipperTypeID;
//   late final String Note;
//
//   Measurement.fromJson(Map<String, dynamic> json){
//     Id = json['Id'];
//     saleId = json['sale_id'];
//     ItemCode = json['Item_Code'];
//     ItemName = json['Item_Name'];
//     FrontLength = json['Front_Length'];
//     BackLength = json['Back_Length'];
//     ShoulderWidth = json['Shoulder_Width'];
//     ShoulderSlope = json['Shoulder_Slope'];
//     Sleeve = json['Sleeve'];
//     SleeveTop = json['Sleeve_Top'];
//     Wrist = json['Wrist'];
//     PlainCuffLength = json['Plain_Cuff_Length'];
//     CuffLength = json['Cuff_Length'];
//     CuffWidth = json['Cuff_Width'];
//     MiddleWidth = json['Middle_Width'];
//     ChestFront = json['Chest_Front'];
//     ChestBack = json['Chest_Back'];
//     BottomHeight = json['Bottom_Height'];
//     BottomWidth = json['Bottom_Width'];
//     CollarWidth = json['Collar_Width'];
//     CollarHeight = json['Collar_Height'];
//     ZipperHeight = json['Zipper_Height'];
//     ZipperWidth = json['Zipper_Width'];
//     ChestPocketHeight = json['Chest_Pocket_Height'];
//     ChestPocketWidth = json['Chest_Pocket_Width'];
//     MobilePocketHeight = json['Mobile_Pocket_Height'];
//     WalletPocketHeight = json['Wallet_Pocket_Height'];
//     WalletPocketWidth = json['Wallet_Pocket_Width'];
//     HaunchWidth = json['Haunch_Width'];
//     ButtonNo = json['Button_No'];
//     EmbroideryNo = json['Embroidery_No'];
//     EstimatedLength = json['Estimated_Length'];
//     TailorId = json['Tailor_id'];
//     sample = json['sample'];
//     urgent = json['urgent'];
//     shoulderChestLength = json['shoulder_chest_length'];
//     sleeveMiddle = json['sleeve_middle'];
//     SidePocketLength = json['Side_Pocket_Length'];
//     takhalees = json['takhalees'];
//     CollarTypeID = json['Collar_Type_ID'];
//     CuffTypeID = json['Cuff_Type_ID'];
//     ModelTypeID = json['Model_Type_ID'];
//     PocketTypeID = json['Pocket_Type_ID'];
//     FillingTypeID = json['Filling_Type_ID'];
//     ZipperTypeID = null;
//     Note = json['Note'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['Id'] = Id;
//     _data['sale_id'] = saleId;
//     _data['Item_Code'] = ItemCode;
//     _data['Item_Name'] = ItemName;
//     _data['Front_Length'] = FrontLength;
//     _data['Back_Length'] = BackLength;
//     _data['Shoulder_Width'] = ShoulderWidth;
//     _data['Shoulder_Slope'] = ShoulderSlope;
//     _data['Sleeve'] = Sleeve;
//     _data['Sleeve_Top'] = SleeveTop;
//     _data['Wrist'] = Wrist;
//     _data['Plain_Cuff_Length'] = PlainCuffLength;
//     _data['Cuff_Length'] = CuffLength;
//     _data['Cuff_Width'] = CuffWidth;
//     _data['Middle_Width'] = MiddleWidth;
//     _data['Chest_Front'] = ChestFront;
//     _data['Chest_Back'] = ChestBack;
//     _data['Bottom_Height'] = BottomHeight;
//     _data['Bottom_Width'] = BottomWidth;
//     _data['Collar_Width'] = CollarWidth;
//     _data['Collar_Height'] = CollarHeight;
//     _data['Zipper_Height'] = ZipperHeight;
//     _data['Zipper_Width'] = ZipperWidth;
//     _data['Chest_Pocket_Height'] = ChestPocketHeight;
//     _data['Chest_Pocket_Width'] = ChestPocketWidth;
//     _data['Mobile_Pocket_Height'] = MobilePocketHeight;
//     _data['Wallet_Pocket_Height'] = WalletPocketHeight;
//     _data['Wallet_Pocket_Width'] = WalletPocketWidth;
//     _data['Haunch_Width'] = HaunchWidth;
//     _data['Button_No'] = ButtonNo;
//     _data['Embroidery_No'] = EmbroideryNo;
//     _data['Estimated_Length'] = EstimatedLength;
//     _data['Tailor_id'] = TailorId;
//     _data['sample'] = sample;
//     _data['urgent'] = urgent;
//     _data['shoulder_chest_length'] = shoulderChestLength;
//     _data['sleeve_middle'] = sleeveMiddle;
//     _data['Side_Pocket_Length'] = SidePocketLength;
//     _data['takhalees'] = takhalees;
//     _data['Collar_Type_ID'] = CollarTypeID;
//     _data['Cuff_Type_ID'] = CuffTypeID;
//     _data['Model_Type_ID'] = ModelTypeID;
//     _data['Pocket_Type_ID'] = PocketTypeID;
//     _data['Filling_Type_ID'] = FillingTypeID;
//     _data['Zipper_Type_ID'] = ZipperTypeID;
//     _data['Note'] = Note;
//     return _data;
//   }
// }