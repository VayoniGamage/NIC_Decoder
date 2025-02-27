import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nic_decoder/controllers/nic_controller.dart';
import 'package:nic_decoder/views/nic_result_screen.dart';

// ignore: use_key_in_widget_constructors
class NicInputScreen extends StatelessWidget {
  final TextEditingController nicController = TextEditingController();
  final NicController controller = Get.put(NicController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("NIC DECODER")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/sri_lanka_logo.png', height: 100), // Add Sri Lankan emblem

            const SizedBox(height: 20),
            TextField(
              controller: nicController,
              decoration: const InputDecoration(
                labelText: "Enter your NIC number",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (nicController.text.isNotEmpty) {
                  controller.decodeNIC(nicController.text);
                  Get.to(() => NicResultScreen());
                } else {
                  Get.snackbar("Error", "Please enter a valid NIC number",
                      backgroundColor: Colors.red, colorText: Colors.white);
                }
              },
              child: const Text("Decode"),
            ),
          ],
        ),
      ),
    );
  }
}
