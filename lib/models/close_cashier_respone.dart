class CloseCashierResponse {
  bool? status;
  String? invoiceCount;
  String? returnInvoiceCount;
  String? cashInHand;
  String? openDate;
  String? closeDate;
  String? invoiceGrandTotal;
  String? returnInvoiceGrandTotal;
  int? netSalesGrandTotal;
  int? totalAdvance;
  String? totalCc;
  int? totalCash;

  CloseCashierResponse(
      {this.status,
        this.invoiceCount,
        this.returnInvoiceCount,
        this.cashInHand,
        this.openDate,
        this.closeDate,
        this.invoiceGrandTotal,
        this.returnInvoiceGrandTotal,
        this.netSalesGrandTotal,
        this.totalAdvance,
        this.totalCc,
        this.totalCash});

  CloseCashierResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    invoiceCount = json['invoice count'];
    returnInvoiceCount = json['return invoice count'];
    cashInHand = json['cash in hand'];
    openDate = json['open date'];
    closeDate = json['close date'];
    invoiceGrandTotal = json['invoice grand total'];
    returnInvoiceGrandTotal = json['return invoice grand total'];
    netSalesGrandTotal = json['net sales grand total'];
    totalAdvance = json['total Advance'];
    totalCc = json['total cc'];
    totalCash = json['total cash'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['invoice count'] = this.invoiceCount;
    data['return invoice count'] = this.returnInvoiceCount;
    data['cash in hand'] = this.cashInHand;
    data['open date'] = this.openDate;
    data['close date'] = this.closeDate;
    data['invoice grand total'] = this.invoiceGrandTotal;
    data['return invoice grand total'] = this.returnInvoiceGrandTotal;
    data['net sales grand total'] = this.netSalesGrandTotal;
    data['total Advance'] = this.totalAdvance;
    data['total cc'] = this.totalCc;
    data['total cash'] = this.totalCash;
    return data;
  }
}