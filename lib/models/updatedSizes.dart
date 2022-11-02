class InvoiceNewSizesModel {
  List<Sales>? sales;

  InvoiceNewSizesModel({this.sales});

  InvoiceNewSizesModel.fromJson(Map<String, dynamic> json) {
    if (json['sales'] != null) {
      sales = <Sales>[];
      json['sales'].forEach((v) {
        sales!.add(new Sales.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.sales != null) {
      data['sales'] = this.sales!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Sales {
  int? id;
  List<Measurement>? measurement;

  Sales({this.id, this.measurement});

  Sales.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['Measurement'] != null) {
      measurement = <Measurement>[];
      json['Measurement'].forEach((v) {
        measurement!.add(new Measurement.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.measurement != null) {
      data['Measurement'] = this.measurement!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Measurement {
  String? itemName;
  String? itemCode;
  double? frontLength;
  double? backLength;
  double? shoulderWidth;
  double? shoulderSlope;
  double? sleeve;
  double? sleeveTop;
  double? wrist;
  double? plainCuffLength;
  double? cuffLength;
  double? cuffWidth;
  double? middleWidth;
  double? chestFront;
  double? chestBack;
  double? bottomHeight;
  double? bottomWidth;
  double? collarWidth;
  double? collarHeight;
  double? zipperHeight;
  double? zipperWidth;
  double? chestPocketHeight;
  double? chestPocketWidth;
  double? mobilePocketHeight;
  double? walletPocketHeight;
  double? walletPocketWidth;
  double? haunchWidth;
  int? buttonNo;
  int? embroideryNo;
  double? estimatedLength;
  int? tailorId;
  int? sample;
  int? urgent;
  double? shoulderChestLength;
  double? sleeveMiddle;
  double? sidePocketLength;
  String? takhalees;
  int? collarTypeID;
  int? cuffTypeID;
  int? modelTypeID;
  int? pocketTypeID;
  int? fillingTypeID;
  int? zipperTypeID;
  String? note;

  Measurement(
      {

        required this.itemName,
        required  this.itemCode,
        required this.frontLength,
        required this.backLength,
        required  this.shoulderWidth,
        required  this.shoulderSlope,
        required   this.sleeve,
        required   this.sleeveTop,
        required   this.wrist,
        required     this.plainCuffLength,
        required     this.cuffLength,
        required  this.cuffWidth,
        required   this.middleWidth,
        required   this.chestFront,
        required  this.chestBack,
        required    this.bottomHeight,
        required     this.bottomWidth,
        required     this.collarWidth,
        required     this.collarHeight,
        required      this.zipperHeight,
        required     this.zipperWidth,
        required      this.chestPocketHeight,
        required      this.chestPocketWidth,
        required   this.mobilePocketHeight,
        required    this.walletPocketHeight,
        required    this.walletPocketWidth,
        required    this.haunchWidth,
        required    this.buttonNo,
        required    this.embroideryNo,
        required     this.estimatedLength,
        required     this.tailorId,
        required      this.sample,
        required   this.urgent,
        required    this.shoulderChestLength,
        required    this.sleeveMiddle,
        required     this.sidePocketLength,
        required     this.takhalees,
        required     this.collarTypeID,
        required    this.cuffTypeID,
        required    this.modelTypeID,
        required        this.pocketTypeID,
        required    this.fillingTypeID,
        required   this.zipperTypeID,
        required    this.note});

  Measurement.fromJson(Map<String, dynamic> json) {
    itemName = json['Item_Name'];
    itemCode = json['Item_Code'];
    frontLength = json['Front_Length'];
    backLength = json['Back_Length'];
    shoulderWidth = json['Shoulder_Width'];
    shoulderSlope = json['Shoulder_Slope'];
    sleeve = json['Sleeve'];
    sleeveTop = json['Sleeve_Top'];
    wrist = json['Wrist'];
    plainCuffLength = json['Plain_Cuff_Length'];
    cuffLength = json['Cuff_Length'];
    cuffWidth = json['Cuff_Width'];
    middleWidth = json['Middle_Width'];
    chestFront = json['Chest_Front'];
    chestBack = json['Chest_Back'];
    bottomHeight = json['Bottom_Height'];
    bottomWidth = json['Bottom_Width'];
    collarWidth = json['Collar_Width'];
    collarHeight = json['Collar_Height'];
    zipperHeight = json['Zipper_Height'];
    zipperWidth = json['Zipper_Width'];
    chestPocketHeight = json['Chest_Pocket_Height'];
    chestPocketWidth = json['Chest_Pocket_Width'];
    mobilePocketHeight = json['Mobile_Pocket_Height'];
    walletPocketHeight = json['Wallet_Pocket_Height'];
    walletPocketWidth = json['Wallet_Pocket_Width'];
    haunchWidth = json['Haunch_Width'];
    buttonNo = json['Button_No'];
    embroideryNo = json['Embroidery_No'];
    estimatedLength = json['Estimated_Length'];
    tailorId = json['Tailor_id'];
    sample = json['sample'];
    urgent = json['urgent'];
    shoulderChestLength = json['shoulder_chest_length'];
    sleeveMiddle = json['sleeve_middle'];
    sidePocketLength = json['Side_Pocket_Length'];
    takhalees = json['takhalees'];
    collarTypeID = json['Collar_Type_ID'];
    cuffTypeID = json['Cuff_Type_ID'];
    modelTypeID = json['Model_Type_ID'];
    pocketTypeID = json['Pocket_Type_ID'];
    fillingTypeID = json['Filling_Type_ID'];
    zipperTypeID = json['Zipper_Type_ID'];
    note = json['Note'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Item_Name'] = this.itemName;
    data['Item_Code'] = this.itemCode;
    data['Front_Length'] = this.frontLength;
    data['Back_Length'] = this.backLength;
    data['Shoulder_Width'] = this.shoulderWidth;
    data['Shoulder_Slope'] = this.shoulderSlope;
    data['Sleeve'] = this.sleeve;
    data['Sleeve_Top'] = this.sleeveTop;
    data['Wrist'] = this.wrist;
    data['Plain_Cuff_Length'] = this.plainCuffLength;
    data['Cuff_Length'] = this.cuffLength;
    data['Cuff_Width'] = this.cuffWidth;
    data['Middle_Width'] = this.middleWidth;
    data['Chest_Front'] = this.chestFront;
    data['Chest_Back'] = this.chestBack;
    data['Bottom_Height'] = this.bottomHeight;
    data['Bottom_Width'] = this.bottomWidth;
    data['Collar_Width'] = this.collarWidth;
    data['Collar_Height'] = this.collarHeight;
    data['Zipper_Height'] = this.zipperHeight;
    data['Zipper_Width'] = this.zipperWidth;
    data['Chest_Pocket_Height'] = this.chestPocketHeight;
    data['Chest_Pocket_Width'] = this.chestPocketWidth;
    data['Mobile_Pocket_Height'] = this.mobilePocketHeight;
    data['Wallet_Pocket_Height'] = this.walletPocketHeight;
    data['Wallet_Pocket_Width'] = this.walletPocketWidth;
    data['Haunch_Width'] = this.haunchWidth;
    data['Button_No'] = this.buttonNo;
    data['Embroidery_No'] = this.embroideryNo;
    data['Estimated_Length'] = this.estimatedLength;
    data['Tailor_id'] = this.tailorId;
    data['sample'] = this.sample;
    data['urgent'] = this.urgent;
    data['shoulder_chest_length'] = this.shoulderChestLength;
    data['sleeve_middle'] = this.sleeveMiddle;
    data['Side_Pocket_Length'] = this.sidePocketLength;
    data['takhalees'] = this.takhalees;
    data['Collar_Type_ID'] = this.collarTypeID;
    data['Cuff_Type_ID'] = this.cuffTypeID;
    data['Model_Type_ID'] = this.modelTypeID;
    data['Pocket_Type_ID'] = this.pocketTypeID;
    data['Filling_Type_ID'] = this.fillingTypeID;
    data['Zipper_Type_ID'] = this.zipperTypeID;
    data['Note'] = this.note;
    return data;
  }
}