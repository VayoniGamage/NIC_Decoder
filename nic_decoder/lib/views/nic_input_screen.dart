import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/nic_controller.dart';

// ignore: use_key_in_widget_constructors
class NICInputScreen extends StatelessWidget {
  final NICController controller = Get.put(NICController());
  final TextEditingController nicInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF003249), // Deep Navy
        title: const Text(
          'NIC DECODER',
          style: TextStyle(color: Color(0xFFE7C582), fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
    body: Padding(
  padding: const EdgeInsets.all(16.0),
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset('lib/assets/sri_lanka_emblem.png', height: 150), // Larger Logo
      const SizedBox(height: 25),
      const Text(
        "DETECT YOUR NIC HERE",
        style: TextStyle(
          fontSize: 22, // Bigger font size
          fontWeight: FontWeight.bold,
          color: Color(0xFF003249), // Matching theme color
        ),
        textAlign: TextAlign.center,
      ),
      const SizedBox(height: 30),
      TextField(
        controller: nicInputController,
        decoration: const InputDecoration(
          labelText: "Enter your NIC number",
          border: OutlineInputBorder(),
        ),
        style: TextStyle(fontSize: 18), // Bigger input text
      ),
      const SizedBox(height: 20),
      ElevatedButton(
        onPressed: () {
          controller.decodeNIC(nicInputController.text);
          if (controller.isValidNIC.value) {
            Get.toNamed('/result');
          } else {
            Get.snackbar("Error", "Invalid NIC number!",
                snackPosition: SnackPosition.BOTTOM);
          }
        },
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15), // Bigger button
          backgroundColor: const Color(0xFFE7C582), // Theme color
          foregroundColor: Colors.black, // Text color
        ),
        child: const Text("Decode", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      ),
    ],
  ),
),
      bottomNavigationBar: Container(
        height: 50,
        decoration: const BoxDecoration(
          color: Color(0xFF003249), // Footer color
          borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
        ),
        child: const Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.circle, size: 8, color: Colors.black),
              SizedBox(width: 5),
              Icon(Icons.circle, size: 8, color: Colors.black),
            ],
          ),
        ),
      ),
    );
  }
}
