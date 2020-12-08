// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:footer/footer.dart';
// import 'package:footer/footer_view.dart';

// class HomePage extends StatefulWidget{
//   @override
//     _HomePageState createState() => _HomePageState(); 
// }
  
// class _HomePageState extends State<HomePage> {
//     ScrollController _scrollController = new ScrollController();
//     @override
//     Widget build(BuildContext context) {
   
//       return new MaterialApp(
//         debugShowCheckedModeBanner: false,
//         theme: ThemeData(
//           primaryColor: Colors.white,
//           // primarySwatch: Colors.blue,    
//           visualDensity: VisualDensity.adaptivePlatformDensity,
//         ),
//         home: new DefaultTabController(
//         length: 4,
//         child:new Scaffold(        
//             appBar:AppBar(
//               title: Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                         Image.asset(
//                       'assets/images/logo.PNG',
//                         fit: BoxFit.contain,
//                         height: 50,               
//                     ),
//                     // Container(
//                     //     // padding: const EdgeInsets.all(8.0), child: Text('YourAppTitle')
//                     // )
//                   ],
//               ),

//               actions: [
//                   IconButton(icon: Icon(Icons.dehaze), onPressed: (){
//                           print("Menu");
//                   })
//               ],                
//             ),
            
//             body:Container(
          
//               decoration: const BoxDecoration(
//                 border: Border(
//                   top: BorderSide(width: 2.0, color:Colors.greenAccent),
//                   left: BorderSide(width: 2.0, color:Colors.greenAccent),
//                   right: BorderSide(width: 2.0, color:Colors.greenAccent),
//                   bottom: BorderSide(width: 2.0, color:Colors.greenAccent),
//                 ),
//               ),
//               margin: const EdgeInsets.only(left: 20.0, top:20.0,bottom:20.0,right: 20.0),  

//               child: new FooterView(
//                   children:<Widget>[ 
//                     Container(
//                       color: Colors.green, 
//                       child:new TabBar(                        
//                         indicatorColor: Colors.red,  
//                         labelStyle: TextStyle(fontSize:MediaQuery.of(context).size.width/48),  //51For Selected tab
//                         unselectedLabelStyle: TextStyle(fontSize:MediaQuery.of(context).size.width/50), //58For Un-selected Tabs          
//                         labelColor: Colors.greenAccent,
//                         unselectedLabelColor: Colors.black,
                                
//                         indicator: BoxDecoration(
//                         shape: BoxShape.rectangle,
//                         border: Border.all(color: Colors.greenAccent, width: 2),
//                         borderRadius: BorderRadius.circular(5),
//                         color: Colors.white,
//                       ),
//                         tabs: [                      
//                           new Container(
//                             width:MediaQuery.of(context).size.width,
//                             height: MediaQuery.of(context).size.height/10,//5
//                             child: new Tab(icon: new Image.asset('assets/images/news.png',fit: BoxFit.contain,height:MediaQuery.of(context).size.height/20,),text: 'ニュース'),   //10                            
//                           ),                            
//                           new Container(
                            
//                             width: MediaQuery.of(context).size.width,
//                             height: MediaQuery.of(context).size.height/10,                                
//                             child:new Tab(icon: new Image.asset('assets/images/doctor.png',fit: BoxFit.contain,height:MediaQuery.of(context).size.height/20,),text:'介護施設検索'),
//                           ), 
//                           new Container( 
//                             width:MediaQuery.of(context).size.width,
//                             height: MediaQuery.of(context).size.height/10,
//                             child: new Tab(icon: new Image.asset('assets/images/reception.png',fit: BoxFit.contain,height:MediaQuery.of(context).size.height/20,),text:'病院検索'),
//                           ), 
//                           new Container(
//                             width:MediaQuery.of(context).size.width,
//                             height: MediaQuery.of(context).size.height/10,
//                             child: new Tab(icon: new Image.asset('assets/images/job-search.png',fit: BoxFit.contain,height:MediaQuery.of(context).size.height/20,),text:'求人検索'),
//                           ), 
                                                    
//                         ]
//                       )
//                     ),
//                     Container(                                
//                       height:MediaQuery.of(context).size.height/1.5,//1.8, //height of TabBarView
                             
//                         child:new TabBarView( 
//                           children: [
//                             new ListView(
//                               controller: _scrollController,
//                               children: list,
//                             ),
//                             new ListView(
//                               controller: _scrollController,
//                               children: list,
//                             ),
//                             new ListView(
//                               controller: _scrollController,
//                               children: list,
//                             ),
//                               new ListView(
//                               controller: _scrollController,
//                               children: list,
//                             ),
//                           ],
//                         ),
                              
//                     ),
//                     Container(
//                       decoration: const BoxDecoration(
//                           border: Border(
//                             top: BorderSide(width: 2.0, color:Colors.grey),
//                             left: BorderSide(width: 2.0, color:Colors.grey),
//                             right: BorderSide(width: 2.0, color:Colors.grey),
//                             bottom: BorderSide(width: 2.0, color:Colors.grey),
//                           ),
//                       ),
//                       margin: const EdgeInsets.only(left: 30.0, top:50.0,bottom:0.0,right: 30.0), 
//                       height:MediaQuery.of(context).size.height/5,//18
//                       child:Row(   
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               children: [
//                                   Image.asset('assets/images/logo.PNG',fit: BoxFit.contain,height:MediaQuery.of(context).size.height/22 ,),
//                                   Text(
//                                     '170 Reviews',
//                                     style: TextStyle(
//                                       color: Colors.black,
//                                       fontWeight: FontWeight.w400,
//                                       fontFamily: 'Roboto',
//                                       letterSpacing: 0.5,
//                                       fontSize:MediaQuery.of(context).size.width/25,
//                                     )
//                                   ),
//                               ],                                
//                       ),   
//                     ),                   
//                  ],
//                       footer: new Footer(
//                             child: Padding(
//                               padding: new EdgeInsets.all(10.0),
//                               child: Text('Copyright©TRUST-ESTATE Co,Ltd.All Rights Reserved.')
//                             ),
//                       ), 
//                   flex: 5, //5 default flex is 2
//               ),              
//             ),          
//         ),  
//         )
//       );
//     }  
// }

// List<Widget> list = <Widget>[
//   new ListTile(
//     title: new Text('CineArts at the Empire',
//         style: new TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
//     subtitle: new Text('85 W Portal Ave'),
//     leading: new Icon(
//       Icons.theaters,
//       color: Colors.blue[500],
//     ),
//   ),
//   new ListTile(
//     title: new Text('The Castro Theater',
//         style: new TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
//     subtitle: new Text('429 Castro St'),
//     leading: new Icon(
//       Icons.theaters,
//       color: Colors.blue[500],
//     ),
//   ),
//   new ListTile(
//     title: new Text('Alamo Drafthouse Cinema',
//         style: new TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
//     subtitle: new Text('2550 Mission St'),
//     leading: new Icon(
//       Icons.theaters,
//       color: Colors.blue[500],
//     ),
//   ),
//   new ListTile(
//     title: new Text('Roxie Theater',
//         style: new TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
//     subtitle: new Text('3117 16th St'),
//     leading: new Icon(
//       Icons.theaters,
//       color: Colors.blue[500],
//     ),
//   ),
//   new ListTile(
//     title: new Text('United Artists Stonestown Twin',
//         style: new TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
//     subtitle: new Text('501 Buckingham Way'),
//     leading: new Icon(
//       Icons.theaters,
//       color: Colors.blue[500],
//     ),
//   ),
//   new ListTile(
//     title: new Text('AMC Metreon 16',
//         style: new TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
//     subtitle: new Text('135 4th St #3000'),
//     leading: new Icon(
//       Icons.theaters,
//       color: Colors.blue[500],
//     ),
//   ),
//   new Divider(),
//   new ListTile(
//     title: new Text('K\'s Kitchen',
//         style: new TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
//     subtitle: new Text('757 Monterey Blvd'),
//     leading: new Icon(
//       Icons.restaurant,
//       color: Colors.blue[500],
//     ),
//   ),
//   new ListTile(
//     title: new Text('Emmy\'s Restaurant',
//         style: new TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
//     subtitle: new Text('1923 Ocean Ave'),
//     leading: new Icon(
//       Icons.restaurant,
//       color: Colors.blue[500],
//     ),
//   ),
//   new ListTile(
//     title: new Text('Chaiya Thai Restaurant',
//         style: new TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
//     subtitle: new Text('272 Claremont Blvd'),
//     leading: new Icon(
//       Icons.restaurant,
//       color: Colors.blue[500],
//     ),
//   ),
//   new ListTile(
//     title: new Text('La Ciccia',
//         style: new TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
//     subtitle: new Text('291 30th St'),
//     leading: new Icon(
//       Icons.restaurant,
//       color: Colors.blue[500],
//     ),
//   ),
//     new ListTile(
//     title: new Text('zzzzzLa Ciccia',
//         style: new TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
//     subtitle: new Text('291 30th St'),
//     leading: new Icon(
//       Icons.restaurant,
//       color: Colors.blue[500],
//     ),
//   ),
//    new ListTile(
//     title: new Text('zzzzzLa Ciccia',
//         style: new TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
//     subtitle: new Text('291 30th St'),
//     leading: new Icon(
//       Icons.restaurant,
//       color: Colors.blue[500],
//     ),
//   ),
//    new ListTile(
//     title: new Text('zzzzzLa Ciccia',
//         style: new TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
//     subtitle: new Text('291 30th St'),
//     leading: new Icon(
//       Icons.restaurant,
//       color: Colors.blue[500],
//     ),
//   ),
//    new ListTile(
//     title: new Text('zzzzzLa Ciccia',
//         style: new TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
//     subtitle: new Text('291 30th St'),
//     leading: new Icon(
//       Icons.restaurant,
//       color: Colors.blue[500],
//     ),
//   ),
//    new ListTile(
//     title: new Text('zzzzzLa Ciccia',
//         style: new TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
//     subtitle: new Text('291 30th St'),
//     leading: new Icon(
//       Icons.restaurant,
//       color: Colors.blue[500],
//     ),
//   ),
//    new ListTile(
//     title: new Text('yuclara Ciccia',
//         style: new TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
//     subtitle: new Text('291 30th St'),
//     leading: new Icon(
//       Icons.restaurant,
//       color: Colors.blue[500],
//     ),
//   ),
//      new ListTile(
//     title: new Text('eeeeeyuclara Ciccia',
//         style: new TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
//     subtitle: new Text('291 30th St'),
//     leading: new Icon(
//       Icons.restaurant,
//       color: Colors.blue[500],
//     ),
//   ),
// ];