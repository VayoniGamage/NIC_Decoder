import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/nic_controller.dart';

class NICInputScreen extends StatelessWidget {
  final NICController controller = Get.put(NICController());
  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFCCDBDC), // Updated Background Color
      appBar: AppBar(
        backgroundColor: Color(0xFF003249), // Deep Navy
        title: Text(
          'NIC DECODER',
          style: TextStyle(color: Color(0xFFE7C582), fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Color(0xFF567485), // Muted Blue-Gray for Input Field
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextField(
                  controller: textController,
                  decoration: InputDecoration(
                    hintText: 'Enter your NIC number',
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: Colors.white70),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF567485), // Muted Blue-Gray for Button
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                ),
                onPressed: () => controller.decodeNIC(textController.text),
                child: Text('Decode', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
