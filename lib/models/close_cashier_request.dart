class CloseCashierRequest {
  String? userId;
  String? closedAt;

  CloseCashierRequest({this.userId, this.closedAt});

  CloseCashierRequest.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    closedAt = json['closed_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['closed_at'] = this.closedAt;
    return data;
  }
}