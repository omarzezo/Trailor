import 'package:omar/models/tRCollar.dart';
import 'package:omar/models/tRCuff.dart';
import 'package:omar/models/tRModel.dart';
import 'package:omar/models/tRPocket.dart';
import 'package:omar/models/tRTailor.dart';
import 'package:omar/models/tRZipper.dart';
import 'package:omar/models/trFilling.dart';

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
      // this.tRMeasurement,
      this.tRTailorList,
      this.tRFillingList,
      this.tRZipperList,
      this.tRCollarList,
      this.tRCuffList,
      this.tRModelList,
      this.tRPocketList,
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
    // tRMeasurement = json['TR_Measurement'];
    if (json['TR_tailor'] != null) {
      tRTailorList = [];
      json['TR_tailor'].forEach((v) {
        tRTailorList?.add(tRTailorModel.fromJson(v));
      });
    }
    if (json['TR_Filling'] != null) {
      tRFillingList = [];
      json['TR_Filling'].forEach((v) {
        tRFillingList?.add(tRFillingModel.fromJson(v));
      });
    } if (json['TR_Zipper'] != null) {
      tRZipperList = [];
      json['TR_Zipper'].forEach((v) {
        tRZipperList?.add(tRZipperModel.fromJson(v));
      });
    }
    if (json['TR_Collar'] != null) {
      tRCollarList = [];
      json['TR_Collar'].forEach((v) {
        tRCollarList?.add(tRCollarModel.fromJson(v));
      });
    }
    if (json['TR_Cuff'] != null) {
      tRCuffList = [];
      json['TR_Cuff'].forEach((v) {
        tRCuffList?.add(tRCuffModel.fromJson(v));
      });
    }
    if (json['TR_Model'] != null) {
      tRModelList = [];
      json['TR_Model'].forEach((v) {
        tRModelList?.add(tRModelModel.fromJson(v));
      });
    }
    if (json['TR_Pocket'] != null) {
      tRPocketList = [];
      json['TR_Pocket'].forEach((v) {
        tRPocketList?.add(tRPocketModel.fromJson(v));
      });
    }
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
  // dynamic tRMeasurement;
  List<tRTailorModel>? tRTailorList;
  List<tRFillingModel>? tRFillingList;
  List<tRZipperModel>? tRZipperList;
  List<tRCollarModel>? tRCollarList;
  List<tRCuffModel>? tRCuffList;
  List<tRModelModel>? tRModelList;
  List<tRPocketModel>? tRPocketList;
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
    // map['TR_Measurement'] = tRMeasurement;
    if (tRTailorList != null) {
      map['TR_tailor'] = tRFillingList?.map((v) => v.toJson()).toList();
    }if (tRFillingList != null) {
      map['TR_Filling'] = tRFillingList?.map((v) => v.toJson()).toList();
    }if (tRZipperList != null) {
      map['TR_Zipper'] = tRZipperList?.map((v) => v.toJson()).toList();
    }

    if (tRCollarList != null) {
      map['TR_Collar'] = tRCollarList?.map((v) => v.toJson()).toList();
    } if (tRCuffList != null) {
      map['TR_Cuff'] = tRCuffList?.map((v) => v.toJson()).toList();
    } if (tRModelList != null) {
      map['TR_Model'] = tRModelList?.map((v) => v.toJson()).toList();
    }if (tRPocketList != null) {
      map['TR_Pocket'] = tRPocketList?.map((v) => v.toJson()).toList();
    }
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