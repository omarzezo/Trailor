import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:omar/Controller/Cubit/Cubit.dart';
import 'package:omar/Controller/Cubit/State.dart';
import 'package:omar/constant/constant.dart';
import 'package:omar/models/customer.dart';

class NewUserScreen extends StatelessWidget {
  NewUserScreen({Key? key}) : super(key: key);
  static const routeName = "NewUserScreen";
  final _formKey = GlobalKey<FormState>();

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

  @override
  Widget build(BuildContext context) {
    var cubit = LoginCubit.get(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              systemOverlayStyle:
                  SystemUiOverlayStyle(statusBarColor: Colors.grey),
              backgroundColor: MyConstant().purpleColor,
              elevation: 0,
              centerTitle: true,
              title: Text(
                "اضافة عميل",
                style: TextStyle(fontSize: 35, color: Colors.white),
              ),
            ),
            body: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextFormFieldWidget(
                      text: "اسم الشركة",
                      textInputAction: TextInputAction.next,

                      validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'ادخل قيمة صحيحة';
                                              }
                                              return null;
                                            },
                      textEditingController: companyNameEditingController,
                    ),
                    TextFormFieldWidget(
                      text: "البريد الالكترونى",
                      textInputAction: TextInputAction.next,

                      validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'ادخل قيمة صحيحة';
                                              }
                                              return null;
                                            },
                      textEditingController: companyEmailAddressEditingController,
                    ),
                    TextFormFieldWidget(
                      text: "رقم جروب العميل",
                      textInputAction: TextInputAction.next,

                      validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'ادخل قيمة صحيحة';
                                              }
                                              return null;
                                            },
                      textEditingController: companyGroupIdrEditingController,
                    ),
                    TextFormFieldWidget(
                      text: "نوع جروب العميل",
                      textInputAction: TextInputAction.next,

                      validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'ادخل قيمة صحيحة';
                                              }
                                              return null;
                                            },
                      textEditingController: companyGroupNameEditingController,
                    ),
                    TextFormFieldWidget(
                      text: "رقم تعريف ضريبة القيمة المضافة",
                      textInputAction: TextInputAction.next,

                      validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'ادخل قيمة صحيحة';
                                              }
                                              return null;
                                            },
                      textEditingController: companyVatNoEditingController,
                    ),
                    TextFormFieldWidget(
                      text: "عنوان الشركة",
                      textInputAction: TextInputAction.next,

                      validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'ادخل قيمة صحيحة';
                                              }
                                              return null;
                                            },
                      textEditingController: companyAddressEditingController,
                    ),
                    TextFormFieldWidget(
                      text: "المحافظة",
                      textInputAction: TextInputAction.next,

                      validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'ادخل قيمة صحيحة';
                                              }
                                              return null;
                                            },
                      textEditingController: companyStateEditingController,
                    ),
                    TextFormFieldWidget(
                      text: "الرقم البريدى",
                      textInputAction: TextInputAction.next,

                      validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'ادخل قيمة صحيحة';
                                              }
                                              return null;
                                            },
                      textEditingController: companyPostalCodeEditingController,
                    ),
                    TextFormFieldWidget(
                      text: "الدولة",
                      textInputAction: TextInputAction.next,

                      validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'ادخل قيمة صحيحة';
                                              }
                                              return null;
                                            },
                      textEditingController: companyCountryEditingController,
                    ),
                    TextFormFieldWidget(
                      text: "رقم تليفون الشركه",
                      textInputAction: TextInputAction.next,

                      validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'ادخل قيمة صحيحة';
                                              }
                                              return null;
                                            },
                      textEditingController: companyPhoneNumberEditingController,
                    ),
                    TextFormFieldWidget(
                      text: "رقم قيد الشركة",
                      textInputAction: TextInputAction.next,

                      validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'ادخل قيمة صحيحة';
                                              }
                                              return null;
                                            },
                      textEditingController: companyCrNoEditingController,
                    ),
                    TextFormFieldWidget(
                      text: "كود الشركه",
                      textInputAction: TextInputAction.done,

                      validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'ادخل قيمة صحيحة';
                                              }
                                              return null;
                                            },
                      textEditingController: companyOfflineIdEditingController,
                    ),
                    Container(
                        width: double.infinity,
                        height: 48,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: OutlinedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                MyConstant().purpleColor),
                          ),
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                            // Navigator.pop(context);
                            Customer customer = Customer(
                              company: companyNameEditingController.text,
                              email: companyEmailAddressEditingController.text,
                              customerGroupId: int.parse(companyGroupIdrEditingController.text),
                              customerGroupName:
                                  companyGroupNameEditingController.text,
                              vatNo: companyVatNoEditingController.text,
                              address: companyAddressEditingController.text,
                              state: companyStateEditingController.text,
                              postalCode: companyPostalCodeEditingController.text,
                              country: companyCountryEditingController.text,
                              phone: companyPhoneNumberEditingController.text,
                              crNo: companyCrNoEditingController.text,
                              offlineId: int.parse(
                                  companyOfflineIdEditingController.text),
                            );
                            // CustomerModel(customer: [customer]);
                            //  PillRequestModel customerList=PillRequestModel(productList: [], customerList: [customer], categoryList: [], posRegisterList: [], salesList: [], payment: [], expensesList: []);


      await cubit.addCustomerResponse(
          customerModel: CustomerModel(customer: [customer]));
      await cubit.getCustomers();
      Navigator.pop(context);
    }

                          },
                          child: Text('اضافة',
                              style: GoogleFonts.notoKufiArabic(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18)),
                        )),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    this.onFieldSubmitted,
    this.textInputAction,
    required this.text,
    this.height = 40,
    this.width = double.infinity,
    this.icon,
    required this.validator,
    Key? key,
    required this.textEditingController,
  }) : super(key: key);
  final String text;
  final TextEditingController textEditingController;
  final double? height;
  final double? width;
  final Widget? icon;
  final String? Function(String?)? validator;
  final TextInputAction? textInputAction;
  final Function(String)? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(text,
              style: GoogleFonts.notoKufiArabic(
                  color: MyConstant().purpleColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16)),
          SizedBox(
            height: 10,
          ),
          Container(
            height: height,
            width: width,
            child: TextFormField(
              textInputAction: textInputAction,
              onFieldSubmitted: onFieldSubmitted,
              controller: textEditingController,
              validator: validator,
              textAlign: TextAlign.start,
              textDirection: TextDirection.rtl,
              textAlignVertical: TextAlignVertical.top,
              decoration: InputDecoration(
                errorBorder: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide(color: Colors.red)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide(color: Colors.green)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide(color: Colors.green)),
                prefixIcon: icon,
                // enabledBorder: OutlineInputBorder()
              ),
            ),
          )
        ],
      ),
    );
  }
}
