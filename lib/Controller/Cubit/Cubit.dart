import 'dart:convert';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:esc_pos_printer/esc_pos_printer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:omar/Controller/End%20Point.dart';
import 'package:omar/View/Data%20Table/model.dart';
import 'package:omar/models/Companies.dart';
import 'package:omar/models/PaymentType.dart';
import 'package:omar/models/Products.dart';
import 'package:omar/models/Taxrates.dart';
import 'package:omar/models/Units.dart';
import 'package:omar/models/Users.dart';
import 'package:omar/models/customer.dart';
import 'package:omar/models/invoiceModel.dart';
import 'package:omar/models/pillResponse.dart';
import 'package:omar/View/Data Table/model.dart' as data;
import 'package:omar/models/tRCollar.dart';
import 'package:omar/models/tRCuff.dart';
import 'package:omar/models/tRModel.dart';
import 'package:omar/models/tRPocket.dart';
import 'package:omar/models/tRTailor.dart';
import 'package:omar/models/tRZipper.dart';
import 'package:omar/models/trFilling.dart';
import 'package:omar/models/updatePillsStatus.dart';
import 'package:sunmi_printer_plus/sunmi_printer_plus.dart';
import '../../models/TrailorListsResponse.dart';
import '../../models/pillRequest.dart';
import 'State.dart';
import 'dart:ui' as ui;

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(InitialLogin());

  static LoginCubit get(context) => BlocProvider.of(context);
  Uint8List? pngBytes;
  TextEditingController tailor = TextEditingController();
  TextEditingController type = TextEditingController();
  TextEditingController frontHeight = TextEditingController();
  TextEditingController backHeight = TextEditingController();
  TextEditingController shoulderWidth = TextEditingController();
  TextEditingController shoulderSlope = TextEditingController();
  TextEditingController sleeveLengthPlain = TextEditingController();
  TextEditingController sleeveLengthIsHigher = TextEditingController();
  TextEditingController wideWrist = TextEditingController();
  TextEditingController plainCuff = TextEditingController();
  TextEditingController cuffLength = TextEditingController();
  TextEditingController cuffShow = TextEditingController();
  TextEditingController wideMiddle = TextEditingController();
  TextEditingController expandTheChestInFront = TextEditingController();
  TextEditingController expandTheChestBehind = TextEditingController();
  TextEditingController koftaBottom = TextEditingController();
  TextEditingController expandDown = TextEditingController();
  TextEditingController wideNeckPillow = TextEditingController();
  TextEditingController neckHeight = TextEditingController();
  TextEditingController gypsumHeight = TextEditingController();
  TextEditingController viewGypsum = TextEditingController();
  TextEditingController lengthChestPocket = TextEditingController();
  TextEditingController wideChestPocket = TextEditingController();
  TextEditingController wideMobilePocket = TextEditingController();
  TextEditingController wideMobilePocket2 = TextEditingController();
  TextEditingController lengthPocketWallet = TextEditingController();
  TextEditingController widePocketWallet = TextEditingController();
  TextEditingController hipWidth = TextEditingController();
  TextEditingController buttonNumber = TextEditingController();
  TextEditingController embroideryNumber = TextEditingController();
  TextEditingController betweenTheChestPocketAndTheShoulder =
      TextEditingController();
  TextEditingController sidePocket = TextEditingController();
  TextEditingController quantumCapacityMedium = TextEditingController();
  TextEditingController Takhalis = TextEditingController();
  TextEditingController expectedFabricInMeter = TextEditingController();
  TextEditingController quantities = TextEditingController();
  TextEditingController itemPrice = TextEditingController();
  TextEditingController totalPrice = TextEditingController();
  TextEditingController totalPriceDetails = TextEditingController();
  TextEditingController discount = TextEditingController();
  TextEditingController tax = TextEditingController();
  TextEditingController whatYouPay = TextEditingController();
  TextEditingController cash = TextEditingController();
  TextEditingController onlinePayment = TextEditingController();
  TextEditingController cheeckPayment = TextEditingController();
  TextEditingController delayMoney = TextEditingController();
  TextEditingController searchController = TextEditingController();
  String customerName = "";
  String employeeName = "";
  String typeOfClothes = "";
  String size = "";
  String paymentType = "";
  String ModelName = "";
  String CollerName = "";
  String CuffName = "";
  String ZipperName = "";
  String PocketName = "";
  String TaillorName = "";
  String FillingName = "";
  int ModelTypeID = 0;
  int CollerTypeID = 0;
  int CuffTypeID = 0;
  int ZipperTypeID = 0;
  int PocketTypeID = 0;
  int TaillorTypeID = 0;
  int FillingTypeID = 0;
  String itemCode = "";
  Products? productItem;
  Units? valueItemSize;
  // Companies? userItem;
  String? userItem;
  Companies? employeeItem;
  PaymentType? paymentTypeItem;
  int itemIndex=0;

// String paymentCodeName="";
  bool sample = false;

  bool harryUp = false;
  GlobalKey repaintKey = GlobalKey();
  List<String> fixedPayment = [
    "نقدى",
    "بطاقة إئتمان",
    "شيك بنكى",
  ];
  String? fixedPaymentType="نقدى";

  // captureBoundary() async {
  //   Uint8List? pngBytes;
  //   try {
  //     final RenderRepaintBoundary repaintBoundary = RenderRepaintBoundary();
  //
  //     // RenderRepaintBoundary boundary =
  //     repaintKey.currentContext!.findRenderObject();
  //     ui.Image savedImage = await repaintBoundary.toImage(pixelRatio: 3.0);
  //     ByteData? byteData =
  //     await savedImage.toByteData(format: ui.ImageByteFormat.png);
  //     pngBytes = byteData!.buffer.asUint8List();
  //     // saveFile(widget.pickedImage.uri.path, pngBytes);
  //     print(pngBytes.toString());
  //     return pngBytes;
  //   } catch (e) {
  //     print(e);
  //   }
  // }
  InvoiceModel? invoiceModel;
  Future<InvoiceModel>  getInvoiceInformation(String id )async{
    Dio dio = Dio();


    final response = await dio.get(
      'https://cpe-soft.com/admin/api/v1/Getallsalesdetails?api-key=k4csscc0gcosgs0s8ossows4kkkc4wsw8wgc8wko&warehouse_id=w_1&id=$id',
    );
    if(response.statusCode==200){
      invoiceModel=InvoiceModel.fromJson(response.data);

    }else{
      print (response.statusMessage);
    }
    return invoiceModel!;
  }

  printsonomi(Uint8List? theimageThatC)async{

    await SunmiPrinter.initPrinter();
    await SunmiPrinter.startTransactionPrint(true);
    await SunmiPrinter.printImage(theimageThatC!);
    await SunmiPrinter.lineWrap(2);
    await SunmiPrinter.exitTransactionPrint(true);
  }


  Future<Uint8List?> getWidgetImage() async {
    try {
      // RenderRepaintBoundary boundary = _renderObjectKey.currentContext.findRenderObject();
      RenderRepaintBoundary boundary = repaintKey.currentContext!
          .findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      pngBytes = byteData!.buffer.asUint8List();
      // bs64 = base64Encode(pngBytes);
      // debugPrint(bs64.length.toString());
      print("NewImage>> " + pngBytes.toString());
      // return pngBytes;
    } catch (exception) {}
    return pngBytes!;
  }

  List<Companies> customerModel=[];
// Future<List<Companies>> getCompaniesDetails()async{
//   customerModel=[];
//   Dio dio=Dio();
//   final response = await dio.get(
//     'https://cpe-soft.com/admin/api/v1/data?api-key=k4csscc0gcosgs0s8ossows4kkkc4wsw8wgc8wko&warehouse_code=w_1',
//   );
//   if(response.statusCode==200){
//
//     response.data["companies"].forEach((element) {
//       customerModel.add(Companies.fromJson(element));
//     });
//     return customerModel;
//   }else{
//     print(response.statusMessage);
//   }
//   return customerModel;
// }
  Future<TrailorListsResponse> login({
    required String email,
    required String password,
  }) async {
    customerModel=[];
    var response = await http.get(
        Uri.parse(BASEURL +
            "v1/data?api-key=" +
            email +
            "&warehouse_code=" +
            password),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        });
    TrailorListsResponse lenderResponseModel = TrailorListsResponse();

    try {
      print(jsonDecode(const Utf8Decoder().convert(response.bodyBytes)));
      lenderResponseModel = TrailorListsResponse.fromJson(
          jsonDecode(const Utf8Decoder().convert(response.bodyBytes)));
      users = lenderResponseModel.users!;
      tRCollarList = lenderResponseModel.tRCollarList!;
      // print(tRCollarList);
      // print(tRCuffList);
      // print(tRModelList);
      tRCuffList = lenderResponseModel.tRCuffList!;
      tRFillingList = lenderResponseModel.tRFillingList!;
      tRModelList = lenderResponseModel.tRModelList!;
      tRZipperList = lenderResponseModel.tRZipperList!;
      tRPocketList = lenderResponseModel.tRPocketList!;
      tRTailorList = lenderResponseModel.tRTailorList!;
      productsNameList = lenderResponseModel.products!;
      unitsNameList = lenderResponseModel.units!;
      taxRatesNameList = lenderResponseModel.taxrates!;
      customerModel = lenderResponseModel.companies!;


      lenderResponseModel.paymentType!.forEach((element) {
        if (element.isActive == "1" && element.isCC == "1") {
          paymentCodeList.add(element);
        }
      });

      lenderResponseModel.companies!.forEach((element) {
        if (element.groupName == "customer") {
          companiesCustomerName.add(element);
        } else if (element.groupName == "biller") {
          companiesEmployeeName.add(element);
        }
      });
      // users.forEach((element) {usersName.add(element.company!);});

    } catch (e) {
      print(e.toString());
      print(e);
    }

    return lenderResponseModel;
  }

  Future<PillResponseModel> pillResponse(
      {required PillRequestModel pillRequestModel}) async {
    Dio dio = Dio();
    PillResponseModel? pillResponseModel;

    dio.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Accept-Version': 'V1',
      'api-key': 'k4csscc0gcosgs0s8ossows4kkkc4wsw8wgc8wko'
    };
    final response = await dio.post(
        'https://cpe-soft.com/admin/api/v1/SalesSet3',
        data: jsonEncode(pillRequestModel));
    if (response.statusCode == 200) {
      debugPrint(jsonEncode(pillRequestModel));
      // log(jsonEncode(pillRequestModel));
      print(response.data);
      pillResponseModel = PillResponseModel.fromJson(response.data);

      return pillResponseModel;
    } else {
      print(response.statusMessage);
    }
    return pillResponseModel!;
  }

  Future<List<Companies>> getCustomers(
      ) async {
    customerModel=[] ;

    emit(GetCustomerLoadingState());
    companiesCustomerName=[];

    // dio.options.headers = {
    //   'Content-Type': 'application/json',
    //   'Accept': 'application/json',
    //   'Accept-Version': 'V1',
    //   'api-key': 'k4csscc0gcosgs0s8ossows4kkkc4wsw8wgc8wko'
    // };
    Dio dio = Dio();


    final response = await dio.get(
        'https://cpe-soft.com/admin/api/v1/data?api-key=k4csscc0gcosgs0s8ossows4kkkc4wsw8wgc8wko&warehouse_code=w_1',
        );
    if (response.statusCode == 200) {
      // log(jsonEncode(pillRequestModel));
      response.data["companies"].forEach((element) {
        companiesCustomerName.add(Companies.fromJson(element)) ;



        customerModel.add(Companies.fromJson(element));

        emit(GetCustomerSuccessState());

      });
      print(response.data);
return companiesCustomerName;
    } else {
      print(response.statusMessage);
      emit(GetCustomerErrorState());

    }
    return companiesCustomerName;

  }

  getProductDetails(int id){


  }
  Future<PillResponseModel> addCustomerResponse(
      {required CustomerModel customerModel}) async {
emit(AddCustomerLoadingState());
    Dio dio = Dio();

    PillResponseModel? pillResponseModel;

    dio.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Accept-Version': 'V1',
      'api-key': 'k4csscc0gcosgs0s8ossows4kkkc4wsw8wgc8wko'
    };
    final response = await dio.post(
        'https://cpe-soft.com/admin/api/v1/SalesSet3',
        data: jsonEncode(customerModel));
    if (response.statusCode == 200) {
      debugPrint(jsonEncode(customerModel));
      // log(jsonEncode(pillRequestModel));
      print(response.data);
      pillResponseModel = PillResponseModel.fromJson(response.data);
emit(AddCustomerSuccessState());
      return pillResponseModel;
    } else {
      print(response.statusMessage);
      emit(AddCustomerErrorState());


    }
    return pillResponseModel!;
  }

  getPillsDetailsForItem(int itemIndex ){
    // return pillsDetails!.data!.where((element) => element.id==itemId);
    pillsDetailsItem=pillsDetails!.data![itemIndex];
    selectedDate=
        pillsDetailsItem!.deliveryDate!
            .split(" ")
            .first ??
            "";
   status =pillsDetailsItem!.saleStatus ?? "";
    // return pillsDetails!.data![itemIndex];
  }
  PillsDetails? pillsDetails;
  data.PillsDetailsData?   pillsDetailsItem;
  Future<PillsDetails> getPillsDetails ()async{
    Dio dio = Dio();
    // final response=await dio.get("https://cpe-soft.com/admin/api/v1/Getallsales?api-key=k4csscc0gcosgs0s8ossows4kkkc4wsw8wgc8wko&warehouse_code=w_1");
    final response=await dio.get("https://cpe-soft.com/admin/api/v1/Getallsales?api-key=k4csscc0gcosgs0s8ossows4kkkc4wsw8wgc8wko&warehouse_code=w_1");
    if(response.statusCode==200){
      print(response.data);
      pillsDetails=PillsDetails.fromJson(response.data);
      return pillsDetails!;
    }else{
      print(response.statusMessage);
    }
  return pillsDetails!;
  }
  // PillsResponseModel? pillsResponseModel;

//   Future<PillsResponseModel> pillsResponse()async{
//     Dio dio = Dio();
// final response=await dio.get("https://cpe-soft.com/admin/api/v1/Getallsales?api-key=k4csscc0gcosgs0s8ossows4kkkc4wsw8wgc8wko&warehouse_code=w_1");
// if(response.statusCode==200){
//   print(response.data);
//   List<Details> details=[];
//
//   pillsResponseModel=PillsResponseModel.fromJson(response.data);
// 
//   return pillsResponseModel!;
//
//
//   }else{
//   print(response.statusMessage);
// }
// return pillsResponseModel!;
//   }

  List<tRCollarModel> tRCollarList = [];
  List<tRCuffModel> tRCuffList = [];
  List<tRModelModel> tRModelList = [];
  List<tRFillingModel> tRFillingList = [];
  List<tRPocketModel> tRPocketList = [];
  List<tRZipperModel> tRZipperList = [];
  List<tRTailorModel> tRTailorList = [];
  List<Users> users = [];
  List<Companies> companiesCustomerName = [];
  List<Products> productsNameList = [];
  List<Taxrates> taxRatesNameList = [];
  List<Units> unitsNameList = [];
  List<Companies> companiesEmployeeName = [];
  List<PaymentType> paymentCodeList = [];

  void clearControllers() {
    tailor.clear();
    type.clear();
    frontHeight.clear();
    backHeight.clear();
    shoulderWidth.clear();
    shoulderSlope.clear();
    sleeveLengthPlain.clear();
    sleeveLengthIsHigher.clear();
    wideWrist.clear();
    plainCuff.clear();
    cuffLength.clear();
    cuffShow.clear();
    wideMiddle.clear();
    expandTheChestInFront.clear();
    expandTheChestBehind.clear();
    koftaBottom.clear();
    expandDown.clear();
    wideNeckPillow.clear();
    neckHeight.clear();
    gypsumHeight.clear();
    viewGypsum.clear();
    lengthChestPocket.clear();
    wideChestPocket.clear();
    wideMobilePocket.clear();
    wideMobilePocket2.clear();
    lengthPocketWallet.clear();
    widePocketWallet.clear();
    hipWidth.clear();
    buttonNumber.clear();
    embroideryNumber.clear();
    betweenTheChestPocketAndTheShoulder.clear();
    sidePocket.clear();
    quantumCapacityMedium.clear();
    Takhalis.clear();
    expectedFabricInMeter.clear();
    quantities.clear();
    itemPrice.clear();
    totalPrice.clear();
    totalPriceDetails.clear();
    discount.clear();
    tax.clear();
    whatYouPay.clear();
    cash.clear();
    onlinePayment.clear();
    delayMoney.clear();
  }

  calculateWhatYouPay() {
    whatYouPay.text =
        ((double.parse(totalPrice.text) * double.parse(tax.text) / 100) +
                double.parse(totalPrice.text))
            .toStringAsFixed(2);
  }

  calculateDiscount(String value) {
    try {
      if (value.isNotEmpty) {
        whatYouPay.text = (double.parse(whatYouPay.text) -
                (double.parse(whatYouPay.text) * double.parse(value) / 100))
            .toStringAsFixed(2);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  calculateRecentMoney(String value) {
    try {
      if (value.isNotEmpty) {
        delayMoney.text = (double.parse(value) - double.parse(whatYouPay.text))
            .toStringAsFixed(2);
      }
    } catch (e) {
      print(e.toString());
    }
  }
  // DateTime selectedDate=DateTime.now();
  String? selectedDate;

  getDateFromUser(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015, 8),
        lastDate:  DateTime(2040));
    if (picked != null ) {
      selectedDate =  DateFormat("yyyy-MM-dd HH:mm:ss").format(picked).toString();
      emit(AppGetDateFromUserState());
    }else {
      return;
    }
  }
  String? status;

  Future<UpdatedPillsResponse> updatePills(UpdatedPillsStatusModel updatedPillsStatusModel)async{

    Dio dio = Dio();
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Accept-Version': 'V1',
      'Accept-Language': 'en',
      'api-key': 'k4csscc0gcosgs0s8ossows4kkkc4wsw8wgc8wko'
    };
    emit(UpdatedPillsResponseLoadingState());
    final response = await dio.post(
        'https://cpe-soft.com/admin/api/v1/UpdateSales',
        data: jsonEncode(updatedPillsStatusModel));
    // print(jsonEncode(updatedPillsStatusModel).toString());
    if(response.statusCode==200){
      print(response.data);
      emit(UpdatedPillsResponseSuccessState());
      getPillsDetails();
      return UpdatedPillsResponse.fromJson(response.data);

    }else{
      print(response.statusMessage);
      emit(UpdatedPillsResponseErrorState());


    }
    return UpdatedPillsResponse.fromJson(response.data);

  }

// Future<TrailorListsResponse> login ({required String email, required String password,}) async {
  //   TrailorListsResponse  lenderResponseModel=TrailorListsResponse();
  //  await DioHelper.getData(url: URL, query: {
  //     'api-key' :  email,
  //     'warehouse_code' : password,
  //   }).then((value) {
  //     // var json = jsonEncode(value.toJson());
  //     var responseBody = value!.data!;
  //
  //       lenderResponseModel = TrailorListsResponse.fromJson(jsonDecode(const Utf8Decoder().convert(responseBody)));
  //
  //     emit(LoginSuccess());
  //
  //   });
  //   return lenderResponseModel;
  // }

  // void getList(List<Details> details) => details.map((e) {});
}
