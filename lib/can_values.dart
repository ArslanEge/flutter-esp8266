import 'package:animated_digit/animated_digit.dart';

class CanValues{

  CanValues._privateConstructor();


  static final CanValues canValue = CanValues._privateConstructor();
  factory CanValues() => canValue;


  int maxVoltage = -9999;
  int minVoltage = -9999;
  int maxTmp = -9999;
  int minTmp = -9999;
  int totalVoltage = -9999;
  int currenent = -9999;
  int soc = -9999;
  bool chargeMos=false;
  bool dischargeMos=false;
  int capacity=-9999;
  int gatherTotalVoltage = -9999;
  String formattedSoc = "";
  String formattedTotal = "";
  String formattedGathered = "";
  String formattedCapacity= "";
  AnimatedDigitController batteryvoltageController = AnimatedDigitController(0);
  AnimatedDigitController batterycurrentController = AnimatedDigitController(0);
  AnimatedDigitController batteryEnegryAvailableController = AnimatedDigitController(0);
  AnimatedDigitController batterySohController = AnimatedDigitController(0);
  AnimatedDigitController batteryMaxCellVoltageController = AnimatedDigitController(0);
  AnimatedDigitController batterryMaxCellTemperatureController = AnimatedDigitController(0);
  AnimatedDigitController batteryAvgvoltController = AnimatedDigitController(0);
  AnimatedDigitController batteryAvgtempController = AnimatedDigitController(0);

  List<int> volts = List<int>.filled(16, 0);

  int batteryCurrent=-9999;
  int batteryVoltage=-9999;
  int batterySoc=-9999;
  int batterySoh=-9999;
  int batteryEnegryAvailable=-9999;

  int batteryMaxCellTemperature=-9999;
  int batteryMinCellTempeatrue=-9999;

  int batteryMaxCellVoltage=-9999;
  int batteryMinCellVoltage=-9999;

  int batteryAvgtemp=-9999;
  int batteryAvgvolt=-9999;



  
}