import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:omar/Controller/Cubit/Cubit.dart';
import 'package:omar/Controller/Cubit/State.dart';
import 'package:omar/constant/LoadingPage.dart';
import 'package:omar/constant/appstrings.dart';
import 'package:omar/constant/constant.dart';
import 'package:omar/models/customer.dart';
import 'package:flutter/services.dart' as p;

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
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
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
              AppStrings.addnewcustomer.tr(),style: GoogleFonts.notoKufiArabic(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18),
            ),
          ),
          body: Padding(
            padding:  EdgeInsets.only(left:(MediaQuery.of(context).size.width>500)? 60:10,right: (MediaQuery.of(context).size.width>500)? 60:10),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Container(
                  // padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      TextFormFieldWidget(
                        text: AppStrings.customerorcompany.tr(),
                        textInputAction: TextInputAction.next,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '???????? ???????? ??????????';
                          }
                          return null;
                        },
                        textEditingController: companyNameEditingController,
                      ),
                      TextFormFieldWidget(
                        text: AppStrings.Email.tr(),
                        textInputAction: TextInputAction.next,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '???????? ???????? ??????????';
                          }
                          return null;
                        },
                        textEditingController:
                        companyEmailAddressEditingController,
                      ),
                      // TextFormFieldWidget(
                      //   text: "?????? ???????? ????????????",
                      //   textInputAction: TextInputAction.next,
                      //   validator: (value) {
                      //     if (value == null || value.isEmpty) {
                      //       return '???????? ???????? ??????????';
                      //     }
                      //     return null;
                      //   },
                      //   textEditingController: companyGroupIdrEditingController,
                      // ),
                      TextFormFieldWidget(
                        text: AppStrings.vatNumber.tr(),
                        textInputAction: TextInputAction.next,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '???????? ???????? ??????????';
                          }
                          return null;
                        },
                        textEditingController: companyVatNoEditingController,
                      ),
                      TextFormFieldWidget(
                        text: "??????????????",
                        textInputAction: TextInputAction.next,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '???????? ?????????? ??????????????';
                          }
                          return null;
                        },
                        textEditingController: companyAddressEditingController,
                      ),
                      TextFormFieldWidget(
                        text:AppStrings.zipCode.tr(),
                        textInputAction: TextInputAction.next,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '???????? ???????? ??????????';
                          }
                          return null;
                        },
                        textEditingController: companyPostalCodeEditingController,
                      ),
                      TextFormFieldWidget(
                        text: AppStrings.country.tr(),
                        textInputAction: TextInputAction.next,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '???????? ???????? ??????????';
                          }
                          return null;
                        },
                        textEditingController: companyCountryEditingController,
                      ),
                      TextFormFieldWidget(
                        text: AppStrings.phoneNumber.tr(),
                        textInputAction: TextInputAction.next,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '???????? ???????? ??????????';
                          }
                          return null;
                        },
                        textEditingController:
                        companyPhoneNumberEditingController,
                      ),
                      TextFormFieldWidget(
                        text: AppStrings.companyregistrationnumber.tr(),
                        textInputAction: TextInputAction.next,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '???????? ???????? ??????????';
                          }
                          return null;
                        },
                        textEditingController: companyCrNoEditingController,
                      ),
                      TextFormFieldWidget(
                        textInputType: TextInputType.number,

                        text: AppStrings.companyCode.tr(),
                        textInputAction: TextInputAction.done,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '???????? ???????? ??????????';
                          }
                          return null;
                        },
                        textEditingController: companyOfflineIdEditingController,
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width/2,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: OutlinedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  MyConstant().purpleColor),
                            ),
                            onPressed: () async {
                              try{
                                if (_formKey.currentState!.validate()) {
                                LoadingPage(context).show();

                                // Navigator.pop(context);

                                Customer customer = Customer(
                                  company: replaceArabicNumber(companyNameEditingController.text ?? ""),
                                  email:replaceArabicNumber( companyEmailAddressEditingController.text ?? ""),
                                  // customerGroupId: int.parse(companyGroupIdrEditingController.text),
                                  customerGroupId: 2,
                                  customerGroupName: replaceArabicNumber(companyGroupNameEditingController.text ?? ""),
                                  vatNo:replaceArabicNumber( companyVatNoEditingController.text ?? ""),
                                  address:replaceArabicNumber( companyAddressEditingController.text ?? ""),
                                  state:replaceArabicNumber( companyStateEditingController.text ?? ""),
                                  postalCode:replaceArabicNumber( companyPostalCodeEditingController.text ?? ""),
                                  country:replaceArabicNumber( companyCountryEditingController.text ?? ""),
                                  phone:replaceArabicNumber( companyPhoneNumberEditingController.text ?? ""),
                                  crNo:replaceArabicNumber( companyCrNoEditingController.text ?? ""),
                                  offlineId:0,
                                );

                                print("hhhhhhhhhhhhhhhhhh${jsonEncode(customer.toJson())}");
                                // CustomerModel(customer: [customer]);
                                //  PillRequestModel customerList=PillRequestModel(productList: [], customerList: [customer], categoryList: [], posRegisterList: [], salesList: [], payment: [], expensesList: []);
                                await cubit.addCustomerResponse(
                                    customerModel:
                                    CustomerModel(customer: [customer]));
                                await cubit.getCustomers();
                                LoadingPage(context).close();
                                //
                                Navigator.pop(context);
                                }

                              }catch(error){
                                print(error.toString());
                                LoadingPage(context).close();

                              }
                              LoadingPage(context).close();

                            },
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10,bottom: 10),
                              child: Text(AppStrings.add.tr(),
                                  style: GoogleFonts.notoKufiArabic(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18)),
                            ),
                          )),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
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
    this.textInputType,
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
  final TextInputType? textInputType;

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
              keyboardType: textInputType,
              textInputAction: textInputAction,
              onFieldSubmitted: onFieldSubmitted,
              controller: textEditingController,
              validator: validator,


              textAlign: TextAlign.start,
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
