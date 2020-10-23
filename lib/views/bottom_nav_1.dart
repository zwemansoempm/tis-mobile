import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tis/bloc/get_source_news_bloc.dart';
import 'package:tis/elements/loader.dart';
import 'package:tis/model/article.dart';
import 'package:tis/model/article_response.dart';
import 'package:tis/model/source.dart';
import 'package:tis/screens/news_detail.dart';
import 'package:tis/views/search.dart';
import 'package:tis/views/settingScreen.dart';
import 'package:tis/style/theme.dart' as Style;
import 'package:timeago/timeago.dart' as timeago;

class HomeWidget extends StatefulWidget {
 final SourceModel source;
 final List<String> list=List.generate(20, (index) => "Textto $index");
 HomeWidget({Key key, @required this.source}) : super(key: key);
  @override
  _BottomNav1State createState() => _BottomNav1State(source);

}  

class _BottomNav1State  extends State<HomeWidget> with SingleTickerProviderStateMixin { 
  final SourceModel source;
  _BottomNav1State(this.source);

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
    getSourceNewsBloc..getSourceNews("abc-news");
  }

  @override
  void dispose() {
    _controller?.dispose();
    getSourceNewsBloc.drainStream();
    super.dispose();
  } 

  @override
  Widget build(BuildContext context) {        
      
         return Container(
                child: CustomScrollView(              
                slivers: <Widget>[                 
                // Add the app bar to the CustomScrollView.
                  SliverAppBar(
                    floating: true,
                    pinned: true,
                    snap: true,
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
                          Column(
                              children: [
                                // Container(
                                //     padding: EdgeInsets.only(left: 15.0, right: 15.0, bottom: 15.0),
                                //     color: Style.Colors.mainColor,
                                //     width: MediaQuery.of(context).size.width,
                                //     child: Column(
                                //       children: [
                                //           Hero(
                                //               tag:source.id,
                                //               child: SizedBox(
                                //                 height: 80.0,
                                //                 width: 80.0,
                                //                 child: Container(
                                //                         decoration: BoxDecoration(
                                //                         border: Border.all(width: 2.0, color: Colors.white),
                                //                         shape: BoxShape.circle,
                                //                         image: DecorationImage(
                                //                         image: AssetImage("assets/logos/${source.id}.png"),
                                //                         fit: BoxFit.cover)),
                                //                 )
                                //               ),
                                //           )
                                //       ]
                                //     ),
                                // ),   
                                Expanded(child: StreamBuilder<ArticleResponse>(
                                    stream: getSourceNewsBloc.subject.stream,
                                    builder: (context, AsyncSnapshot<ArticleResponse> snapshot) {
                                      if (snapshot.hasData) {
                                        if (snapshot.data.error != null &&
                                            snapshot.data.error.length > 0) {
                                          return Container();
                                        }
                                        return _buildSourceNewsWidget(snapshot.data);                                 
                                      } else if (snapshot.hasError) {
                                        return Container();
                                      } else {
                                        return buildLoadingWidget();
                                      }
                                    },
                                ))                            
                              ]
                          ),
                          // Center(child: Text("ニュース")),
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


  Widget _buildSourceNewsWidget(ArticleResponse data) {
    List<ArticleModel> articles = data.articles;

    if (articles.length == 0) {
      return Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "No more news",
              style: TextStyle(color: Colors.black45),
            ),
          ],
        ),
      );
    } else
      return ListView.builder(
          itemCount: articles.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
               Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailNews(
                                article: articles[index],
                              )));
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: Colors.grey[200], width: 1.0),
                  ),
                  color: Colors.white,
                ),
                height: 150,
                child: Row(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(
                          top: 10.0, left: 10.0, bottom: 10.0, right: 10.0),
                      width: MediaQuery.of(context).size.width * 3 / 5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          
                          Text(
                              articles[index].title,
                              maxLines: 3,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 14.0)),
                          Expanded(
                              child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Text(
                                        timeUntil(
                                            DateTime.parse(articles[index].date)),
                                        style: TextStyle(
                                            color: Colors.black26,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10.0))
                                  ],
                                ),
                              ],
                            ),
                          ))
                        ],
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.only(right: 10.0),
                        width: MediaQuery.of(context).size.width * 2 / 5,
                        height: 130,
                        child: 
                        FadeInImage.assetNetwork(
                            alignment: Alignment.topCenter,
                            placeholder: 'assets/img/placeholder.jpg',
                            image: articles[index].img == null
                                ? "http://to-let.com.bd/operator/images/noimage.png"
                                : articles[index].img,
                            fit: BoxFit.fitHeight,
                            width: double.maxFinite,
                            height: MediaQuery.of(context).size.height * 1 / 3))
                  ],
                ),
              ),
            );
          });
  }
  String timeUntil(DateTime date) {
  return timeago.format(date, allowFromNow: true, locale: 'en');
}
}

class TabData {
  TabData({this.title, this.color});

  final String title;
  final Color color;
}

  