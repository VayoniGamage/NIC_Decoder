import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/nic_controller.dart';

class NICResultScreen extends StatelessWidget {
  final NICController controller = Get.find<NICController>();

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
            const Text("NIC Details", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),

            _infoTile("Date of Birth (Year)", controller.birthYear),
            _infoTile("Date of Birth (Date)", controller.birthDate),
            _infoTile("Date of Birth (Day)", controller.birthDay),
            _infoTile("Age", controller.age),
            _infoTile("Gender", controller.gender),

            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Get.back(),
              child: const Text("Regenerate"),
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

  Widget _infoTile(String label, RxString value) {
    return Obx(() => Card(
          child: ListTile(
            title: Text(label),
            subtitle: Text(value.value),
          ),
        ));
  }
}

