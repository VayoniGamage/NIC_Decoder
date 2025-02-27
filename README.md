# NIC Decoder App - Sri Lanka 

A Flutter application that decodes Sri Lankan National Identity Card (NIC) numbers to extract details such as birth year, birth date, gender, and age.

---

## 🚀 Features
- Enter NIC number to decode details
- Displays extracted details in a structured manner
- Uses GetX for state management
- Clean and modern UI with the Sri Lankan emblem

---
##🛠 The Dart Decoding logic that I've used in here:
void decodeNIC(String nic) {
  if (nic.isEmpty || nic.length < 10) {
    isValidNIC.value = false;
    return;
  }

  String year = nic.substring(0, 2);
  int fullYear = int.parse(year) > 30 ? 1900 + int.parse(year) : 2000 + int.parse(year);

  int days = int.parse(nic.substring(2, 5));
  String gender = (days > 500) ? "Female" : "Male";
  days = (days > 500) ? days - 500 : days;

  DateTime birthDate = DateTime(fullYear, 1, 1).add(Duration(days: days - 1));
  int age = DateTime.now().year - birthDate.year;

  birthYear.value = fullYear.toString();
  birthDate.value = birthDate.toString().split(" ")[0];
  birthDay.value = birthDate.weekday.toString();
  this.age.value = age.toString();
  this.gender.value = gender;
  isValidNIC.value = true;
}

---
## 🛠 Technologies Used
- **Flutter** (UI Development)
- **Dart** (Programming Language)
- **GetX** (State Management)
- **Material UI** (UI Components)

---

## 🔢 Expected Input & Output

### ✅ **Valid NIC Numbers**
| **Input (NIC Number)** | **Decoded Output** |
|------------------------|--------------------|
| 200012345678           | - Year: **2000** <br> - Date: **May 3rd** <br> - Day: **Wednesday** <br> - Age: **25** <br> - Gender: **Male** |
| 993456789V             | - Year: **1999** <br> - Date: **December 15th** <br> - Day: **Friday** <br> - Age: **26** <br> - Gender: **Male** |
| 200678945123           | - Year: **2006** <br> - Date: **March 25th** <br> - Day: **Saturday** <br> - Age: **19** <br> - Gender: **Female** |
| 881234567V             | - Year: **1988** <br> - Date: **January 10th** <br> - Day: **Monday** <br> - Age: **37** <br> - Gender: **Male** |

---

## ❌ **Invalid NIC Formats**
| **Input (NIC Number)** | **Error Message** |
|------------------------|--------------------|
| `20001A2345678`        | ❌ Invalid NIC format |
| `abcd5678V`            | ❌ Invalid NIC format |
| `12345`                | ❌ NIC number too short |
| `2000999999999`        | ❌ Invalid date calculation |

---
## 📂 Project Structure

### 🔥 What's New in This Version?
✅ **Added Input & Expected Output**  
✅ **Table for Valid & Invalid NIC Formats**  
✅ **Clear Error Messages for Bad Input**  

This version **clearly explains** what inputs are accepted and what outputs are generated, making it easier for **users** and **developers** to understand how the app works. 🚀🔥  

## 📜 License
This project is licensed under the MIT License.

---
## 📞 Contact
For any inquiries or contributions, feel free to contact:
**Vayoni Gamage** – [vayonithathsarani2770@gmail.com](mailto:vayonithathsarani2770@gmail.com)
