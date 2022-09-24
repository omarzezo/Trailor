import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:omar/View/Data%20Table/widget%20table.dart';

import 'model.dart';

class DataTableScreen extends StatefulWidget {
  const DataTableScreen({Key? key}) : super(key: key);

  @override
  _DataTableScreenState createState() => _DataTableScreenState();
}

class _DataTableScreenState extends State<DataTableScreen> {
  late List<Details> details;
  List<Details> selectItem = [];
  final columns = [
    'الحالة',
    'تاريخ التسليم',
    'تاريخ الفاتورة',
    'العميل',
    'الحوال',
    'كود العميل',
    'المرجع',
    // 'N',
  ];
  int? sortColumn;
  bool? isAscending;
  @override
  void initState() {
    super.initState();
    details = List.of( listOfDetail );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Container(
          width: MediaQuery.of(context).size.width / 1,
          height: MediaQuery.of(context).size.height / 1,
          // color: Colors.amber,
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            children: [
              Container(
                width: 30,
                color: Colors.purple,
                height: 378,
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 32,
                      child: Text(
                        'م',
                        style: GoogleFonts.lato(
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            color: Colors.white),
                      ),
                      alignment: Alignment.center,
                    ),
                    const Divider(
                      color: Colors.white,
                    ),
                    Expanded(
                      child: ListView.separated(
                          itemBuilder: (context, index) {
                            return IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.check_box_outline_blank,
                                  color: Colors.white,
                                  size: 15,
                                ));
                          },
                          separatorBuilder: (context, index) => const Divider(
                                color: Colors.white,
                              ),
                          itemCount: details.length),
                    )
                  ],
                ),
              ),
              Container(
                width: 30,
                color: Colors.green,
                height: 375,
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 32,
                      child: Text(
                        'ع',
                        style: GoogleFonts.lato(
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            color: Colors.white),
                      ),
                      alignment: Alignment.center,
                    ),
                    const Divider(
                      color: Colors.white,
                    ),
                    Expanded(
                      child: ListView.separated(
                          itemBuilder: (context, index) {
                            return IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.check_box_outline_blank,
                                  color: Colors.white,
                                  size: 15,
                                ));
                          },
                          separatorBuilder: (context, index) => const Divider(
                                color: Colors.white,
                              ),
                          itemCount: details.length),
                    )
                  ],
                ),
              ),
              Expanded(
                child: DataTable2(
                  sortAscending: isAscending != null,
                  sortColumnIndex: sortColumn,
                  // dataRowHeight: 35,
                  headingRowColor: MaterialStateColor.resolveWith(
                      (states) => Colors.green.withOpacity(0.2)),
                  showBottomBorder: true,
                  headingRowHeight: 40,
                  columnSpacing: 10.0,
                  dataRowColor: MaterialStateColor.resolveWith(
                      (states) => Colors.grey.withOpacity(0.4)),
                  // onSelectAll: (){},

                  border: TableBorder.symmetric(
                      outside: const BorderSide(
                        color: Colors.purple,
                      ),
                      inside: const BorderSide(color: Colors.green)),
                  showCheckboxColumn: true,
                  minWidth: 1,
                  dividerThickness: 2,
                  columns: getColumns(columns),
                  rows: getRows(details),
                ),
              ),
              Container(
                width: 30,
                // color: Colors.green,
                height: 375,
                decoration: const BoxDecoration(
                  border: Border(
                    right: BorderSide(color: Colors.purple),
                    top: BorderSide(color: Colors.purple),
                    bottom: BorderSide(color: Colors.purple),
                  )
                ),
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 32,
                      child: Text(
                        'N',
                        style: GoogleFonts.lato(
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            color: Colors.green),
                      ),
                      alignment: Alignment.center,
                    ),
                    const Divider(
                      color: Colors.green,
                    ),
                    Expanded(
                      child: ListView.separated(
                          itemBuilder: (context, index) {
                            return Text('1' ,style: GoogleFonts.lato(
                                fontSize: 18,
                                fontWeight: FontWeight.normal,
                                color: Colors.green),);
                          },
                          separatorBuilder: (context, index) => const Divider(
                            color: Colors.green,
                          ),
                          itemCount: details.length),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<DataColumn2> getColumns(List<String> columns) => columns
      .map((String column) =>
          DataColumn2(label: Text(column, style: GoogleFonts.notoKufiArabic(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 12,
          ),), onSort: onSort, size: ColumnSize.S))
      .toList();

  List<DataRow2> getRows(List<Details> detail) => detail.map((Details det) {
        final cells = [
          det.status,
          det.dateOfDelivery,
          det.dateOfInvoice,
          det.client,
          det.phone,
          det.code,
          det.ref,
          // det.num
        ];
        return DataRow2(
            // selected: selectItem.contains(det),
            // color: MaterialStateProperty.all(Colors.black12),
            // // specificRowHeight: 40,
            // onSelectChanged: (isSelected) {
            //   setState(() {
            //     final isAdding = isSelected != null && isSelected;
            //     isAdding ? selectItem.add(det) : selectItem.remove(det);
            //   });
            // },
            cells: getCells(cells));
      }).toList();

  List<DataCell> getCells(List<dynamic> cells) =>
      cells.map((data) => DataCell(Text('$data' , style: GoogleFonts.notoKufiArabic(
        fontSize: 10,
        fontWeight: FontWeight.normal
      ),))).toList();

  void onSort(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      details.sort((detail1, detail2) =>
          compareString(ascending, detail1.status, detail2.client));
    } else if (columnIndex == 1) {
      details.sort((detail3, detail4) => compareString(
          ascending, detail3.dateOfDelivery, detail4.dateOfInvoice));
    }
    setState(() {
      sortColumn = columnIndex;
      isAscending = ascending;
    });
  }

  int compareString(bool ascending, dynamic value1, dynamic value2) {
    return ascending ? value1.compareTo(value2) : value2.compareTo(value1);
  }
}
