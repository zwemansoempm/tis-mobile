import 'package:flutter/material.dart';

class TopPage extends StatefulWidget{
  final List<String> list=List.generate(10, (index) => "Textto $index");
  @override
    _TopPageState createState() => _TopPageState();
}
    
class _TopPageState extends State<TopPage> {
  @override
  Widget build(BuildContext context) {
    
        
      return new Scaffold(        
        // No appbar provided to the Scaffold, only a body with a
        // CustomScrollView.
        body: CustomScrollView(
          
            slivers: <Widget>[
            // Add the app bar to the CustomScrollView.
               SliverAppBar(
                 automaticallyImplyLeading: false,
                 leading: IconButton(      
                   padding: new EdgeInsets.all(20.0),          
                   icon: Image.asset("assets/images/refresh.png"),
                   onPressed: () {  },                 
                 ),
                  centerTitle: false,
                  title:  Transform(                    
                      // you can forcefully translate values left side using Transform
                      transform:MediaQuery.of(context).size.width>1000?Matrix4.translationValues(MediaQuery.of(context).size.width/3.5, 0.0, 0):
                      MediaQuery.of(context).size.width>700?Matrix4.translationValues(MediaQuery.of(context).size.width/4.3, 0.0, 0):
                      MediaQuery.of(context).size.width>417 || MediaQuery.of(context).size.width>680 ?Matrix4.translationValues(MediaQuery.of(context).size.width/25, 0.0, 0):
                      Matrix4.translationValues(-15, 0.0, 0),
                     // transform:MediaQuery.of(context).size.width>417 || MediaQuery.of(context).size.width>680 ?Matrix4.translationValues(MediaQuery.of(context).size.width/25, 0.0, 0):Matrix4.translationValues(-15, 0.0, 0),
                    child: Row(
                        
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[ 
                            SizedBox(
              
                                    height:MediaQuery.of(context).size.height,
                                    width: MediaQuery.of(context).size.width>1000?MediaQuery.of(context).size.width/3.5:
                                            MediaQuery.of(context).size.width>700?MediaQuery.of(context).size.width/3:
                                            MediaQuery.of(context).size.width>417 ||  MediaQuery.of(context).size.width>680 ?MediaQuery.of(context).size.width/1.5:
                                            MediaQuery.of(context).size.width/1.4,
                                          // width: MediaQuery.of(context).size.width>417 ||  MediaQuery.of(context).size.width>680 ?MediaQuery.of(context).size.width/1.5:MediaQuery.of(context).size.width/1.4,
                                    child: new IconButton(                  
                                            icon:  Image.asset("assets/images/s1.png"),
                                            onPressed: null,
                                    )
                            ), 
                      ],
                    ),
                  ),                   
                  // Allows the user to reveal the app bar if they begin scrolling
                  // back up the list of items.
                  floating: true,
                  // Display a placeholder widget to visualize the shrinking size.
                  // flexibleSpace: Placeholder(),
                  // Make the initial height of the SliverAppBar larger than normal.
                  // expandedHeight: 100,
               ),
               // Next, create a SliverList
              SliverList(
                // Use a delegate to build items as they're scrolled on screen.
                delegate: SliverChildBuilderDelegate(
                    // The builder function returns a ListTile with a title that
                    // displays the index of the current item.
                    (context, index) => ListTile(title: Text('Item #$index')),
                    // Builds 200 ListTiles
                    childCount: 20,
                )
              )
            ]
        )
      );  
  }
}