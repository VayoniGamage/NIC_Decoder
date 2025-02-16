import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/nic_controller.dart';

class NICResultScreen extends StatelessWidget {
  final NICController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFCCDBDC), // Light Teal Background
      appBar: AppBar(
        backgroundColor: Color(0xFF003249), // Deep Navy Header
        title: Text(
          'NIC DECODER',
          style: TextStyle(color: Color(0xFFE7C582), fontWeight: FontWeight.bold), // Warm Gold Text
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildInfoBox('NIC Details'),
              _buildInfoBox('Date of Birth: Year ${controller.birthYear}'),
              _buildInfoBox('Date of Birth: Date ${controller.birthDate}'),
              _buildInfoBox('Date of Birth: Day ${controller.weekDay}'),
              _buildInfoBox('Age: ${controller.age}'),
              _buildInfoBox('Gender: ${controller.gender}'),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF567485), // Muted Blue-Gray Button
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                ),
                onPressed: () => Get.back(),
                child: Text('Regenerate', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoBox(String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.all(12),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFF567485), // Muted Blue-Gray Info Boxes
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }
}
