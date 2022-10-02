import 'dart:convert';

Companies companiesFromJson(String str) => Companies.fromJson(json.decode(str));
String companiesToJson(Companies data) => json.encode(data.toJson());
class Companies {
  Companies({
      this.offlineId, 
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
      this.vatNo,});

  Companies.fromJson(dynamic json) {
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
  dynamic offlineId;
  dynamic additionalNo;
  String? address;
  dynamic addressEn;
  String? api;
  String? awardPoints;
  dynamic buildingNo;
  String? cf1;
  String? cf2;
  String? cf3;
  String? cf4;
  String? cf5;
  String? cf6;
  String? city;
  dynamic coType;
  String? company;
  dynamic companyEn;
  String? country;
  dynamic crNo;
  dynamic customerGroupId;
  dynamic customerGroupName;
  dynamic depositAmount;
  dynamic districtName;
  String? email;
  dynamic groupId;
  String? groupName;
  String? gstNo;
  String? hideInPos;
  String? id;
  String? invoiceFooter;
  String? logo;
  String? logoImageUrl;
  String? name;
  dynamic nameEn;
  String? paymentTerm;
  String? phone;
  String? postalCode;
  dynamic priceGroupId;
  dynamic priceGroupName;
  String? state;
  dynamic streetName;
  String? vatNo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Offline_id'] = offlineId;
    map['additional_no'] = additionalNo;
    map['address'] = address;
    map['addressEn'] = addressEn;
    map['api'] = api;
    map['award_points'] = awardPoints;
    map['building_no'] = buildingNo;
    map['cf1'] = cf1;
    map['cf2'] = cf2;
    map['cf3'] = cf3;
    map['cf4'] = cf4;
    map['cf5'] = cf5;
    map['cf6'] = cf6;
    map['city'] = city;
    map['co_type'] = coType;
    map['company'] = company;
    map['companyEn'] = companyEn;
    map['country'] = country;
    map['cr_no'] = crNo;
    map['customer_group_id'] = customerGroupId;
    map['customer_group_name'] = customerGroupName;
    map['deposit_amount'] = depositAmount;
    map['district_name'] = districtName;
    map['email'] = email;
    map['group_id'] = groupId;
    map['group_name'] = groupName;
    map['gst_no'] = gstNo;
    map['hide_in_pos'] = hideInPos;
    map['id'] = id;
    map['invoice_footer'] = invoiceFooter;
    map['logo'] = logo;
    map['logo_image_url'] = logoImageUrl;
    map['name'] = name;
    map['nameEn'] = nameEn;
    map['payment_term'] = paymentTerm;
    map['phone'] = phone;
    map['postal_code'] = postalCode;
    map['price_group_id'] = priceGroupId;
    map['price_group_name'] = priceGroupName;
    map['state'] = state;
    map['street_name'] = streetName;
    map['vat_no'] = vatNo;
    return map;
  }

}