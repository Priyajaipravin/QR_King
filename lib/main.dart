import 'package:flutter/material.dart';
import './Screens/home_Screen.dart';
import './Screens/CSV_Form.dart';
import './Screens/UPI QR.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => Text_QR_Screen(),
        "/CSV_to_QR" :(context) =>  CsvForm_Screen(),
        "/UPI_QR" :(context) => UPI_QR(),
      },
    );
  }
}
