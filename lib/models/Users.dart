import 'dart:convert';

Users usersFromJson(String str) => Users.fromJson(json.decode(str));
String usersToJson(Users data) => json.encode(data.toJson());
class Users {
  Users({
      this.activationCode, 
      this.active, 
      this.allowDiscount, 
      this.api, 
      this.avatar, 
      this.awardPoints, 
      this.billerId, 
      this.company, 
      this.companyId, 
      this.createdOn, 
      this.editPrice, 
      this.editRight, 
      this.email, 
      this.firstName, 
      this.forgottenPasswordCode, 
      this.forgottenPasswordTime, 
      this.gender, 
      this.groupId, 
      this.id, 
      this.ipAddress, 
      this.keyP, 
      this.lastIpAddress, 
      this.lastLogin, 
      this.lastName, 
      this.password, 
      this.phone, 
      this.rememberCode, 
      this.salt, 
      this.showCost, 
      this.showPrice, 
      this.username, 
      this.viewRight, 
      this.warehouseCode, 
      this.warehouseId,});

  Users.fromJson(dynamic json) {
    activationCode = json['activation_code'];
    active = json['active'];
    allowDiscount = json['allow_discount'];
    api = json['api'];
    avatar = json['avatar'];
    awardPoints = json['award_points'];
    billerId = json['biller_id'];
    company = json['company'];
    companyId = json['company_id'];
    createdOn = json['created_on'];
    editPrice = json['edit_price'];
    editRight = json['edit_right'];
    email = json['email'];
    firstName = json['first_name'];
    forgottenPasswordCode = json['forgotten_password_code'];
    forgottenPasswordTime = json['forgotten_password_time'];
    gender = json['gender'];
    groupId = json['group_id'];
    id = json['id'];
    ipAddress = json['ip_address'];
    keyP = json['key_p'];
    lastIpAddress = json['last_ip_address'];
    lastLogin = json['last_login'];
    lastName = json['last_name'];
    password = json['password'];
    phone = json['phone'];
    rememberCode = json['remember_code'];
    salt = json['salt'];
    showCost = json['show_cost'];
    showPrice = json['show_price'];
    username = json['username'];
    viewRight = json['view_right'];
    warehouseCode = json['warehouse_code'];
    warehouseId = json['warehouse_id'];
  }
  dynamic activationCode;
  String? active;
  String? allowDiscount;
  String? api;
  dynamic avatar;
  String? awardPoints;
  String? billerId;
  String? company;
  dynamic companyId;
  String? createdOn;
  String? editPrice;
  String? editRight;
  String? email;
  String? firstName;
  dynamic forgottenPasswordCode;
  dynamic forgottenPasswordTime;
  String? gender;
  String? groupId;
  String? id;
  String? ipAddress;
  String? keyP;
  dynamic lastIpAddress;
  String? lastLogin;
  String? lastName;
  String? password;
  String? phone;
  dynamic rememberCode;
  dynamic salt;
  String? showCost;
  String? showPrice;
  String? username;
  String? viewRight;
  String? warehouseCode;
  String? warehouseId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['activation_code'] = activationCode;
    map['active'] = active;
    map['allow_discount'] = allowDiscount;
    map['api'] = api;
    map['avatar'] = avatar;
    map['award_points'] = awardPoints;
    map['biller_id'] = billerId;
    map['company'] = company;
    map['company_id'] = companyId;
    map['created_on'] = createdOn;
    map['edit_price'] = editPrice;
    map['edit_right'] = editRight;
    map['email'] = email;
    map['first_name'] = firstName;
    map['forgotten_password_code'] = forgottenPasswordCode;
    map['forgotten_password_time'] = forgottenPasswordTime;
    map['gender'] = gender;
    map['group_id'] = groupId;
    map['id'] = id;
    map['ip_address'] = ipAddress;
    map['key_p'] = keyP;
    map['last_ip_address'] = lastIpAddress;
    map['last_login'] = lastLogin;
    map['last_name'] = lastName;
    map['password'] = password;
    map['phone'] = phone;
    map['remember_code'] = rememberCode;
    map['salt'] = salt;
    map['show_cost'] = showCost;
    map['show_price'] = showPrice;
    map['username'] = username;
    map['view_right'] = viewRight;
    map['warehouse_code'] = warehouseCode;
    map['warehouse_id'] = warehouseId;
    return map;
  }

}