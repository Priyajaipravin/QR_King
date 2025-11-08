import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../Functions/SaveQrImage.dart';

class UPI_QR extends StatefulWidget {
  const UPI_QR({super.key});

  @override
  State<UPI_QR> createState() => _UPI_QRState();
}

class _UPI_QRState extends State<UPI_QR> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _QrKey = GlobalKey();
  late ShareQRCode shareQRCode ;

  final TextEditingController _UPI = TextEditingController();
  final TextEditingController _PB_Name = TextEditingController();
  final TextEditingController _Amount = TextEditingController();
  final TextEditingController _CUR = TextEditingController();

  String UPI_ID = "";
  String name = "";
  String amt = "";
  String currency = "";
  String QRdata = "";

  void Reset() {
    setState(() {
      _UPI.clear();
      _PB_Name.clear();
      _Amount.clear();
      _CUR.clear();
      QRdata = "";
    });
  }

  void genQR() {
    UPI_ID = _UPI.text.trim();
    name = _PB_Name.text.trim();
    amt = _Amount.text.trim();
    currency = _CUR.text.trim();
    QRdata = "upi://pay?pa=${UPI_ID}&pn=${name}&am=${amt}&cu=${currency}";
  }

  OutlineInputBorder _outlinedBorder(Color c) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(width: 2, color: c),
    );
  }

  InputDecoration _inputDecorationwithimage(String Text, Image? image) {
    return InputDecoration(
      prefixIcon: image != null
          ? ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                height: 20,
                width: 20,
                margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Padding(padding: const EdgeInsets.all(1), child: image),
              ),
            )
          : null,
      labelText: Text,
      labelStyle: TextStyle(color: Colors.black),
      enabledBorder: _outlinedBorder(Colors.grey),
      focusedBorder: _outlinedBorder(Colors.blueAccent),
      errorBorder: _outlinedBorder(Colors.red),
    );
  }

  InputDecoration _inputDecorationwithicon(String Text, IconData? icon) {
    return InputDecoration(
      prefixIcon: icon != null ? Icon(icon) : null,
      labelText: Text,
      labelStyle: TextStyle(color: Colors.black),
      enabledBorder: _outlinedBorder(Colors.grey),
      focusedBorder: _outlinedBorder(Colors.blueAccent),
      errorBorder: _outlinedBorder(Colors.red),
    );
  }

  @override
  void initState() {
    super.initState();
    shareQRCode = ShareQRCode(_QrKey);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("UPI To QR Creator"),
        foregroundColor: Colors.white,
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Form(
            key: _formKey,
            child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                spacing: 20,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Text("UPI Details"),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      controller: _UPI,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter Value";
                        }
                      },
                      decoration: _inputDecorationwithimage(
                        "Enter Your UPI",
                        Image.asset('lib/icons/upi.png'),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      controller: _PB_Name,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter Value";
                        }
                      },
                      decoration: _inputDecorationwithicon(
                        "Payee Name/Business Name",
                        Icons.person_3,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: TextFormField(
                      controller: _Amount,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Required Amount";
                        }
                        if (!RegExp(r'^[0-9]+(\.[0-9]+)?$').hasMatch(value)) {
                          return "Please Enter Amount Only";
                        }
                      },
                      decoration: _inputDecorationwithicon(
                        "Amount",
                        Icons.money_outlined,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: DropdownMenu<String>(
                      controller: _CUR,
                      initialSelection: "INR",
                      dropdownMenuEntries: <DropdownMenuEntry<String>>[
                        DropdownMenuEntry(
                          value: "INR",
                          leadingIcon: Icon(Icons.currency_rupee),
                          label: "Rupees",
                        ),
                        DropdownMenuEntry(
                          value: "EUR",
                          leadingIcon: Image.asset('lib/icons/euro.png'),
                          label: "Euro",
                        ),
                      ],
                      label: Text("Currency"),
                      leadingIcon: Icon(Icons.currency_rupee),
                    ),
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                  Container(
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          FocusScope.of(context).unfocus();
                          genQR();
                          setState(() {
                          });
                        }
                      },
                      child: Text("Generate QR UPI "),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    child: ElevatedButton(
                      onPressed: () {
                          FocusScope.of(context).unfocus();
                          Reset();
                      },
                      child: Text("Reset"),
                    ),
                  ),
                  ],),
                  if (QRdata.isNotEmpty)
                    RepaintBoundary(
                      key: _QrKey,
                      child: QrImageView(
                        data: QRdata,
                        size: 200,
                        backgroundColor: Colors.white,
                      ),
                    ),
                  if (QRdata.isNotEmpty)
                    ElevatedButton.icon(
                      onPressed: () =>{
                        shareQRCode.shareQrImage(context)
                      },
                      icon: Icon(Icons.share),
                      label: Text("Share QR Image"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                      ),
                    ),
                  SizedBox(height: 20,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
