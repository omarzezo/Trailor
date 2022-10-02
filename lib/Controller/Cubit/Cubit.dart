import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:omar/Controller/End%20Point.dart';
import 'package:omar/Controller/Network/Remote%20Data/Dio%20Helper.dart';
import 'package:omar/View/Data%20Table/model.dart';
import '../../models/TrailorListsResponse.dart';
import 'State.dart';

class LoginCubit extends Cubit<LoginState>{
  LoginCubit() : super(InitialLogin());

  static LoginCubit get(context) => BlocProvider.of(context);

  Future<TrailorListsResponse> login({required String email, required String password,}) async {
    var response = await http.get(Uri.parse(BASEURL+"v1/data?api-key="+email+"&warehouse_code="+password),headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      });
    TrailorListsResponse  lenderResponseModel=TrailorListsResponse();

    try {
      print(jsonDecode(const Utf8Decoder().convert(response.bodyBytes)));
      lenderResponseModel = TrailorListsResponse.fromJson(jsonDecode(const Utf8Decoder().convert(response.bodyBytes)));
    } catch (e) {
      print(e.toString());
    }

    return lenderResponseModel;
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

  void getList (List<Details> details)=> details.map((e) {});
}