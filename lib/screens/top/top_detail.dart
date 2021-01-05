
import 'package:flutter/material.dart';
import 'package:tis/model/posts.dart';
import 'package:tis/presentation/custom_app_icons.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/html_parser.dart';
import 'package:flutter_html/style.dart';


class TopDetailScreen extends StatelessWidget {
  final PostsModel top;
  TopDetailScreen({Key key,@required this.top}) : super(key: key);
  @override
    Widget build(BuildContext context) {   
        var htmlData = this.top.body;  
        // print(this.top.mainPoint.toString());
        print(htmlData);
        return Scaffold(
           body: Center(
             child: CustomScrollView(
               slivers:[
                 SliverAppBar(
                   title:Text('ニュース詳細'),
                   backgroundColor:Colors.blueGrey[300],
                  //  expandedHeight: 350.0,
                  //  flexibleSpace: FlexibleSpaceBar(
                  //    background: ,
                  //  ),
                 ),
                 SliverFillRemaining(                  
                   child:ListView(
                       children:[
                          Column( 
                            children: [
                              Center(
                                    child:Container(
                                    padding: EdgeInsets.fromLTRB(20, 20, 20,10),
                                    child: Text(this.top.title.toString(), 
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
                                  child: Text(this.top.createdByCompany.toString()),
                                )
                              ),
                              Row(
                                children: [                          
                                  Container(
                                          margin: const EdgeInsets.only(left: 100.0, top: 0, right: 0.0,bottom: 0.0),    
                                          padding: EdgeInsets.fromLTRB(2, 2, 2, 2),
                                          decoration:BoxDecoration(                                               
                                              borderRadius: BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5),bottomLeft:Radius.circular(5),bottomRight: Radius.circular(5) ),
                                              color: Color(0xffd1281c)
                                          ),
                                          child: Text(this.top.cName.toString(),style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.white,)),
                                    
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
                                        child:Text(this.top.createdAt.toString(),style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color:  Color(0xffaaaaab))),
                                    ),                           
                                ],                      
                              ),
                              Container(            
                                      margin: const EdgeInsets.only(left: 0.0, top: 10, right: 0.0,bottom: 0.0),             
                                      height: 150,
                                      child: Stack(
                                          fit:StackFit.expand,
                                          children: <Widget>[
                                            FadeInImage.assetNetwork(
                                                                    fadeInDuration: const Duration(seconds: 2),
                                                                    // alignment: Alignment.topLeft,
                                                                    placeholder: 'assets/img/placeholder.jpg',
                                                                    image: "https://test.t-i-s.jp/upload/news/"+this.top.photo,
                                                                    fit: BoxFit.fitHeight,
                                                                    width: double.maxFinite,
                                                                    height: MediaQuery.of(context).size.height,
                                                                    imageErrorBuilder: (context, error, stackTrace) {                                         
                                                                        return Image.asset(
                                                                              "assets/img/placeholder.jpg",
                                                                        );
                                                                    },                                                                           
                                              ),                                   
                                          ]
                                      ),
                              ),
                              Container(
                                    margin: const EdgeInsets.only(left: 0.0, top: 10, right: 0.0,bottom: 0.0),     
                                    child:Text(this.top.mainPoint.toString(),style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color:Colors.black)), 
                              ),  
                              Html(
                                  data: htmlData,
                              ),                                    
                            ],
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
  // _TopDetailScreenState createState() => _TopDetailScreenState(top);
}




// class _TopDetailScreenState extends State<TopDetailScreen> {
//   final PostsModel top;
//   _TopDetailScreenState(this.top);
//   @override
//   Widget build(BuildContext context) {     
//         // print(this.top.mainPoint.toString());
//         return Container(
          
//         );
//   }
  
// }