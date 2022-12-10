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
import 'package:omar/models/customer_request.dart';

class EditCustomerScreen extends StatefulWidget {
  EditCustomerScreen({Key? key}) : super(key: key);
  static const routeName = "EditCustomerScreen";

  @override
  State<EditCustomerScreen> createState() => _EditCustomerScreenState();
}

class _EditCustomerScreenState extends State<EditCustomerScreen> {
  final _formKey = GlobalKey<FormState>();



  @override
  void initState() {
 
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    var cubit = LoginCubit.get(context);
    return Directionality(
      textDirection: p.TextDirection.rtl,
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              systemOverlayStyle:
              SystemUiOverlayStyle(statusBarColor: Colors.grey),
              backgroundColor: MyConstant().purpleColor,
              elevation: 0,
              centerTitle: true,
              title: Text(
                AppStrings.editCustomerInfo.tr(),style: GoogleFonts.notoKufiArabic(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
              ),
            ),
            body: Padding(
              padding: EdgeInsets.only(left: (MediaQuery
                  .of(context)
                  .size
                  .width > 500) ? 60 : 10, right: (MediaQuery
                  .of(context)
                  .size
                  .width > 500) ? 60 : 10),
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
                              return 'ادخل قيمة صحيحة';
                            }
                            return null;
                          },
                          textEditingController:LoginCubit.get(context).companyNameEditingController,
                        ),
                        TextFormFieldWidget(
                          text: AppStrings.Email.tr(),
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'ادخل قيمة صحيحة';
                            }
                            return null;
                          },
                          textEditingController:LoginCubit.get(context).companyEmailAddressEditingController,
                        ),
                        // TextFormFieldWidget(
                        //   text: "رقم جروب العميل",
                        //   textInputAction: TextInputAction.next,
                        //   validator: (value) {
                        //     if (value == null || value.isEmpty) {
                        //       return 'ادخل قيمة صحيحة';
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
                              return 'ادخل قيمة صحيحة';
                            }
                            return null;
                          },
                          textEditingController:LoginCubit.get(context).companyVatNoEditingController,
                        ),
                        TextFormFieldWidget(
                          text: "العنوان",
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'يرجي ادخال العنوان';
                            }
                            return null;
                          },
                          textEditingController:LoginCubit.get(context).companyAddressEditingController,
                        ),
                        TextFormFieldWidget(
                          text: AppStrings.zipCode.tr(),
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'ادخل قيمة صحيحة';
                            }
                            return null;
                          },
                          textEditingController:LoginCubit.get(context).companyPostalCodeEditingController,
                        ),
                        TextFormFieldWidget(
                          text: AppStrings.country.tr(),
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'ادخل قيمة صحيحة';
                            }
                            return null;
                          },
                          textEditingController:LoginCubit.get(context).companyCountryEditingController,
                        ),
                        TextFormFieldWidget(
                          text: AppStrings.phoneNumber.tr(),
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'ادخل قيمة صحيحة';
                            }
                            return null;
                          },
                          textEditingController:LoginCubit.get(context).companyPhoneNumberEditingController,
                        ),
                        TextFormFieldWidget(

                          text: AppStrings.companyregistrationnumber.tr(),
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'ادخل قيمة صحيحة';
                            }
                            return null;
                          },
                          textEditingController:LoginCubit.get(context).companyCrNoEditingController,
                        ),
                        TextFormFieldWidget(
                          text: AppStrings.companyCode.tr(),
                          textInputAction: TextInputAction.done,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'ادخل قيمة صحيحة';
                            }
                            return null;
                          },
                          textEditingController:LoginCubit.get(context).companyOfflineIdEditingController,
                        ),
                        Container(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width / 2,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: OutlinedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    MyConstant().purpleColor),
                              ),
                              onPressed: () async {
                                try {
                                  // if (_formKey.currentState!.validate()) {
                                  LoadingPage(context).show();
                                  CustomerRequest customerRequest = CustomerRequest(
                                    name
                                    :LoginCubit.get(context).companyNameEditingController.text,
                                    id
                                    :LoginCubit.get(context).customerid,
                                    email
                                    :LoginCubit.get(context).companyEmailAddressEditingController.text ,
                                    company
                                    :LoginCubit.get(context).companyNameEditingController.text,
                                    country
                                    :LoginCubit.get(context).companyCountryEditingController.text,
                                    phone
                                    :LoginCubit.get(context).companyPhoneNumberEditingController.text,
                                    address
                                    :LoginCubit.get(context).companyAddressEditingController.text,
                                    crNo
                                    :LoginCubit.get(context).companyCrNoEditingController.text,
                                    postalCode
                                    :LoginCubit.get(context).companyPostalCodeEditingController.text,
                                    state
                                    :LoginCubit.get(context).companyStateEditingController.text,
                                    vatNo
                                    :LoginCubit.get(context).companyVatNoEditingController.text,);
                                  await
                                  cubit.updateCustomerDetails(customerRequest);

                                  LoadingPage(context).close();

                                  Navigator.pop(context);
                                  // }

                                } catch (error) {
                                  print(error.toString());
                                }
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 10, bottom: 10),
                                child: Text(AppStrings.edit.tr(),
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
      ),
    );
  }
}

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    this.onFieldSubmitted,
    this.hintText="",
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
  final String hintText;
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
              // textAlign: TextAlign.start,
              // textDirection: p.TextDirection.rtl,
              textAlignVertical: TextAlignVertical.bottom,
              decoration: InputDecoration(
                hintText: hintText,
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
