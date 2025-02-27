import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'views/nic_input_screen.dart';
import 'views/nic_result_screen.dart';
import 'theme.dart';

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
      theme: AppTheme.lightTheme,  // Apply theme
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => NICInputScreen()),
        GetPage(name: '/result', page: () => NICResultScreen()),
      ],
    );
  }
}
