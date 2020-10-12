import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();    
    // State<StatefulWidget> createState() {  
    //   throw UnimplementedError();
    // }
  }
  
class _HomePageState extends State<HomePage>  {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
          // automaticallyImplyLeading: false, 
          leading: IconButton(
            onPressed: (){
              print("Home");
            },
            icon: Icon(Icons.dehaze),   
            // alignment:A,
          ),
          actions: [
              IconButton(icon: Icon(Icons.dehaze), onPressed: (){
                      print("Menu");
              })
          ],
      ),
    );
  }
}