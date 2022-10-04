class tRCuff {
  String? CuffName;
  String? CuffTypeId;

  tRCuff({
    this.CuffName,
    this.CuffTypeId,
  });

  factory tRCuff.fromJson(Map<String, dynamic> json) {
    return tRCuff(
      CuffName: json["Cuff_Name"],
      CuffTypeId: json["Cuff_Type_ID"],
    );
  }
//

}