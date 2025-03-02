import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../views/nic_result_screen.dart';

class NICController extends GetxController {
  var nicNumber = ''.obs;
  var birthYear = ''.obs;
  var birthDate = ''.obs;
  var birthDay = ''.obs;
  var age = ''.obs;
  var gender = ''.obs;
  var votingEligibility = ''.obs;
  var isValidNIC = false.obs;

  void decodeNIC(String nic) {
    nic = nic.trim();
    if (nic.isEmpty) {
      Get.snackbar("Error", "NIC number cannot be empty",
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Get.theme.colorScheme.error);
      isValidNIC.value = false;
      return;
    }

    if (nic.length == 10 && RegExp(r'^\d{9}[VvXx]$').hasMatch(nic)) {
      _decodeOldNIC(nic);
    } else if (nic.length == 12 && RegExp(r'^\d{12}$').hasMatch(nic)) {
      _decodeNewNIC(nic);
    } else {
      isValidNIC.value = false;
      Get.snackbar("Invalid NIC", "Enter a valid Sri Lankan NIC",
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Get.theme.colorScheme.error);
      return;
    }

    isValidNIC.value = true;
    Get.to(() => const NICResultScreen()); // Navigate after decoding
  }

  void _decodeOldNIC(String nic) {
    String year = "19${nic.substring(0, 2)}";
    int days = int.parse(nic.substring(2, 5));
    String voteChar = nic.substring(9, 10).toUpperCase();

    _processNICData(year, days);

    // Voting eligibility for old NIC: 'V' means can vote if age is 18+, 'X' means cannot vote
    if (int.parse(age.value) >= 18 && voteChar == 'V') {
      votingEligibility.value = "Eligible to Vote";
    } else {
      votingEligibility.value = "Not Eligible to Vote";
    }
  }

  void _decodeNewNIC(String nic) {
    String year = nic.substring(0, 4);
    int days = int.parse(nic.substring(4, 7));

    _processNICData(year, days);

    // For new NIC, eligibility is determined solely by age (18+)
    votingEligibility.value = (int.parse(age.value) >= 18) ? "Eligible to Vote" : "Not Eligible to Vote";
  }

  void _processNICData(String year, int days) {
    String genderText = (days > 500) ? "Female" : "Male";
    if (days > 500) days -= 500;

    DateTime dob;
    try {
      dob = DateTime(int.parse(year), 1, 1).add(Duration(days: days - 1));
    } catch (e) {
      Get.snackbar("Error", "Invalid NIC format",
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Get.theme.colorScheme.error);
      return;
    }

    String formattedDate = DateFormat("yyyy-MM-dd").format(dob);
    String weekDay = DateFormat("EEEE").format(dob);

    int currentYear = DateTime.now().year;
    int userAge = currentYear - int.parse(year);

    birthYear.value = year;
    birthDate.value = formattedDate;
    birthDay.value = weekDay;
    gender.value = genderText;
    age.value = userAge.toString();
  }
}
