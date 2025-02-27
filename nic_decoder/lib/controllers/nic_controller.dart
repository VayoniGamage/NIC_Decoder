import 'package:get/get.dart';
import 'package:intl/intl.dart';

class NicController extends GetxController {
  var birthYear = "".obs;
  var birthDate = "".obs;
  var birthDay = "".obs;
  var age = "".obs;
  var gender = "".obs;
  var canVote = "".obs;

  void decodeNIC(String nic) {
    if (nic.length == 10 || nic.length == 12) {
      String year;
      int dayOfYear;
      
      if (nic.length == 10) {
        // Old NIC Format (e.g., 853400937V)
        year = "19${nic.substring(0, 2)}";
        dayOfYear = int.parse(nic.substring(2, 5));
      } else {
        // New NIC Format (e.g., 198534000937)
        year = nic.substring(0, 4);
        dayOfYear = int.parse(nic.substring(4, 7));
      }

      // Determine gender
      if (dayOfYear > 500) {
        dayOfYear -= 500;
        gender.value = "Female";
      } else {
        gender.value = "Male";
      }

      // Calculate birthdate
      DateTime birthDateObj = DateTime(int.parse(year), 1, 1).add(Duration(days: dayOfYear - 1));
      birthDate.value = DateFormat("MMMM dd").format(birthDateObj);
      birthDay.value = DateFormat("EEEE").format(birthDateObj);
      birthYear.value = year;

      // Calculate age
      DateTime now = DateTime.now();
      age.value = (now.year - int.parse(year)).toString();

      // Determine voting eligibility
      canVote.value = nic.length == 10 ? (nic[9].toUpperCase() == "V" ? "Yes" : "No") : "Yes";
    } else {
      birthYear.value = "Invalid NIC";
      birthDate.value = "";
      birthDay.value = "";
      age.value = "";
      gender.value = "";
      canVote.value = "";
    }
  }
}
