import 'package:tozero/home.dart';

class canError {
  Map<int, String> values = {
    00: "Sum volt low level 2",
    01: "Sum volt low level 1",
    02: "Sum volt high level 2",
    03: "Sum volt high level 1",
    04: "Cell volt low level 2",
    05: "Cell volt low level 1",
    06: "Cell volt high level 2",
    07: "Cell volt high level 1",
    10: "Dischg temp low level 2",
    11: "Dischg temp low level 1",
    12: "Dischg temp high level 2",
    13: "Dischg temp high level 1",
    14: "Chg temp low level 2",
    15: "Chg temp low level 1",
    16: "Chg temp high level 2",
    17: "Chg temp high level 1",
    20: "SOC Low level 2",
    21: "SOC Low level 1",
    22: "SOC high level 2",
    23: "SOC high level 1",
    24: "Dischg overcurrent level 2",
    25: "Dischg overcurrent level 1",
    26: "Chg overcurrent level 2",
    27: "Chg overcurrent level 1",
    30: "empty",
    31: "empty",
    32: "empty",
    33: "empty",
    34: "Diff temp level 2",
    35: "Diff temp level 1",
    36: "Diff volt level 2",
    37: "Diff volt level 1",
    40: "Discrg MOS open circuit err",
    41: "Chg MOS open circuit err",
    42: "Dischg MOS adhesion err",
    43: "Chg MOS adhesion err",
    44: "Dischg MOS temp sensor err",
    45: "Chg MOS temp sensor err",
    46: "Dischg MOS temp high alarm",
    47: "Chg MOS temp high alarm",
    50: "Internal communication failure",
    51: "Communication failure",
    52: "Precharge failure",
    53: "RTC err",
    54: "EEPROM err",
    55: "Cell temp sensor err",
    56: "Voltage collect dropped",
    57: "AFE collect chip err",
    60: "empty",
    61: "empty",
    62: "empty",
    63: "empty",
    64: "Low volt forbidden chg fault",
    65: "Short circuit protect fault",
    66: "Sum voltage detect fault",
    67: "Current module fault"
  };

  void addBinary(String binary, int value) {
    for (int i = 0; i < 7; i++) {
      for (int j = 0; j <= 7; j++) {
        if (value == i) {

          int key = i * 10 + j;

          if (binary[j] == "1") {
            

            if (values[key] != "empty") {
              if (!Home.main_errors.contains(values[key])) {
                Home.main_errors.add(values[key]!);
              } 
            }
          }
          else {
            
                if (Home.main_errors.contains(values[key])) {
                  Home.main_errors.remove(values[key]);
                }
              }
        }
      }
    }
  }
}
