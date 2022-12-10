class CustomerRequest {
  String? id;
  String? company;
  String? name;
  String? email;
  String? vatNo;
  String? crNo;
  String? address;
  String? state;
  String? postalCode;
  String? country;
  String? phone;

  CustomerRequest(
      {this.id,
        this.company,
        this.name,
        this.email,
        this.vatNo,
        this.crNo,
        this.address,
        this.state,
        this.postalCode,
        this.country,
        this.phone});

  CustomerRequest.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    company = json['company'];
    name = json['name'];
    email = json['email'];
    vatNo = json['vat_no'];
    crNo = json['cr_no'];
    address = json['address'];
    state = json['state'];
    postalCode = json['postal_code'];
    country = json['country'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['company'] = this.company;
    data['name'] = this.name;
    data['email'] = this.email;
    data['vat_no'] = this.vatNo;
    data['cr_no'] = this.crNo;
    data['address'] = this.address;
    data['state'] = this.state;
    data['postal_code'] = this.postalCode;
    data['country'] = this.country;
    data['phone'] = this.phone;
    return data;
  }
}