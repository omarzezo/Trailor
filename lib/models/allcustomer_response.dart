class AllCustomerResponse {
  List<Data>? data;
  int? limit;
  int? start;
  int? total;

  AllCustomerResponse({this.data, this.limit, this.start, this.total});

  AllCustomerResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
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

class Data {
  String? offlineId;
  String? additionalNo;
  String? address;
  String? addressEn;
  String? api;
  String? awardPoints;
  String? buildingNo;
  String? cf1;
  String? cf2;
  String? cf3;
  String? cf4;
  String? cf5;
  String? cf6;
  String? city;
  String? coType;
  String? company;
  dynamic companyEn;
  String? country;
  String? crNo;
  String? customerGroupId;
  String? customerGroupName;
  dynamic depositAmount;
  dynamic districtName;
  String? email;
  String? groupId;
  String? groupName;
  dynamic gstNo;
  String? hideInPos;
  String? id;
  dynamic invoiceFooter;
  String? logo;
  String? logoImageUrl;
  String? name;
  dynamic nameEn;
  String? paymentTerm;
  String? phone;
  String? postalCode;
  String? priceGroupId;
  String? priceGroupName;
  String? state;
  dynamic streetName;
  String? vatNo;

  Data(
      {this.offlineId,
        this.additionalNo,
        this.address,
        this.addressEn,
        this.api,
        this.awardPoints,
        this.buildingNo,
        this.cf1,
        this.cf2,
        this.cf3,
        this.cf4,
        this.cf5,
        this.cf6,
        this.city,
        this.coType,
        this.company,
        this.companyEn,
        this.country,
        this.crNo,
        this.customerGroupId,
        this.customerGroupName,
        this.depositAmount,
        this.districtName,
        this.email,
        this.groupId,
        this.groupName,
        this.gstNo,
        this.hideInPos,
        this.id,
        this.invoiceFooter,
        this.logo,
        this.logoImageUrl,
        this.name,
        this.nameEn,
        this.paymentTerm,
        this.phone,
        this.postalCode,
        this.priceGroupId,
        this.priceGroupName,
        this.state,
        this.streetName,
        this.vatNo});

  Data.fromJson(Map<String, dynamic> json) {
    offlineId = json['Offline_id'];
    additionalNo = json['additional_no'];
    address = json['address'];
    addressEn = json['addressEn'];
    api = json['api'];
    awardPoints = json['award_points'];
    buildingNo = json['building_no'];
    cf1 = json['cf1'];
    cf2 = json['cf2'];
    cf3 = json['cf3'];
    cf4 = json['cf4'];
    cf5 = json['cf5'];
    cf6 = json['cf6'];
    city = json['city'];
    coType = json['co_type'];
    company = json['company'];
    companyEn = json['companyEn'];
    country = json['country'];
    crNo = json['cr_no'];
    customerGroupId = json['customer_group_id'];
    customerGroupName = json['customer_group_name'];
    depositAmount = json['deposit_amount'];
    districtName = json['district_name'];
    email = json['email'];
    groupId = json['group_id'];
    groupName = json['group_name'];
    gstNo = json['gst_no'];
    hideInPos = json['hide_in_pos'];
    id = json['id'];
    invoiceFooter = json['invoice_footer'];
    logo = json['logo'];
    logoImageUrl = json['logo_image_url'];
    name = json['name'];
    nameEn = json['nameEn'];
    paymentTerm = json['payment_term'];
    phone = json['phone'];
    postalCode = json['postal_code'];
    priceGroupId = json['price_group_id'];
    priceGroupName = json['price_group_name'];
    state = json['state'];
    streetName = json['street_name'];
    vatNo = json['vat_no'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Offline_id'] = this.offlineId;
    data['additional_no'] = this.additionalNo;
    data['address'] = this.address;
    data['addressEn'] = this.addressEn;
    data['api'] = this.api;
    data['award_points'] = this.awardPoints;
    data['building_no'] = this.buildingNo;
    data['cf1'] = this.cf1;
    data['cf2'] = this.cf2;
    data['cf3'] = this.cf3;
    data['cf4'] = this.cf4;
    data['cf5'] = this.cf5;
    data['cf6'] = this.cf6;
    data['city'] = this.city;
    data['co_type'] = this.coType;
    data['company'] = this.company;
    data['companyEn'] = this.companyEn;
    data['country'] = this.country;
    data['cr_no'] = this.crNo;
    data['customer_group_id'] = this.customerGroupId;
    data['customer_group_name'] = this.customerGroupName;
    data['deposit_amount'] = this.depositAmount;
    data['district_name'] = this.districtName;
    data['email'] = this.email;
    data['group_id'] = this.groupId;
    data['group_name'] = this.groupName;
    data['gst_no'] = this.gstNo;
    data['hide_in_pos'] = this.hideInPos;
    data['id'] = this.id;
    data['invoice_footer'] = this.invoiceFooter;
    data['logo'] = this.logo;
    data['logo_image_url'] = this.logoImageUrl;
    data['name'] = this.name;
    data['nameEn'] = this.nameEn;
    data['payment_term'] = this.paymentTerm;
    data['phone'] = this.phone;
    data['postal_code'] = this.postalCode;
    data['price_group_id'] = this.priceGroupId;
    data['price_group_name'] = this.priceGroupName;
    data['state'] = this.state;
    data['street_name'] = this.streetName;
    data['vat_no'] = this.vatNo;
    return data;
  }
}