class UpdatedPillsStatusModel {
  String? saleId;
  String? deliveryDate;
  String? saleStatus;
  String? note;

  UpdatedPillsStatusModel({required this.saleId,required this.deliveryDate,required this.saleStatus,required this.note});

  UpdatedPillsStatusModel.fromJson(Map<String, dynamic> json) {
    saleId = json['sale_id'];
    deliveryDate = json['delivery_date'];
    saleStatus = json['sale_status'];
    note = json['note'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sale_id'] = this.saleId;
    data['delivery_date'] = this.deliveryDate;
    data['sale_status'] = this.saleStatus;
    data['note'] = this.note;
    return data;
  }
}
class UpdatedPillsResponse {
  String? message;
  bool? status;

  UpdatedPillsResponse({this.message, this.status});

  UpdatedPillsResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}