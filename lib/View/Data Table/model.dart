// class Details {
//   final String status;
//   final dynamic dateOfDelivery;
//   final dynamic dateOfInvoice;
//   final String client;
//   final double phone;
//   final double code;
//   final double ref;
//   final double num;
//
//   const Details({
//     required this.status,
//     required this.dateOfDelivery,
//     required this.dateOfInvoice,
//     required this.client,
//     required this.phone,
//     required this.code,
//     required this.ref,
//     required this.num,
//   });
//
//   factory Details.fromJson(Map<String, dynamic> json) {
//     return Details(
//       status: json["status"],
//       dateOfDelivery: json["dateOfDelivery"],
//       dateOfInvoice: json["dateOfInvoice"],
//       client: json["client"],
//       phone: double.parse(json["phone"]),
//       code: double.parse(json["code"]),
//       ref: double.parse(json["reference_no"]),
//       num: double.parse(json["num"]),
//     );
//   }
// //
//
// }
// class Details {
//   final String status;
//   final dynamic dateOfDelivery;
//   final dynamic dateOfInvoice;
//   final String client;
//   final double phone;
//   final double code;
//   final String refNumber;
//   final double num;
//
//   const Details({
//     required this.status,
//     required this.dateOfDelivery,
//     required this.dateOfInvoice,
//     required this.client,
//     required this.phone,
//     required this.code,
//     required this.refNumber,
//     required this.num,
//   });
//
//   factory Details.fromJson(Map<String, dynamic> json) {
//     return Details(
//       status: json["sale_status"],
//       dateOfDelivery: json["supply_date"],
//       dateOfInvoice: json["date"],
//       client: json["customer"],
//       phone: double.parse(json["phone"]),
//       code: double.parse(json["code"]),
//       refNumber: json["reference_no"],
//       num: double.parse(json["num"]),
//     );
//   }
// //
//
// }
// class PillsDetails {
//   List<Data>? data;
//   int? limit;
//   int? start;
//   int? total;
//
//   PillsDetails({this.data, this.limit, this.start, this.total});
//
//   PillsDetails.fromJson(Map<String, dynamic> json) {
//     if (json['data'] != null) {
//       data = <Data>[];
//       json['data'].forEach((v) {
//         data!.add( Data.fromJson(v));
//       });
//     }
//     limit = json['limit'];
//     start = json['start'];
//     total = json['total'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data =  Map<String, dynamic>();
//     if (this.data != null) {
//       data['data'] = this.data!.map((v) => v.toJson()).toList();
//     }
//     data['limit'] = limit;
//     data['start'] = start;
//     data['total'] = total;
//     return data;
//   }
// }
//
// class Data {
//   String? id;
//   String? referenceNo;
//   String? customerId;
//   String? customer;
//   String? date;
//   String? saleStatus;
//
//   Data(
//       {this.id,
//         this.referenceNo,
//         this.customerId,
//         this.customer,
//         this.date,
//         this.saleStatus});
//
//   Data.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     referenceNo = json['reference_no'];
//     customerId = json['customer_id'];
//     customer = json['customer'];
//     date = json['date'];
//     saleStatus = json['sale_status'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = id;
//     data['reference_no'] = referenceNo;
//     data['customer_id'] = customerId;
//     data['customer'] = customer;
//     data['date'] = date;
//     data['sale_status'] = saleStatus;
//     return data;
//   }
// }
class PillsDetails {
  List<PillsDetailsData>? data;
  int? limit;
  int? start;
  int? total;

  PillsDetails({this.data, this.limit, this.start, this.total});

  PillsDetails.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <PillsDetailsData>[];
      json['data'].forEach((v) {
        data!.add(new PillsDetailsData.fromJson(v));
      });
    }
    limit = json['limit'];
    start = json['start'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['limit'] = this.limit;
    data['start'] = this.start;
    data['total'] = this.total;
    return data;
  }
}

class PillsDetailsData {
  String? id;
  String? referenceNo;
  String? customerId;
  String? customer;
  String? date;
  String? deliveryDate;
  String? saleStatus;
  String? balance;

  PillsDetailsData(
      {this.id,
        this.referenceNo,
        this.customerId,
        this.customer,
        this.date,
        this.deliveryDate,
        this.saleStatus,
        this.balance});

  PillsDetailsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    referenceNo = json['reference_no'];
    customerId = json['customer_id'];
    customer = json['customer'];
    date = json['date'];
    deliveryDate = json['delivery_date'];
    saleStatus = json['sale_status'];
    balance = json['balance'];
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
    return data;
  }
}