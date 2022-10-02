import 'dart:convert';

Possettings possettingsFromJson(String str) => Possettings.fromJson(json.decode(str));
String possettingsToJson(Possettings data) => json.encode(data.toJson());
class Possettings {
  Possettings({
      this.addCustomer, 
      this.addManualProduct, 
      this.afterSalePage, 
      this.api, 
      this.authorize, 
      this.autoPrint, 
      this.cancelSale, 
      this.cashDrawerCodes, 
      this.catLimit, 
      this.categoriesTab, 
      this.cfTitle1, 
      this.cfTitle2, 
      this.cfValue1, 
      this.cfValue2, 
      this.charPerLine, 
      this.closeRegister, 
      this.customerDetails, 
      this.customerSelection, 
      this.defaultBiller, 
      this.defaultCategory, 
      this.defaultCustomer, 
      this.displayTime, 
      this.envatoUsername, 
      this.finalizeSale, 
      this.focusAddItem, 
      this.itemOrder, 
      this.javaApplet, 
      this.keyboard, 
      this.localPrinters, 
      this.openHoldBills, 
      this.orderPrinters, 
      this.orderType, 
      this.paypalPro, 
      this.pinCode, 
      this.posId, 
      this.posPrinters, 
      this.posRecieptA4PageSize, 
      this.posScreenStyle, 
      this.printItemsList, 
      this.printer, 
      this.proLimit, 
      this.productButtonColor, 
      this.purchaseCode, 
      this.receiptPrinter, 
      this.remotePrinting, 
      this.reportPinCode, 
      this.rounding, 
      this.stripe, 
      this.suspendSale, 
      this.taxMethodType, 
      this.todaySale, 
      this.toggleBrandsSlider, 
      this.toggleCategorySlider, 
      this.toggleSubcategorySlider, 
      this.tooltips, 
      this.version,});

  Possettings.fromJson(dynamic json) {
    addCustomer = json['add_customer'];
    addManualProduct = json['add_manual_product'];
    afterSalePage = json['after_sale_page'];
    api = json['api'];
    authorize = json['authorize'];
    autoPrint = json['auto_print'];
    cancelSale = json['cancel_sale'];
    cashDrawerCodes = json['cash_drawer_codes'];
    catLimit = json['cat_limit'];
    categoriesTab = json['categories_tab'];
    cfTitle1 = json['cf_title1'];
    cfTitle2 = json['cf_title2'];
    cfValue1 = json['cf_value1'];
    cfValue2 = json['cf_value2'];
    charPerLine = json['char_per_line'];
    closeRegister = json['close_register'];
    customerDetails = json['customer_details'];
    customerSelection = json['customer_selection'];
    defaultBiller = json['default_biller'];
    defaultCategory = json['default_category'];
    defaultCustomer = json['default_customer'];
    displayTime = json['display_time'];
    envatoUsername = json['envato_username'];
    finalizeSale = json['finalize_sale'];
    focusAddItem = json['focus_add_item'];
    itemOrder = json['item_order'];
    javaApplet = json['java_applet'];
    keyboard = json['keyboard'];
    localPrinters = json['local_printers'];
    openHoldBills = json['open_hold_bills'];
    orderPrinters = json['order_printers'];
    orderType = json['order_type'];
    paypalPro = json['paypal_pro'];
    pinCode = json['pin_code'];
    posId = json['pos_id'];
    posPrinters = json['pos_printers'];
    posRecieptA4PageSize = json['pos_reciept_a4_page_size'];
    posScreenStyle = json['pos_screen_style'];
    printItemsList = json['print_items_list'];
    printer = json['printer'];
    proLimit = json['pro_limit'];
    productButtonColor = json['product_button_color'];
    purchaseCode = json['purchase_code'];
    receiptPrinter = json['receipt_printer'];
    remotePrinting = json['remote_printing'];
    reportPinCode = json['report_pin_code'];
    rounding = json['rounding'];
    stripe = json['stripe'];
    suspendSale = json['suspend_sale'];
    taxMethodType = json['tax_method_type'];
    todaySale = json['today_sale'];
    toggleBrandsSlider = json['toggle_brands_slider'];
    toggleCategorySlider = json['toggle_category_slider'];
    toggleSubcategorySlider = json['toggle_subcategory_slider'];
    tooltips = json['tooltips'];
    version = json['version'];
  }
  String? addCustomer;
  String? addManualProduct;
  String? afterSalePage;
  String? api;
  String? authorize;
  String? autoPrint;
  String? cancelSale;
  String? cashDrawerCodes;
  String? catLimit;
  String? categoriesTab;
  String? cfTitle1;
  String? cfTitle2;
  String? cfValue1;
  String? cfValue2;
  String? charPerLine;
  String? closeRegister;
  String? customerDetails;
  String? customerSelection;
  String? defaultBiller;
  String? defaultCategory;
  String? defaultCustomer;
  String? displayTime;
  String? envatoUsername;
  String? finalizeSale;
  String? focusAddItem;
  String? itemOrder;
  String? javaApplet;
  String? keyboard;
  String? localPrinters;
  String? openHoldBills;
  String? orderPrinters;
  String? orderType;
  String? paypalPro;
  String? pinCode;
  String? posId;
  dynamic posPrinters;
  String? posRecieptA4PageSize;
  String? posScreenStyle;
  String? printItemsList;
  dynamic printer;
  String? proLimit;
  String? productButtonColor;
  String? purchaseCode;
  dynamic receiptPrinter;
  String? remotePrinting;
  dynamic reportPinCode;
  String? rounding;
  String? stripe;
  String? suspendSale;
  String? taxMethodType;
  String? todaySale;
  String? toggleBrandsSlider;
  String? toggleCategorySlider;
  String? toggleSubcategorySlider;
  String? tooltips;
  String? version;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['add_customer'] = addCustomer;
    map['add_manual_product'] = addManualProduct;
    map['after_sale_page'] = afterSalePage;
    map['api'] = api;
    map['authorize'] = authorize;
    map['auto_print'] = autoPrint;
    map['cancel_sale'] = cancelSale;
    map['cash_drawer_codes'] = cashDrawerCodes;
    map['cat_limit'] = catLimit;
    map['categories_tab'] = categoriesTab;
    map['cf_title1'] = cfTitle1;
    map['cf_title2'] = cfTitle2;
    map['cf_value1'] = cfValue1;
    map['cf_value2'] = cfValue2;
    map['char_per_line'] = charPerLine;
    map['close_register'] = closeRegister;
    map['customer_details'] = customerDetails;
    map['customer_selection'] = customerSelection;
    map['default_biller'] = defaultBiller;
    map['default_category'] = defaultCategory;
    map['default_customer'] = defaultCustomer;
    map['display_time'] = displayTime;
    map['envato_username'] = envatoUsername;
    map['finalize_sale'] = finalizeSale;
    map['focus_add_item'] = focusAddItem;
    map['item_order'] = itemOrder;
    map['java_applet'] = javaApplet;
    map['keyboard'] = keyboard;
    map['local_printers'] = localPrinters;
    map['open_hold_bills'] = openHoldBills;
    map['order_printers'] = orderPrinters;
    map['order_type'] = orderType;
    map['paypal_pro'] = paypalPro;
    map['pin_code'] = pinCode;
    map['pos_id'] = posId;
    map['pos_printers'] = posPrinters;
    map['pos_reciept_a4_page_size'] = posRecieptA4PageSize;
    map['pos_screen_style'] = posScreenStyle;
    map['print_items_list'] = printItemsList;
    map['printer'] = printer;
    map['pro_limit'] = proLimit;
    map['product_button_color'] = productButtonColor;
    map['purchase_code'] = purchaseCode;
    map['receipt_printer'] = receiptPrinter;
    map['remote_printing'] = remotePrinting;
    map['report_pin_code'] = reportPinCode;
    map['rounding'] = rounding;
    map['stripe'] = stripe;
    map['suspend_sale'] = suspendSale;
    map['tax_method_type'] = taxMethodType;
    map['today_sale'] = todaySale;
    map['toggle_brands_slider'] = toggleBrandsSlider;
    map['toggle_category_slider'] = toggleCategorySlider;
    map['toggle_subcategory_slider'] = toggleSubcategorySlider;
    map['tooltips'] = tooltips;
    map['version'] = version;
    return map;
  }

}