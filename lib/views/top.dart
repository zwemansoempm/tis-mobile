import 'dart:async';
import 'dart:io';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tis/presentation/custom_app_icons.dart';
import 'package:tis/screens/hospital/search_hospital.dart';
import 'package:tis/views/bottom_nav_1.dart';
import 'package:tis/views/nusingSearch.dart';
import 'bottom_nav_4.dart';

class TopPage extends StatefulWidget {
  const TopPage({Key key}) : super(key: key);
  @override
  _TopPageState createState() => _TopPageState();
}

class _TopPageState extends State<TopPage> with SingleTickerProviderStateMixin {
  final _sIndexNotifier = ValueNotifier<int>(0);
  final __connectionStatusNotifier = ValueNotifier<String>('3');
  TabController _tabController;  
  // int _selectedIndex = 0;

  // int _currentIndex = 0;
  final List<Widget> _children = [
   const HomeWidget(),
   const NusingSearch(),
   const SearchHospital(),
   const JobWidget(),
  ];


  // String _connectionStatus = '3';
  final Connectivity _connectivity = Connectivity();
  StreamSubscription<ConnectivityResult> _connectivitySubscription;


  @override
  void initState() {
    super.initState();   

     initConnectivity();
    _connectivitySubscription =
    _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
    _tabController = TabController(vsync: this, length: 4);
    _tabController.addListener(() {
    if(_tabController.index != _tabController.previousIndex){
          // Tab Changed swiping to a new tab
          // setState(() {
          //   _selectedIndex =   _tabController.index;
          // });     
          _sIndexNotifier.value=_tabController.index;
      }     
    });
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel(); 
    _tabController.dispose();
    super.dispose();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initConnectivity() async {
    ConnectivityResult result;
    // Platform messages may fail, so we use a try/catch PlatformException.

    try {
      result = await _connectivity.checkConnectivity();
    }
    on PlatformException catch (e) {
      // print(e.toString());
    } 
    on SocketException catch(e){
        // print('socket error');
        print(e.toString());
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }
  
   Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    switch (result) {
      case ConnectivityResult.wifi:
        __connectionStatusNotifier.value='1';
      //  setState(() => _connectionStatus ='1');
        break;
      case ConnectivityResult.mobile:
        __connectionStatusNotifier.value='2';
      //  setState(() => _connectionStatus ='2');
        break;
      case ConnectivityResult.none:
        __connectionStatusNotifier.value='3';
        // setState(() => _connectionStatus ='3');
        break;
      default:
        __connectionStatusNotifier.value='3';
        // setState(() => _connectionStatus ='3');
        break;            
    }
  }


  @override
  Widget build(BuildContext context) { 

     return DefaultTabController(
      length: 4, 
      initialIndex: 0, 
      child: Scaffold(       
      body:ValueListenableBuilder(
          valueListenable: __connectionStatusNotifier,  
          builder: (BuildContext context, value, Widget child){
          return  value=="3"?  
            Center(child: Text('接続ステータス：接続を取得できませんでした。')):
            TabBarView(
              controller: _tabController,
              children: _children,  
            );        
          }
        ), 
        //  _connectionStatus=="3"?  
        // Center(child: Text('接続ステータス：接続を取得できませんでした。')):
        // TabBarView(
        //   controller: _tabController,
        //   children: _children,
        // ),      
        bottomNavigationBar:          
        BottomAppBar( 
          child: PreferredSize(
            preferredSize: Size.fromWidth(150),
            child: ValueListenableBuilder(
                valueListenable: _sIndexNotifier,
                builder: (BuildContext context, value, Widget child) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5), topRight: Radius.circular(5)),
                  color: value==1 || value==2?Color(int.parse("0xff63b7ff")):(value==0?Colors.green:(value == 3
                                    ?Color(int.parse("0xff828282")):Colors.white)),
                  // _selectedIndex==1 || _selectedIndex==2?Color(int.parse("0xff63b7ff")):(_selectedIndex==0?Colors.green:(_selectedIndex == 3
                  //                   ?Color(int.parse("0xff828282")):Colors.white)),
                ),
                height: 65,
                // color: Colors.green,
                child: TabBar(
                  onTap: (tabIndex) {
                    // setState(() {
                    //   _selectedIndex = tabIndex;
                    // });
                     _sIndexNotifier.value=tabIndex;
                  },
                  indicatorColor: Colors.green,
                  indicator: BoxDecoration(
                    color: Colors.white,
                  ),
                  labelStyle: TextStyle(fontSize: 9.0, fontFamily: 'Family Name'),
                  unselectedLabelStyle:
                      TextStyle(fontSize: 6.0, fontFamily: 'Family Name'),
                  // labelColor: Colors.black,
                  tabs: <Widget>[
                    Tab(
                        icon: new Icon(
                          CustomApp.newspaper,
                          size: 24,
                          color:
                             value == 0 ? Colors.green :(value==1 || value==2 || value==3?Colors.white:(Color(int.parse("0xff63b7ff")))),
                              // _selectedIndex == 0 ? Colors.green :(_selectedIndex==1 || _selectedIndex==2 || _selectedIndex==3?Colors.white:(Color(int.parse("0xff63b7ff")))),
                        ),
                        child: Text("ニュース",
                            style: TextStyle(
                              color: value == 0
                                  ? Colors.green
                                  :(value==1 || value==2 || value==3?Colors.white:Color(int.parse("0xff63b7ff"))),
                              fontSize: 10.0,
                            ))),
                    Tab(
                        icon: new Icon(
                          CustomApp.user_md,
                          size: 24,
                          color:
                              value == 1? Color(int.parse("0xff63b7ff")) :Colors.white,
                        ),
                        child: Text("介護施設検索",
                            style: TextStyle(
                                color: value == 1
                                    ? Color(int.parse("0xff63b7ff"))
                                   :Colors.white,
                                     fontSize: 9.0,
                            ))),
                    Tab(
                        icon: new Icon(
                          CustomApp.briefcase_medical,
                          size: 24,
                          color:
                             (value==1 || value==0  || value==3 ?Colors.white: Color(int.parse("0xff63b7ff"))),
                        ),
                        child: Text("病院検索",
                            style: TextStyle(
                                color:(value==1 || value==0 || value==3?Colors.white:Color(int.parse("0xff63b7ff"))),
                                     fontSize: 10.0,
                            ))),
                    Tab(
                        icon: new Icon(
                          CustomApp.users,
                          size: 24,
                          color:value == 3
                                    ?Color(int.parse("0xff828282")):
                              (value==1 || value==0 || value==2 ?Colors.white:Color(int.parse("0xff63b7ff"))),
                        ),
                        child: Text("求人検索",
                            style: TextStyle(
                                color: value == 3
                                    ?Color(int.parse("0xff828282"))
                                    :(value==1 || value==0 || value==2?Colors.white:Color(int.parse("0xff63b7ff"))),
                                     fontSize: 10.0,
                            ))),
                  ],
                  controller: _tabController,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}