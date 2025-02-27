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
          style: TextStyle(color: Color(0xFFE7C582),fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("YOUR NIC DETAILS", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),

            _infoTile("1.) Date of Birth (Year) :", controller.birthYear),
            _infoTile("2.) Date of Birth (Date) :", controller.birthDate),
            _infoTile("3.) Date of Birth (Day) :", controller.birthDay),
            _infoTile("4.) Age :", controller.age),
            _infoTile("5.) Gender :", controller.gender),

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
        decoration: const BoxDecoration(
          color: Color(0xFF003249), // Footer color
          borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
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

  Widget _infoTile(String label, RxString value) {
  return Obx(() => Container(
        width: double.infinity, // Makes it full width
        margin: EdgeInsets.symmetric(vertical: 6), // Adds spacing between tiles
        decoration: BoxDecoration(
          color: Colors.white, // Background color
          borderRadius: BorderRadius.circular(20), // Fully rounded corners
          border: Border.all(color: Color(0xFF003249), width: 2), // Border color
          boxShadow: const [
            BoxShadow(
              color: Colors.black26, // Soft shadow
              blurRadius: 6, // Increases blur effect
              offset: Offset(2, 4), // Moves shadow slightly
            ),
          ],
        ),
        padding: EdgeInsets.symmetric(vertical: 14, horizontal: 16), // Box padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black87),
            ),
            SizedBox(height: 4), // Spacing between title & value
            Text(
              value.value,
              style: const TextStyle(fontSize: 18, color: Color.fromARGB(155, 0, 0, 0)),
            ),
          ],
        ),
      ));
}

}

