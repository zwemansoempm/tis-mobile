
import 'package:flutter/material.dart';
import 'package:tis/bloc/get_newdetails_bloc.dart';
import 'package:tis/bloc/get_related_news_bloc.dart';
import 'package:tis/model/newdetails_response.dart';
import 'package:tis/model/posts.dart';
import 'package:tis/model/related_news_response.dart';
import 'package:flutter_html/flutter_html.dart';

class TopDetailScreen extends StatefulWidget {

  // final PostsModel top;  
  final String top;  
  final String news;
  
  const TopDetailScreen({Key key,@required this.top,this.news}) : super(key: key); 
  
 @override
  _TopDetailState createState() => _TopDetailState();
}

class _TopDetailState  extends State<TopDetailScreen> with SingleTickerProviderStateMixin { 

  var stream; var stream1;
 
  @override
  void initState() {     
    super.initState();     
    // ignore: unnecessary_statements   
     getRelatedNewsBloc.drainStream();
     getNewdetailsBloc.drainStream(); 
     stream=getRelatedNewsBloc..getRelatedNews(widget.top.toString());
     stream1=getNewdetailsBloc..getNewsDetails(widget.top.toString());
  }
  @override
  void dispose() {    
    getRelatedNewsBloc.drainStream();
    getNewdetailsBloc.drainStream(); 
    super.dispose();
  }
 
  @override
    Widget build(BuildContext context) {  
 
        return Scaffold(
           body: Center(
             child: CustomScrollView(
               slivers:[
                 SliverAppBar(
                   title:Text('ニュース詳細'),
                   backgroundColor:Colors.blueGrey[300],
          //          automaticallyImplyLeading:false,
          //         leading: BackButton(
          //   onPressed: () => Navigator.pop(context),
          // ),
                  //  expandedHeight: 350.0,
                  //  flexibleSpace: FlexibleSpaceBar(
                  //    background: ,
                  //  ),
                 ),
                 SliverFillRemaining(                  
                   child:ListView(                   
                       children:[
                          Container(
                              margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 2.0),                                 
                              child: StreamBuilder<NewdetailsResponse>(
                                stream: getNewdetailsBloc.subject.stream,
                                builder: (context, AsyncSnapshot<NewdetailsResponse> snapshot) {
                                    if (snapshot.connectionState == ConnectionState.waiting) {
                                          return Container(
                                              height:MediaQuery.of(context).size.height/1.5,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [SizedBox(
                                                  height: 35,
                                                  width: 35,
                                                  child: CircularProgressIndicator()),
                                                ]),
                                          );//
                                    }
                                    else if (snapshot.hasError) {
                                          return Container();
                                    } 
                                    else   if (snapshot.hasData) {
                                          if (snapshot.data.error != null &&
                                                snapshot.data.error.length > 0) {
                                                  return Container();
                                          }    
                                                  return  _getNewdetailsWidget(snapshot.data);                                 
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
                       ]
                      // child: Column(                    
                   )
                 ),
               ]
             ),
           ), 
        );
  }
  Widget _getNewdetailsWidget(NewdetailsResponse data){
       List<PostsModel> allPosts = data.posts;

     return  Column( 
                  children: [
                    Center(
                          child:Container(
                          padding: EdgeInsets.fromLTRB(20, 20, 20,10),
                          child: Text(allPosts[0].title.toString(), 
                                style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,)
                                )
                          )
                    ),  
                    Center(
                      child: Container(
                        padding: EdgeInsets.fromLTRB(20, 0, 20,10),
                        child: Row(
                              children: List.generate(800~/10, (index) => Expanded(
                              child: Container(
                                color: index%2==0?Colors.transparent
                                :Colors.blue[200],
                                height: 1,
                              ),
                              )),
                        ),
                      ),
                    ),  
                    Center(
                      child: Container(
                        padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                        child: Text(allPosts[0].createdByCompany.toString()),
                      )
                    ),
                    Row(
                      children: [                          
                        Container(
                                margin: const EdgeInsets.only(left: 100.0, top: 0, right: 0.0,bottom: 0.0),    
                                padding: EdgeInsets.fromLTRB(2, 2, 2, 2),
                                decoration:BoxDecoration(                                               
                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5),bottomLeft:Radius.circular(5),bottomRight: Radius.circular(5) ),
                                    // color:Color(int.parse(widget.top.colorCode.replaceFirst('#','0xff')))// widget.colorcode==null ? Color(int.parse(widget.top.colorCode.replaceFirst('#','0xff'))) : Color(int.parse(widget.colorcode.replaceFirst('#','0xff')))
                                ),
                                // child: Text(widget.news!='news'?widget.top.cName.toString():widget.top.catName.toString(),style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.white,)),
                          
                          ),
                          Container(
                              margin: const EdgeInsets.only(left: 20.0, top: 0, right: 0.0,bottom: 0.0),  
                              child:Icon(
                                              Icons.date_range,
                                              color: Colors.black26,
                                              size: 15,
                                    ), 
                          ),
                          Container(
                              margin: const EdgeInsets.only(left: 10.0, top: 0, right: 0.0,bottom: 0.0),    
                              child:Text(allPosts[0].createdAt.toString(),style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color:  Color(0xffaaaaab))),
                          ),                           
                      ],                      
                    ),
                    Container(            
                            margin: const EdgeInsets.only(left: 0.0, top: 10, right: 0.0,bottom: 0.0),             
                            height: 150,
                            child: Stack(
                                fit:StackFit.expand,
                                children: <Widget>[                                 
                                  //&& allPosts[0].id!=311 && allPosts[0].id!=410 && allPosts[0].id!=236 && allPosts[0].id!=272 && allPosts[0].id!=482 && allPosts[0].id!=312 && allPosts[0].id!=329 && allPosts[0].id!=359 && allPosts[0].id!=402 && allPosts[0].id!=403 && allPosts[0].id!=438 && allPosts[0].id!=418 && allPosts[0].id!=437 && allPosts[0].id!=453 && allPosts[0].id!=451 && allPosts[0].id!=445 && allPosts[0].id!=413 && allPosts[0].id!=214
                                  (allPosts[0].photo!=null && allPosts[0].photo!='')? 
                                  FadeInImage.assetNetwork(
                                                          // fadeInDuration: const Duration(seconds: 2),
                                                          // alignment: Alignment.topLeft,
                                                          placeholder: 'assets/img/placeholder.jpg',
                                                          image: "https://test.t-i-s.jp/upload/news/"+allPosts[0].photo,
                                                          fit: BoxFit.fitHeight,
                                                          width: double.minPositive,
                                                          height: MediaQuery.of(context).size.height,
                                                          imageErrorBuilder: (context, error, stackTrace) {                                         
                                                              return Image.asset(
                                                                    "assets/img/placeholder.jpg",
                                                              );
                                                          },                                                                           
                                    ):Image.asset(
                                        "assets/img/placeholder.jpg",
                                    )                                   
                                ]
                            ),
                    ),
                    Container(
                          margin: const EdgeInsets.only(left: 10.0, top: 10, right: 10.0,bottom: 0.0),     
                          child:Text(allPosts[0].mainPoint.toString(),style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color:Colors.black)), 
                    ),  
                    Html(
                          data: allPosts[0].body,
                    ),  
                    Container(
                          margin: const EdgeInsets.only(left: 10.0, top: 10, right: 10.0,bottom: 10.0), 
                          child:Text(allPosts[0].createdBy.toString(),style: TextStyle(fontSize: 10,fontWeight: FontWeight.normal,color:Colors.black45)),
                    ),
                    Center(
                      child: Container(
                        padding: EdgeInsets.fromLTRB(20, 0, 20,10),
                        child: Row(
                              children: List.generate(800~/10, (index) => Expanded(
                              child: Container(
                                color: index%2==0?Colors.transparent
                                :Colors.black26,
                                height: 1,
                              ),
                              )),
                        ),
                      ),
                    ),    
                    (allPosts[0].relatedNews!=null) ? Container(    
                          height: 50.0,
                          margin: const EdgeInsets.only(left: 20.0, top: 10, right: 20.0,bottom: 0.0),   
                          child:Row(
                            children: [
                              Container(
                                width:5 ,
                                height: 40.0,
                                  decoration: BoxDecoration(
                                    border: Border.all(color:Color(0xff2980b9)) ,
                                    color: Color(0xff2980b9),
                                    borderRadius: BorderRadius.all(Radius.circular(10.0))
                                  ),                                          
                              ),    
                              Container(
                                margin: const EdgeInsets.only(left: 20.0, top: 0, right: 0.0,bottom: 0.0),  
                                child: Text("関連ニュース",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color:Colors.black87)),
                              ),                                                        
                            ],
                          ),
                    ):Container(),
                    (allPosts[0].relatedNews!=null) ?  Container(    
                      margin: EdgeInsets.symmetric(vertical: 5.0),                                 
                      child: StreamBuilder<RelatedNewsResponse>(
                      stream: getRelatedNewsBloc.subject.stream,
                      builder: (context, AsyncSnapshot<RelatedNewsResponse> snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                                return Container(
                                    height:MediaQuery.of(context).size.height/1.5,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [SizedBox(
                                        height: 35,
                                        width: 35,
                                        child: CircularProgressIndicator()),
                                      ]),
                                );//
                          }
                          else if (snapshot.hasError) {
                                return Container();
                          } 
                          else if (snapshot.hasData) {
                            if (snapshot.data.error != null &&
                                snapshot.data.error.length > 0) {
                                return Container();
                            }
                                return  _getRelatedNewsWidget(snapshot.data);                                 
                          } else {
                                return Container(
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
                    ):Container(),                                            
                  ],
            ); 
  }

  Widget _getRelatedNewsWidget(RelatedNewsResponse data){
  List<PostsModel> allPosts = data.posts;
    return detailListWidget(allPosts);
  }

  Widget detailListWidget(allPosts){
            return 
  Container(
      height: 170.0*allPosts.length,
      child: SizedBox(
        child:
         ListView.builder(         
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical, 
            itemCount:allPosts.length,
            itemBuilder: (context, index) {
                return Container(
                   margin: const EdgeInsets.only(left: 20.0, top: 0, right: 20.0,bottom: 20.0),  
                   height: 150.0,           
                  child: GestureDetector(
                     child:Stack(
                            fit:StackFit.expand,
                            children: <Widget>[
                              //&& allPosts[index].id!=311 && allPosts[index].id!=410 && allPosts[index].id!=236 && allPosts[index].id!=272 && allPosts[index].id!=482 && allPosts[index].id!=312 && allPosts[index].id!=329 && allPosts[index].id!=359 && allPosts[index].id!=402 && allPosts[index].id!=403 && allPosts[index].id!=438 && allPosts[index].id!=418 && allPosts[index].id!=437 && allPosts[index].id!=453 && allPosts[index].id!=451 && allPosts[index].id!=445 && allPosts[index].id!=413 && allPosts[index].id!=214 
                               (allPosts[index].photo!=null && allPosts[index].photo!='')? 
                                 FadeInImage.assetNetwork(
                                            // fadeInDuration: const Duration(seconds: 2),
                                            // alignment: Alignment.topLeft,
                                            placeholder: 'assets/img/placeholder.jpg',
                                            image: "https://test.t-i-s.jp/upload/news/"+allPosts[index].photo,
                                            fit: BoxFit.fitHeight,
                                            width: double.minPositive,
                                            height: MediaQuery.of(context).size.height,
                                            imageErrorBuilder: (context, error, stackTrace) {                                         
                                                return Image.asset(
                                                      "assets/img/placeholder.jpg",
                                                );
                                            },                                                                           
                                ) :Image.asset(
                                      "assets/img/placeholder.jpg",
                                ),                         
                                new Positioned(
                                  left: 0.0,
                                  top: 100.0,
                                  child: Container(   
                                      height: 200,   
                                      width:  MediaQuery.of(context).size.width,                                                      
                                      child: Text(                                            
                                          allPosts[index].mainPoint.toString().length>=90?allPosts[index].mainPoint.toString().substring(0,60)+"...":allPosts[index].mainPoint.toString(),   //allPosts[index].mainPoint.toString().length.toString(),// allPosts[index].mainPoint.toString().substring(1,2),   
                                                                                              
                                          style: TextStyle(
                                                fontSize: 10.0,color: Colors.white,fontWeight: FontWeight.bold
                                          )
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
                          builder: (context) => new TopDetailScreen(top:allPosts[index].id.toString(),news:'news'),
                        ),
                      ).then((value) {
                          setState(() {
                            stream =getRelatedNewsBloc..getRelatedNews(widget.top.toString());//allPosts[index].id.toString()  widget.top.toString()
                            stream1 =getNewdetailsBloc..getNewsDetails(widget.top.toString());//allPosts[index].id.toString()  widget.top.toString()
                          });
                      });
                    }
                  ),
                );
            }
        ),
      )
  );
  } 
}

