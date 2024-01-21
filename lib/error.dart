import 'package:flutter/material.dart';
import 'package:tozero/bottomBarWidget.dart';
import 'package:tozero/home.dart';

class Error extends StatelessWidget {


  
  const Error({super.key,});
  
  Widget _showErrors() {
  return SingleChildScrollView(
    child: Center(
      child: SingleChildScrollView(
        child: Column(


          
          children:Home.main_errors.isEmpty
          ? [
            SizedBox(height:280,),
            Container(
            child: Text('No errors to display',style:TextStyle(fontSize:20,color:Color(0xFFC70039)
            ),
            )
            )
            ]:
           Home.main_errors.map((value) => _getErrorContainer(value)).toList(),
        ),
      ),
    ),
  );
}

Widget _getErrorContainer(String value) {
  return Container(
    height: 50,
    child: Row(
      children: <Widget>[
        
        Expanded(
          child: Column(
            children: <Widget>[
              Icon(Icons.error, color: Color(0xFFC70039)),
              Text(
                value,
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xFF040D12),
      body: _showErrors(),
      bottomNavigationBar:bottomNavBarWidget(context:context,selectedIndex:1,)
    );
  }
}


