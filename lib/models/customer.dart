class CustomerModel {
  List<Customer>? customer;

  CustomerModel({this.customer});

  CustomerModel.fromJson(Map<String, dynamic> json) {
    if (json['customer'] != null) {
      customer = <Customer>[];
      json['customer'].forEach((v) {
        customer!.add( Customer.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    if (customer != null) {
      data['customer'] = customer!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Customer {
  String? company;
  String? email;
  int? customerGroupId;
  String? customerGroupName;
  String? vatNo;
  String? address;
  String? state;
  String? postalCode;
  String? country;
  String? phone;
  String? crNo;
  int? offlineId;

  Customer(
      {
        required this.company,
        required this.email,
        required  this.customerGroupId,
        required  this.customerGroupName,
        required  this.vatNo,
        required  this.address,
        required  this.state,
        required  this.postalCode,
        required   this.country,
        required  this.phone,
        required  this.crNo,
        required  this.offlineId});

  Customer.fromJson(Map<String, dynamic> json) {
    company = json['company'];
    email = json['email'];
    customerGroupId = json['customer_group_id'];
    customerGroupName = json['customer_group_name'];
    vatNo = json['vat_no'];
    address = json['address'];
    state = json['state'];
    postalCode = json['postal_code'];
    country = json['country'];
    phone = json['phone'];
    crNo = json['cr_no'];
    offlineId = json['Offline_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['company'] = company ?? "";
    data['email'] = email ?? "";
    data['customer_group_id'] = customerGroupId ?? 0;
    data['customer_group_name'] = customerGroupName ?? "";
    data['vat_no'] = vatNo ?? "";
    data['address'] = address ?? "";
    data['state'] = state ?? "";
    data['postal_code'] = postalCode ?? "";
    data['country'] = country ?? "";
    data['phone'] = phone ?? "";
    data['cr_no'] = crNo ?? "";
    data['Offline_id'] = offlineId ?? 0;
    return data;
  }
}