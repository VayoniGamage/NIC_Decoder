import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nic_decoder/views/nic_input_screen.dart';

void main() {
  runApp(MyApp());
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "NIC Decoder",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NicInputScreen(),
    );
  }
}
