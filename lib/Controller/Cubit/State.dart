abstract class LoginState{}

class InitialLogin extends LoginState{}

class LoginLoading extends LoginState{}
class LoginSuccess extends LoginState{}
class LoginError extends LoginState{}
class GetCustomerLoadingState  extends LoginState{}
class GetCustomerSuccessState  extends LoginState{}
class GetCustomerErrorState  extends LoginState{}