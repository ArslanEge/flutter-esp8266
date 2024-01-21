import 'package:flutter/material.dart';
import 'package:tozero/home.dart';
import 'package:tozero/error.dart';





// ignore: must_be_immutable
class bottomNavBarWidget extends StatelessWidget {

 
  BuildContext context;
  int selectedIndex;
  bottomNavBarWidget({
    required this.selectedIndex,
    required this.context,
    Key? key,
  }) : super(key: key);
  final List<Widget> _pages = [
    Home(), // Replace with your page widgets
    Error(),
  ];
  
  
  void _onItemTapped(int index){

      //BluetoothDeviceClass.device.disconnect();

      selectedIndex = index;

      Navigator.push(
                 context,
                 MaterialPageRoute(builder: (context) => _pages[selectedIndex]),
                );
  

  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor:Color.fromARGB(255, 34, 33, 33),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.error),
            label: 'ERRORS',
          ),
          
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
        selectedFontSize: 12, // Font size for selected item label
        unselectedFontSize: 12,
      );
      
  }
}
