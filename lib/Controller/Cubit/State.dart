abstract class LoginState{}

class InitialLogin extends LoginState{}

class LoginLoading extends LoginState{}
class LoginSuccess extends LoginState{}
class LoginError extends LoginState{}
class GetCustomerLoadingState  extends LoginState{}
class GetCustomerSuccessState  extends LoginState{}
class GetCustomerErrorState  extends LoginState{}
class AddCustomerLoadingState  extends LoginState{}
class AddCustomerSuccessState  extends LoginState{}
class AddCustomerErrorState  extends LoginState{}
class UpdatedPillsResponseLoadingState  extends LoginState{}
class UpdatedPillsResponseSuccessState  extends LoginState{}
class UpdatedPillsResponseErrorState  extends LoginState{}
class UpdatedInvoiceResponseLoadingState  extends LoginState{}
class UpdatedInvoiceResponseSuccessState  extends LoginState{}
class UpdatedInvoiceResponseErrorState  extends LoginState{}
class AppGetDateFromUserState  extends LoginState{}
class GetWhatYouPayAfterDiscount  extends LoginState{}