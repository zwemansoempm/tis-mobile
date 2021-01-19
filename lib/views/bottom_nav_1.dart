import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:tis/app-format.dart';
import 'package:tis/bloc/get_medical_bloc.dart';
import 'package:tis/bloc/get_hotnews_bloc.dart';
import 'package:tis/bloc/get_latest_post_all_cat_bloc.dart';
import 'package:tis/bloc/get_nurse_bloc.dart';
import 'package:tis/bloc/get_postsnews_bloc.dart';
// import 'package:tis/bloc/get_source_news_bloc.dart';
import 'package:tis/elements/loader.dart';
import 'package:tis/model/article.dart';
import 'package:tis/model/article_response.dart';
import 'package:tis/model/medical.dart';
import 'package:tis/model/medical_response.dart';
import 'package:tis/model/nurse_response.dart';
import 'package:tis/model/posts.dart';
import 'package:tis/model/posts_response.dart';
import 'package:tis/presentation/custom_app_icons.dart';
import 'package:tis/screens/hospital/hospital_search.dart';
// import 'package:tis/model/source.dart';
import 'package:tis/screens/news_detail.dart';
import 'package:tis/screens/tabs/tab_news_screen.dart';
import 'package:tis/screens/top/top_detail.dart';
import 'package:tis/views/nusingSearch.dart';
import 'package:tis/views/search.dart';
import 'package:tis/views/jobsearch.dart';
import 'package:tis/views/settingScreen.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:html/parser.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'jobsearch.dart';
import 'package:intl/intl.dart';

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
  bool viewVisible = true ;
  bool medicalVisible=true;
  bool nurseVisible=true;

  @override
  void initState() {    
    super.initState(); 
    // double devprev=DevicePreview.of(context).mediaQuery.size.width;    
    _tabData = [
      TabData(title: '  トップ  ', color: Color(0xff287db4)),
      TabData(title: '  病院・医療  ', color:Color(0xffd1281c)),
      TabData(title: '  特養・介護  ', color:Color(0xff9579ef)),
      TabData(title: '  有料老人ホーム  ', color: Color(0xff20d1de)),

      TabData(title: '  訪問介護・看護  ', color: Color(0xffa3774a)),   
      TabData(title: '  デイサービス  ', color: Color(0xffFDCE00)),
      TabData(title: '  グループホーム  ', color: Color(0xff211E55)),
      TabData(title: '  新型コロナ  ', color: Color(0xffA01C38)),
      TabData(title: '  その他  ', color: Color(0xffAAAAAA)),
      TabData(title: '  コラム  ', color: Color(0xff29905e)),
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
    // getPostsNewsBloc..getPostsNews();
    getLatestPostAllCatBloc..getLatestPostAllCat();
    getMedicalBloc..getMedicalNews();
    getNurseBloc..getNurseNews();
    // getMedical2Bloc..getMedical2();
  }

  @override
  void dispose() {
    _controller?.dispose();
    // getSourceNewsBloc.drainStream();
    // getPostsNewsBloc.drainStream();
    getLatestPostAllCatBloc.drainStream();
    getMedicalBloc.drainStream();
    getNurseBloc..getNurseNews();
    // getMedical2Bloc.drainStream();
    super.dispose();
  }  

   showHideWidget(numb){
    setState(() {
      if(numb==1){
          if(medicalVisible==true){
            medicalVisible = false ; 
          }else{
            medicalVisible = true ; 
          }   
      }else if(numb==2){
          if(nurseVisible==true){
            nurseVisible = false ; 
          }else{
            nurseVisible = true ; 
          }   
      }
      // if(viewVisible==true){
      //     viewVisible = false ; 
      // }else{
      //     viewVisible = true ; 
      // }    
    });
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
                          MediaQuery.removePadding(
                                context: context,
                                removeTop: true,
                                child: ListView(    
                                children:[
                                  Container(
                                        margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 2.0),                                 
                                        child: StreamBuilder<PostsResponse>(
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
                                                                                         
                                                      return Container(
                                                        height:MediaQuery.of(context).size.height/1.5,
                                                        child: Column(
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          children: [SizedBox(
                                                            height: 35,
                                                            width: 35,
                                                            child: CircularProgressIndicator()),
                                                          ]),
                                                      );//return buildLoadingWidget();
                                            }
                                          }                                      
                                        )
                                    ),                                 

                                  Container(
                                        // margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 2.0),                                 
                                        child: StreamBuilder<MedicalResponse>(
                                          stream: getMedicalBloc.subject.stream,
                                          builder: (context, AsyncSnapshot<MedicalResponse> snapshot) {
                                              if (snapshot.hasData) {
                                                  if (snapshot.data.error != null &&
                                                    snapshot.data.error.length > 0) {
                                                      return Container();
                                                  }    
                                                      return _getEachdata(snapshot.data,"病院・医療","0xffd1281c",1);
                                                      // return  _getMedicalWidget(snapshot.data);          
                                              }else if (snapshot.hasError) {
                                                      return Container();
                                              } else {                                                
                                                        return Container(
                                                          height: 150,
                                                          child:buildLoadingWidget()
                                                        ); 
                                              }
                                          } 
                                        ),
                                  ),
                                  Container(
                                      child: StreamBuilder<NurseResponse>(
                                      stream: getNurseBloc.subject.stream,
                                      builder: (context, AsyncSnapshot<NurseResponse> snapshot) {
                                          if (snapshot.hasData) {
                                              if (snapshot.data.error != null &&
                                                  snapshot.data.error.length > 0) {
                                                  return Container();
                                              } 
                                               return _getEachdata(snapshot.data,"特養・介護 ","0xff9579ef",2);
                                              }else if (snapshot.hasError) {
                                                      return Container();
                                              } else {                                                
                                                        return Container(
                                                          height: 150,
                                                          child:buildLoadingWidget()
                                                        ); 
                                               }                                         
                                      }
                                      ),
                                  ),

                                ]      
                            ),
                          ),                         
                          TabNewsScreen(), //NusingSearch(),
                          HospitalSearch(),
                          Center(child: Text("")),
                          Center(child: Text("")),
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
  // Widget _getEachNews1(MedicalResponse alldata,String textdata,String colorcode){
  //   return _getEachdata(alldata,textdata,colorcode);        
  // }
  Widget _getEachdata(med,textdata,colorcode,numb){

         return  Column(
                    children: [
                        Container(
                            margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),      
                                child: Divider(
                                  height:10,
                                  color:Color(int.parse(colorcode)),//Color(0xffd1281c),
                                  thickness: 1.5,
                                ),
                        ),
                        Container(    
                            height: 50.0,
                            margin: const EdgeInsets.only(left: 10.0, top: 0, right: 20.0,bottom: 0.0),   
                            child:Row(
                              children: [
                                Container(
                                  width:5 ,
                                  height: 30.0,
                                    decoration: BoxDecoration(
                                      border: Border.all(color:Color(int.parse(colorcode))) ,
                                      color:Color(int.parse(colorcode)),
                                      borderRadius: BorderRadius.all(Radius.circular(10.0))
                                    ),                                          
                                ),    
                                  Container(
                                    margin: const EdgeInsets.only(left: 20.0, top: 0, right: 0.0,bottom:3),  
                                    child: Text(textdata,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color:Color(int.parse(colorcode)),)),
                                  ), 
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width/1.8,
                                  ) ,
                                  new IconButton(                  
                                      icon:new Icon(                                       
                                         (numb==1?medicalVisible:nurseVisible)==true?Icons.arrow_drop_down_sharp:Icons.arrow_right_sharp,
                                        color:(numb==1?medicalVisible:nurseVisible)==true?Colors.black87:Colors.redAccent ,
                                        ), 
                                      onPressed: (){
                                          showHideWidget(numb);
                                      }//showHideWidget(numb),
                                    ),                                                  
                              ],
                            ),
                        ),
                        Visibility(
                          maintainSize: false, 
                          maintainAnimation: true,
                          maintainState: true,
                          visible:numb==1?medicalVisible:nurseVisible,
                          child:_getMedicalWidget(med),  
                        ),                      
                    ],
                );
  }
  Widget _getMedicalWidget(data){
  List<dynamic> medical = data.medical;   
  List<dynamic>  result = [];
  for (var j = 0; j < medical.length; j++) {
    result.add(medical[j]);
  }

   return  Container(
       height:300 ,
      //  width: 300,
     child: ListView(
         shrinkWrap: true,
              //  physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,              
                children: <Widget>[
                   Container(
                      width:MediaQuery.of(context).size.width,
                      // color: Colors.blue[500],
                      child:   ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical, 
                      itemCount:medical.length>=3?3:medical.length,
                      itemBuilder: (context, index) {
                        return Container(
                          child: GestureDetector(
                                  onTap: (){
                                         Navigator.push<Widget>(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) => TopDetailScreen(top:medical[index].pid.toString()),
                                                ),
                                          );
                                  },
                                  child: Card(  
                                  color:Color(0xfff7f7f7),                                
                                  child: Container(
                                  height: 90,
                                  child: Row(
                                        children: [
                                          Expanded(
                                            child: (medical[index].photo!=null && medical[index].photo!='') ? 
                                              Padding(
                                                padding: const EdgeInsets.all(8),
                                                child: Stack(
                                                  children: [
                                                    Center(
                                                      child: 
                                                      medical[index].pid!=410?FadeInImage(
                                                        fadeInDuration: const Duration(seconds: 2),
                                                        placeholder: AssetImage('assets/img/placeholder.jpg'),
                                                        image: NetworkImage(
                                                          "https://test.t-i-s.jp/upload/news/"+medical[index].photo,
                                                        ),
                                                        imageErrorBuilder: (context, error, stackTrace) { 
                                                          return Image.asset(
                                                            "assets/img/placeholder.jpg",
                                                          );
                                                        },                                                                           
                                                      ):Container(),
                                                    ),
                                                    // dateToStringFormat(DateTime.now()) == medical[0].createdAt.split(" ")[0] ? _newLogo(color) : Container(),
                                                ]),
                                              ) :Image.asset(
                                                          "assets/img/placeholder.jpg",
                                              )
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(
                                              top: 10.0, left: 4.0,  right: 10.0, bottom: 4.0),
                                            width:MediaQuery.of(context).size.width/1.5,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  medical[index].mainPoint.toString().length>=60?medical[index].mainPoint.toString().substring(0,50)+"...":medical[index].mainPoint,  
                                                  // medical[index].mainPoint,
                                                  maxLines: 3,
                                                  //overflow: TextOverflow.ellipsis,
                                                ),
                                                Expanded(
                                                  child: Align(
                                                  alignment: Alignment.bottomRight,
                                                  child: Text(
                                                    medical[index].createdAt,
                                                    style: TextStyle(
                                                      color: Colors.black38,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 12.0)),
                                                ))
                                              ],
                                            )
                                          ),
                                        ],
                                     ),
                                  ),
                                  ) ,
                            ),
                          );
                        // ),
                      }
                  ) ,     
                ),         
                Container(
                  width:MediaQuery.of(context).size.width,
                  height: 300,
                  // color: Colors.purple[500],
                  
                  child: ListView.builder(               
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical, 
                      itemCount: medical.length>=9?6:(medical.length-3<0?0:medical.length-3),
                      itemBuilder: (context, indexs) {
                          return  GestureDetector(
                                      onTap: (){
                                          Navigator.push<Widget>(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) => TopDetailScreen(top:medical[indexs+3].pid.toString()),
                                                ),
                                          );
                                      },
                                      child: Card(
                                      color:Color(0xfff7f7f7),
                                      // child: GestureDetector(
                                      //   onTap: (){
                                      //       // Navigator.push(context, MaterialPageRoute(builder: (context) => TopDetailScreen(top: medical),));
                                      //   },
                                      child: Container(
                                              height: 41,
                                              child:Column(
                                                children: [
                                                  Row(
                                                      children: [
                                                        Expanded(
                                                          child:
                                                            Padding(
                                                              padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                                                              child: Stack(
                                                                children: [                                                           
                                                                    Icon(
                                                                        CustomApp.building,
                                                                        color: Colors.redAccent,
                                                                        size: 15,                                                                    
                                                                    ),
                                                              ]),
                                                            ) 
                                                        ),
                                                        Container(
                                                          height: 25,
                                                          // padding: EdgeInsets.only(
                                                          //   top: 0.0, left: 0,  right: 0.0, bottom:0),
                                                          width:MediaQuery.of(context).size.width/1.2,
                                                          child: Column(
                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              Text(
                                                                medical[indexs+3].mainPoint.toString().length>=35?medical[indexs+3].mainPoint.toString().substring(0,25)+"...":medical[indexs+3].mainPoint,  
                                                                // medical[indexs+3].mainPoint,
                                                                maxLines: 2,
                                                                style: TextStyle(
                                                                    color: Colors.black54,
                                                                    fontWeight: FontWeight.bold,
                                                                    fontSize: 10.0
                                                                )
                                                                //overflow: TextOverflow.ellipsis,
                                                              ),                                                           
                                                            ],
                                                          )
                                                        ),
                                                      ],
                                                  ),
                                                  Container(
                                                        height: 10,
                                                        margin: const EdgeInsets.only(left: 0.0, top: 0, right: 5.0,bottom: 1.0),
                                                        child: Align(
                                                        alignment: Alignment.bottomRight,
                                                        child: Text(
                                                          medical[indexs+3].createdAt,
                                                          style: TextStyle(
                                                            color: Colors.black38,
                                                            fontWeight: FontWeight.bold,
                                                            fontSize: 10.0)),
                                                      ),
                                                    ),                                               
                                                ],
                                              ),
                                       )
                                      ),
                                  );
                          // );
                      }
                 ),
                ),
              ],
      //  );
                 
     ),
   ); 
  }

  Widget _getLatestPostAllCatWidget(PostsResponse data){


  List<PostsModel> allPosts = data.posts;
  List<dynamic> result = [];
  for (var j = 0; j < allPosts.length; j++) {
    result.add(allPosts[j]);
  }
    return  Container( 
              height: 150.0,
              color:Color(0xfff7f7f7),
              child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      // padding:EdgeInsets.only(top: 0),
                      itemCount: 1,
                      itemBuilder: (context, index) {
                      return GestureDetector(
                        child: 
                        Column(
                            children: [
                              CarouselSlider(  
                              options: CarouselOptions(
                                aspectRatio: 2.0,
                                // height: 150.0, 
                                initialPage: 0,
                                autoPlay: true,                           
                                // viewportFraction:1,
                                ),
                              items: result.map((i) {
                                  var inputFormat = DateFormat('yyyy-MM-dd hh:mm:ss');
                                  var inputDate = inputFormat.parse(i.createdAt.toString()); 
                                  var outputFormat = DateFormat('MM/dd HH:mm');
                                return Builder(
                                  builder: (BuildContext context) {
                                    
                                    return Container(
                                        width: MediaQuery.of(context).size.width,
                                        margin: EdgeInsets.symmetric(horizontal: 10.0),
                                        decoration: BoxDecoration(color: Colors.white),
                                        child: GestureDetector(
                                            child:Stack(
                                                fit:StackFit.expand,
                                                children: <Widget>[
                                                   (i.photo!=null && i.photo!='' ) ?                 
                                                   FadeInImage.assetNetwork(                                                          
                                                                fadeInDuration: const Duration(seconds: 2),
                                                                // alignment: Alignment.topLeft,
                                                                placeholder: 'assets/img/placeholder.jpg',
                                                                image: "https://test.t-i-s.jp/upload/news/"+i.photo,
                                                                imageScale: 0.5,
                                                                fit: BoxFit.fitHeight,                                                           
                                                                imageErrorBuilder: (context, error, stackTrace) {                                         
                                                                    return 
                                                                    Image.asset(
                                                                          "assets/img/placeholder.jpg",
                                                                    );
                                                                },                                                                           
                                                    )                                              
                                                    :Image.asset(
                                                          "assets/img/placeholder.jpg",
                                                    ),
                                            
                                                    new Positioned(
                                                      left: 0.0,
                                                      top: 100.0,
                                                      child: Container(   
                                                          // margin: const EdgeInsets.only(left: 10.0, top: , right: 0.0,bottom: 0.0),
                                                          height: 200,   
                                                          width:  MediaQuery.of(context).size.width,                                                      
                                                          child: Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start, 
                                                            children: [
                                                                SizedBox(   
                                                                    width: MediaQuery.of(context).size.width,                                                         
                                                                    height: 40,
                                                                    child: Padding(
                                                                      padding: const EdgeInsets.fromLTRB(5,5,5,5),
                                                                      child: Text(  
                                                                 
                                                                      i.mainPoint.toString().length>=90?allPosts[index].mainPoint.toString().substring(0,60)+"...":i.mainPoint.toString(),   //allPosts[index].mainPoint.toString().length.toString(),// allPosts[index].mainPoint.toString().substring(1,2),   
                                                                                                                          
                                                                      style: TextStyle(
                                                                            fontSize: 10.0,color: Colors.white,fontWeight: FontWeight.bold
                                                                      )
                                                                ),
                                                                    ),
                                                              ),
                                                              SizedBox(                                                          
                                                                width:MediaQuery.of(context).size.width/1.4,//350,
                                                                child: Align(
                                                                    alignment: Alignment.bottomRight,
                                                                    child: Text(
                                                                    outputFormat.format(inputDate),                                                              
                                                                    style: TextStyle(
                                                                          fontSize: 10.0,color: Colors.white,fontWeight: FontWeight.bold
                                                                    )
                                                                  ),
                                                                ),
                                                              )
                                                            ],
                                                          ), 
                                                          decoration: BoxDecoration(
                                                          border: Border(
                                                              // top: BorderSide(color: Colors.black87, width: 1.0),
                                                          ),
                                                          color: Colors.black87.withOpacity(0.5),
                                                          ), 
                                                      ), 
                                                    ),                                              
                                                ]
                                            ),                                             
                                            onTap: () {
                                              Navigator.push<Widget>(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) => TopDetailScreen(top:i.id.toString()),
                                                ),
                                              );
                                            }
                                        )
                                      );
                                  },
                                );
                              }).toList(),                           
                           ),
                        ],
                          )
                      );                                
                }
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

  