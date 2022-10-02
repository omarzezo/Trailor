import 'Taxrates.dart';
import 'Users.dart';
import 'Companies.dart';
import 'Settings.dart';
import 'Possettings.dart';
import 'Categories.dart';
import 'Units.dart';
import 'Permissions.dart';
import 'CustomerGroups.dart';
import 'PaymentType.dart';
import 'ExpenseCategories.dart';
import 'Warehouses.dart';
import 'Products.dart';
import 'WarehousesProducts.dart';
import 'PriceGroups.dart';
import 'ResturantEmpTypes.dart';
import 'dart:convert';

TrailorListsResponse trailorListsResponseFromJson(String str) => TrailorListsResponse.fromJson(json.decode(str));
String trailorListsResponseToJson(TrailorListsResponse data) => json.encode(data.toJson());
class TrailorListsResponse {
  TrailorListsResponse({
      this.taxrates, 
      this.users, 
      this.companies, 
      this.settings, 
      this.possettings, 
      this.categories, 
      this.units, 
      this.permissions, 
      this.customerGroups, 
      this.paymentType, 
      this.tRMeasurement, 
      this.tRTailor, 
      this.tRFilling, 
      this.tRZipper, 
      this.tRCollar, 
      this.tRCuff, 
      this.tRModel, 
      this.tRPocket, 
      this.expenseCategories, 
      this.warehouses, 
      this.products, 
      this.warehousesProducts, 
      this.priceGroups, 
      this.resturantEmpTypes, 
      this.limit, 
      this.start, 
      this.total,});

  TrailorListsResponse.fromJson(dynamic json) {
    if (json['taxrates'] != null) {
      taxrates = [];
      json['taxrates'].forEach((v) {
        taxrates?.add(Taxrates.fromJson(v));
      });
    }
    if (json['users'] != null) {
      users = [];
      json['users'].forEach((v) {
        users?.add(Users.fromJson(v));
      });
    }
    if (json['companies'] != null) {
      companies = [];
      json['companies'].forEach((v) {
        companies?.add(Companies.fromJson(v));
      });
    }
    if (json['settings'] != null) {
      settings = [];
      json['settings'].forEach((v) {
        settings?.add(Settings.fromJson(v));
      });
    }
    if (json['possettings'] != null) {
      possettings = [];
      json['possettings'].forEach((v) {
        possettings?.add(Possettings.fromJson(v));
      });
    }
    if (json['categories'] != null) {
      categories = [];
      json['categories'].forEach((v) {
        categories?.add(Categories.fromJson(v));
      });
    }
    if (json['units'] != null) {
      units = [];
      json['units'].forEach((v) {
        units?.add(Units.fromJson(v));
      });
    }
    if (json['permissions'] != null) {
      permissions = [];
      json['permissions'].forEach((v) {
        permissions?.add(Permissions.fromJson(v));
      });
    }
    if (json['customer_groups'] != null) {
      customerGroups = [];
      json['customer_groups'].forEach((v) {
        customerGroups?.add(CustomerGroups.fromJson(v));
      });
    }
    if (json['payment_type'] != null) {
      paymentType = [];
      json['payment_type'].forEach((v) {
        paymentType?.add(PaymentType.fromJson(v));
      });
    }
    tRMeasurement = json['TR_Measurement'];
    tRTailor = json['TR_tailor'];
    tRFilling = json['TR_Filling'];
    tRZipper = json['TR_Zipper'];
    tRCollar = json['TR_Collar'];
    tRCuff = json['TR_Cuff'];
    tRModel = json['TR_Model'];
    tRPocket = json['TR_Pocket'];
    if (json['expense_categories'] != null) {
      expenseCategories = [];
      json['expense_categories'].forEach((v) {
        expenseCategories?.add(ExpenseCategories.fromJson(v));
      });
    }
    if (json['warehouses'] != null) {
      warehouses = [];
      json['warehouses'].forEach((v) {
        warehouses?.add(Warehouses.fromJson(v));
      });
    }
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(Products.fromJson(v));
      });
    }
    if (json['warehouses_products'] != null) {
      warehousesProducts = [];
      json['warehouses_products'].forEach((v) {
        warehousesProducts?.add(WarehousesProducts.fromJson(v));
      });
    }
    if (json['price_groups'] != null) {
      priceGroups = [];
      json['price_groups'].forEach((v) {
        priceGroups?.add(PriceGroups.fromJson(v));
      });
    }
    if (json['resturant_emp_types'] != null) {
      resturantEmpTypes = [];
      json['resturant_emp_types'].forEach((v) {
        resturantEmpTypes?.add(ResturantEmpTypes.fromJson(v));
      });
    }
    limit = json['limit'];
    start = json['start'];
    total = json['total'];
  }
  List<Taxrates>? taxrates;
  List<Users>? users;
  List<Companies>? companies;
  List<Settings>? settings;
  List<Possettings>? possettings;
  List<Categories>? categories;
  List<Units>? units;
  List<Permissions>? permissions;
  List<CustomerGroups>? customerGroups;
  List<PaymentType>? paymentType;
  dynamic tRMeasurement;
  dynamic tRTailor;
  dynamic tRFilling;
  dynamic tRZipper;
  dynamic tRCollar;
  dynamic tRCuff;
  dynamic tRModel;
  dynamic tRPocket;
  List<ExpenseCategories>? expenseCategories;
  List<Warehouses>? warehouses;
  List<Products>? products;
  List<WarehousesProducts>? warehousesProducts;
  List<PriceGroups>? priceGroups;
  List<ResturantEmpTypes>? resturantEmpTypes;
  int? limit;
  int? start;
  int? total;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (taxrates != null) {
      map['taxrates'] = taxrates?.map((v) => v.toJson()).toList();
    }
    if (users != null) {
      map['users'] = users?.map((v) => v.toJson()).toList();
    }
    if (companies != null) {
      map['companies'] = companies?.map((v) => v.toJson()).toList();
    }
    if (settings != null) {
      map['settings'] = settings?.map((v) => v.toJson()).toList();
    }
    if (possettings != null) {
      map['possettings'] = possettings?.map((v) => v.toJson()).toList();
    }
    if (categories != null) {
      map['categories'] = categories?.map((v) => v.toJson()).toList();
    }
    if (units != null) {
      map['units'] = units?.map((v) => v.toJson()).toList();
    }
    if (permissions != null) {
      map['permissions'] = permissions?.map((v) => v.toJson()).toList();
    }
    if (customerGroups != null) {
      map['customer_groups'] = customerGroups?.map((v) => v.toJson()).toList();
    }
    if (paymentType != null) {
      map['payment_type'] = paymentType?.map((v) => v.toJson()).toList();
    }
    map['TR_Measurement'] = tRMeasurement;
    map['TR_tailor'] = tRTailor;
    map['TR_Filling'] = tRFilling;
    map['TR_Zipper'] = tRZipper;
    map['TR_Collar'] = tRCollar;
    map['TR_Cuff'] = tRCuff;
    map['TR_Model'] = tRModel;
    map['TR_Pocket'] = tRPocket;
    if (expenseCategories != null) {
      map['expense_categories'] = expenseCategories?.map((v) => v.toJson()).toList();
    }
    if (warehouses != null) {
      map['warehouses'] = warehouses?.map((v) => v.toJson()).toList();
    }
    if (products != null) {
      map['products'] = products?.map((v) => v.toJson()).toList();
    }
    if (warehousesProducts != null) {
      map['warehouses_products'] = warehousesProducts?.map((v) => v.toJson()).toList();
    }
    if (priceGroups != null) {
      map['price_groups'] = priceGroups?.map((v) => v.toJson()).toList();
    }
    if (resturantEmpTypes != null) {
      map['resturant_emp_types'] = resturantEmpTypes?.map((v) => v.toJson()).toList();
    }
    map['limit'] = limit;
    map['start'] = start;
    map['total'] = total;
    return map;
  }

}