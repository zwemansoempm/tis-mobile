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
  TopPage({Key key}) : super(key: key);
  @override
  _TopPageState createState() => _TopPageState();
}

class _TopPageState extends State<TopPage> with SingleTickerProviderStateMixin {
  TabController _tabController;

  // int _currentIndex = 0;
  final List<Widget> _children = [
    HomeWidget(),
    NusingSearch(),
    SearchHospital(),
    JobWidget(),
  ];


  String _connectionStatus = '3';
  final Connectivity _connectivity = Connectivity();
  StreamSubscription<ConnectivityResult> _connectivitySubscription;


  @override
  void initState() {
    super.initState();   

     initConnectivity();
    _connectivitySubscription =
    _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
    _tabController = TabController(vsync: this, length: 4);
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
      print(e.toString());
    } 
    on SocketException catch(e){
        print('socket error');
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
       setState(() => _connectionStatus ='1');
        break;
      case ConnectivityResult.mobile:
       setState(() => _connectionStatus ='2');
        break;
      case ConnectivityResult.none:
        setState(() => _connectionStatus ='3');
        break;
      default:
        setState(() => _connectionStatus ='3');
        break;
    }
  }

  int _selectedIndex = 0; 

  @override
  Widget build(BuildContext context) { 

     return DefaultTabController(
      length: 4, 
      initialIndex: 0, 
      child: Scaffold(       
      body:     
         _connectionStatus=="3"?  
        Center(child: Text('接続ステータス：接続を取得できませんでした。')):
        TabBarView(
          controller: _tabController,
          children: _children,
        ),      
        bottomNavigationBar:          
        BottomAppBar( 
          child: PreferredSize(
            preferredSize: Size.fromWidth(150),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5), topRight: Radius.circular(5)),
                color: Colors.green,
              ),
              height: 60,
              // color: Colors.green,
              child: TabBar(
                onTap: (tabIndex) {
                  setState(() {
                    _selectedIndex = tabIndex;
                  });
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
                            _selectedIndex == 0 ? Colors.green : Colors.white,
                      ),
                      child: Text("ニュース",
                          style: TextStyle(
                            color: _selectedIndex == 0
                                ? Colors.green
                                : Colors.white,
                            fontSize: 10.0,
                          ))),
                  Tab(
                      icon: new Icon(
                        CustomApp.user_md,
                        size: 24,
                        color:
                            _selectedIndex == 1 ? Colors.green : Colors.white,
                      ),
                      child: Text("介護施設検索",
                          style: TextStyle(
                              color: _selectedIndex == 1
                                  ? Colors.green
                                  : Colors.white,
                                   fontSize: 10.0,
                          ))),
                  Tab(
                      icon: new Icon(
                        CustomApp.briefcase_medical,
                        size: 24,
                        color:
                            _selectedIndex == 2 ? Colors.green : Colors.white,
                      ),
                      child: Text("病院検索",
                          style: TextStyle(
                              color: _selectedIndex == 2
                                  ? Colors.green
                                  : Colors.white,
                                   fontSize: 10.0,
                          ))),
                  Tab(
                      icon: new Icon(
                        CustomApp.users,
                        size: 24,
                        color:
                            _selectedIndex == 3 ? Colors.green : Colors.white,
                      ),
                      child: Text("求人検索",
                          style: TextStyle(
                              color: _selectedIndex == 3
                                  ? Colors.green
                                  : Colors.white,
                                   fontSize: 10.0,
                          ))),
                ],
                controller: _tabController,
              ),
            ),
          ),
        ),
      ),
    );
  }
}