import 'package:flutter/material.dart';
import 'package:tis/views/search.dart';
import 'package:tis/views/settingScreen.dart';

class HomeWidget extends StatefulWidget {
 final List<String> list=List.generate(20, (index) => "Textto $index");
  @override
  _BottomNav1State createState() => _BottomNav1State();

}
  
class _BottomNav1State  extends State<HomeWidget> with SingleTickerProviderStateMixin { 

    TabController _controller;
  List<TabData> _tabData;
  List<Tab> _tabs = [];
  //List<Widget> _tabViews = [];
  Color _activeColor;

  @override
  void initState() {
    super.initState();
    _tabData = [
      TabData(title: 'ニュース', color: Colors.red),
      TabData(title: '介護施設検索', color: Colors.green),
      TabData(title: '病院検索', color: Colors.blue),
      TabData(title: '求人検索', color: Colors.orange),
    ];
    _activeColor = _tabData.first.color;
    _tabData.forEach((data) {
      final tab = Tab(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5)),
            color: data.color,
          ),
          constraints: BoxConstraints.expand(),
          
          child: Center(
            child: Text(data.title,),
          ),
        ),
      );
      _tabs.add(tab);

      // final widget = Scaffold(
        
      // );
      // _tabViews.add(widget);
    });
    _controller = TabController(vsync: this, length: _tabData.length)
      ..addListener(() {
        setState(() {
          _activeColor = _tabData[_controller.index].color;
        });
      });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
 
  @override
  Widget build(BuildContext context) {        

         return Container(
                child: CustomScrollView(              
                slivers: <Widget>[                 
                // Add the app bar to the CustomScrollView.
                  SliverAppBar(
                    backgroundColor:Colors.black,
                    automaticallyImplyLeading: false,
                    leading: IconButton(      
                      padding: new EdgeInsets.all(15.0),          
                      icon:new Icon(Icons.refresh),// Image.asset("assets/images/refresh.png"),
                      onPressed: () {  },                 
                    ),
                      centerTitle: true,
                      title: Row( //Transform(                    
                            // you can forcefully translate values left side using Transform
                            // transform:MediaQuery.of(context).size.width>1000?Matrix4.translationValues(MediaQuery.of(context).size.width/3.5, 0.0, 0):
                            // MediaQuery.of(context).size.width>700?Matrix4.translationValues(MediaQuery.of(context).size.width/4.3, 0.0, 0):
                            // MediaQuery.of(context).size.width>417 || MediaQuery.of(context).size.width>680 ?Matrix4.translationValues(MediaQuery.of(context).size.width/25, 0.0, 0):
                            // Matrix4.translationValues(-15, 0.0, 0),
                            // transform:MediaQuery.of(context).size.width>417 || MediaQuery.of(context).size.width>680 ?Matrix4.translationValues(MediaQuery.of(context).size.width/25, 0.0, 0):Matrix4.translationValues(-15, 0.0, 0),
                            // child: Row(
                              
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[ 
                                  SizedBox(
                  
                                          // height:MediaQuery.of(context).size.height,
                                          // width: MediaQuery.of(context).size.width>1000?MediaQuery.of(context).size.width/0.5:
                                          //         MediaQuery.of(context).size.width>700?MediaQuery.of(context).size.width/0.5:
                                          //         MediaQuery.of(context).size.width>417 ||  MediaQuery.of(context).size.width>680 ?MediaQuery.of(context).size.width/0.5:
                                          //         MediaQuery.of(context).size.width/1.7,//1.4
                                                // width: MediaQuery.of(context).size.width>417 ||  MediaQuery.of(context).size.width>680 ?MediaQuery.of(context).size.width/1.5:MediaQuery.of(context).size.width/1.4,
                                          child: new IconButton(                  
                                                  icon:new Icon(Icons.search), // Image.asset("assets/images/s1.png"),
                                                  onPressed: (){
                                                    showSearch(context: context,delegate: SearchScreen(widget.list));
                                                  },
                                          ),  
                                                                              
                                  ), 
                                  new RaisedButton(
                                          color: Colors.black.withOpacity(0.05),
                                          onPressed: () {  showSearch(context: context,delegate: SearchScreen(widget.list)); },
                                          child: new Text("Search News...", style: TextStyle(color: Colors.lightBlue)),
                                  ),                               
                              ],
                          // ),
                        ),
                      
                      bottom: TabBar(
                        indicator: UnderlineTabIndicator(
                          borderSide: BorderSide(width: 5,color: _activeColor),
                          insets: EdgeInsets.symmetric(horizontal:800.0),
                        ),
                        // indicator: BoxDecoration(
                        //     borderRadius: BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5)),
                        // ),
                        
                        indicatorColor: _activeColor,
                        labelPadding: EdgeInsets.zero,
                        labelColor: Colors.white,
                        controller: _controller,
                        tabs: _tabs,
                      ),
                      
                        
                      actions: [
                        IconButton(
                          icon:new Icon(Icons.settings),//Image.asset("assets/images/setting.png"), 
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>SettingScreen()));
                          },
                        )
                      ],               
                      // Allows the user to reveal the app bar if they begin scrolling
                      // back up the list of items.
                      floating: true,
                      // Display a placeholder widget to visualize the shrinking size.
                      // flexibleSpace: Placeholder(),
                      // Make the initial height of the SliverAppBar larger than normal.
                      // expandedHeight: 100,
                  ),                 
                  // Next, create a SliverList
                  //SliverList(
                    // Use a delegate to build items as they're scrolled on screen.
                    // delegate: SliverChildBuilderDelegate(
                      
                    //     // The builder function returns a ListTile with a title that
                    //     // displays the index of the current item.
                    //     (context, index) => ListTile(title: Text(widget.list[index])),//'Item #$index'
                    //     // Builds 200 ListTiles
                    //     childCount: 20,
                    // )
                    SliverFillRemaining(
                      child: TabBarView(
                        controller: _controller,
                        children: [
                          Center(child: Text("ニュース")),
                          Center(child: Text("介護施設検索")),
                          Center(child: Text("病院検索")),
                          Center(child: Text("求人検索")),
                        ],
                      ),
                    ),
                  //),
                
                ]
            ),
        ); 
  }
}

class TabData {
  TabData({this.title, this.color});

  final String title;
  final Color color;
}