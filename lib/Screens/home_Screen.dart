import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../Functions/SaveQrImage.dart';


class Text_QR_Screen extends StatefulWidget {
  const Text_QR_Screen({super.key});

  @override
  State<Text_QR_Screen> createState() => _Text_QR_ScreenState();
}

class _Text_QR_ScreenState extends State<Text_QR_Screen> {
  String qrdata = "";
  TextEditingController inputvalue = TextEditingController();
  final GlobalKey qrKey = GlobalKey();
  final _formKey = GlobalKey<FormState>();
  late ShareQRCode shareQRCode ;

  void qrgen() {
    setState(() {
      qrdata = inputvalue.text;
    });
  }

  void qr_reset() {
    setState(() {
      inputvalue.clear();
      qrdata = "";
    });
  }



  @override
  void initState() {
    super.initState();
    shareQRCode = ShareQRCode(qrKey);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("Priyajai Pravin"),
              accountEmail: Text("priyajaipravin4142@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person, size: 40, color: Colors.red),
              ),
              decoration: BoxDecoration(color: Colors.blueAccent),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () => {Navigator.pop(context)},
            ),
            ListTile(
              leading: Icon(Icons.person_2),
              title: Text("Contact QR Creator"),
              onTap: () => {
                Navigator.pop(context),
                Navigator.pushNamed(context, "/CSV_to_QR"),
              },
            ),
            ListTile(
              leading: Icon(Icons.currency_rupee),
              title: Text("UPI To QR"),
              onTap: () =>
                  {
                    Navigator.popAndPushNamed(context, '/UPI_QR')
                  },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("QR Code Generator"),
        foregroundColor: Colors.white,
        backgroundColor: Colors.blueAccent,
      ),
      body: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              TextFormField(
                controller: inputvalue,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'required';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: "Enter URL or Text",
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black26, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueAccent, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        qrgen();
                        FocusScope.of(context).unfocus();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      foregroundColor: Colors.white,
                      elevation: 10,
                      shadowColor: Colors.black,
                    ),
                    child: Text("Generate QR Code"),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: qr_reset,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      elevation: 10,
                      shadowColor: Colors.black,
                    ),
                    child: Text("Reset"),
                  ),
                ],
              ),
              SizedBox(height: 20),

              if (qrdata.isNotEmpty)
                RepaintBoundary(
                  key: qrKey,
                  child: QrImageView(
                    data: qrdata,
                    size: 200,
                    backgroundColor: Colors.white,
                  ),
                ),

              SizedBox(height: 20),
              if (qrdata.isNotEmpty)
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
            ],
          ),
        ),
      ),
    );
  }
}
