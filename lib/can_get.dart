import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:tozero/can_error.dart';
import 'package:tozero/can_values.dart';
import 'package:tozero/home.dart';
import 'dart:io' show Platform;
import 'dart:async';


class canGet{

  
  String recivedMessage = "";
   String message = "";
   int number_of_battery=0;
  int index=0;
  List<int>temp_volts=[];
  var can = new canError();

  Function()? onPageUpdate;
  var canValue=new CanValues();

  void assignValues(String message){

    String id =extractId(message);
    List<String> datas=extractDataValues(message);

    print(id+datas.toString());

    switch(id){
      case '401':
         handle401(datas);
         break;

      case '403':
         handle403(datas);
         break;
      case '404':
         handle404(datas);
         break;

    }



  onPageUpdate!();
  }

  void handle401(List<String> datas){
    print("BABA 401 DE");

    canValue.batteryCurrent=hexToDecimal(datas,[0,1]);
    canValue.batteryCurrent=(canValue.batteryCurrent/10).toInt();
    canValue.batteryCurrent-=1000;
    print("GELEN DEĞERR");
    print("CURRENT GELİYORRR");
    print(canValue.batteryCurrent);
    canValue.batterycurrentController.value=canValue.batteryCurrent;
    print(canValue.batterycurrentController.value);

    canValue.batteryVoltage=hexToDecimal(datas,[2,3]);
    canValue.batteryVoltage=(canValue.batteryVoltage/10).toInt();
    canValue.batteryvoltageController.value=canValue.batteryVoltage;

    canValue.batterySoc=hexToDecimal(datas,[4,4]);
    canValue.formattedSoc=canValue.batterySoc.toString();

    canValue.batterySoh=hexToDecimal(datas,[5,5]);
    canValue.batterySohController.value=hexToDecimal(datas,[5,5]);


    canValue.batteryEnegryAvailable=hexToDecimal(datas,[6,6]);
    canValue.batteryEnegryAvailableController.value=hexToDecimal(datas,[6,6]);

    print("SIKINTI YOK");



 }
void handle403(List<String> datas){
  print("BABA 403 DE");
  canValue.batteryMaxCellTemperature=hexToDecimal(datas, [0,0]);
  canValue.batteryMaxCellTemperature-=50;
  canValue.batterryMaxCellTemperatureController.value=canValue.batteryMaxCellTemperature;
  print("GELEN DEĞER");
  print(canValue.batteryMaxCellTemperature);
  canValue.batteryMinCellTempeatrue=hexToDecimal(datas, [1,1]);
  canValue.batteryMinCellTempeatrue-=50;
  print("SIKINTI YOK");

  canValue.batteryAvgtemp=hexToDecimal(datas, [2,2]);
  canValue.batteryAvgtemp-=50;
  canValue.batteryAvgtempController.value=canValue.batteryAvgtemp;

}
void handle404(List<String> datas){
  print("BABA 404 DE");
  canValue.batteryMaxCellVoltage=hexToDecimal(datas,[0,1]);
  canValue.batteryMaxCellVoltageController.value=hexToDecimal(datas,[0,1]);
  print("GELEN DEĞER");
  print(canValue.batteryMaxCellVoltage);
  canValue.batteryMinCellVoltage=hexToDecimal(datas,[2,3]);
  print("SIKINTI YOK");

  canValue.batteryAvgvolt=hexToDecimal(datas,[4,5]);
  canValue.batteryAvgvoltController.value=hexToDecimal(datas,[4,5]);


}

  String extractId(String input) {
  // Use a regular expression to find the ID in the string
  final idRegex = RegExp(r'Id is (\d+)');
  final match = idRegex.firstMatch(input);

  if (match != null && match.groupCount >= 1) {
    return match.group(1) ?? "No ID found";
  } else {
    return "No ID found";
  }
}

List<String> extractDataValues(String input) {
  // Split the string by spaces and find the part after "data is"
  final parts = input.split('data is ');
  print(parts);
  print(parts[1]);
  if (parts.length > 1) {
    // Split the second part by spaces to get individual data values
    List<String>temp= parts[1].trim().split(' ');
    print(temp);
    for(int i=0; i<temp.length; i++){
      if(temp[i].length==1){
        String dummy="0";
        dummy+=temp[i];
        temp[i]=dummy;
      }
    }
    return temp;
  } else {
    return [];
  }
}

int hexToDecimal(List<String> hexList, List<int> indices) {
  if (indices.length != 2 || indices[0] < 0 || indices[1] >= hexList.length) {
    throw Exception('Invalid indices');
  }

  // Extracting the hex values at the given indices and concatenating them
  String concatenatedValues = '';
  int index=0;
  for (int i = indices[0]; i <= indices[1]; i++) {
    if(index==1){
      String temp='';

      temp=hexList[i];
      temp+=concatenatedValues;
      concatenatedValues=temp;
      
      

    }else{
    concatenatedValues += hexList[i];

    }
    index++;
  }

  // Converting the concatenated hex value to decimal
  return int.parse(concatenatedValues, radix: 16);
}






}