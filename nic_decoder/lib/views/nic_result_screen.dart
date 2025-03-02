import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/nic_controller.dart';

class NICResultScreen extends StatelessWidget {
  const NICResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final NICController controller = Get.find<NICController>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF003249),
        title: const Text(
          'NIC DECODER',
          style: TextStyle(color: Color(0xFFE7C582), fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("YOUR NIC DETAILS", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),

            _infoTile("1.) Date of Birth (Year):", controller.birthYear),
            _infoTile("2.) Date of Birth (Date):", controller.birthDate),
            _infoTile("3.) Date of Birth (Day):", controller.birthDay),
            _infoTile("4.) Age:", controller.age),
            _infoTile("5.) Gender:", controller.gender),
            _infoTile("6.) Voting Eligibility:", controller.votingEligibility), // Updated voting eligibility

            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Get.back(),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFE7C582), // Updated Button Color
                foregroundColor: Colors.black, // Text Color for Better Contrast
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              child: const Text("Decode Another"),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 50,
        decoration: const BoxDecoration(
          color: Color(0xFF003249),
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
          width: double.infinity,
          margin: const EdgeInsets.symmetric(vertical: 6),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: const Color(0xFF003249), width: 2),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 6,
                offset: Offset(2, 4),
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black87),
              ),
              const SizedBox(height: 4),
              Text(
                value.value.isNotEmpty ? value.value : "N/A",
                style: const TextStyle(fontSize: 18, color: Color.fromARGB(155, 0, 0, 0)),
              ),
            ],
          ),
        ));
  }
}
