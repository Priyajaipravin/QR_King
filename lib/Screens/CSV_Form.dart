import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../Functions/SaveQrImage.dart';

class CsvForm_Screen extends StatefulWidget {
  const CsvForm_Screen({super.key});

  @override
  State<CsvForm_Screen> createState() => _CsvForm_ScreenState();
}

class _CsvForm_ScreenState extends State<CsvForm_Screen> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey qrKey = GlobalKey();
  final String text = "";
  late ShareQRCode shareQRCode ;

  String fName = "";
  String lName = "";
  String CM1 = "";
  String CM2 = "";
  String M1 = "";
  String M2 = "";
  String EM = "";
  String CN = "";
  String Desig = "";

  String vCard = "";

  TextEditingController F_Name = TextEditingController();
  TextEditingController L_Name = TextEditingController();
  TextEditingController Code_Mobile1 = TextEditingController();
  TextEditingController Mobile1 = TextEditingController();
  TextEditingController Code_Mobile2 = TextEditingController();
  TextEditingController Mobile2 = TextEditingController();
  TextEditingController Email = TextEditingController();
  TextEditingController Company_Name = TextEditingController();
  TextEditingController Designation = TextEditingController();
  TextEditingController Street = TextEditingController();
  TextEditingController City = TextEditingController();
  TextEditingController State = TextEditingController();

  void createQR() {
    setState(() {
      fName = F_Name.text.trim();
      lName = L_Name.text.trim();
      CM1 = Code_Mobile1.text.trim();
      CM2 = Code_Mobile2.text.trim();
      M1 = Mobile1.text.trim();
      M2 = Mobile2.text.trim();
      EM = Email.text.trim();
      CN = Company_Name.text.trim();
      Desig = Designation.text.trim();
      vCard =
          """
BEGIN:VCARD
VERSION:3.0
N:$lName;$fName;;;
FN:$fName $lName
ORG:$CN
TITLE:$Desig
TEL;TYPE=cell:$CM1$M1
TEL;TYPE=work:$CM2$M2
EMAIL:$EM
ADR;TYPE=work:;;${Street.text};${City.text};${State.text};;India
END:VCARD
""";
    });
  }

  void reset() {
    F_Name.clear();
    L_Name.clear();
    Code_Mobile1.clear();
    Mobile1.clear();
    Code_Mobile2.clear();
    Mobile2.clear();
    Email.clear();
    Company_Name.clear();
    Designation.clear();
    Street.clear();
    City.clear();
    State.clear();
    setState(() {
      vCard = "";
    });
  }

  @override
  void initState() {
    super.initState();
    shareQRCode = ShareQRCode(qrKey);
  }

  // Get Values From the TEC to Varibale and Find State useage

  OutlineInputBorder _buildBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(color: color, width: 2),
    );
  }

  TextInputType _Text() {
    return TextInputType.text;
  }

  TextInputType _Number() {
    return TextInputType.number;
  }

  InputDecoration _In_Decor(String lableText, IconData? icon) {
    return InputDecoration(
      prefixIcon: icon != null ? Icon(icon) : null,
      labelText: lableText,
      labelStyle: TextStyle(color: Colors.black),
      enabledBorder: _buildBorder(Colors.grey),
      focusedBorder: _buildBorder(Colors.blueAccent),
      errorBorder: _buildBorder(Colors.red),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contacts to QR Creator"),
        foregroundColor: Colors.white,
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Card(
                color: Colors.white60,
                elevation: 5,
                shadowColor: Colors.black87,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text("Name"),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: TextFormField(
                          controller: F_Name,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value == "" || value == null) {
                              return "Required";
                            }
                            return null;
                          },
                          decoration: _In_Decor(
                            "First Name",
                            Icons.person_2_outlined,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: L_Name,
                        keyboardType: _Text(),
                        decoration: _In_Decor(
                          "Last Name",
                          Icons.person_2_outlined,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                color: Colors.white60,
                elevation: 5,
                shadowColor: Colors.black87,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text("Contact"),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child: TextFormField(
                                controller: Code_Mobile1,
                                keyboardType: _Number(),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Required';
                                  }
                                  if (!value.startsWith('+')) {
                                    return 'Start with +';
                                  }
                                  return null;
                                },
                                decoration: _In_Decor("Code", null),
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: TextFormField(
                                controller: Mobile1,
                                keyboardType: _Number(),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Required';
                                  }
                                  if (value.length <= 9) {
                                    return 'Mobile number Must Be 10 digits';
                                  }
                                  if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                                    return 'Only Numbers Allowed';
                                  }
                                  return null;
                                },
                                decoration: _In_Decor(
                                  "Mobile Number 1",
                                  Icons.call,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child: TextFormField(
                                keyboardType: _Number(),
                                controller: Code_Mobile2,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return null;
                                  }
                                  if (!value.startsWith("+")) {
                                    return 'Must Starts with +';
                                  }
                                  return null;
                                },
                                decoration: _In_Decor("Code", null),
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: TextFormField(
                                controller: Mobile2,
                                keyboardType: _Number(),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return null;
                                  }
                                  if (value.length <= 9) {
                                    return 'Mobile number Must Be 10 digits';
                                  }
                                  if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                                    return 'Only Numbers Allowed';
                                  }
                                  return null;
                                },
                                decoration: _In_Decor(
                                  "Mobile Number 2",
                                  Icons.call,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                color: Colors.white60,
                elevation: 5,
                shadowColor: Colors.black87,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text("Email"),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: TextFormField(
                          controller: Email,
                          validator: (value) {
                            if (value == "" || value == null) {
                              return "Required";
                            }
                            if (!RegExp(
                              r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                            ).hasMatch(value)) {
                              return "Email ID Only";
                            }
                            return null;
                          },
                          keyboardType: TextInputType.emailAddress,
                          decoration: _In_Decor("Email", Icons.mail),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                color: Colors.white60,
                elevation: 5,
                shadowColor: Colors.black87,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text("Company Details"),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: TextFormField(
                          controller: Company_Name,
                          keyboardType: _Text(),
                          decoration: _In_Decor(
                            "Company Name",
                            Icons.local_post_office_outlined,
                          ),
                          validator: (value) {
                            if (value == "" || value == null) {
                              return "Required";
                            }
                            return null;
                          },
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: TextFormField(
                          controller: Designation,
                          keyboardType: _Text(),
                          decoration: _In_Decor(
                            "Designation",
                            Icons.local_post_office_sharp,
                          ),
                          validator: (value) {
                            if (value == "" || value == null) {
                              return "Required";
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                color: Colors.white60,
                elevation: 5,
                shadowColor: Colors.black87,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text("Address"),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          decoration: _In_Decor("Street", Icons.maps_home_work),
                          controller: Street,
                          validator: (value) {
                            if (value == "" || value == null) {
                              return "Required";
                            }
                            return null;
                          },
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          decoration: _In_Decor(
                            "City",
                            Icons.maps_home_work_outlined,
                          ),
                          controller: City,
                          validator: (value) {
                            if (value == "" || value == null) {
                              return "Required";
                            }
                            return null;
                          },
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          decoration: _In_Decor("State", Icons.maps_ugc_sharp),
                          controller: State,
                          validator: (value) {
                            if (value == "" || value == null) {
                              return "Required";
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(width: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        FocusScope.of(context).unfocus();
                        createQR();
                        Fluttertoast.showToast(
                          msg: "Valid",
                          toastLength: Toast.LENGTH_SHORT,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0,
                        );
                      } else {
                        Fluttertoast.showToast(
                          msg: "Please Fill The Required Fields",
                          toastLength: Toast.LENGTH_SHORT,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0,
                        );
                      }
                    },
                    child: Text("Submit"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      reset();
                    },
                    child: Text("Reset"),
                  ),
                ],
              ),

              SizedBox(height: 20),

              if (vCard.isNotEmpty)
                RepaintBoundary(
                  key: qrKey,
                  child: QrImageView(
                  data: vCard,
                  size: 300,
                  version: QrVersions.auto,
                  backgroundColor: Colors.white,
                  ),
                ),
              if (vCard.isNotEmpty)
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
    );
  }
}
