import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:tis/bloc/get_all_news_search_bloc.dart';
import 'package:tis/bloc/get_hotnews_bloc.dart';
import 'package:tis/bloc/get_latest_post_all_cat_bloc.dart';
import 'package:tis/bloc/get_medical_2_bloc.dart';
import 'package:tis/bloc/get_postsnews_bloc.dart';
// import 'package:tis/bloc/get_source_news_bloc.dart';
import 'package:tis/elements/loader.dart';
import 'package:tis/model/article.dart';
import 'package:tis/model/article_response.dart';
import 'package:tis/model/medical.dart';
import 'package:tis/model/medical_response.dart';
import 'package:tis/model/medical_response2.dart';
import 'package:tis/model/posts.dart';
import 'package:tis/model/posts_response.dart';
// import 'package:tis/model/source.dart';
import 'package:tis/screens/news_detail.dart';
import 'package:tis/views/jobapply.dart';
import 'package:tis/views/jobapplythree.dart';
import 'package:tis/views/jobapplytwo.dart';
import 'package:tis/views/jobsearch.dart';
import 'package:tis/views/nusingSearch.dart';
import 'package:tis/views/search.dart';
import 'package:tis/views/jobsearch.dart';
import 'package:tis/views/jobdetail.dart';
import 'package:tis/views/settingScreen.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:html/parser.dart';



class HomeWidget extends StatefulWidget {

 final List<String> list=List.generate(20, (index) => "Textto $index");
  @override
  _BottomNav1State createState() => _BottomNav1State();//source

}  

class _BottomNav1State  extends State<HomeWidget> with SingleTickerProviderStateMixin { 

  TabController _controller;
  List<TabData> _tabData;
  List<Tab> _tabs = [];

  Color _activeColor;
  
  @override
  void initState() {    
    super.initState(); 
    // double devprev=DevicePreview.of(context).mediaQuery.size.width;
    _tabData = [
      TabData(title: '  トップ  ', color: Color(0xff287db4)),
      TabData(title: '  病院・医療  ', color:Color(0xffa3774a)),
      TabData(title: '  特養・介護  ', color:Color(0xff9579ef)),
      TabData(title: '  有料老人ホーム  ', color: Color(0xff20d1de)),

      TabData(title: '  訪問介護・看護  ', color: Color(0xffd1281c)),
      TabData(title: '  テストカテゴリー  ', color: Color(0xff287db4)),
      TabData(title: '  デイサービス  ', color: Color(0xffa3774a)),
      TabData(title: '  グループホーム  ', color: Color(0xff9579ef)),
      TabData(title: '  新型コロナ  ', color: Color(0xff20d1de)),
      TabData(title: '  その他  ', color: Color(0xffd1281c)),
    ];
    _activeColor = _tabData.first.color;
    _tabData.forEach((data) {
      final tab = Tab(
        child: PreferredSize(
                  preferredSize: Size.fromWidth(150),
                  child: Container(
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5)),
                  color: data.color,
              ),
            child: Center(
              child: Text(data.title,style: TextStyle(fontSize:15)),//(devprev==768 || (devprev>768 && devprev<1024 ))?20:(devprev>=1024)?24:15) 
            ),
          ),
        ),
      );
      _tabs.add(tab);
    });
    _controller = TabController(vsync: this, length: _tabData.length)
      ..addListener(() {
        setState(() {
          _activeColor = _tabData[_controller.index].color;
        });
      });
    // getSourceNewsBloc..getSourceNews("abc-news");
    getPostsNewsBloc..getPostsNews();
    getLatestPostAllCatBloc..getLatestPostAllCat();
    getAllNewsSearchBloc..getAllNewsSearch();
    getMedical2Bloc..getMedical2();
  }

  @override
  void dispose() {
    _controller?.dispose();
    // getSourceNewsBloc.drainStream();
    getPostsNewsBloc.drainStream();
    getLatestPostAllCatBloc.drainStream();
    getAllNewsSearchBloc.drainStream();
    getMedical2Bloc.drainStream();
    super.dispose();
  } 

  @override
  Widget build(BuildContext context) {
                                     
         return Container(
                child: CustomScrollView(    
                // physics: NeverScrollableScrollPhysics(),  
                // shrinkWrap: true,        
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
                    title: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[ 
                          SizedBox(
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
                        ),
                      
                      bottom: TabBar(
                        isScrollable: true,
                        indicator: UnderlineTabIndicator(
                          borderSide: BorderSide(width: 5,color: _activeColor),
                          insets: EdgeInsets.symmetric(horizontal:800.0),
                        ),
                        indicatorColor: _activeColor,
                        labelPadding: EdgeInsets.fromLTRB(1,0,1.0,0),
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
                  ), 
                    
                    SliverFillRemaining(
                 
                      child: TabBarView(
                        controller: _controller,
                        children: [
                          ListView(
                           children:[                              
                                      Container(
                                     
                                         child: StreamBuilder<PostsResponse>(
                                              stream: getPostsNewsBloc.subject.stream,
                                              builder: (context, AsyncSnapshot<PostsResponse> snapshot) {
                                                    if (snapshot.hasData) {
                                                      if (snapshot.data.error != null &&
                                                          snapshot.data.error.length > 0) {
                                                        return Container();
                                                      }  //return Container();
                                                      return _buildSourceNewsWidget(snapshot.data);                                 
                                                    } else if (snapshot.hasError) {
                                                      return Container();
                                                    } else {
                                                      return buildLoadingWidget();
                                                    }
                                                  },
                                          ),                                         
                                      ), 
                                      Container(
                                            child:  StreamBuilder<PostsResponse>(
                                               stream: getLatestPostAllCatBloc.subject.stream,
                                               builder: (context, AsyncSnapshot<PostsResponse> snapshot) {
                                                  if (snapshot.hasData) {
                                                    if (snapshot.data.error != null &&
                                                        snapshot.data.error.length > 0) {
                                                      return Container();
                                                    }
                                                    return  _getLatestPostAllCatWidget(snapshot.data);                                 
                                                  } else if (snapshot.hasError) {
                                                    return Container();
                                                  } else {
                                                    return Container();//buildLoadingWidget();
                                                  }
                                               },
                                          ),
                                      ),  
                                      Container(                                        //  height: 30, 
                                         decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border(
                                                top: BorderSide(
                                                    color:Color(0xffd1281c),
                                                    width: 1.0
                                                ),
                                            )
                                        ),
                                        child:  Row(                                                                                
                                          children: [
                                            SizedBox(                                            
                                               width:MediaQuery.of(context).size.width/4,
                                               child:  Text('病院・医療',textScaleFactor: 1,style:TextStyle( 
                                                                fontWeight: FontWeight.bold,
                                                                color: Color(0xffd1281c),                                                          // fontSize: 10.0
                                                      ),textAlign: TextAlign.center,
                                                ),
                                            ),
                                              SizedBox(
                                              width:150 ),
                                           SizedBox(
                                              width: MediaQuery.of(context).size.width/3,
                                              child:  Text('新着ニュース一覧',textScaleFactor: 0.7,style:TextStyle( 
                                                                fontWeight: FontWeight.normal,
                                                                color: Color(0xff999999),                                                          // fontSize: 10.0
                                                      ),textAlign: TextAlign.center,
                                            ),) 
                                          ],
                                        ),                                       
                                      ) ,
                                      Container(
                               
                                            margin: EdgeInsets.symmetric(vertical: 10.0),
                                            height: 202.0,
                                            child: new ListView(
                                            scrollDirection: Axis.horizontal,
                                            children: <Widget>[
                                              StreamBuilder<MedicalResponse>(
                                                stream: getAllNewsSearchBloc.subject.stream,
                                                builder: (context, AsyncSnapshot<MedicalResponse> snapshot) {
                                                    if (snapshot.hasData) {
                                                      if (snapshot.data.error != null &&
                                                              snapshot.data.error.length > 0) {
                                                        return Container();
                                                      }                                                     
                                                      return  _getMedicalWidget(snapshot.data);                                 
                                                    } else if (snapshot.hasError) {
                                                      return Container();
                                                    } else {
                                                      return Container();//buildLoadingWidget();
                                                    }
                                                },
                                            ),
                                             StreamBuilder<MedicalResponse2>(
                                                stream: getMedical2Bloc.subject.stream,
                                                builder: (context, AsyncSnapshot<MedicalResponse2> snapshot) {
                                                    if (snapshot.hasData) {
                                                      if (snapshot.data.error != null &&
                                                              snapshot.data.error.length > 0) {
                                                        return Container();
                                                      }                                                    
                                                      return  _getMedical2Widget(snapshot.data);                                 
                                                    } else if (snapshot.hasError) {
                                                      return Container();
                                                    } else {
                                                      return Container();//buildLoadingWidget();
                                                    }
                                                },
                                            ),                                             
                                            ],
                                          ) 
                                       ), 
                           ]                          
                         ),                          
                          NusingSearch(),
                          Center(child: Text("")),
                          Center(child: Text("")),
                          Center(child: Text("")),
                          // Center(child: Text("")),
                          Center(child: Text("")),
                          Center(child: Text("")),
                          Center(child: Text("")),
                          Center(child: Text("")),
                          JobSearch(),
                        ],
                      ),
                    ),     
                ]
            ),
        ); 
  }
  Widget _getMedical2Widget(MedicalResponse2 data){
       List<MedicalModel> medical = data.medical;  

       return  Container(
            width:200,
            height: 200,
            child: SizedBox(
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical, 
                  itemCount: 3,
                  itemBuilder: (context, index) {
                         return GestureDetector(
                              child:  Column(
                                children: [
                                    Container(
                                      width: 200.0,
                                      child: Card(
                                        child: 
                                          Wrap(
                                            direction: Axis.horizontal,
                                            spacing: 0.0, // gap between adjacent chips
                                            runSpacing: 0.0, // gap between lines
                                            children: <Widget>[
                                                  Row(
                                                       mainAxisAlignment: MainAxisAlignment.start,                                  
                                                       children: [
                                                          ( medical[index] !=null ) ?  Container(   
                                                          margin: const EdgeInsets.only(left: 0.0, top: 0, right: 0.0,bottom: 0.0),
                                                          padding:EdgeInsets.only(right:10),//EdgeInsets.all(10.0),                               
                                                          width:70,//fotoSize(context),//MediaQuery.of(context).size.width/ 0.7, //MediaQuery.of(context).size.width * 2 / 5,
                                                          height: 50,
                                                          child: 
                                                            FadeInImage.assetNetwork(
                                                            fadeInDuration: const Duration(seconds: 2),
                                                            alignment: Alignment.topLeft,
                                                            placeholder: 'assets/img/placeholder.jpg',
                                                            image: "https://test.t-i-s.jp/upload/news/"+medical[index].photo,
                                                            fit: BoxFit.fitHeight,
                                                            width: double.maxFinite,
                                                            height: MediaQuery.of(context).size.height,
                                                            imageErrorBuilder: (context, error, stackTrace) {                                         
                                                                return Image.asset(
                                                                      "assets/img/placeholder.jpg",
                                                                );
                                                            },                                                                           
                                                            )
                                                        ) : Container(),                              
                                                       SizedBox(width: 5,),
                                                       Padding(       
                                                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                                                          child: SizedBox(
                                                            width: 70,
                                                            child: Text(                                            
                                                                medical[index].mainPoint.toString().length>=20?medical[index].mainPoint.toString().substring(0,10)+"...":medical[index].mainPoint,   //allPosts[index].mainPoint.toString().length.toString(),// allPosts[index].mainPoint.toString().substring(1,2),   
                                                                // textAlign: TextAlign.left,                                                                       
                                                                style: TextStyle(
                                                                      fontSize: 8.0
                                                                )
                                                            ),
                                                          ),
                                                        ),
                                                    ],
                                                  ), 
                                              ]
                                            ),                                           
                                          )
                                      )                                 
                                ],
                              )
                         );
                  }
                )
            )
       );
  }


  Widget _getMedicalWidget(MedicalResponse data){
    List<MedicalModel> medical = data.medical;   

    return  Container(
              width:160,
              height: 202,
              child: SizedBox(
                child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal, 
                itemCount: 1,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    child:  Column(
                      children: [
                        Container(
                            width: 160.0,
                            height: 202,
                            child: Card(
                              child: Wrap(
                                children: [
                                  Column(
                                    children: [
                                         Image.network( "https://test.t-i-s.jp/upload/news/"+medical[0].photo),
                                         Container(
                                            padding: EdgeInsets.only(
                                            top: 10.0, left: 10.0, bottom: 10.0, right: 10.0),
                                            width:captionSize(context),
                                            child:   Text(
                                            medical[0].mainPoint,
                                            maxLines: 3,
                                            style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                  fontSize: 10.0)
                                                  ),
                                         ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                        ),
                        // Container(
                        //     width: 160.0,
                        //     child: Card(

                        //     )
                        // ),
                      ],
                    )  ,
                  );
                }                 
        //  ),
      // ),
            ),
              ),
      );
  }

  Widget _getLatestPostAllCatWidget(PostsResponse data){

  List<PostsModel> allPosts = data.posts;

  return  Container( 
    child:GridView.count(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding:EdgeInsets.only(top: 5),
      childAspectRatio:4,
        // Create a grid with 2 columns. If you change the scrollDirection to
        // horizontal, this produces 2 rows.
      crossAxisCount: 2,
      // Generate 100 widgets that display their index in the List.
      children: List.generate(allPosts.length, (index) {
       
      return  Card(
                child: 
                    Wrap(
                        direction: Axis.horizontal,
                        spacing: 1.0, // gap between adjacent chips
                        runSpacing: 0.0, // gap between lines
                        children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,                                  
                                children: [
                                  ( allPosts[index] !=null ) ?  Container(   
                                  margin: const EdgeInsets.only(left: 0.0, top: 0, right: 0.0,bottom: 14.0),
                                  padding:EdgeInsets.only(right:10),//EdgeInsets.all(10.0),                               
                                  width:70,//fotoSize(context),//MediaQuery.of(context).size.width/ 0.7, //MediaQuery.of(context).size.width * 2 / 5,
                                  height: 50,
                                  child: 
                                        FadeInImage.assetNetwork(
                                        fadeInDuration: const Duration(seconds: 2),
                                        alignment: Alignment.topLeft,
                                        placeholder: 'assets/img/placeholder.jpg',
                                        image: "https://test.t-i-s.jp/upload/news/"+allPosts[index].photo,
                                        fit: BoxFit.fitHeight,
                                        width: double.maxFinite,
                                        height: MediaQuery.of(context).size.height,
                                        imageErrorBuilder: (context, error, stackTrace) {                                         
                                            return Image.asset(
                                                  "assets/img/placeholder.jpg",
                                            );
                                        },                                                                           
                                        )
                                  ) : Container(),                              
                                  SizedBox(width: 5,),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                                      child: SizedBox(
                                        width: 70,
                                        child: Text(                                            
                                            allPosts[index].mainPoint.toString().length>=20?allPosts[index].mainPoint.toString().substring(0,10)+"...":allPosts[index].mainPoint,   //allPosts[index].mainPoint.toString().length.toString(),// allPosts[index].mainPoint.toString().substring(1,2),   
                                            // textAlign: TextAlign.left,                                                                       
                                            style: TextStyle(
                                                  fontSize: 8.0
                                            )
                                        ),
                                      ),
                                    ),    
                                ],
                              ) ,                  
                        ]
                    )      
                );
      }),
    )       
  );

  }

  Widget _buildSourceNewsWidget(PostsResponse data) {
    List<PostsModel> posts = data.posts;
    final document = parse(posts[0].body);
    final String parsedString = parse(document.body.text).documentElement.text;
     
    if (posts.length == 0) {
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
      return Container(
              height: 200.0,
              child: SizedBox( 
              // height: 150.0,
              child:ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              padding:EdgeInsets.only(top: 10),
              itemCount: 1,
              itemBuilder: (context, index) {
                return GestureDetector(
                  // onTap: () {
                  //  Navigator.push(
                  //         context,
                  //         MaterialPageRoute(
                  //             builder: (context) => DetailNews(
                  //                   // article: articles[index],
                  //                 )));
                  // },
                  child:
                Container(
                          decoration: BoxDecoration(
                            border: Border(
                                top: BorderSide(color: Colors.grey[200], width: 1.0),
                            ),
                            color: Colors.white,
                          ),          
                          height: 200,
                
                          child: Row(                      
                              children: <Widget>[
                                  Column(
                                    children: [
                                      (index == 0 && posts[0] !=null ) ?  Container(
                                        margin: const EdgeInsets.only(left: 0.0, top: 5, right: 0.0,bottom: 0.0),
                                        padding:EdgeInsets.only(right:20),//EdgeInsets.all(10.0),
                                        width:fotoSize(context),//MediaQuery.of(context).size.width/ 0.7, //MediaQuery.of(context).size.width * 2 / 5,
                                        height: 100,
                                        child: 
                                              FadeInImage.assetNetwork(
                                              alignment: Alignment.topRight,
                                              placeholder: 'assets/img/placeholder.jpg',
                                              image: posts[0].photo == null
                                                  ? 'assets/img/placeholder.jpg'
                                                  :"https://test.t-i-s.jp/upload/news/"+posts[0].photo,
                                              fit: BoxFit.fitHeight,
                                              width: double.maxFinite,
                                              height: MediaQuery.of(context).size.height)
                                              ) : Container() ,

                                  Container(
                                    padding: EdgeInsets.only(
                                    top: 10.0, left: 10.0, bottom: 10.0, right: 10.0),
                                    width:captionSize(context),
                                    child:   Text(
                                    posts[index].mainPoint,//articles
                                    maxLines: 3,
                                    style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: 10.0)
                                          ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(
                                    top: 0.0, left: 10.0, bottom: 0.0, right: 10.0),
                                    width:captionSize(context),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [                                  
                                            Icon(
                                                Icons.date_range,
                                                color: Colors.black26,
                                                size: 15,
                                            ),
                                            SizedBox(width: 20,),
                                            Text(
                                                timeUntil(
                                                    DateTime.parse(posts[index].createdAt)
                                                ),
                                                style: TextStyle(
                                                    color: Colors.black26,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 8.0)
                                                )
                                        ],
                                    ),                                                           
                                  ),
                              ],
                         ),                    
                         Column(
                           children: <Widget>[
                             Expanded(                 
                               child: SizedBox(                                  
                                  width: 170,
                                  // height: 70.0,
                                  child: new ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    padding:EdgeInsets.only(top: 0),
                                    itemCount: posts.length-1,
                                    itemBuilder: (BuildContext ctxt, int index) {
                                    return  Container(                        
                                        margin: const EdgeInsets.only(left: 0.0, top: 2.5, right: 0.0,bottom: 0.0),
                                        // padding:EdgeInsets.only(left: 10),
                                        child:Wrap(
                                              direction: Axis.vertical,
                                              spacing: 5.0, // gap between adjacent chips
                                              runSpacing: 0.0, // gap between lines
                                              children: <Widget>[
                                                  Text(
                                                    posts[index+1].mainPoint,
                                                    style: TextStyle( 
                                                      fontSize: 10.0
                                                    )
                                                  ),                          
                                              ]
                                        ),
                                        decoration: (index+1!=9) ? BoxDecoration(
                            
                                              border: Border(
                                                  bottom: BorderSide(color: Colors.grey[200], width: 2.0),
                                                  
                                                ),
                                                color: Colors.white,
                                        ) : null,                        
                                    ) ;//new Text(posts[index+1].mainPoint);
                                    },
                                  ),
                               ),
                              ),      
                            ],
                          ),                   
                      ],
                    ),   
                ),          
                );                
              }),
        ),
      );
  }
  fotoSize(BuildContext context) {  
       return MediaQuery.of(context).size.width/2;    
  }
  captionSize(BuildContext context){  
       return MediaQuery.of(context).size.width/2;   
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

  