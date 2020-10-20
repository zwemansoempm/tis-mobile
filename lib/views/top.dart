import 'package:flutter/material.dart';
import 'package:tis/presentation/custom_app_icons.dart';
import 'package:tis/views/bottom_nav_1.dart';
import 'bottom_nav_2.dart';
import 'bottom_nav_3.dart';

class TopPage extends StatefulWidget{  

  @override
    _TopPageState createState() => _TopPageState();
  }
    
class _TopPageState extends State<TopPage> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomeWidget(),
    SearchWidget(),
    PlaceWidget(),
  ];

  void onTabTapped(int index) {
   setState(() {
     _currentIndex = index;
   });
 }

  @override
  Widget build(BuildContext context) {
      
      return new Scaffold(        
        // No appbar provided to the Scaffold, only a body with a
        // CustomScrollView.
        body:_children[_currentIndex], 
        
        bottomNavigationBar: BottomNavigationBar(
          onTap: onTabTapped, 
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          backgroundColor:Colors.blueGrey[300],
          currentIndex: _currentIndex,
          items: [ 
              BottomNavigationBarItem(
                
                icon: new Icon(CustomApp.newspaper_1, size: 24,),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: new Icon(Icons.search,size: 24,),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.place, size: 24,),
                label: 'Place',
              )
          ],
        ),
      );  
  }
}