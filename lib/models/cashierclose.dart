class CashierCloseRequest {
  String? userId;
  String? closedAt;
  String? totalCash;
  String? totalCheques;
  String? totalCc;
  String? invoiceCount;
  String? closedBy;
  String? note;

  CashierCloseRequest(
      {this.userId,
        this.closedAt,
        this.totalCash,
        this.totalCheques,
        this.totalCc,
        this.invoiceCount,
        this.closedBy,
        this.note});

  CashierCloseRequest.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    closedAt = json['closed_at'];
    totalCash = json['total_cash'];
    totalCheques = json['total_cheques'];
    totalCc = json['total_cc'];
    invoiceCount = json['invoice_count'];
    closedBy = json['closed_by'];
    note = json['note'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['closed_at'] = this.closedAt;
    data['total_cash'] = this.totalCash;
    data['total_cheques'] = this.totalCheques;
    data['total_cc'] = this.totalCc;
    data['invoice_count'] = this.invoiceCount;
    data['closed_by'] = this.closedBy;
    data['note'] = this.note;
    return data;
  }
}

