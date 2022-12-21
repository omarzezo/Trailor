import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:omar/Controller/Cubit/Cubit.dart';
import 'package:omar/Controller/Cubit/State.dart';
import 'package:omar/constant/appstrings.dart';
import 'package:omar/constant/constant.dart';
import 'package:omar/models/customer.dart';

import '../../constant/LoadingPage.dart';
import 'add_new_customer_screen.dart';

class NewAddCustomerScreen extends StatelessWidget {
  static const routeName = "NewAddCustomerScreen";

  NewAddCustomerScreen({Key? key}) : super(key: key);
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
     var cubit=LoginCubit.get(context);
    double w = 1.1;
    MediaQuery.of(context).orientation == Orientation.landscape
        ? w = 1.1
        : w = .6;
    return SafeArea(
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Container(
                width: MediaQuery.of(context).size.width / w,
                // height: MediaQuery.of(context).size.height/1.5,
                margin:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  border:
                  Border.all(color: MyConstant().purpleColor, width: 3),
                ),
                child: Column(
                  children: [
                    Container(
                        height: MediaQuery.of(context).size.height / 16,
                        // height: 40,
                        width: double.infinity,
                        color: MyConstant().purpleColor,
                        padding: const EdgeInsets.only(left: 30, right: 20),
                        child: Row(
                          children: [
                            Text(AppStrings.addnewcustomer.tr(),
                                style: GoogleFonts.notoKufiArabic(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18)),

                          ],
                        )),
                    SizedBox(height: 20,),
                    Form(
                      key: _formKey,
                      child: SingleChildScrollView(
                        child: Container(
                          // padding: const EdgeInsets.all(20),
                          margin: const EdgeInsets.all(20),
                          child: Column(
                            children: [
                              Row(children: [
                                Expanded(
                                child: TextFormFieldWidget(
                                  text: AppStrings.customerorcompany.tr(),
                                  textInputAction: TextInputAction.next,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'ادخل قيمة صحيحة';
                                    }
                                    return null;
                                  },
                                  textEditingController: companyNameEditingController,
                                ),
                              ),
                                Expanded(
                                  child: TextFormFieldWidget(
                                    text: AppStrings.Email.tr(),
                                    textInputAction: TextInputAction.next,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'ادخل قيمة صحيحة';
                                      }
                                      return null;
                                    },
                                    textEditingController:
                                    companyEmailAddressEditingController,
                                  ),
                                ),],),
                              Row(children: [Expanded(
                                child: TextFormFieldWidget(
                                  text: AppStrings.vatNumber.tr(),
                                  textInputAction: TextInputAction.next,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'ادخل قيمة صحيحة';
                                    }
                                    return null;
                                  },
                                  textEditingController: companyVatNoEditingController,
                                ),
                              ),
                                Expanded(
                                  child: TextFormFieldWidget(
                                    text: "العنوان",
                                    textInputAction: TextInputAction.next,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'يرجي ادخال العنوان';
                                      }
                                      return null;
                                    },
                                    textEditingController: companyAddressEditingController,
                                  ),
                                ),],),
                              Row(children: [Expanded(
                                child: TextFormFieldWidget(
                                  text:AppStrings.zipCode.tr(),
                                  textInputAction: TextInputAction.next,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'ادخل قيمة صحيحة';
                                    }
                                    return null;
                                  },
                                  textEditingController: companyPostalCodeEditingController,
                                ),
                              ),
                                Expanded(
                                  child: TextFormFieldWidget(
                                    text: AppStrings.country.tr(),
                                    textInputAction: TextInputAction.next,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'ادخل قيمة صحيحة';
                                      }
                                      return null;
                                    },
                                    textEditingController: companyCountryEditingController,
                                  ),
                                ),],),

                              Row(children: [ Expanded(
                                child: TextFormFieldWidget(
                                  text: AppStrings.phoneNumber.tr(),
                                  textInputAction: TextInputAction.next,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'ادخل قيمة صحيحة';
                                    }
                                    return null;
                                  },
                                  textEditingController:
                                  companyPhoneNumberEditingController,
                                ),
                              ),
                                Expanded(
                                  child: TextFormFieldWidget(
                                    text: AppStrings.companyregistrationnumber.tr(),
                                    textInputAction: TextInputAction.next,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'ادخل قيمة صحيحة';
                                      }
                                      return null;
                                    },
                                    textEditingController: companyCrNoEditingController,
                                  ),
                                ),],),


                              TextFormFieldWidget(
                                text: AppStrings.companyCode.tr(),
                                textInputAction: TextInputAction.done,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'ادخل قيمة صحيحة';
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
                                        // if (_formKey.currentState!.validate()) {
                                        LoadingPage(context).show();

                                        // Navigator.pop(context);
                                        Customer customer = Customer(
                                          company: companyNameEditingController.text ?? "",
                                          email: companyEmailAddressEditingController.text ?? "",
                                          // customerGroupId: int.parse(companyGroupIdrEditingController.text),
                                          customerGroupId: 2 ,
                                          customerGroupName: companyGroupNameEditingController.text ?? "",
                                          vatNo: companyVatNoEditingController.text ?? "",
                                          address: companyAddressEditingController.text ?? "",
                                          state: companyStateEditingController.text ?? "",
                                          postalCode: companyPostalCodeEditingController.text ?? "",
                                          country: companyCountryEditingController.text ?? "",
                                          phone: companyPhoneNumberEditingController.text ?? "",
                                          crNo: companyCrNoEditingController.text ?? "",
                                          offlineId:companyOfflineIdEditingController.text!=null&&companyOfflineIdEditingController.text.isNotEmpty?
                                          int.parse(companyOfflineIdEditingController.text):0,
                                        );
                                        // CustomerModel(customer: [customer]);
                                        //  PillRequestModel customerList=PillRequestModel(productList: [], customerList: [customer], categoryList: [], posRegisterList: [], salesList: [], payment: [], expensesList: []);
                                        await cubit.addCustomerResponse(
                                            customerModel:
                                            CustomerModel(customer: [customer]));
                                        await cubit.getCustomers();
                                        LoadingPage(context).close();

                                        Navigator.pop(context);
                                        // }

                                      }catch(error){
                                        print(error.toString());
                                      }
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
                    )

                  ],
                ),
              ),

            ],
          );
        },
      ),
    );;
  }
}
