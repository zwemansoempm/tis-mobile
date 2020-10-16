import 'package:flutter/material.dart';

class SettingScreen extends  StatefulWidget{
  @override 
     _SettingScreen createState() => _SettingScreen();  
}

class _SettingScreen extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
      return Scaffold(
          appBar: AppBar(
            backgroundColor:Color(0xffffffff),
            leading: BackButton(
              color: Colors.black
            ),
            title: Text('Settings',style: TextStyle(
              color: Colors.black
            )),
          ),
      );
  }

}