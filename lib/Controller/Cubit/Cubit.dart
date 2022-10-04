import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:omar/Controller/End%20Point.dart';
import 'package:omar/Controller/Network/Remote%20Data/Dio%20Helper.dart';
import 'package:omar/View/Data%20Table/model.dart';
import 'package:omar/models/Users.dart';
import 'package:omar/models/sizeModel.dart';
import '../../models/TrailorListsResponse.dart';
import 'State.dart';

class LoginCubit extends Cubit<LoginState>{
  LoginCubit() : super(InitialLogin());
  static LoginCubit get(context) => BlocProvider.of(context);

  TextEditingController tailor=TextEditingController();
TextEditingController type=TextEditingController();
TextEditingController frontHeight=TextEditingController();
TextEditingController backHeight=TextEditingController();
TextEditingController shoulderWidth=TextEditingController();
TextEditingController shoulderSlope=TextEditingController();
TextEditingController sleeveLengthPlain=TextEditingController();
TextEditingController sleeveLengthIsHigher=TextEditingController();
TextEditingController wideWrist=TextEditingController();
TextEditingController plainCuff=TextEditingController();
TextEditingController cuffLength=TextEditingController();
TextEditingController cuffShow=TextEditingController();
TextEditingController wideMiddle=TextEditingController();
TextEditingController expandTheChestInFront=TextEditingController();
TextEditingController expandTheChestBehind=TextEditingController();
TextEditingController koftaBottom=TextEditingController();
TextEditingController expandDown=TextEditingController();
TextEditingController wideNeckPillow=TextEditingController();
TextEditingController neckHeight=TextEditingController();
TextEditingController gypsumHeight=TextEditingController();
TextEditingController viewGypsum=TextEditingController();
TextEditingController lengthChestPocket=TextEditingController();
TextEditingController wideChestPocket=TextEditingController();
TextEditingController wideMobilePocket=TextEditingController();
TextEditingController wideMobilePocket2=TextEditingController();
TextEditingController lengthPocketWallet=TextEditingController();
TextEditingController widePocketWallet=TextEditingController();
TextEditingController hipWidth=TextEditingController();
TextEditingController buttonNumber=TextEditingController();
TextEditingController embroideryNumber=TextEditingController();
TextEditingController betweenTheChestPocketAndTheShoulder=TextEditingController();
TextEditingController sidePocket=TextEditingController();
TextEditingController quantumCapacityMedium=TextEditingController();
TextEditingController Takhalis=TextEditingController();
TextEditingController expectedFabricInMeter=TextEditingController();
TextEditingController quantities=TextEditingController();
TextEditingController itemPrice=TextEditingController();
TextEditingController totalPrice=TextEditingController();
TextEditingController totalPriceDetails=TextEditingController();
TextEditingController discount=TextEditingController();
TextEditingController tax=TextEditingController();
TextEditingController whatYouPay=TextEditingController();
TextEditingController cash=TextEditingController();
TextEditingController onlinePayment=TextEditingController();
TextEditingController delayMoney=TextEditingController();
String customerName="";
String employeeName="";
String typeOfClothes="";
String size="";
String paymentType="";

  Future<TrailorListsResponse> login({required String email, required String password,}) async {
    var response = await http.get(Uri.parse(BASEURL+"v1/data?api-key="+email+"&warehouse_code="+password),headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      });
    TrailorListsResponse  lenderResponseModel=TrailorListsResponse();

    try {
      print(jsonDecode(const Utf8Decoder().convert(response.bodyBytes)));
      lenderResponseModel = TrailorListsResponse.fromJson(jsonDecode(const Utf8Decoder().convert(response.bodyBytes)));
      users=lenderResponseModel.users!;
      // users.forEach((element) {usersName.add(element.company!);});

    } catch (e) {
      print(e.toString());
    }

    return lenderResponseModel;

  }
List<Users> users=[];
  List<String> usersName=[];

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

  void getList (List<Details> details)=> details.map((e) {});
}