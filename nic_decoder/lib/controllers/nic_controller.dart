import 'package:get/get.dart';
import 'package:intl/intl.dart';

class NICController extends GetxController {
  var nicNumber = ''.obs;
  var birthYear = ''.obs;
  var birthDate = ''.obs;
  var birthDay = ''.obs;
  var age = ''.obs;
  var gender = ''.obs;
  var isValidNIC = false.obs;

  get nicInputController => null;

  void decodeNIC(String nic) {
    nicNumber.value = nic.trim();
    
    // Check if it's 9-digit old NIC or 12-digit new NIC
    if (nic.length == 10 && RegExp(r'^\d{9}[VvXx]$').hasMatch(nic)) {
      _decodeOldNIC(nic);
    } else if (nic.length == 12 && RegExp(r'^\d{12}$').hasMatch(nic)) {
      _decodeNewNIC(nic);
    } else {
      isValidNIC.value = false;
      return;
    }

    isValidNIC.value = true;
  }

  void _decodeOldNIC(String nic) {
    String yearPrefix = (nic[0] == '0') ? '19' : '19'; // Always 19XX
    String year = yearPrefix + nic.substring(0, 2);
    int days = int.parse(nic.substring(2, 5));

    _processNICData(year, days);
  }

  void _decodeNewNIC(String nic) {
    String year = nic.substring(0, 4);
    int days = int.parse(nic.substring(4, 7));

    _processNICData(year, days);
  }

  void _processNICData(String year, int days) {
    // Gender check: if days > 500, it's female (subtract 500)
    String genderText = (days > 500) ? "Female" : "Male";
    if (days > 500) days -= 500;

    // Convert day of the year to actual date
    DateTime dob = DateTime(int.parse(year), 1, 1).add(Duration(days: days - 1));
    String formattedDate = DateFormat("yyyy-MM-dd").format(dob);
    String weekDay = DateFormat("EEEE").format(dob);

    // Calculate Age
    int currentYear = DateTime.now().year;
    int userAge = currentYear - int.parse(year);

    // Update Variables
    birthYear.value = year;
    birthDate.value = formattedDate;
    birthDay.value = weekDay;
    gender.value = genderText;
    age.value = userAge.toString();
  }
  
}
