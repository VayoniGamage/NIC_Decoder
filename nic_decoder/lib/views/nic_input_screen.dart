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
            Image.asset('lib/assets/sri_lanka_emblem.png', height: 150,width: 150, fit: BoxFit.contain, errorBuilder: (context, error, stackTrace) { // Prevents stretching
const SizedBox(height: 30);// Increase spacing to uplift
              return const Text(
                'Image not found',
                style: TextStyle(color: Colors.red, fontSize: 16),
              );
            }),
            const SizedBox(height: 20),
            TextField(
              controller: nicInputController,
              decoration: const InputDecoration(
                labelText: "Enter your NIC number",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 25),
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
              child: const Text("Decode"),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 50,
        decoration: BoxDecoration(
          color: const Color(0xFF003249), // Footer color
          borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
        ),
        child: Center(
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
