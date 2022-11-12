// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:qr_flutter/qr_flutter.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
//
// class InvoiceScreenTest  extends StatefulWidget {
//   var printInvoiceViewModel,TypeList,TypeListBool;
//   InvoiceScreenTest({this.printInvoiceViewModel,this.TypeList,this.TypeListBool});
//   _InvoiceScreenTest  createState() => _InvoiceScreenTest(printInvoiceViewModel:printInvoiceViewModel,TypeList:TypeList,TypeListBool:TypeListBool);
// }
//
// class _InvoiceScreenTest  extends State<InvoiceScreenTest> {
//   var printInvoiceViewModel,TypeList,TypeListBool;
//   _InvoiceScreenTest({this.printInvoiceViewModel,this.TypeList,this.TypeListBool});
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     intState();
//   }
//   bool IsResturant=false;
//   SharedPreferences? prefs;
//   intState()async{
//     int? a;
//     prefs = await SharedPreferences.getInstance();
//     setState(() {
//       a=prefs?.getInt("IsResturant");
//     });
//     if(a==1){
//       setState(() {
//         IsResturant=true;
//       });
//     }else{
//       setState(() {
//         IsResturant=false;
//       });
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return getContent(size,context);
//   }
//
//   getContent(size,context){
//     return  Container(
//         width: 190,
//         color: Colors.white,
//         child: Directionality(
//             textDirection: TextDirection.ltr,
//             child:Column(
//               children: [
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 const Divider(
//                   color: Colors.black,
//                 ),
//                 Container(
//                     alignment: Alignment.center,
//                     height: 50,
//                     width: 190,
//                     child:Container(
//                         height: 50,
//                         width: double.infinity,
//                         child: Image.asset('image/logo app.png',fit: BoxFit.fill,),
//                     )
//                 ),
//                 Container(
//                     alignment: Alignment.center,
//                     width: double.infinity,
//                     child:Column(
//                         children: [
//
//                           Text(
//                              "فاتورة ضريبية مبسطة",
//                             style: TextStyle(
//                                 fontFamily:"Almarai", fontSize: 10, fontWeight: FontWeight.bold),
//                           ),
//                           const SizedBox(
//                             height: 5,
//                           ),
//                           Container(
//                             width: double.infinity,
//                             alignment: Alignment.center,
//                             decoration: BoxDecoration(
//                               color: Colors.grey.shade300,
//                             ),
//                             padding: const EdgeInsets.only(top: 3,bottom: 3),
//                             child:Text(
//                               "sittttt",
//                               textAlign: TextAlign.center,
//                               style: const TextStyle(
//                                   fontFamily:"Almarai", fontSize: 10, fontWeight: FontWeight.bold),
//                             ),),
//                           const SizedBox(
//                             height: 5,
//                           ),Text(
//                             "",
//                             textAlign: TextAlign.center,
//                             style: const TextStyle(
//                                 fontFamily:"Almarai", fontSize: 10, fontWeight: FontWeight.bold),
//                           ),
//                           const Divider(
//                             color: Colors.black,
//                           ),
//                         ])),
//                 Container(
//                     alignment: Alignment.center,
//
//                     width: double.infinity,
//                     child:Column(
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Container(
//                                   width: 50,
//                                   alignment: Alignment.centerLeft,
//                                   child: const Text(
//                                     "Phone",
//                                     style: TextStyle( fontFamily:"Almarai",fontWeight: FontWeight.bold,
//                                       fontSize: 9, ),
//                                   )),  Container(
//                                   width: 90,
//                                   alignment: Alignment.center,
//                                   child:Text(
//                                     "0515151",
//                                     style: const TextStyle( fontFamily:"Almarai",fontWeight: FontWeight.bold,
//                                       fontSize: 9, ),
//                                   )),  Container(
//                                   width: 50,
//                                   alignment: Alignment.centerRight,
//                                   child:const Text(
//                                     "الهاتف",textAlign: TextAlign.center,
//                                     style: TextStyle( fontFamily:"Almarai",fontWeight: FontWeight.bold,
//                                       fontSize: 9, ),
//                                   )),
//                             ],),
//                           const SizedBox(
//                             height: 5,
//                           ),Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Container(
//                                   width: 55,
//                                   alignment: Alignment.centerLeft,
//                                   child: const Text(
//                                     "Vat No",
//                                     style: TextStyle( fontFamily:"Almarai",fontWeight: FontWeight.bold,
//                                       fontSize: 9, ),
//                                   )),  Container(
//                                   width: 80,
//                                   alignment: Alignment.center,
//                                   child:Text(
//                                     "15151515151",textAlign: TextAlign.center,
//                                     style: const TextStyle( fontFamily:"Almarai",fontWeight: FontWeight.bold,
//                                       fontSize: 9, ),
//                                   )),  Container(
//                                   width: 55,
//                                   alignment: Alignment.centerRight,
//                                   child:const Text(
//                                     "الرقم الضريبي",textAlign: TextAlign.right,
//                                     style: TextStyle( fontFamily:"Almarai",fontWeight: FontWeight.bold,
//                                       fontSize: 9, ),
//                                   )),
//
//                             ],), const SizedBox(
//                             height: 5,
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Container(
//                                   width: 50,
//                                   alignment: Alignment.centerLeft,
//                                   child: const Text(
//                                     "CR No",
//                                     style: TextStyle( fontFamily:"Almarai",fontWeight: FontWeight.bold,
//                                       fontSize: 9, ),
//                                   )),
//                               Container(
//                                   width: 80,
//                                   alignment: Alignment.center,
//                                   child:Text(
//                                     "545455145",textAlign: TextAlign.center,
//                                     style: const TextStyle( fontFamily:"Almarai",fontWeight: FontWeight.bold,
//                                       fontSize: 9, ),
//                                   )),
//                               Container(
//                                   width: 60,
//                                   alignment: Alignment.centerRight,
//                                   child:const Text(
//                                     "السجل التجاري",textAlign: TextAlign.right,
//                                     style: TextStyle( fontFamily:"Almarai",fontWeight: FontWeight.bold,
//                                       fontSize: 9, ),
//                                   )),
//
//                             ],),
//
//
//                         ])),
//                 const SizedBox(
//                   height: 5,
//                 ),
//                 Container(
//                     alignment: Alignment.center,
//                     width: 190,
//                     child:Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Container(
//                                   width: 45,
//                                   alignment: Alignment.centerLeft,
//                                   child: const Text(
//                                     "Date",
//                                     style: TextStyle( fontFamily:"Almarai",fontWeight: FontWeight.bold,
//                                       fontSize: 9, ),
//                                   )),  Container(
//                                   width: 100,
//                                   alignment: Alignment.center,
//                                   child:Text(
//                                     "24_11_2020",textAlign: TextAlign.center,
//                                     style: const TextStyle( fontFamily:"Almarai",fontWeight: FontWeight.bold,
//                                       fontSize: 9, ),
//                                   )),  Container(
//                                   width: 45,
//                                   alignment: Alignment.centerRight,
//                                   child:const Text(
//                                     "التاريخ",textAlign: TextAlign.center,
//                                     style: TextStyle( fontFamily:"Almarai",fontWeight: FontWeight.bold,
//                                       fontSize: 9, ),
//                                   )),
//
//                             ],),
//                           const SizedBox(
//                             height: 5,
//                           ),
//
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Container(
//                                   width: 50,
//                                   alignment: Alignment.centerLeft,
//                                   child: const Text(
//                                     "Reference",
//                                     style: TextStyle( fontFamily:"Almarai",fontWeight: FontWeight.bold,
//                                       fontSize: 9, ),
//                                   )),  Container(
//                                   width: 100,
//                                   alignment: Alignment.center,
//                                   child:Text(
//                                     "151515",textAlign: TextAlign.center,
//                                     style: const TextStyle( fontFamily:"Almarai",fontWeight: FontWeight.bold,
//                                       fontSize: 9, ),
//                                   )),  Container(
//                                   width: 40,
//                                   alignment: Alignment.centerRight,
//                                   child:const Text(
//                                     "المرجع",textAlign: TextAlign.center,
//                                     style: TextStyle( fontFamily:"Almarai",fontWeight: FontWeight.bold,
//                                       fontSize: 9, ),
//                                   )),
//
//                             ],),
//
//                           const SizedBox(
//                             height: 5,
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Container(
//                                   width: 50,
//                                   alignment: Alignment.centerLeft,
//                                   child: const Text(
//                                     "Seller",
//                                     style: TextStyle( fontFamily:"Almarai",fontWeight: FontWeight.bold,
//                                       fontSize: 9, ),
//                                   )),  Container(
//                                   width: 90,
//                                   alignment: Alignment.center,
//                                   child:Text(
//                                     "omar",textAlign: TextAlign.center,
//                                     style: const TextStyle( fontFamily:"Almarai",fontWeight: FontWeight.bold,
//                                       fontSize: 9, ),
//                                   )),  Container(
//                                   width: 50,
//                                   alignment: Alignment.centerRight,
//                                   child:const Text(
//                                     "البائع",textAlign: TextAlign.center,
//                                     style: TextStyle( fontFamily:"Almarai",fontWeight: FontWeight.bold,
//                                       fontSize: 9, ),
//                                   )),
//
//                             ],),
//
//                           const SizedBox(
//                             height: 5,
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Container(
//                                   width: 50,
//                                   alignment: Alignment.centerLeft,
//                                   child: const Text(
//                                     "Customer",
//                                     style: TextStyle( fontFamily:"Almarai",fontWeight: FontWeight.bold,
//                                       fontSize: 9, ),
//                                   )),  Container(
//                                   width: 90,
//                                   alignment: Alignment.center,
//                                   child:Text(
//                                     "ahmed",textAlign: TextAlign.center,
//                                     style: const TextStyle( fontFamily:"Almarai",fontWeight: FontWeight.bold,
//                                       fontSize: 9, ),
//                                   )),  Container(
//                                   width: 50,
//                                   alignment: Alignment.centerRight,
//                                   child:const Text(
//                                     "العميل",textAlign: TextAlign.center,
//                                     style: TextStyle( fontFamily:"Almarai",fontWeight: FontWeight.bold,
//                                       fontSize: 9, ),
//                                   )),
//
//                             ],),
//                           const SizedBox(
//                             height: 5,
//                           ),Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Container(
//                                   width: 55,
//                                   alignment: Alignment.centerLeft,
//                                   child: const Text(
//                                     "Vat No",
//                                     style: TextStyle( fontFamily:"Almarai",fontWeight: FontWeight.bold,
//                                       fontSize: 9, ),
//                                   )),  Container(
//                                   width: 80,
//                                   alignment: Alignment.center,
//                                   child:Text(
//                                    "11515151",textAlign: TextAlign.left,
//                                     style: const TextStyle( fontFamily:"Almarai",fontWeight: FontWeight.bold,
//                                       fontSize: 9, ),
//                                   )),  Container(
//                                   width: 55,
//                                   alignment: Alignment.centerRight,
//                                   child:const Text(
//                                     "الرقم الضريبي",textAlign: TextAlign.right,
//                                     style: TextStyle( fontFamily:"Almarai",fontWeight: FontWeight.bold,
//                                       fontSize: 9, ),
//                                   )),
//
//                             ],),
//
//                         ])),                            const Divider(
//                   color: Colors.black,
//                 ),
//                 Container(
//                   alignment: Alignment.center,
//                   height: 20,
//                   width: 190,
//                   child:
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [const Text(
//                       "Invoice No",
//                       style: TextStyle( fontFamily:"Almarai",fontWeight: FontWeight.bold,
//                         fontSize: 10, ),
//                     ),
//                       Text(
//                         "515222",
//                         style: const TextStyle(
//                             fontFamily:"Almarai", fontSize: 10, fontWeight: FontWeight.bold),
//                       ), const Text(
//                         "رقم الفاتورة",
//                         style: TextStyle( fontFamily:"Almarai",fontWeight: FontWeight.bold,
//                           fontSize: 9, ),
//                       ),
//                     ],),
//                 ),
//                 const SizedBox(height:5,),
//                 SizedBox(
//                     height: 30,
//                     width: 190,
//                     child:Table(
//                         border: TableBorder.all(),
//                         defaultVerticalAlignment: TableCellVerticalAlignment.middle,
//                         children: <TableRow>[
//                           TableRow(
//                               decoration: const BoxDecoration(
//                                 color: Colors.white,
//                               ),
//                               children: <Widget>[
//                                 Container(
//                                     height: 35,
//                                     width: 95,
//                                     alignment: Alignment.centerLeft,
//                                     margin: const EdgeInsets.only(top: 4,left: 4),
//                                     child: Column(
//                                       children: const [
//                                         Text(
//                                           "Description",
//                                           textAlign: TextAlign.left,
//                                           style: TextStyle(
//                                               fontFamily:"Almarai",  fontSize: 9, fontWeight: FontWeight.bold),
//                                         ),
//                                         Text(
//                                           "وصف الصنف",
//                                           textAlign: TextAlign.left,
//                                           style: TextStyle(
//                                               fontFamily:"Almarai",   fontSize: 9,  fontWeight: FontWeight.bold),
//                                         ),
//
//                                       ],)),
//                                 Container(
//                                   height: 35,
//                                   width: 95,
//                                   alignment: Alignment.centerLeft,
//                                   margin: const EdgeInsets.only(top: 4,left: 4),
//                                   child: Column(
//                                     children: const [
//                                       Text(
//                                         "QTY   Price   Total",
//                                         style: TextStyle(
//                                             fontFamily:"Almarai",    fontSize: 9, fontWeight: FontWeight.bold),
//                                       ),
//                                       Text(
//                                         "الاجمالي  سعر  الكمية",
//                                         style: TextStyle(
//                                             fontFamily:"Almarai",  fontSize: 9, fontWeight: FontWeight.bold),
//                                       ),],),
//
//                                 )])])),
//                 ListView.builder(
//                   scrollDirection: Axis.vertical,
//                   shrinkWrap: true,
//                   itemCount:TypeList.length,
//                   itemBuilder: (context, index) {
//                     return Table(
//                         border: TableBorder.all(),
//                         defaultVerticalAlignment: TableCellVerticalAlignment.middle,
//                         children: <TableRow>[
//                           TableRow(
//                               decoration: const BoxDecoration(
//                                 color: Colors.white,
//                               ),
//                               children: <Widget>[
//                                 Container(
//                                   margin: const EdgeInsets.only(right: 4,left: 4),
//                                   child:  Text(
//                                     TypeList[index][0].toString(),
//                                     style: const TextStyle(
//                                         fontFamily:"Almarai",    fontSize: 9, fontWeight: FontWeight.bold),
//                                     textAlign: TextAlign.right,
//                                     overflow: TextOverflow.ellipsis,
//                                     maxLines: 2,
//                                   ),
//                                 ),
//                                 Container(
//                                   alignment: Alignment.centerRight,
//                                   height: 25,
//                                   margin: const EdgeInsets.only(right: 4,left: 4),
//                                   child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Text(
//                                         TypeListBool?TypeList[index][2].toStringAsFixed(2):TypeList[index][12].toStringAsFixed(2),
//                                         style: const TextStyle(
//                                             fontFamily:"Almarai",     fontSize: 10, fontWeight: FontWeight.bold),
//                                       ),
//                                       Text(
//                                         TypeListBool?TypeList[index][3].toString():TypeList[index][2].toString(),
//                                         style: const TextStyle(
//                                             fontFamily:"Almarai",     fontSize: 10, fontWeight: FontWeight.bold),
//                                       ),
//                                       Text(
//                                         TypeListBool?TypeList[index][5].toString():TypeList[index][13].toString(),
//                                         style: const TextStyle(
//                                             fontFamily:"Almarai",     fontSize: 10, fontWeight: FontWeight.bold),
//                                       ),
//                                     ],),
//
//                                 ),                            ])]);
//                   },
//                 ),
//                 const SizedBox(height:3,),
//                 SizedBox(
//                     width: 190,
//                     child:  Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Container(
//                             width: 65,
//                             alignment: Alignment.centerLeft,
//                             child:const Text(
//                               "Total",
//                               textAlign: TextAlign.left,
//                               style: TextStyle(
//                                   fontFamily:"Almarai",   fontSize: 9, fontWeight: FontWeight.bold),
//                             )),
//                         Container(
//                             width: 60,
//                             alignment: Alignment.center,
//                             child: Text(
//                               "520",
//                               textAlign: TextAlign.center,
//                               style: const TextStyle(
//                                   fontFamily:"Almarai",   fontSize: 10, fontWeight: FontWeight.bold),
//                             )),
//                         Container(
//                             width: 65,
//                             alignment: Alignment.centerRight,
//                             child: const Text(
//                               "الاجمالي",
//                               textAlign: TextAlign.right,
//                               style: TextStyle(
//                                   fontFamily:"Almarai",   fontSize: 9, fontWeight: FontWeight.bold),
//                             )),
//                       ],)),
//                 const SizedBox(height:3,),
//                 SizedBox(
//                     width: 190,
//                     child:  Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Container(
//                             width: 65,
//                             alignment: Alignment.centerLeft,
//                             child:const Text(
//                               "VAT",
//                               textAlign: TextAlign.left,
//                               style: TextStyle(
//                                   fontFamily:"Almarai",   fontSize: 9, fontWeight: FontWeight.bold),
//                             )),
//                         Container(
//                             width: 60,
//                             alignment: Alignment.center,
//                             child: Text(
//                               "51515",
//                               textAlign: TextAlign.center,
//                               style: const TextStyle(
//                                   fontFamily:"Almarai",   fontSize: 10, fontWeight: FontWeight.bold),
//                             )),
//                         Container(
//                             width: 65,
//                             alignment: Alignment.centerRight,
//                             child: const Text(
//                               "الضريبة",
//                               textAlign: TextAlign.right,
//                               style: TextStyle(
//                                   fontFamily:"Almarai",   fontSize: 9, fontWeight: FontWeight.bold),
//                             )),
//                       ],)),
//                   SizedBox(
//                     width: 190,
//                     child:  Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Container(
//                             width: 60,
//                             alignment: Alignment.centerLeft,
//                             child: const Text(
//                               "Discount",
//                               textAlign: TextAlign.left,
//                               style: TextStyle(
//                                   fontFamily:"Almarai",   fontSize: 9, fontWeight: FontWeight.bold),
//                             )),
//                         Container(
//                             width: 60,
//                             alignment: Alignment.center,
//                             child: Text(
//                               "kmklnkn",
//                               textAlign: TextAlign.center,
//                               style: const TextStyle(
//                                   fontFamily:"Almarai",  fontSize: 10, fontWeight: FontWeight.bold),
//                             )),
//                         Container(
//                             width: 60,
//                             alignment: Alignment.centerRight,
//                             child:  const Text(
//                               "الخصم",
//                               textAlign: TextAlign.right,
//                               style: TextStyle(
//                                   fontFamily:"Almarai",   fontSize: 9, fontWeight: FontWeight.bold),
//                             )),
//                       ],)),
//                 const SizedBox(height:3,),
//                 SizedBox(
//                     width: 190,
//                     child:  Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Container(
//                             width:70,
//                             alignment: Alignment.centerLeft,
//                             child:const Text(
//                               "Grand Total",
//                               textAlign: TextAlign.left,
//                               style: TextStyle(
//                                   fontFamily:"Almarai",   fontSize: 9, fontWeight: FontWeight.bold),
//                             )),
//                         Container(
//                             width: 50,
//                             alignment: Alignment.center,
//                             child: Text(
//                               "44515",
//                               textAlign: TextAlign.center,
//                               style: const TextStyle(
//                                   fontFamily:"Almarai",   fontSize: 10, fontWeight: FontWeight.bold),
//                             )),
//                         Container(
//                             width: 70,
//                             alignment: Alignment.centerRight,
//                             child: const Text(
//                               "المبلغ المطلوب",
//                               textAlign: TextAlign.right,
//                               style: TextStyle(
//                                   fontFamily:"Almarai",   fontSize: 9, fontWeight: FontWeight.bold),
//                             )),
//                       ],)),
//                 const SizedBox(height:3,),
//                 SizedBox(
//                     width: 190,
//                     child:  Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Container(
//                             width:70,
//                             alignment: Alignment.centerLeft,
//                             child:const Text(
//                               "Paid",
//                               textAlign: TextAlign.left,
//                               style: TextStyle(
//                                   fontFamily:"Almarai",   fontSize: 9, fontWeight: FontWeight.bold),
//                             )),
//                         Container(
//                             width: 50,
//                             alignment: Alignment.center,
//                             child: Text(
//                               "556",
//                               textAlign: TextAlign.center,
//                               style: const TextStyle(
//                                   fontFamily:"Almarai",   fontSize: 10, fontWeight: FontWeight.bold),
//                             )),
//                         Container(
//                             width: 70,
//                             alignment: Alignment.centerRight,
//                             child: const Text(
//                               "المبلغ المدفوع",
//                               textAlign: TextAlign.right,
//                               style: TextStyle(
//                                   fontFamily:"Almarai",   fontSize: 9, fontWeight: FontWeight.bold),
//                             )),
//                       ],)),
//                 const SizedBox(height:3,),
//
//                 SizedBox(
//                     width: 190,
//                     child:  Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Container(
//                             width: 70,
//                             alignment: Alignment.centerLeft,
//                             child:const Text(
//                               "Payment Status",
//                               textAlign: TextAlign.left,
//                               style: TextStyle(
//                                   fontFamily:"Almarai",   fontSize: 9, fontWeight: FontWeight.bold),
//                             )),
//                         Container(
//                             width: 50,
//                             alignment: Alignment.center,
//                             child: Text(
//                               "pending",
//                               textAlign: TextAlign.center,
//                               style: const TextStyle(
//                                   fontFamily:"Almarai",   fontSize: 10, fontWeight: FontWeight.bold),
//                             )),
//                         Container(
//                             width: 70,
//                             alignment: Alignment.centerRight,
//                             child: const Text(
//                               "حالة الدفع",
//                               textAlign: TextAlign.right,
//                               style: TextStyle(
//                                   fontFamily:"Almarai",   fontSize: 9, fontWeight: FontWeight.bold),
//                             )),
//                       ],)),
//
//
//
//                 Column(children: [
//                   const Divider(
//                     color: Colors.black,
//                   ),
//                   const SizedBox(height: 2),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     crossAxisAlignment:CrossAxisAlignment.center ,
//                     children: [
//
//                       Container(
//                           width: 95,
//                           alignment: Alignment.centerLeft,
//                           child:  Text(
//                             "note note",
//                             textAlign: TextAlign.left,
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontFamily: "Almarai",
//                               fontSize: 9,
//                             ),
//                           )),
//                       Container(
//                           width: 95,
//                           alignment: Alignment.centerRight,
//                           child: const Text(
//                             "الملاحظة",
//                             textAlign: TextAlign.right,
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontFamily: "Almarai",
//                               fontSize: 9,
//                             ),
//                           )),
//                     ],),
//                   const SizedBox(height: 2),]),
//                 const Divider(
//                   color: Colors.black,
//                 ),
//                 QrImage(
//                   data: printInvoiceViewModel.getQrCodeTVL(context),
//                   version: QrVersions.auto,
//                   size: 120.0,
//                 ),const Divider(
//                   color: Colors.black,
//                 )
//               ],
//             )));
//   }
// }