import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nic_decoder/controllers/nic_controller.dart';

// ignore: use_key_in_widget_constructors
class NicResultScreen extends StatelessWidget {
  final NicController controller = Get.find<NicController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("NIC Details")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(child: Text("NIC Details", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold))),

            const SizedBox(height: 20),
            infoCard("Year of Birth", controller.birthYear.value),
            infoCard("Date of Birth", controller.birthDate.value),
            infoCard("Day of Birth", controller.birthDay.value),
            infoCard("Age", controller.age.value),
            infoCard("Gender", controller.gender.value),
            infoCard("Can Vote", controller.canVote.value),

            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () => Get.back(),
                child: const Text("Go Back"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget infoCard(String title, String value) {
    return Card(
      child: ListTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(value),
      ),
    );
  }
}
