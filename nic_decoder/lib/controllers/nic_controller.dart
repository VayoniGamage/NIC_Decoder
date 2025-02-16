import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:nic_decoder/views/nic_result_screen.dart';

class NICController extends GetxController {
  var nic = ''.obs;
  var birthYear = ''.obs;
  var birthDate = ''.obs;
  var weekDay = ''.obs;
  var age = ''.obs;
  var gender = ''.obs;
  var voteAbility = ''.obs;

  void decodeNIC(String nicInput) {
    nic.value = nicInput;
    
    if (nicInput.length == 10) {
      birthYear.value = '19' + nicInput.substring(0, 2);
      int dayOfYear = int.parse(nicInput.substring(2, 5));
      voteAbility.value = nicInput[9].toUpperCase();

      if (dayOfYear > 500) {
        gender.value = 'Female';
        dayOfYear -= 500;
      } else {
        gender.value = 'Male';
      }
      birthDate.value = getDateFromDayOfYear(int.parse(birthYear.value), dayOfYear);
    } 
    else if (nicInput.length == 12) {
      birthYear.value = nicInput.substring(0, 4);
      int dayOfYear = int.parse(nicInput.substring(4, 7));
      voteAbility.value = 'N/A';

      if (dayOfYear > 500) {
        gender.value = 'Female';
        dayOfYear -= 500;
      } else {
        gender.value = 'Male';
      }
      birthDate.value = getDateFromDayOfYear(int.parse(birthYear.value), dayOfYear);
    } 
    else {
      Get.snackbar('Error', 'Invalid NIC format', snackPosition: SnackPosition.BOTTOM);
      return;
    }

    DateTime birth = DateFormat('yyyy-MM-dd').parse(birthDate.value);
    weekDay.value = DateFormat('EEEE').format(birth);
    age.value = (DateTime.now().year - birth.year).toString();

    Get.to(() => NICResultScreen());
  }

  String getDateFromDayOfYear(int year, int day) {
    DateTime date = DateTime(year).add(Duration(days: day - 1));
    return DateFormat('yyyy-MM-dd').format(date);
  }
}
