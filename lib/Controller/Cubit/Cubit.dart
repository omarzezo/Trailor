import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart' as intl;
import 'package:omar/Controller/End%20Point.dart';
import 'package:omar/SharedPreferencesHelper.dart';
import 'package:omar/View/Data%20Table/model.dart';
import 'package:omar/View/sewing%20invoice%20screen/restart_screen.dart';
import 'package:omar/constant/LoadingPage.dart';
import 'package:omar/constant/appstrings.dart';
import 'package:omar/models/Companies.dart';
import 'package:omar/models/PaymentType.dart';
import 'package:omar/models/Products.dart';
import 'package:omar/models/Taxrates.dart';
import 'package:omar/models/Units.dart';
import 'package:omar/models/Users.dart';
import 'package:omar/models/cashier_response.dart';
import 'package:omar/models/cashierclose.dart';
import 'package:omar/models/cashierstart.dart';
import 'package:omar/models/close_cashier_request.dart';
import 'package:omar/models/close_cashier_respone.dart';
import 'package:omar/models/customer.dart';
import 'package:omar/models/customer_request.dart';
import 'package:omar/models/details_of_sales_models.dart';
import 'package:omar/models/invoiceUpdateResponse.dart';
import 'package:omar/models/pillRequest.dart';
import 'package:omar/models/pillResponse.dart';
import 'package:omar/View/Data Table/model.dart' as data;
import 'package:omar/models/returninvoicemodel.dart';
import 'package:omar/models/sizeInformation.dart';
import 'package:omar/models/tRCollar.dart';
import 'package:omar/models/tRCuff.dart';
import 'package:omar/models/tRModel.dart';
import 'package:omar/models/tRPocket.dart';
import 'package:omar/models/tRTailor.dart';
import 'package:omar/models/tRZipper.dart';
import 'package:omar/models/trFilling.dart';
import 'package:omar/models/updatePillsStatus.dart';
import 'package:omar/models/updatedSizes.dart';
import '../../models/TrailorListsResponse.dart';
import '../../models/allcustomer_response.dart';
import '../../models/modelreturn.dart';
import '../../models/test.dart';
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
  String? productItemName;
  // Units? valueItemSize;
  String? valueItemSizeName;
  Companies? userItem;
  String? userItemName;
  String? employeeItemName;
  Companies? employeeItem;
  PaymentType? paymentTypeItem;
  int itemIndex=0;
int? paymentId;
  // variable of controllers
  String? tailorV;
  String? typeV;
  String? frontHeightV;
  String? backHeightV;
  String? shoulderWidthV;
  String? shoulderSlopeV;
  String? sleeveLengthPlainV;
  String? sleeveLengthIsHigherV;
  String? wideWristV;
  String? plainCuffV;
  String? cuffLengthV;
  String? cuffShowV;
  String? wideMiddleV;
  String? expandTheChestInFrontV;
  String? expandTheChestBehindV;
  String? koftaBottomV;
  String? expandDownV;
  String? wideNeckPillowV;
  String? neckHeightV;
  String? gypsumHeightV;
  String? tailorNameV;
  String? viewGypsumV;
  String? lengthChestPocketV;
  String? wideChestPocketV;
  String? wideMobilePocketV;
  String? wideMobilePocket2V;
  String? lengthPocketWalletV;
  String? widePocketWalletV;
  String? hipWidthV;
  String? buttonNumberV;
  String? embroideryNumberV;
  String? betweenTheChestPocketAndTheShoulderV;
  String? sidePocketV;
  String? quantumCapacityMediumV;
  String? TakhalisV;
  String? expectedFabricInMeterV;
  String? quantitiesV;
  String? itemPriceV;
  String? totalPriceV;
  String? totalPriceDetailsV;
  String? discountV;
  String? taxV;
  String? whatYouPayV;
  String? cashV;
  String? onlinePaymentV;
  String? cheeckPaymentV;
  String? delayMoneyV;
  String? searchControllerV;

// String paymentCodeName="";
  bool sample = false;

  bool harryUp = false;
  GlobalKey repaintKey = GlobalKey();
  List<String> fixedPayment = [
    AppStrings.monetary.tr(),
    AppStrings.CreditCard.tr(),
    AppStrings.BankCheck.tr(),
  ];
  String? fixedPaymentType=AppStrings.monetary.tr();

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
  AllInvoicesDetails? invoiceModel;
  Future<AllInvoicesDetails>  getInvoiceInformation(String id )async{
    String? APIKEY1 = await SharedPreferencesHelper.getApiKey() ?? APIKEYLogin;
    print("urlIs"+'https://cpe-soft.com/admin/api/v1/Getallsalesdetails?api-key=${APIKEY1}&warehouse_id=w_1&id=$id');
    Dio dio = Dio();
    final response = await dio.get(
      'https://cpe-soft.com/admin/api/v1/Getallsalesdetails?api-key=${APIKEY1}&warehouse_id=w_1&id=$id',
    );
    if(response.statusCode==200){
      invoiceModel=AllInvoicesDetails.fromJson(response.data);

    }else{
      print (response.statusMessage);
    }
    return invoiceModel!;
  }
  // List<InvoiceModel> allInvoices=[];
  List<InvoiceData> allInvoices=[];
  Future<List<InvoiceData>>  getAllInvoiceInformation()async{
    String? APIKEY1 = await SharedPreferencesHelper.getApiKey() ?? APIKEYLogin;
    print("urlIS>>"+'https://cpe-soft.com/admin/api/v1/Getallsalesdetails?api-key=$APIKEY1&warehouse_id=w_1');
    Dio dio = Dio();

    dio.interceptors.add(LogInterceptor(
        requestBody: true,
        error: true,
        requestHeader: true,
        responseHeader: true,
        responseBody: true,

    ));
    final response = await dio.get(
      'https://cpe-soft.com/admin/api/v1/Getallsalesdetails?api-key=$APIKEY1&warehouse_id=w_1',
    );
    if(response.statusCode==200){
      allInvoices=AllInvoicesDetails.fromJson(response.data).invoiceData!;
      // AllInvoicesDetails.fromJson(response.data).invoiceData!.forEach((invoice){
      //
      //   allInvoices.add(invoice);
      // });
    }else{
      print (response.statusMessage);
    }
    return allInvoices;
  }

  printsonomi(Uint8List? theimageThatC)async{

    // await SunmiPrinter.initPrinter();
    // await SunmiPrinter.startTransactionPrint(true);
    // await SunmiPrinter.printImage(theimageThatC!);
    // await SunmiPrinter.lineWrap(2);
    // await SunmiPrinter.exitTransactionPrint(true);
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
    return pngBytes;
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


  // Future<List<Companies>> getAllData()async{
  //   companiesEmployeeName=[];
  //
  //   //  https://cpe-soft.com/admin/api/v1/data?api-key=k4csscc0gcosgs0s8ossows4kkkc4wsw8wgc8wko&warehouse_code=w_1
  //   Dio dio = Dio();
  //   // final response=await dio.get("https://cpe-soft.com/admin/api/v1/Getallsales?api-key=k4csscc0gcosgs0s8ossows4kkkc4wsw8wgc8wko&warehouse_code=w_1");
  //   final response=await dio.get("https://cpe-soft.com/admin/api/v1/data?api-key=k4csscc0gcosgs0s8ossows4kkkc4wsw8wgc8wko&warehouse_code=w_1");
  //   if(response.statusCode==200){
  //     print(response.data);
  //     //  TrailorListsResponse.fromJson(response.data).companies!.forEach((element) {
  //     //   if (element.groupName == "biller") {
  //     //     companiesEmployeeName.add(element);
  //     //   }
  //     // });
  //     // Companies.fromJson(response.data);
  //
  //   }else{
  //     print(response.statusMessage);
  //   }
  //   final ids = Set();
  //   // companiesEmployeeName.retainWhere((x) => ids.add(x.id));
  //   return companiesEmployeeName;
  // }


  List<Companies> customerListOfData=[];
  Future<TrailorListsResponse> login({
    required String email,
    required String password,
  }) async {
    companiesCustomerName=[];
    customerModel=[];
    var response = await http.get(
        Uri.parse(BASEURL +
            "v1/data?api-key=" +
            password +
            "&warehouse_code=" +
            email),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        });
    await getAllCustomers();
    TrailorListsResponse lenderResponseModel = TrailorListsResponse();

    try {
      companiesEmployeeName=[];
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

      lenderResponseModel.companies!.forEach((element) {
        if(element.groupName=="customer"){
          customerListOfData.add(element);
        }
      });
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


      usersList=  lenderResponseModel.users;
      // users.forEach((element) {usersName.add(element.company!);});

    } catch (e) {
      print(e.toString());
      print(e);
    }
    return lenderResponseModel;

  }
  List<Users>? usersList;
  String? userName;
String totalCash="0";
int invoiceNumbers=0;
  Future<PillResponseModel> pillResponse({required PillRequestModel pillRequestModel}) async {
    String? APIKEY1 = await SharedPreferencesHelper.getApiKey() ?? APIKEYLogin;
    Dio dio = Dio();
    PillResponseModel? pillResponseModel;
    dio.interceptors.add(LogInterceptor(
        requestBody: true,
        error: true,
        requestHeader: true,
        responseHeader: true,
        responseBody: true
    ));
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Accept-Version': 'V1',
      'api-key': APIKEY1
    };
    log(jsonEncode(pillRequestModel));
    final response = await dio.post(
        'https://cpe-soft.com/admin/api/v1/SalesSet3', data: jsonEncode(pillRequestModel));
    if (response.statusCode == 200) {
      // debugPrint(jsonEncode(pillRequestModel));
      // log(jsonEncode(pillRequestModel));
      // print(response.data);
      pillResponseModel = PillResponseModel.fromJson(response.data);
      await getAllInvoiceInformation();
      await getPillsDetails();

      return pillResponseModel;
    } else {
      print(response.statusMessage);
    }
    return pillResponseModel!;
  }

  Future<List<Companies>> getCustomers() async {
    String? APIKEY1 = await SharedPreferencesHelper.getApiKey() ?? APIKEYLogin;
    print("urlIs>>"+"https://cpe-soft.com/admin/api/v1/data?api-key=${APIKEY1}&warehouse_code=w_1");
    customerModel=[] ;
    companiesCustomerName=[];

    emit(GetCustomerLoadingState());

    // dio.options.headers = {
    //   'Content-Type': 'application/json',
    //   'Accept': 'application/json',
    //   'Accept-Version': 'V1',
    //   'api-key': 'k4csscc0gcosgs0s8ossows4kkkc4wsw8wgc8wko'
    // };
    Dio dio = Dio();


    final response = await dio.get(
        "https://cpe-soft.com/admin/api/v1/data?api-key=${APIKEY1}&warehouse_code=w_1",
        );
    if (response.statusCode == 200) {
      // log(jsonEncode(pillRequestModel));
      response.data["companies"].forEach((element) {
        companiesCustomerName.add(Companies.fromJson(element)) ;



        customerModel.add(Companies.fromJson(element));

        emit(GetCustomerSuccessState());

      });
      final ids = Set();
      companiesEmployeeName.retainWhere((x) => ids.add(x.id));
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
  Future<PillResponseModel> addCustomerResponse({required CustomerModel customerModel}) async {
    String? APIKEY1 = await SharedPreferencesHelper.getApiKey() ?? APIKEYLogin;
    emit(AddCustomerLoadingState());
    Dio dio = Dio();

    PillResponseModel? pillResponseModel;

    dio.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Accept-Version': 'V1',
      'api-key': '${APIKEY1}'
    };
    final response = await dio.post('https://cpe-soft.com/admin/api/v1/SalesSet3', data: jsonEncode(customerModel));
    if (response.statusCode == 200) {
      debugPrint(jsonEncode(customerModel));
      // log(jsonEncode(pillRequestModel));
      print(response.data);
      pillResponseModel = PillResponseModel.fromJson(response.data);
    await  getAllCustomers();
emit(AddCustomerSuccessState());
      return pillResponseModel;
    } else {
      print(response.statusMessage);
      emit(AddCustomerErrorState());


    }
    return pillResponseModel!;
  }
String? salesId;
String? returnid;
  returnsalesModel? returnsizeInformationModel;

Future<returnsalesModel>getReturnId(int index)async{
  String? APIKEY1 = await SharedPreferencesHelper.getApiKey() ?? APIKEYLogin;
  print("urlIs>>"+"https://cpe-soft.com/admin/api/v1/Getallsalesdetails?api-key=${APIKEY1}&warehouse_id=w_1");
  Dio dio = Dio();
  // final response=await dio.get("https://cpe-soft.com/admin/api/v1/Getallsales?api-key=k4csscc0gcosgs0s8ossows4kkkc4wsw8wgc8wko&warehouse_code=w_1");
  final response=await dio.get("https://cpe-soft.com/admin/api/v1/Getallsalesdetails?api-key=${APIKEY1}&warehouse_id=w_1");
  if(response.statusCode==200){
    returnsizeInformationModel= returnsalesModel.fromJson(response.data);
    returnid=  returnsizeInformationModel!.data![index].items![0].saleId;
  }else {
    print(response.statusCode);
  }
  return returnsizeInformationModel!;
}


  getPillsDetailsForItem(int itemIndex ){

    // return pillsDetails!.data!.where((element) => element.id==itemId);
    pillsDetailsItem=pillsDetails!.data![itemIndex];
    salesId=pillsDetails!.data![itemIndex].id;
    selectedDate=
        pillsDetailsItem!.deliveryDate?.split(" ").first ??
            "";
   status =pillsDetailsItem!.saleStatus ?? "";
    // return pillsDetails!.data![itemIndex];
  }

  getPillsDetailsForItemFilterd(int itemIndex ){
    stausName=null;

    // PillsDetails? pillsDetails=PillsDetails();
    // pillsDetails.data=[];
    // pillsDetails.data = pillsDetails!.data!.where((i) => i.saleStatus!.contains('completed')?false:true).toList();

    // return pillsDetails!.data!.where((element) => element.id==itemId);
   pillsDetails!.data!.forEach((element) {if(element.id==itemIndex.toString()){
     pillsDetailsItem=element;
     salesId=element.id;
     selectedDate=element.deliveryDate?.split(" ").first ?? "";
     // status=element.saleStatus??"";

     stausName=element.saleStatus;

    }});
   //  salesId=pillsDetails!.data![itemIndex].id;
   //  selectedDate=
   //      pillsDetailsItem!.deliveryDate!
   //          .split(" ")
   //          .first ??
   //          "";
   // status =pillsDetailsItem!.saleStatus ?? "";
    // return pillsDetails!.data![itemIndex];
  }

  PillsDetails? pillsDetails;
  data.PillsDetailsData?   pillsDetailsItem;
  Future<void> getPillsDetails ()async{
    // companiesEmployeeName=[];
    String? APIKEY1 = await SharedPreferencesHelper.getApiKey() ?? APIKEYLogin;
    print("urlIs>>"+"https://cpe-soft.com/admin/api/v1/Getallsales?api-key=${APIKEY1}&warehouse_code=w_1");
    Dio dio = Dio();
    // final response=await dio.get("https://cpe-soft.com/admin/api/v1/Getallsales?api-key=k4csscc0gcosgs0s8ossows4kkkc4wsw8wgc8wko&warehouse_code=w_1");
    final response=await dio.get("https://cpe-soft.com/admin/api/v1/Getallsales?api-key=${APIKEY1}&warehouse_code=w_1");
    if(response.statusCode==200){
      print(response.data);
      pillsDetails=PillsDetails.fromJson(response.data);
      // await getAllData();
      emit(GetDataSuccessState());

      // return pillsDetails!;
    }else{
      print(response.statusMessage);
    }
  // return pillsDetails!;
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
  // List<String> statusNameList = [AppStrings.pendingState.tr(),AppStrings.completedState.tr(),AppStrings.returnedState.tr()];
  List<String> statusNameList = ['pending','completed','returned'];

  String? stausName;
  List<Taxrates> taxRatesNameList = [];
  List<Units> unitsNameList = [];
  List<Companies> companiesEmployeeName = [];
  List<PaymentType> paymentCodeList = [];

  void clearControllers() {
    pngBytes=null;
    userItemName=null;
    employeeItemName=null;
    productItemName=null;
    valueItemSizeName=null;
    itemPrice1=null;
    quantities1=null;
    userName=null;
    cashInHandController.clear();
     tRPocketValueName=null;
     trFillingValueName=null;
   tRZipperValueName=null;
     tRTailorValueName=null;
     trModelValueName=null;
     tRCollarValueName=null;
     tRCuffValueName=null;
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
    cheeckPayment.clear();
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
    // tRPocketValue==null? tRPocketValue=tRPocketValue:  tRPocketValue!.PocketTypeId="";
    // tRPocketValue==null? tRPocketValue=tRPocketValue:   tRPocketValue!.PocketName="";
    // trFillingValue==null? trFillingValue=trFillingValue:   trFillingValue!.FillingName="";
    // trFillingValue==null? trFillingValue=trFillingValue: trFillingValue!.FillingTypeId="";
    // tRZipperValue==null? tRZipperValue=tRZipperValue:  tRZipperValue!.ZipperName="";
    // tRZipperValue==null? tRZipperValue=tRZipperValue: tRZipperValue!.ZipperTypeId="";
    // tRTailorValue==null? tRTailorValue=tRTailorValue:  tRTailorValue!.TailorName="";
    // tRTailorValue==null? tRTailorValue=tRTailorValue:  tRTailorValue!.TailorId="";
    // trModelValue==null? trModelValue=trModelValue: trModelValue!.modelName="";
    // trModelValue==null? trModelValue=trModelValue: trModelValue!.modelTypeID="";
    // tRCollarValue==null? tRCollarValue=tRCollarValue: tRCollarValue!.CollarTypeId="";
    // tRCollarValue==null? tRCollarValue=tRCollarValue:  tRCollarValue!.CollarName="";
    // tRCuffValue==null? tRCuffValue=tRCuffValue:  tRCuffValue!.CuffName="";
    // tRCuffValue==null? tRCuffValue=tRCuffValue: tRCuffValue!.CuffTypeId="";
    // employeeItem==null? employeeItem=employeeItem: employeeItem!.name="";
    // productItem==null? productItem=productItem: productItem!.name="";
    // valueItemSize==null? valueItemSize=valueItemSize: valueItemSize!.name="";
    // valueItemSize==null? valueItemSize=valueItemSize:valueItemSize!.unitValue="";
    // tRPocketValue=tRPocketValue;
    // tRPocketValue=tRPocketValue;
    // trFillingValue=trFillingValue;
    // trFillingValue=trFillingValue;
    // tRZipperValue=tRZipperValue;
    // tRZipperValue=tRZipperValue;
    // tRTailorValue=tRTailorValue;
    // tRTailorValue=tRTailorValue;
    // trModelValue=trModelValue;
    // trModelValue=trModelValue;
    // tRCollarValue=tRCollarValue;
    // tRCollarValue=tRCollarValue;
    // tRCuffValue=tRCuffValue;
    // tRCuffValue=tRCuffValue;
    // employeeItem=employeeItem;
    // productItem=productItem;
    // valueItemSize=valueItemSize;
    // valueItemSize=valueItemSize;

    trModelValue=null;
    tRCollarValue=null;
    tRCuffValue=null;
    tRPocketValue=null;
    trFillingValue=null;
    tRZipperValue=null;
    tRTailorValue=null;
    emit(ClearControllersState());

  }
String? itemPrice1;
String? quantities1;
  calculateWhatYouPay() {
    itemPrice1=itemPrice.text;
    if(itemPrice1!=null&&quantities1!=null){
      totalPrice.text=(double.parse(itemPrice1!)*double.parse(quantities1!)) .toStringAsFixed(2);
      totalPriceDetails.text=(double.parse(totalPrice.text)+(double.parse(totalPrice.text)* double.parse(tax.text) / 100)) .toStringAsFixed(2);
      whatYouPay.text=totalPriceDetails.text;

    }
    // whatYouPay.text =
    //     ((double.parse(totalPrice.text) * double.parse(tax.text) / 100) +
    //             double.parse(totalPrice.text))
    //         .toStringAsFixed(2);
  }

  calculateDiscount(String value) {
    print(value);
    try {

      if (value.isNotEmpty&&value!=" ") {
        whatYouPay.text=(double.parse(totalPriceDetails.text)-(double.parse(totalPriceDetails.text)* double.parse(value) / 100)) .toStringAsFixed(2);
        // totalPriceDetails.text=(double.parse(totalPrice.text)-(double.parse(totalPrice.text)* double.parse(value) / 100)) .toStringAsFixed(2);

        // whatYouPay.text = (double.parse(whatYouPay.text) -
        //         (double.parse(whatYouPay.text) * double.parse(value) / 100))
        //     .toStringAsFixed(2);
     }else{
        whatYouPay.text=totalPriceDetails.text;
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
        emit(GetWhatYouPayAfterDiscount());
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
      selectedDate =  intl.DateFormat("yyyy-MM-dd HH:mm:ss","en").format(picked).toString();
      emit(AppGetDateFromUserState());
    }else {
      return;
    }
  }
  String? status;

  Future<UpdatedPillsResponse> updatePills(UpdatedPillsStatusModel updatedPillsStatusModel)async{
    String? APIKEY1 = await SharedPreferencesHelper.getApiKey() ?? APIKEYLogin;
    Dio dio = Dio();
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Accept-Version': 'V1',
      'Accept-Language': 'en',
      'api-key': '$APIKEY1'
    };
    // emit(UpdatedPillsResponseLoadingState());
    final response = await dio.post(
        'https://cpe-soft.com/admin/api/v1/UpdateSales',
        data: jsonEncode(updatedPillsStatusModel));
    // print(jsonEncode(updatedPillsStatusModel).toString());
    if(response.statusCode==200){
      print(response.data);
    await  getPillsDetails();

      emit(UpdatedPillsResponseSuccessState());
      return UpdatedPillsResponse.fromJson(response.data);

    }else{
      print(response.statusMessage);
      emit(UpdatedPillsResponseErrorState());


    }
    return UpdatedPillsResponse.fromJson(response.data);

  }

  SizeInformationModel? sizeInformationModel;
  List<MeasurementItem> sizes=[];
  String? modelTypeID1;
  String? TailorId1;
  String? ZipperTypeId1;
  String? FillingTypeId1;
  String? PocketTypeId1;
  String? CollarTypeId1;
  String? CuffTypeId1;
  String? tailCode;

  ReturnInvoiceItem? returnInvoice;
  Future getReturnItemInformation(String salesId)async{
    String? APIKEY1 = await SharedPreferencesHelper.getApiKey() ?? APIKEYLogin;
    print("urlIs>>"+"https://cpe-soft.com/admin/api/v1/Getallsalesdetails?api-key=${APIKEY1}&warehouse_id=w_1&id=$salesId");
    try{
      Dio dio = Dio();
      dio.interceptors.add(LogInterceptor(
          requestBody: true,
          error: true,
          requestHeader: true,
          responseHeader: true,
          responseBody: true
      ));
      final response=await dio.get("https://cpe-soft.com/admin/api/v1/Getallsalesdetails?api-key=${APIKEY1}&warehouse_id=w_1&id=$salesId");
      if(response.statusCode==200){
        returnInvoice=null;

        returnInvoice=ReturnInvoiceItem.fromJson(response.data);
      }else{
        print(response.statusMessage);

      }
      }catch(error){
      print(error.toString());

    }
  }

    Future<SizeInformationModel?>getSizeInformation(BuildContext context ,String salesId)async{
      String? APIKEY1 = await SharedPreferencesHelper.getApiKey() ?? APIKEYLogin;
      print("urlIs>>"+"https://cpe-soft.com/admin/api/v1/Getallsalesdetails?api-key=${APIKEY1}&warehouse_id=w_1&id=$salesId");
      LoadingPage(context).show();
    try{
      Dio dio = Dio();
      dio.interceptors.add(LogInterceptor(
          requestBody: true,
          error: true,
          requestHeader: true,
          responseHeader: true,
          responseBody: true
      ));
      final response=await dio.get(
          "https://cpe-soft.com/admin/api/v1/Getallsalesdetails?api-key=${APIKEY1}&warehouse_id=w_1&id=$salesId");
      if(response.statusCode==200){
        sizeInformationModel=SizeInformationModel.fromJson(response.data);
        // returnInvoice=sizeInformationModel;

        if(sizeInformationModel!.sizesData![0].measurement!=null){


        sizes=sizeInformationModel!.sizesData![0].measurement??[];
        // sizes=sizeInformationModel!.sizesData==null?[]:sizeInformationModel!.sizesData![0].measurement!;
        type.text=sizes[0].itemName??"";
        frontHeight.text=sizes[0].frontLength??"";
        backHeight.text=sizes[0].backLength??"";
        shoulderWidth.text=sizes[0].shoulderWidth??"";
        shoulderSlope.text=sizes[0].shoulderSlope??"";
        sleeveLengthPlain.text=sizes[0].sleeve??"";
        sleeveLengthIsHigher.text=sizes[0].sleeveTop??"";
        wideWrist.text=sizes[0].wrist??"";
        plainCuff.text=sizes[0].plainCuffLength??"";
        cuffLength.text=sizes[0].cuffLength??"";
        cuffShow.text=sizes[0].cuffWidth??"";
        wideMiddle.text=sizes[0].middleWidth??"";
        expandTheChestInFront.text=sizes[0].chestFront??"";
        expandTheChestBehind.text=sizes[0].chestBack??"";
        koftaBottom.text=sizes[0].bottomHeight??"";
        expandDown.text=sizes[0].bottomWidth??"";
        wideNeckPillow.text=sizes[0].collarWidth??"";
        neckHeight.text=sizes[0].collarHeight??"";
        gypsumHeight.text=sizes[0].zipperHeight??"";
        viewGypsum.text=sizes[0].zipperWidth??"";
        lengthChestPocket.text=sizes[0].chestPocketHeight??"";
        wideChestPocket.text=sizes[0].chestPocketWidth??"";
        wideMobilePocket.text=sizes[0].mobilePocketHeight??"";
        lengthPocketWallet.text=sizes[0].walletPocketHeight??"";
        widePocketWallet.text=sizes[0].walletPocketWidth??"";
        hipWidth.text=sizes[0].haunchWidth??"";
        buttonNumber.text=sizes[0].buttonNo??"";
        embroideryNumber.text=sizes[0].embroideryNo??"";
        betweenTheChestPocketAndTheShoulder.text=sizes[0].shoulderChestLength??"";
        sidePocket.text=sizes[0].sidePocketLength??"";
        quantumCapacityMedium.text=sizes[0].sleeveMiddle??"";
        Takhalis.text=sizes[0].takhalees??"";
        expectedFabricInMeter.text=sizes[0].estimatedLength??"";
        modelTypeID1=sizes[0].modelTypeID;
        TailorId1=sizes[0].tailorId;
        ZipperTypeId1=sizes[0].zipperTypeID;
        FillingTypeId1=sizes[0].fillingTypeID;
        PocketTypeId1=sizes[0].pocketTypeID;
        CollarTypeId1=sizes[0].collarTypeID;
        CuffTypeId1=sizes[0].cuffTypeID;
        tailCode=sizes[0].itemCode;

         isSelect2 =(sizes[0].sample == "1")
            ? true
            : false;
         isSelect1 = (sizes[0].urgent == "1")
            ? true
            : false;
        await setDropDownValues();}
        else{
          sizeInformationModel!.sizesData![0].measurement=[];
        }
      }else{
        print(response.statusMessage);
      }

    }catch(error){
      print(error.toString());
    }
      LoadingPage(context).close();
    return sizeInformationModel;

  }

  String? modelName1;
  String? TailorName1;
  String? ZipperName1;
  String? FillingName1;
  String? PocketName1;
  String? CollarName1;
  String? CuffName1;
  tRPocketModel? tRPocketValue;
  tRFillingModel? trFillingValue;
  tRZipperModel? tRZipperValue;
  tRTailorModel? tRTailorValue;
  tRModelModel? trModelValue;
  tRCollarModel? tRCollarValue;
  tRCuffModel? tRCuffValue;
  String? tRPocketValueName;
  String? trFillingValueName;
  String? tRZipperValueName;
  String? tRTailorValueName;
  String? trModelValueName;
  String? tRCollarValueName;
  String? tRCuffValueName;
  bool isSelect2 =false;
  bool isSelect1 = false;
  Future<void> setDropDownValues()async{
     tRPocketValue=tRPocketList[0];
     trFillingValue=tRFillingList[0];
     tRZipperValue=tRZipperList[0];
     tRTailorValue=tRTailorList[0];
     trModelValue=tRModelList[0];
     tRCollarValue=tRCollarList[0];
     tRCuffValue=tRCuffList[0];
    try{
     tRModelList.map((selectElement) {
        // (selectElement.modelTypeID==modelTypeID1)?modelName1=selectElement.modelName!:modelName1="";
        (selectElement.modelTypeID==modelTypeID1&&modelTypeID1!=null)?trModelValue=selectElement:trModelValue;

      });



        tRTailorList.map((element) {
        if( element.TailorId==TailorId1&&TailorId1!=null){
          // TailorName1=element.TailorName!;
          tRTailorValue=element;

        }else{
          tRTailorValue=tRTailorValue;
        }
      } ); tRZipperList.map((element) {
        if( element.ZipperTypeId==ZipperTypeId1&&ZipperTypeId1!=null){
          // ZipperName1=element.ZipperName!;
          tRZipperValue=element;
        }else{
          tRZipperValue=tRZipperValue;
        }
      } ); tRFillingList.map((element) {
        if( element.FillingTypeId==FillingTypeId1&&FillingTypeId1!=null){
          // FillingName1=element.FillingName!;
          trFillingValue=element;

        }else{
          trFillingValue=trFillingValue;
        }
      } ); tRPocketList.map((element) {
        if( element.PocketTypeId==PocketTypeId1&&PocketTypeId1!=null){
          // PocketName1=element.PocketName!;
          tRPocketValue=element;


        }else{
          tRPocketValue=tRPocketValue;
        }
      } ); tRCollarList.map((element) {
        if( element.CollarTypeId==CollarTypeId1&&CollarTypeId1!=null){
          // CollarName1=element.CollarName!;
          tRCollarValue=element;


        }else{
          tRCollarValue=tRCollarValue;
        }
      } );
      tRCuffList.map((element) {
        if( element.CuffTypeId==CuffTypeId1&&CuffTypeId1!=null){
          // CuffName1=element.CuffName!;
          tRCuffValue=element;


        }else{
          tRCuffValue=tRCuffValue;
        }

      });
    }catch(error){
      print(error.toString());
    }

  }
  String? tailorId;
  String? modelId;
  String? cuffId;
  String? collerId;
  String? zipperId;
  String? fillId;
  String? pockettailId;
  InvoiceUpdateResponseModel? invoiceUpdateResponseModel;

  Future<InvoiceUpdateResponseModel> updateSize(InvoiceNewSizesModel invoiceNewSizesModel)async{
    String? APIKEY1 = await SharedPreferencesHelper.getApiKey() ?? APIKEYLogin;
    try{
      emit(UpdatedInvoiceResponseLoadingState());
      Dio dio = Dio();

      dio.options.headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Accept-Version': 'V1',
        'api-key': '$APIKEY1'
      };
      final response = await dio.post(
          'https://cpe-soft.com/admin/api/v1/UpdateSalesMeasurement',
          data: jsonEncode(invoiceNewSizesModel));
      if(response.statusCode==200){
        invoiceUpdateResponseModel=InvoiceUpdateResponseModel.fromJson(response.data);
        print(response.data);
        clearControllers();
        emit(UpdatedInvoiceResponseSuccessState());
// clearControllers();
      }else{
        print(response.statusMessage);
      }
    }catch(error){
      print(error.toString());
      emit(UpdatedInvoiceResponseErrorState());

    }
  return invoiceUpdateResponseModel!;
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

chaneLangeUage(BuildContext context)  {
  if(context.locale==Locale("en","US")){
     context.setLocale( Locale("ar","EG"));
     RestartWidget.restartApp(context);

  }else {
      context.setLocale( Locale("en", "US"));
      RestartWidget.restartApp(context);

  }

}
List<PillsDetailsData>? pillsDetailsDataList=[];

String? userId;
  CashierResponse? openCashierResponse;
  CashierResponse? closeCashierResponse;
  bool cashierIsOpened=false;
String startDate="";
String endDate="";
// String cashInHand="0";
  Future<CashierResponse> openCashier(CashierStartRequest cashierStartRequest)async{
    String? APIKEY1 = await SharedPreferencesHelper.getApiKey() ?? APIKEYLogin;
  Dio dio = Dio();
    dio.interceptors.add(LogInterceptor(
        requestBody: true,
        error: true,
        requestHeader: true,
        responseHeader: true,
        responseBody: true
    ));

    dio.options.headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Accept-Version': 'V1',
    'Accept-Language': 'en',
    'api-key': '$APIKEY1',
  };
  // final response=await dio.get("https://cpe-soft.com/admin/api/v1/Getallsales?api-key=k4csscc0gcosgs0s8ossows4kkkc4wsw8wgc8wko&warehouse_code=w_1");
  final response=await dio.post("https://cpe-soft.com/admin/api/v1/OpenRegister",data: jsonEncode(cashierStartRequest));
  if(response.statusCode==200){
    print(response.data);
    openCashierResponse=CashierResponse.fromJson(response.data);
    cashierIsOpened=openCashierResponse!.status!;
  }else{
    print(response.statusMessage);
  }
  return openCashierResponse!;
}
Future<CashierResponse> closeCashier(CashierCloseRequest cashierCloseRequest)async{
  String? APIKEY1 = await SharedPreferencesHelper.getApiKey() ?? APIKEYLogin;
  Dio dio = Dio();
  dio.interceptors.add(LogInterceptor(
      requestBody: true,
      error: true,
      requestHeader: true,
      responseHeader: true,
      responseBody: true
  ));
  dio.options.headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Accept-Version': 'V1',
    'Accept-Language': 'en',
    'api-key': '$APIKEY1'
  };
  // final response=await dio.get("https://cpe-soft.com/admin/api/v1/Getallsales?api-key=k4csscc0gcosgs0s8ossows4kkkc4wsw8wgc8wko&warehouse_code=w_1");
  final response=await dio.post("https://cpe-soft.com/admin/api/v1/CloseRegister",data: jsonEncode(cashierCloseRequest));
  if(response.statusCode==200){
    print(response.data);
    closeCashierResponse=CashierResponse.fromJson(response.data);
    await closeCashierDetails();
    cashierIsOpened=false;

  }else{
    print(response.statusMessage);
  }
  return closeCashierResponse!;
}

  TextEditingController cashInHandController=TextEditingController();
 double cashInHand=0;

  CloseCashierResponse? closeCashierDetailsResponse;
Future<CloseCashierResponse> closeCashierDetails()async{
  String? APIKEY1 = await SharedPreferencesHelper.getApiKey() ?? APIKEYLogin;
  CloseCashierRequest closeCashierRequest=CloseCashierRequest(userId: userId,closedAt: endDate);
  Dio dio = Dio();
  dio.interceptors.add(LogInterceptor(
      requestBody: true,
      error: true,
      requestHeader: true,
      responseHeader: true,
      responseBody: true
  ));
  dio.options.headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Accept-Version': 'V1',
    'Accept-Language': 'en',
    'api-key': '$APIKEY1'


  };
  final response=await dio.post("https://cpe-soft.com/admin/api/v1/RegisterDetails",data: jsonEncode(closeCashierRequest));
  if(response.statusCode==200){
    print(response.data);
    closeCashierDetailsResponse=CloseCashierResponse.fromJson(response.data);
    clearControllers();


  }else{
    print(response.statusMessage);
  }
  return closeCashierDetailsResponse!;
}
  String userNamevar="";


String? salesIdSearch;
  AllCustomerResponse? allCustomerResponse;
  AllCustomerResponse? customerResponse;

Future<AllCustomerResponse> getAllCustomers()async{
  // allCustomerResponse=null;
  String? APIKEY1 = await SharedPreferencesHelper.getApiKey() ?? APIKEYLogin;
  print("urlIs>>"+"https://cpe-soft.com/admin/api/v1/company?api-key=$APIKEY1");
  Dio dio = Dio();
  dio.interceptors.add(LogInterceptor(
      requestBody: true,
      error: true,
      requestHeader: true,
      responseHeader: true,
      responseBody: true
  ));
  final response=await dio.get("https://cpe-soft.com/admin/api/v1/company?api-key=$APIKEY1");
  print("statata>>"+response.statusCode.toString());
  if(response.statusCode==200){
    print(response.data);
    allCustomerResponse=AllCustomerResponse.fromJson(response.data);
    clearControllers();
    cashInHand=0;
  }else{
    print(response.statusMessage);
  }
  return allCustomerResponse!;
}
Future<AllCustomerResponse> getCustomerDetails(BuildContext context ,int id)async{
  String? APIKEY1 = await SharedPreferencesHelper.getApiKey() ?? APIKEYLogin;
  print("urlIs>>"+"https://cpe-soft.com/admin/api/v1/company?api-key=$APIKEY1&id=$id");
  LoadingPage(context).show();
  Dio dio = Dio();
  dio.interceptors.add(LogInterceptor(
      requestBody: true,
      error: true,
      requestHeader: true,
      responseHeader: true,
      responseBody: true
  ));
  // dio.options.headers = {
  //   'Content-Type': 'application/json',
  //   'Accept': 'application/json',
  //   'Accept-Version': 'V1',
  //   'Accept-Language': 'en',
  //   'api-key': 'k4csscc0gcosgs0s8ossows4kkkc4wsw8wgc8wko'
  //
  //
  // };
  final response=await dio.get("https://cpe-soft.com/admin/api/v1/company?api-key=$APIKEY1&id=$id");

  if(response.statusCode==200){
    print(response.data);
    customerResponse=AllCustomerResponse.fromJson(response.data);
    customerid=customerResponse!.data![0].id!;
    companyNameEditingController.text =
    customerResponse!.data![0].company!;
    companyEmailAddressEditingController.text =
    customerResponse!.data![0].email!;
    companyGroupIdrEditingController.text =
    customerResponse!.data![0].groupId!;
    companyGroupNameEditingController.text =
    customerResponse!.data![0].groupName!;
    companyVatNoEditingController.text =
    customerResponse!.data![0].vatNo!;
    companyAddressEditingController.text =
    customerResponse!.data![0].address!;
    companyStateEditingController.text =
    customerResponse!.data![0].state!;
    companyPostalCodeEditingController.text =
    customerResponse!.data![0].postalCode!;
    companyCountryEditingController.text =
    customerResponse!.data![0].country!;
    companyPhoneNumberEditingController.text =
    customerResponse!.data![0].phone!;
    companyCrNoEditingController.text = customerResponse!.data![0].crNo!;
    companyOfflineIdEditingController.text = customerResponse!.data![0].offlineId ?? '';
   getAllCustomers();


  }else{
    print(response.statusMessage);
  }
  LoadingPage(context).close();
  return customerResponse!;
}
  InvoiceUpdateResponseModel? customerUpdateResponse;
Future<InvoiceUpdateResponseModel> updateCustomerDetails(CustomerRequest customerRequest)async{
  String? APIKEY1 = await SharedPreferencesHelper.getApiKey() ?? APIKEYLogin;
  Dio dio = Dio();
  dio.interceptors.add(LogInterceptor(
      requestBody: true,
      error: true,
      requestHeader: true,
      responseHeader: true,
      responseBody: true
  ));
  dio.options.headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Accept-Version': 'V1',
    'Accept-Language': 'en',
    'api-key': '$APIKEY1'


  };
  final response=await dio.post("https://cpe-soft.com/admin/api/v1/UpdateCustomers",data: jsonEncode(customerRequest));
  if(response.statusCode==200){
    print(response.data);
    customerUpdateResponse=InvoiceUpdateResponseModel.fromJson(response.data);
    getCustomers();
   await getAllCustomers();


  }else{
    print(response.statusMessage);
  }
  return customerUpdateResponse!;
}

  TextEditingController companyNameEditingController = TextEditingController();

  TextEditingController companyEmailAddressEditingController =
  TextEditingController();

  TextEditingController companyGroupIdrEditingController =
  TextEditingController();

  TextEditingController companyGroupNameEditingController =
  TextEditingController();

  TextEditingController companyVatNoEditingController = TextEditingController();

  TextEditingController companyAddressEditingController =
  TextEditingController();

  TextEditingController companyStateEditingController = TextEditingController();

  TextEditingController companyPostalCodeEditingController =
  TextEditingController();

  TextEditingController companyCountryEditingController =
  TextEditingController();

  TextEditingController companyPhoneNumberEditingController =
  TextEditingController();

  TextEditingController companyCrNoEditingController = TextEditingController();

  TextEditingController companyOfflineIdEditingController =
  TextEditingController();
  String? customerid;



  bool cashierOpened=false;
  bool cashierClosed=true;
  changeCashierState(){
    cashierOpened=!cashierOpened;
    cashierClosed=!cashierClosed;
    emit(ChangeCashierState());
  }


}

