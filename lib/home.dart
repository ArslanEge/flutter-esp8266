import 'package:flutter/material.dart';
import 'package:tozero/can_get.dart';

import 'dart:io';

import 'package:tozero/bottomBarWidget.dart';
import 'package:tozero/can_widget.dart';
import 'package:tozero/circle_wigit.dart';

import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


import 'package:web_socket_channel/io.dart';

class Home extends StatefulWidget {
  static List<String> main_errors = [];

  

   
  

  const Home({Key? key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

    String connectionStatus = "Disconnected";


    IOWebSocketChannel? channel;


    var canget = new canGet();

    

    void call() {
    canget.onPageUpdate = updatePage;
    
  }

  void updatePage() {
    setState(() {});
  }

    @override
  void initState() {
     connectToWebSocket();

    print("BU EKRAN BİR DENEMEDİR");
    super.initState();
    call();
   
  }

  void connectToWebSocket() async {
    print("BABA BURADA");
    try {
      // Establish the WebSocket connection using dart:io
      final socket = await WebSocket.connect("wss://web-production-66fe.up.railway.app/ws");
      // Wrap the WebSocket in a channel
      channel = IOWebSocketChannel(socket);


      setState(() {
        connectionStatus = "Connected";
      });

      channel!.stream.listen(
        (message) {

          print(message);



          canget.assignValues(message);
        },
        onError: (error) {
          // Handle stream errors
          print(error);
          setState(() {
            connectionStatus = "Error in stream";
          });
        },
        onDone: () {
          // Handle connection closure
          setState(() {
            connectionStatus = "Disconnected";
          });
        },
      );
    } catch (e) {
      print(e);
      setState(() {
        connectionStatus = "Server not available";
      });
    }
  }

  void sendMessage(String message) {
    if (channel != null) {
      channel!.sink.add(message);
    }
  }

  void disconnect() {
    channel?.sink.close();
  }

  @override
  void dispose() {
    disconnect();
    super.dispose();
  }
    

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
        backgroundColor: Color(0xFF121212), //Color.fromARGB(255, 115, 96, 96),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          height: 200,
                          width: 200,
                          child: LiquidCircularProgressIndicator(
                              value: canget.canValue.batterySoc.toDouble() /
                                  100, // Defaults to 0.5.
                              valueColor: AlwaysStoppedAnimation(Color(
                                  0xFF00E676)), // Defaults to the current Theme's accentColor.
                              backgroundColor: Colors
                                  .white, // Defaults to the current Theme's backgroundColor.
                              borderColor: Colors.transparent,
                              borderWidth: 5.0,
                              direction: Axis
                                  .vertical, // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.vertical.
                              center: Text(
                                canget.canValue.formattedSoc,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 25),
                              ))),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                      "SOC%",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),  
                                    
                        
                      Image.asset(
                        
                        "assets/images/image.png",
                        width: 350,
                        height: 120,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width / 15,
                            right: MediaQuery.of(context).size.width / 15,
                            ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            canWidget(
                                controller: canget.canValue.batteryMaxCellVoltageController,
                                textname: "Max Volt ",
                                value:canget.canValue.batteryMaxCellVoltage,
                                icon: Icon(
                                  FontAwesomeIcons.bolt,
                                  size: 20,
                                  color: Colors.white,
                                ),
                                suffix: "mV"),
                            canWidget(
                                controller: canget.canValue.batterryMaxCellTemperatureController,
                                textname: "Max Temp ",
                                value:canget.canValue.batteryMaxCellTemperature,
                                icon: Icon(
                                Icons.device_thermostat,
                                size: 20,
                                color: Colors.white,
                              ),
                                suffix: "C")
                          ],
                        ),
                      ),
                      
                      Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width / 15,
                            right: MediaQuery.of(context).size.width / 15,
                            top: MediaQuery.of(context).size.height / 40,
                            ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            canWidget(
                                controller: canget.canValue.batteryvoltageController,
                                textname: "Voltage ",
                                value:canget.canValue.batteryVoltage,
                                icon: Icon(
                                  FontAwesomeIcons.bolt,
                                  size: 20,
                                  color: Colors.white,
                                ),
                                suffix: "V"),
                            canWidget(
                                controller: canget.canValue.batterycurrentController,
                                textname: "Current ",
                                value:canget.canValue.batteryCurrent,
                                icon: Icon(
                                  FontAwesomeIcons.bolt,
                                  size: 20,
                                  color: Colors.white,
                                ),
                                suffix: "A")
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height / 40,
                            left: MediaQuery.of(context).size.width / 15,
                            right: MediaQuery.of(context).size.width / 15
                            )
                            ,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            canWidget(
                                controller: canget.canValue.batteryEnegryAvailableController,
                                textname: "Energy ",
                                value:canget.canValue.batteryEnegryAvailable,
                                icon: Icon(
                                  FontAwesomeIcons.bolt,
                                  size: 20,
                                  color: Colors.white,
                                ),
                                suffix: "Ah"),
                            canWidget(
                                controller: canget.canValue.batterySohController,
                                value:canget.canValue.batterySoh,
                                textname: "SOH% ",
                                icon: Icon(
                                  
                                  
                                  FontAwesomeIcons.bolt,
                                  size: 20,
                                  color: Colors.white,
                                  
                                ),
                                suffix: "Ah")
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height / 40,
                            left: MediaQuery.of(context).size.width / 15,
                            right: MediaQuery.of(context).size.width / 15
                            )
                        ,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            canWidget(
                                controller: canget.canValue.batteryAvgvoltController,
                                textname: "Avg Volt ",
                                value:canget.canValue.batteryAvgvolt,
                                icon: Icon(
                                  FontAwesomeIcons.bolt,
                                  size: 20,
                                  color: Colors.white,
                                ),
                                suffix: "V"),
                            canWidget(
                                controller: canget.canValue.batteryAvgtempController,
                                textname: "Avg Temp ",
                                value:canget.canValue.batteryAvgtemp,
                                icon: Icon(
                                Icons.device_thermostat,
                                  size: 20,
                                  color: Colors.white,
                                ),
                                suffix: "C"),
                          ],
                        ),
                      ),
                     
                    ]),
              ),
              
             
              
            ],
          ),
        )),
        

      

      
      
    );
  }
}




