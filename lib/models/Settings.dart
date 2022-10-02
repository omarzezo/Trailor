import 'dart:convert';

Settings settingsFromJson(String str) => Settings.fromJson(json.decode(str));
String settingsToJson(Settings data) => json.encode(data.toJson());
class Settings {
  Settings({
      this.isLundry, 
      this.isResturant, 
      this.isServices, 
      this.accounting, 
      this.accountingOffline, 
      this.accountingOnly, 
      this.accountingMethod, 
      this.active, 
      this.allowReg, 
      this.api, 
      this.apis, 
      this.attributes, 
      this.autoDetectBarcode, 
      this.autoReg, 
      this.barcodeImg, 
      this.barcodeSeparator, 
      this.bcFix, 
      this.caPoint, 
      this.captcha, 
      this.company, 
      this.corn, 
      this.customerGroup, 
      this.dateformat, 
      this.decimals, 
      this.decimalsSep, 
      this.defaultBiller, 
      this.defaultCurrency, 
      this.defaultDiscount, 
      this.defaultEmail, 
      this.defaultTaxMethod, 
      this.defaultTaxRate, 
      this.defaultTaxRate2, 
      this.defaultWarehouse, 
      this.deliveryPrefix, 
      this.disableEditing, 
      this.discountMethod, 
      this.displayAllProducts, 
      this.displaySymbol, 
      this.eachSale, 
      this.eachSpent, 
      this.envatoUsername, 
      this.expensePrefix, 
      this.iheight, 
      this.invoiceNoRef, 
      this.invoiceView, 
      this.invoicesSequence, 
      this.isTailer, 
      this.itemAddition, 
      this.iwidth, 
      this.language, 
      this.logo, 
      this.logo2, 
      this.logoImageUrl, 
      this.mailpath, 
      this.mmode, 
      this.overselling, 
      this.paymentPrefix, 
      this.pdfLib, 
      this.pos, 
      this.ppaymentPrefix, 
      this.priceGroup, 
      this.productDiscount, 
      this.productExpiry, 
      this.productSerial, 
      this.protocol, 
      this.purchaseCode, 
      this.purchasePrefix, 
      this.qaPrefix, 
      this.qtyDecimals, 
      this.quotePrefix, 
      this.racks, 
      this.referenceFormat, 
      this.regNotification, 
      this.regVer, 
      this.removeExpired, 
      this.restrictCalendar, 
      this.restrictUser, 
      this.returnPrefix, 
      this.returnpPrefix, 
      this.rowsPerPage, 
      this.rtl, 
      this.saPoint, 
      this.sac, 
      this.salesInvoicePrefix, 
      this.salesPrefix, 
      this.setFocus, 
      this.settingId, 
      this.showProductCode, 
      this.siteEname, 
      this.siteName, 
      this.smtpCrypto, 
      this.smtpHost, 
      this.smtpPass, 
      this.smtpPort, 
      this.smtpUser, 
      this.state, 
      this.symbol, 
      this.tax1, 
      this.tax2, 
      this.theight, 
      this.theme, 
      this.thousandsSep, 
      this.timezone, 
      this.transferPrefix, 
      this.twidth, 
      this.update, 
      this.updateCost, 
      this.version, 
      this.watermark,});

  Settings.fromJson(dynamic json) {
    isLundry = json['IsLundry'];
    isResturant = json['IsResturant'];
    isServices = json['IsServices'];
    accounting = json['accounting'];
    accountingOffline = json['accountingOffline'];
    accountingOnly = json['accountingOnly'];
    accountingMethod = json['accounting_method'];
    active = json['active'];
    allowReg = json['allow_reg'];
    api = json['api'];
    apis = json['apis'];
    attributes = json['attributes'];
    autoDetectBarcode = json['auto_detect_barcode'];
    autoReg = json['auto_reg'];
    barcodeImg = json['barcode_img'];
    barcodeSeparator = json['barcode_separator'];
    bcFix = json['bc_fix'];
    caPoint = json['ca_point'];
    captcha = json['captcha'];
    company = json['company'];
    corn = json['corn'];
    customerGroup = json['customer_group'];
    dateformat = json['dateformat'];
    decimals = json['decimals'];
    decimalsSep = json['decimals_sep'];
    defaultBiller = json['default_biller'];
    defaultCurrency = json['default_currency'];
    defaultDiscount = json['default_discount'];
    defaultEmail = json['default_email'];
    defaultTaxMethod = json['default_tax_method'];
    defaultTaxRate = json['default_tax_rate'];
    defaultTaxRate2 = json['default_tax_rate2'];
    defaultWarehouse = json['default_warehouse'];
    deliveryPrefix = json['delivery_prefix'];
    disableEditing = json['disable_editing'];
    discountMethod = json['discount_method'];
    displayAllProducts = json['display_all_products'];
    displaySymbol = json['display_symbol'];
    eachSale = json['each_sale'];
    eachSpent = json['each_spent'];
    envatoUsername = json['envato_username'];
    expensePrefix = json['expense_prefix'];
    iheight = json['iheight'];
    invoiceNoRef = json['invoiceNoRef'];
    invoiceView = json['invoice_view'];
    invoicesSequence = json['invoices_sequence'];
    isTailer = json['isTailer'];
    itemAddition = json['item_addition'];
    iwidth = json['iwidth'];
    language = json['language'];
    logo = json['logo'];
    logo2 = json['logo2'];
    logoImageUrl = json['logo_image_url'];
    mailpath = json['mailpath'];
    mmode = json['mmode'];
    overselling = json['overselling'];
    paymentPrefix = json['payment_prefix'];
    pdfLib = json['pdf_lib'];
    pos = json['pos'];
    ppaymentPrefix = json['ppayment_prefix'];
    priceGroup = json['price_group'];
    productDiscount = json['product_discount'];
    productExpiry = json['product_expiry'];
    productSerial = json['product_serial'];
    protocol = json['protocol'];
    purchaseCode = json['purchase_code'];
    purchasePrefix = json['purchase_prefix'];
    qaPrefix = json['qa_prefix'];
    qtyDecimals = json['qty_decimals'];
    quotePrefix = json['quote_prefix'];
    racks = json['racks'];
    referenceFormat = json['reference_format'];
    regNotification = json['reg_notification'];
    regVer = json['reg_ver'];
    removeExpired = json['remove_expired'];
    restrictCalendar = json['restrict_calendar'];
    restrictUser = json['restrict_user'];
    returnPrefix = json['return_prefix'];
    returnpPrefix = json['returnp_prefix'];
    rowsPerPage = json['rows_per_page'];
    rtl = json['rtl'];
    saPoint = json['sa_point'];
    sac = json['sac'];
    salesInvoicePrefix = json['sales_invoice_prefix'];
    salesPrefix = json['sales_prefix'];
    setFocus = json['set_focus'];
    settingId = json['setting_id'];
    showProductCode = json['show_product_code'];
    siteEname = json['site_ename'];
    siteName = json['site_name'];
    smtpCrypto = json['smtp_crypto'];
    smtpHost = json['smtp_host'];
    smtpPass = json['smtp_pass'];
    smtpPort = json['smtp_port'];
    smtpUser = json['smtp_user'];
    state = json['state'];
    symbol = json['symbol'];
    tax1 = json['tax1'];
    tax2 = json['tax2'];
    theight = json['theight'];
    theme = json['theme'];
    thousandsSep = json['thousands_sep'];
    timezone = json['timezone'];
    transferPrefix = json['transfer_prefix'];
    twidth = json['twidth'];
    update = json['update'];
    updateCost = json['update_cost'];
    version = json['version'];
    watermark = json['watermark'];
  }
  String? isLundry;
  String? isResturant;
  String? isServices;
  String? accounting;
  String? accountingOffline;
  String? accountingOnly;
  String? accountingMethod;
  String? active;
  String? allowReg;
  String? api;
  String? apis;
  String? attributes;
  String? autoDetectBarcode;
  dynamic autoReg;
  String? barcodeImg;
  String? barcodeSeparator;
  String? bcFix;
  dynamic caPoint;
  String? captcha;
  String? company;
  dynamic corn;
  String? customerGroup;
  String? dateformat;
  String? decimals;
  String? decimalsSep;
  String? defaultBiller;
  String? defaultCurrency;
  String? defaultDiscount;
  String? defaultEmail;
  String? defaultTaxMethod;
  String? defaultTaxRate;
  String? defaultTaxRate2;
  String? defaultWarehouse;
  String? deliveryPrefix;
  String? disableEditing;
  String? discountMethod;
  String? displayAllProducts;
  String? displaySymbol;
  dynamic eachSale;
  dynamic eachSpent;
  String? envatoUsername;
  String? expensePrefix;
  String? iheight;
  String? invoiceNoRef;
  String? invoiceView;
  String? invoicesSequence;
  String? isTailer;
  String? itemAddition;
  String? iwidth;
  String? language;
  String? logo;
  String? logo2;
  String? logoImageUrl;
  String? mailpath;
  String? mmode;
  String? overselling;
  String? paymentPrefix;
  String? pdfLib;
  String? pos;
  String? ppaymentPrefix;
  String? priceGroup;
  String? productDiscount;
  String? productExpiry;
  String? productSerial;
  String? protocol;
  String? purchaseCode;
  String? purchasePrefix;
  String? qaPrefix;
  String? qtyDecimals;
  String? quotePrefix;
  String? racks;
  String? referenceFormat;
  String? regNotification;
  String? regVer;
  String? removeExpired;
  String? restrictCalendar;
  String? restrictUser;
  String? returnPrefix;
  String? returnpPrefix;
  String? rowsPerPage;
  String? rtl;
  dynamic saPoint;
  String? sac;
  dynamic salesInvoicePrefix;
  String? salesPrefix;
  String? setFocus;
  String? settingId;
  String? showProductCode;
  String? siteEname;
  String? siteName;
  dynamic smtpCrypto;
  String? smtpHost;
  String? smtpPass;
  String? smtpPort;
  String? smtpUser;
  String? state;
  String? symbol;
  String? tax1;
  String? tax2;
  String? theight;
  String? theme;
  String? thousandsSep;
  String? timezone;
  String? transferPrefix;
  String? twidth;
  String? update;
  String? updateCost;
  String? version;
  String? watermark;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['IsLundry'] = isLundry;
    map['IsResturant'] = isResturant;
    map['IsServices'] = isServices;
    map['accounting'] = accounting;
    map['accountingOffline'] = accountingOffline;
    map['accountingOnly'] = accountingOnly;
    map['accounting_method'] = accountingMethod;
    map['active'] = active;
    map['allow_reg'] = allowReg;
    map['api'] = api;
    map['apis'] = apis;
    map['attributes'] = attributes;
    map['auto_detect_barcode'] = autoDetectBarcode;
    map['auto_reg'] = autoReg;
    map['barcode_img'] = barcodeImg;
    map['barcode_separator'] = barcodeSeparator;
    map['bc_fix'] = bcFix;
    map['ca_point'] = caPoint;
    map['captcha'] = captcha;
    map['company'] = company;
    map['corn'] = corn;
    map['customer_group'] = customerGroup;
    map['dateformat'] = dateformat;
    map['decimals'] = decimals;
    map['decimals_sep'] = decimalsSep;
    map['default_biller'] = defaultBiller;
    map['default_currency'] = defaultCurrency;
    map['default_discount'] = defaultDiscount;
    map['default_email'] = defaultEmail;
    map['default_tax_method'] = defaultTaxMethod;
    map['default_tax_rate'] = defaultTaxRate;
    map['default_tax_rate2'] = defaultTaxRate2;
    map['default_warehouse'] = defaultWarehouse;
    map['delivery_prefix'] = deliveryPrefix;
    map['disable_editing'] = disableEditing;
    map['discount_method'] = discountMethod;
    map['display_all_products'] = displayAllProducts;
    map['display_symbol'] = displaySymbol;
    map['each_sale'] = eachSale;
    map['each_spent'] = eachSpent;
    map['envato_username'] = envatoUsername;
    map['expense_prefix'] = expensePrefix;
    map['iheight'] = iheight;
    map['invoiceNoRef'] = invoiceNoRef;
    map['invoice_view'] = invoiceView;
    map['invoices_sequence'] = invoicesSequence;
    map['isTailer'] = isTailer;
    map['item_addition'] = itemAddition;
    map['iwidth'] = iwidth;
    map['language'] = language;
    map['logo'] = logo;
    map['logo2'] = logo2;
    map['logo_image_url'] = logoImageUrl;
    map['mailpath'] = mailpath;
    map['mmode'] = mmode;
    map['overselling'] = overselling;
    map['payment_prefix'] = paymentPrefix;
    map['pdf_lib'] = pdfLib;
    map['pos'] = pos;
    map['ppayment_prefix'] = ppaymentPrefix;
    map['price_group'] = priceGroup;
    map['product_discount'] = productDiscount;
    map['product_expiry'] = productExpiry;
    map['product_serial'] = productSerial;
    map['protocol'] = protocol;
    map['purchase_code'] = purchaseCode;
    map['purchase_prefix'] = purchasePrefix;
    map['qa_prefix'] = qaPrefix;
    map['qty_decimals'] = qtyDecimals;
    map['quote_prefix'] = quotePrefix;
    map['racks'] = racks;
    map['reference_format'] = referenceFormat;
    map['reg_notification'] = regNotification;
    map['reg_ver'] = regVer;
    map['remove_expired'] = removeExpired;
    map['restrict_calendar'] = restrictCalendar;
    map['restrict_user'] = restrictUser;
    map['return_prefix'] = returnPrefix;
    map['returnp_prefix'] = returnpPrefix;
    map['rows_per_page'] = rowsPerPage;
    map['rtl'] = rtl;
    map['sa_point'] = saPoint;
    map['sac'] = sac;
    map['sales_invoice_prefix'] = salesInvoicePrefix;
    map['sales_prefix'] = salesPrefix;
    map['set_focus'] = setFocus;
    map['setting_id'] = settingId;
    map['show_product_code'] = showProductCode;
    map['site_ename'] = siteEname;
    map['site_name'] = siteName;
    map['smtp_crypto'] = smtpCrypto;
    map['smtp_host'] = smtpHost;
    map['smtp_pass'] = smtpPass;
    map['smtp_port'] = smtpPort;
    map['smtp_user'] = smtpUser;
    map['state'] = state;
    map['symbol'] = symbol;
    map['tax1'] = tax1;
    map['tax2'] = tax2;
    map['theight'] = theight;
    map['theme'] = theme;
    map['thousands_sep'] = thousandsSep;
    map['timezone'] = timezone;
    map['transfer_prefix'] = transferPrefix;
    map['twidth'] = twidth;
    map['update'] = update;
    map['update_cost'] = updateCost;
    map['version'] = version;
    map['watermark'] = watermark;
    return map;
  }

}