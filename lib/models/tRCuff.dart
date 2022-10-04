class tRCollar {
  String? CollarName;
  String? CollarTypeId;

  tRCollar({
    this.CollarName,
    this.CollarTypeId,
  });

  factory tRCollar.fromJson(Map<String, dynamic> json) {
    return tRCollar(
      CollarName: json["Collar_Name"],
      CollarTypeId: json["Collar_Type_ID"],
    );
  }
//

}