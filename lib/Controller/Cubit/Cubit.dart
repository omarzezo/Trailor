import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:omar/Controller/End%20Point.dart';
import 'package:omar/Controller/Network/Remote%20Data/Dio%20Helper.dart';
import 'package:omar/View/Data%20Table/model.dart';
import 'State.dart';

class LoginCubit extends Cubit<LoginState>{
  LoginCubit() : super(InitialLogin());

  static LoginCubit get(context) => BlocProvider.of(context);

  void login ({
    required String email,
    required String password,
}){
    DioHelper.getData(url: URL, query: {
      'api-key' :  email,
      'warehouse_code' : password,
    }).then((value) {
      emit(LoginSuccess());
    }).then((value) {
      LoginError();
    });
  }

  void getList (List<Details> details)=> details.map((e) {});
}