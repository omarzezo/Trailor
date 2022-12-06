import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:omar/Controller/Cubit/Cubit.dart';
import 'package:omar/Controller/Cubit/State.dart';
import 'package:omar/constant/LoadingPage.dart';
import 'package:omar/constant/appstrings.dart';
import 'package:omar/constant/constant.dart';

import '../../models/pillRequest.dart';

class ReturnItemScreen extends StatelessWidget {
  static const routeName = "ReturnItemScreen";

  const ReturnItemScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit=LoginCubit.get(context);
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
           appBar: AppBar(
          // toolbarHeight: 100,
          backgroundColor: Colors.purple,
          title: Text(AppStrings.returned.tr(),
              style: GoogleFonts.notoKufiArabic(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18)),
          centerTitle: true,
        ),
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${AppStrings.customerorcompany.tr()} : ${cubit.returnInvoice!.data![0].customer}",
                      style: GoogleFonts.notoKufiArabic(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18)),
                  Text("referenceNo : ${cubit.returnInvoice!.data![0].referenceNo}",style: GoogleFonts.notoKufiArabic(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18)),
                  Text("${AppStrings.type.tr()} : ${cubit.returnInvoice!.data![0].items![0].productName}",
                      style: GoogleFonts.notoKufiArabic(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18)),
                  Text("${AppStrings.size.tr()} ${cubit.returnInvoice!.data![0].items![0].productUnitCode}",
                      style: GoogleFonts.notoKufiArabic(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18)),
                  Text("${AppStrings.quantity.tr()} :  ${double.parse(cubit.returnInvoice!.data![0].items![0].quantity??"0").toStringAsFixed(2)}",
                      style: GoogleFonts.notoKufiArabic(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18) ),
                  Text("${AppStrings.unitprice.tr()} :  -  ${double.parse(cubit.returnInvoice!.data![0].items![0].unitPrice??"0").toStringAsFixed(2)}",
                      style: GoogleFonts.notoKufiArabic(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18)),
                  Text("${AppStrings.Total.tr()} : - ${double.parse(cubit.returnInvoice!.data![0].items![0].subtotal??"0").toStringAsFixed(2)}",
                      style: GoogleFonts.notoKufiArabic(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18)),
                  Text("${AppStrings.Tax.tr()} :  - ${double.parse(cubit.returnInvoice!.data![0].items![0].itemTax??"0").toStringAsFixed(2)}",
                      style: GoogleFonts.notoKufiArabic(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18)),

                  Text("${AppStrings.Discount.tr()} :  -  ${double.parse(cubit.returnInvoice!.data![0].items![0].discount??"0").toStringAsFixed(2)}",
                      style: GoogleFonts.notoKufiArabic(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18)),
                  Text("${AppStrings.Total.tr()} : -  ${double.parse(cubit.returnInvoice!.data![0].payments![0].posPaid??"0").toStringAsFixed(2)}",
                      style: GoogleFonts.notoKufiArabic(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18)),
                  Container(
                    width: double.infinity,
                    color: MyConstant().purpleColor,
                    child: MaterialButton(onPressed: ()async {
        try {
        LoadingPage(context).show();
        List<ProductModel> productList = [
        ProductModel(id: null, code: null, name: null, category_id: null, unit: null, price: null, tax_rate: null, tax_method: null, warehouse: null)

        ];
        List<dynamic> customerList = [];
        List<dynamic> categoryList = [];
        List<dynamic> posRegisterList = [];
        List<dynamic> expensesList = [];
        List<dynamic> payment = [];
        List<salesModel> salesList = [
        salesModel(
        // date: "2022-10-10 20:22:00",
        date:
        cubit.returnInvoice!.data![0].date,

        referenceNo: cubit.returnInvoice!.data![0].referenceNo,
        // customerId: int.parse(cubit.users[0].id!),
        // customerId: int.parse(cubit.companiesEmployeeName[0].id!),
        customerId: int.parse(cubit.returnInvoice!.data![0].customerId!),
        dueDate:
        cubit.returnInvoice!.data![0].deliveryDate,
        hash:
        "51280eb9564fe8aaa0abca09a2921438e7b0ae05d1714c0badb64238144eef8c",
        // customer: cubit.companiesEmployeeName[0].company,
        // customer: cubit.companiesEmployeeName[0].company,
        customer: cubit.returnInvoice!.data![0].customer,
        biller: "",
        billerId: null,
        total: double.parse(
            cubit.returnInvoice!.data![0].items![0].subtotal!
       )*-1,
        discountAllowance: double.parse(
            cubit.returnInvoice!.data![0].items![0].discount!),
        returnSaleRef: null,
        returnId: null,
        saleStatus: "completed",
        saleId: null,
        paymentStatus: "paid",
        warehouseCode: "w_1",
        warehouseId: 1,
        grandTotal: double.parse(cubit.returnInvoice!.data![0].payments![0].posPaid!)*-1,
        pos: true,
        surcharge: 0.0000,
        returnSaleTotal:double.parse(cubit.returnInvoice!.data![0].payments![0].posPaid!)*-1,
        paid: double.parse(cubit.returnInvoice!.data![0].payments![0].posPaid!)*-1,
        totalTax: double.parse(cubit.returnInvoice!.data![0].items![0].itemTax!)*-1,
        note: null,
        staffNote: null,
        productDiscount: null,
        orderDiscountId: null,
        orderDiscount: 0.0000,
        totalDiscount: double.parse(
            cubit.returnInvoice!.data![0].items![0].discount!)*-1,
        productTax: null,
        orderTaxId: null,
        orderTax: double.parse(cubit.returnInvoice!.data![0].items![0].itemTax!)*-1,
        shipping: 0.0000,
        totalItems: 1,
        paymentTerm: null,
        rounding: null,
        createdBy: 1,
        orderType: 1,
        tableNo: 0,
        dept: 1,
        empId: null,
        empType: null,
        plateNo: null,
        exitDate: "0001-01-01T00:00:00",
        payment: [
        Payment(
        id: int.parse(cubit.returnInvoice!.data![0].payments![0].id!),
        date: "2022-08-16T00:59:44+03:00",
        amount:double.parse(cubit.returnInvoice!.data![0].payments![0].amount!)*-1,
        paidBy: cubit.returnInvoice!.data![0].payments![0].paidBy!,
        commercialDiscount:
        double.parse(cubit.returnInvoice!.data![0].payments![0].commercialDiscount!)*-1,
        chequeNo: cubit.returnInvoice!.data![0].payments![0].chequeNo!,
        glPaymentMethodId: 0,
        ccNo: null,
        ccHolder: null,
        ccMonth: null,
        ccYear: null,
        ccType: null,
        createdBy: 1,
        type: "received",
        note: null,
        posPaid: double.parse(cubit.returnInvoice!.data![0].payments![0].posPaid!)*-1,
        posBalance: 0.0000, commercialDiscountId:null,
        ),
        ],
        items: [
        Items(
        productId: 1,
        productName: cubit.returnInvoice!.data![0].items![0].productName!,
        productCode: cubit.returnInvoice!.data![0].items![0].productCode!,
        productType: "standard",
        optionId: null,
        netUnitPrice: 8.6957,
        unitPrice: double.parse(cubit.returnInvoice!.data![0].items![0].unitPrice!)*-1,
        unitQuantity: double.parse(cubit.returnInvoice!.data![0].items![0].unitQuantity!),
        realUnitPrice: double.parse(cubit.returnInvoice!.data![0].items![0].realUnitPrice!)*-1,
        productUnitId:
        int.parse(cubit.returnInvoice!.data![0].items![0].productUnitId!),
        productUnitCode:
        cubit.returnInvoice!.data![0].items![0].productUnitCode!,
        quantity: double.parse(
            cubit.returnInvoice!.data![0].items![0].quantity!),
        subtotal: double.parse(
            cubit.returnInvoice!.data![0].items![0].subtotal!)*-1,
        warehouseId: 1,
        warehouseCode: "w_1",
        itemTax: double.parse(
            cubit.returnInvoice!.data![0].items![0].itemTax!)*-1,
        taxRateId: 3,
        tax: "ضريبة النسبة الأساسية 15%",
        discount: double.parse(
            cubit.returnInvoice!.data![0].items![0].discount!)*-1,
        serialNo: null,
        itemDiscount: double.parse(
            cubit.returnInvoice!.data![0].items![0].itemDiscount!)*-1,
        promoFree: false,
        ),
        ],
        measurement: [
        ],
        ),
        ];
        PillRequestModel pillRequestModel =
        PillRequestModel(
        productList: productList,
        customerList: customerList,
        categoryList: categoryList,
        posRegisterList: posRegisterList,
        salesList: salesList,
        payment: payment,
        expensesList: expensesList);
        await cubit.pillResponse(
        pillRequestModel: pillRequestModel);
        LoadingPage(context).close();

        Navigator.pop(context);
        } catch (error) {
        print(error.toString());
        }


                    }, child: Text(AppStrings.returnitem.tr(),
                        style: GoogleFonts.notoKufiArabic(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18))),
                  )

                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
