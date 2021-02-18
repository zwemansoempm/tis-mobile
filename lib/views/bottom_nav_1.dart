import 'package:flutter/material.dart';
import 'package:tis/bloc/get_column_bloc.dart';
import 'package:tis/bloc/get_corona_bloc.dart';
import 'package:tis/bloc/get_dayservice_bloc.dart';
import 'package:tis/bloc/get_group_news_bloc.dart';
import 'package:tis/bloc/get_home_bloc.dart';
import 'package:tis/bloc/get_medical_bloc.dart';
import 'package:tis/bloc/get_latest_post_all_cat_bloc.dart';
import 'package:tis/bloc/get_news_category_mobile_bloc.dart';
import 'package:tis/bloc/get_nurse_bloc.dart';
import 'package:tis/bloc/get_oldpeople_news_bloc.dart';
import 'package:tis/bloc/get_other_bloc.dart';
import 'package:tis/bloc/get_visit_nurse_bloc.dart';
import 'package:tis/elements/loader.dart';
import 'package:tis/model/category.dart';
import 'package:tis/screens/tabs/tab_news_screen.dart';
import 'package:tis/views/search.dart';
import 'package:tis/views/settingScreen.dart';
import 'package:timeago/timeago.dart' as timeago;

class HomeWidget extends StatefulWidget {

 HomeWidget({Key key}) : super(key: key);

  @override
  _BottomNav1State createState() => _BottomNav1State();//source

}  

class _BottomNav1State  extends State<HomeWidget> with TickerProviderStateMixin { 

  TabController _controller;
  List<TabData> _tabData=[];
  List<TabData> _tabDataRes=[];
  List<Tab> _tabs = []; 
  Color _activeColor; 
  int checknum=0;  
  bool check=false;

  @override
  void initState() {
    // double devprev=DevicePreview.of(context).mediaQuery.size.width;   
    _getAllStream(); 
    super.initState(); 
  }

  @override
  void dispose() {
    _controller?.dispose();
    _getAllDrainStream();   
    super.dispose();
  }   

  _getAllDrainStream(){
    getLatestPostAllCatBloc.drainStream();
    getMedicalBloc.drainStream();
    getNurseBloc..drainStream();
    getOldPeopleBloc..drainStream();
    getVisitNurseBloc..drainStream();
    getDayServiceeBloc..drainStream();
    getGroupBloc..drainStream();
    getCoronaBloc..drainStream();
    getOtherBloc..drainStream();
    getColumnBloc..drainStream();
    // getHomeBloc..drainStream();
    getNewsCategoryMobileBloc..drainStream();
  }

  _getAllStream(){   
    getLatestPostAllCatBloc..getLatestPostAllCat();
    getMedicalBloc..getMedicalNews();
    getNurseBloc..getNurseNews();
    getOldPeopleBloc..getPaidOldPeopleNews();
    getVisitNurseBloc..getVisitNurseNews();
    getDayServiceeBloc..getdayServiceNews();
    getGroupBloc..getGroupNews();
    getCoronaBloc..getCoronaNews();
    getOtherBloc..getOtherNews();
    getColumnBloc..getColumnNews(); 
    getHomeBloc..getHomeData(); 
  }

  Future<Null>refreshList() async{
    await Future.delayed(Duration(seconds:5));
  }

  Widget build(BuildContext context) {
 
   return  StreamBuilder<Categories>(
      stream:getHomeBloc.subject.stream,
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) { 

            if (snapshot.data.error != null &&
                snapshot.data.error.length > 0) {
                return Container();
           }  

          for (int i = 0; i < snapshot.data.categories.length; i++) {
            _tabData.add(TabData(id:snapshot.data.categories[i].id,title:snapshot.data.categories[i].name, color: Color(int.parse("0xff"+snapshot.data.categories[i].colorCode.replaceAll("#", ""))) ));                
          }
          _tabDataRes=_tabData;
        
        if(check==false){       
            _activeColor = _tabData.first.color;
        }
          _tabs=[];
           _tabData.forEach((data) {          
              final tab = Tab(
                child: PreferredSize(
                          preferredSize: Size.fromWidth(150),
                          child: Container(
                          padding: new EdgeInsets.all(10.0),    
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
 
      
          _controller = TabController(initialIndex:checknum,vsync: this, length:snapshot.data.categories.length)
          ..addListener(() {            
            if(_tabData.isNotEmpty){         
              setState(() {
                  _tabs=[];
                  _activeColor = _tabData[_controller.index].color; 
              });
            }  
          });
         _tabData=[];
       
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
                      onPressed: () {                       
                        setState(() {                          
                            refreshList();
                            _getAllDrainStream();
                            _getAllStream();   
                              // _tabData=[];  
                        });
                      
                       },                 
                    ),
                    centerTitle: true,
                    title: Row(                      
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[ 
                          SizedBox(
                            child: new IconButton(                  
                                  icon:new Icon(Icons.search), // Image.asset("assets/images/s1.png"),
                                  onPressed: (){                             
                                    showSearch(
                                      context: context,
                                      delegate: SearchScreen(),
                                    );                                     
                                  },
                                ),                                 
                          ), 
                          new RaisedButton(
                                  color: Colors.black.withOpacity(0.05),
                                  onPressed: () {  
                                    showSearch(
                                        context: context,
                                        delegate: SearchScreen(), 
                                      );
                                    },
                                  child: new Text("Search News...", style: TextStyle(color: Colors.lightBlue)),
                          ),    
                                              
                        ],                        
                    ),
                      
                      bottom: //getHome(),
                      TabBar(
                         onTap: (index) {                             
                              getNewsCategoryMobileBloc..drainStream(); 
                              setState(() {                                   
                                _tabs=[];                       
                                _activeColor = _tabDataRes[index].color;                                  
                                check=true;
                                checknum=index;
                              });
                              if(index==1){     
                                    getNewsCategoryMobileBloc..getNewsCategoryMobile(1.toString());
                              }else if(index==2){
                                     getNewsCategoryMobileBloc..getNewsCategoryMobile(2.toString());
                              }else if(index==3){                                  
                                   getNewsCategoryMobileBloc..getNewsCategoryMobile(3.toString());
                              }else if(index==4){
                                   getNewsCategoryMobileBloc..getNewsCategoryMobile(4.toString());
                              }else if(index==5){
                                   getNewsCategoryMobileBloc..getNewsCategoryMobile(5.toString());
                              }else if(index==6){
                                   getNewsCategoryMobileBloc..getNewsCategoryMobile(22.toString());
                              }else if(index==7){
                                   getNewsCategoryMobileBloc..getNewsCategoryMobile(30.toString());
                              }else if(index==8){
                                   getNewsCategoryMobileBloc..getNewsCategoryMobile(27.toString());
                              }else if(index==9){
                                   getNewsCategoryMobileBloc..getNewsCategoryMobile(40.toString());
                              }                         
                                                
                        },
                        isScrollable: true,
                        indicator: UnderlineTabIndicator(
                          borderSide: BorderSide(width: 5,color: _activeColor),
                          insets: EdgeInsets.symmetric(horizontal:800.0),
                        ),
                        indicatorColor: _activeColor,
                        labelPadding: EdgeInsets.fromLTRB(1,0,1.0,0),
                        labelColor: Colors.white,
                        controller: _controller,
                        tabs:_tabs,                      
                      ),

                      actions: [                   
                        IconButton(
                          icon:new Icon(Icons.settings),
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
                                      
                          for (int i = 0;i <snapshot.data.categories.length;i++)
                            TabNewsScreen(categoryId:snapshot.data.categories[i].id.toString(),snapdata:snapshot.data),      
                        
                        ],
                      ),
                    ),     
                ]
            ),
        ); 
        
        }
        if (snapshot.hasError) print(snapshot.error.toString());    
        return Container(
          height: 150,
          child:buildLoadingWidget()
        );   
      },
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
  TabData({this.id,this.title, this.color});
  final int id;
  final String title;
  final Color color;
}

  