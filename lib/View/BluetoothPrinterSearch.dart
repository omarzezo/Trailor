import 'dart:convert';
// import 'package:blue_print_pos/blue_print_pos.dart';
// import 'package:blue_print_pos/models/blue_device.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:omar/SharedPreferencesHelper.dart';
import 'package:shared_preferences/shared_preferences.dart';


class BluetoothPrinterSearch extends StatefulWidget {

  @override
  _BluetoothPrinterSearch createState() => _BluetoothPrinterSearch();
}

class _BluetoothPrinterSearch extends State<BluetoothPrinterSearch> {
  SharedPreferences? prefs;
  String tips = 'no device connect';
  // final BluePrintPos _bluePrintPos = BluePrintPos.instance;
  // List<BlueDevice> _blueDevices = <BlueDevice>[];
  FlutterBlue _blueDevices = FlutterBlue.instance;
  List<ScanResult>? scanResult=[];
  ScanResult? _selectedDevice;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();

  }

  // Platform messages are asynchronous, so we initialize in an async method.

  onConnect(blueDevices,context) async {
    print(blueDevices.address);
    prefs = await SharedPreferences.getInstance();

    BluetoothDevicePrint bluetoothDevicePrint =BluetoothDevicePrint(address: blueDevices.address,
      name: blueDevices.name,
      type: blueDevices.type,);
    await SharedPreferencesHelper.setMacAddress(jsonEncode(bluetoothDevicePrint.toMap()));
    await SharedPreferencesHelper.setMacPrinter(blueDevices.address);
      // prefs?.setString("MacJeson", jsonEncode(bluetoothDevicePrint.toMap()));
      // prefs?.setString("MacPinter",  blueDevices.address);
    setState(() { });

    Navigator.pop(context);
    print("add");

  }


  @override
  Widget build(BuildContext context) {
    bool isorientation= MediaQuery.of(context).orientation == Orientation.landscape;
    return  Container(
        height:MediaQuery.of(context).size.height*0.7,
        width: isorientation?MediaQuery.of(context).size.width*0.6:double.infinity,
        child:Scaffold(
          appBar: AppBar(
            title:  Text('البحث',style: GoogleFonts.notoKufiArabic(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16)),
            centerTitle: true,
          ),
          body: SafeArea(
            child: _isLoading && scanResult!.isNotEmpty
                ? const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              ),
            )
                : scanResult!.isNotEmpty
                ? SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    children: List<Widget>.generate(scanResult!.length,
                            (int index) {
                          return Row(
                            children: <Widget>[
                              Expanded(
                                child: InkWell(
                                  onTap: ()async{
                                    // print("dsak.fnldskfa");
                                    await onConnect(scanResult![index],context);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: <Widget>[
                                        // Text(
                                        //   scanResult![index].device.name,
                                        //   style: TextStyle(
                                        //     color:
                                        //     _selectedDevice?.address == scanResult![index].device.name
                                        //         ? Colors.blue
                                        //         : Colors.black,
                                        //     fontSize: 20,
                                        //     fontWeight: FontWeight.w500,
                                        //   ),
                                        // ),
                                        // Text(
                                        //   _blueDevices[index].address,
                                        //   style: TextStyle(
                                        //     color:
                                        //     _selectedDevice?.address == _blueDevices[index].address ? Colors.blueGrey : Colors.grey,
                                        //     fontSize: 14,
                                        //     fontWeight: FontWeight.w500,
                                        //   ),
                                        // ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),


                            ],
                          );
                        }),
                  ),
                ],
              ),
            )
                : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Text(
                    'Scan bluetooth device',
                    style: TextStyle(fontSize: 24, color: Colors.green),
                  ),
                  Text(
                    'Press button scan',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: (){if(_isLoading){ null; }else{
              try{
                findDevices();
              } catch (e) {
                print(e);
              }
            }
            },
            child: const Icon(Icons.search),
            backgroundColor: _isLoading ? Colors.grey : Colors.green,
          ),
        ));
  }
  void findDevices() {
    setState(() => _isLoading = true);
    _blueDevices.startScan(
      timeout: const Duration(seconds: 3),
    );
    _blueDevices.scanResults.listen((results) {
      setState(() {
        scanResult = results;
        _isLoading = false;
      });
    });
    _blueDevices.stopScan();
  }
  // Future<void> _onScanPressed() async {
  //   setState(() => _isLoading = true);
  //   _bluePrintPos.scan().then((List<BlueDevice> devices) {
  //     if (devices.isNotEmpty) {
  //       setState(() {
  //         _blueDevices = devices;
  //         _isLoading = false;
  //       });
  //     } else {
  //       setState(() => _isLoading = false);
  //     }
  //   });
  // }
}



class BluetoothDevicePrint{

  String?  name ;
  String?  address ;
  int?  type;
  bool? connected;

  BluetoothDevicePrint({this.name, this.address, this.type,this.connected});

  factory BluetoothDevicePrint.fromMap(Map<String, dynamic> json) => BluetoothDevicePrint(
      name: json["name"],
      address: json["address"],
      type: json["type"],
      connected:json["connected"]
  );
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'address': address,
      "type":type,
      "connected":connected
    };
  }
}