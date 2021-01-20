import 'package:flutter/material.dart';
import 'package:tis/presentation/custom_app_icons.dart';
import 'package:tis/views/bottom_nav_1.dart';
import 'bottom_nav_2.dart';
import 'bottom_nav_3.dart';
import 'bottom_nav_4.dart';

class TopPage extends StatefulWidget {
  TopPage({Key key}) : super(key: key);
  @override
  _TopPageState createState() => _TopPageState();
}

class _TopPageState extends State<TopPage> with SingleTickerProviderStateMixin {
  TabController _tabController;

  int _currentIndex = 0;
  final List<Widget> _children = [
    HomeWidget(),
    SearchWidget(),
    PlaceWidget(),
    JobWidget(),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 4);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4, // Added
      initialIndex: 0, //Added
      child: Scaffold(
        // No appbar provided to the Scaffold, only a body with a
        // CustomScrollView.
        body: //_children[_currentIndex],
            TabBarView(
          controller: _tabController,
          children: _children,
        ),
        bottomNavigationBar: BottomAppBar(
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
                                  : Colors.white))),
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
                                  : Colors.white))),
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
                                  : Colors.white))),
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
