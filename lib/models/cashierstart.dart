class CashierStartRequest {
  String? userId;
  String? date;
  String? cashInHand;

  CashierStartRequest({this.userId, this.date, this.cashInHand});

  CashierStartRequest.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    date = json['date'];
    cashInHand = json['cash_in_hand'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['date'] = this.date;
    data['cash_in_hand'] = this.cashInHand;
    return data;
  }
}