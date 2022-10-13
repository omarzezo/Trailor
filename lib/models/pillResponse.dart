class PillResponseModel {
  List<SSalesModel>? sSales;
  List<dynamic>? sExpenses;
  List<dynamic>? sPayment;
  List<dynamic>? sProduct;
  List<dynamic>? sCustomer;
  List<dynamic>? sPosRegister;

  PillResponseModel(
      {this.sSales,
        this.sExpenses,
        this.sPayment,
        this.sProduct,
        this.sCustomer,
        this.sPosRegister});

  factory PillResponseModel.fromJson(Map<String, dynamic> json) {
    return PillResponseModel(
      sSales: List<SSalesModel>.from(json["s_sales"].map((element)=>SSalesModel.fromJson(element)))
         ,
      sExpenses: List.of(json["s_expenses"])
          .map((i) => i /* can't generate it properly yet */)
          .toList(),
      sPayment: List.of(json["s_payment"])
          .map((i) => i /* can't generate it properly yet */)
          .toList(),
      sProduct: List.of(json["s_product"])
          .map((i) => i /* can't generate it properly yet */)
          .toList(),
      sCustomer: List.of(json["s_customer"])
          .map((i) => i /* can't generate it properly yet */)
          .toList(),
      sPosRegister: List.of(json["s_pos_register"])
          .map((i) => i /* can't generate it properly yet */)
          .toList(),
    );
  }
//

}

class SSalesModel {
  String? id;
  String? hash;
  String? onlineId;

  SSalesModel({this.id, this.hash, this.onlineId});

  factory SSalesModel.fromJson(Map<String, dynamic> json) {
    return SSalesModel(
      id: json["id"],
      hash: json["hash"],
      onlineId: json["onlineId"],
    );

  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "hash": hash,
      "onlineId": onlineId,
    };
  }
//

}