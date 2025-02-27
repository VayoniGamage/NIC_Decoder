import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'views/nic_input_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NIC Decoder',
      theme: ThemeData.light(), // Will be customized in theme.dart
      home: NICInputScreen(),
    );
  }
}
