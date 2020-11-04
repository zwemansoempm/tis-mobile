import 'package:flutter/material.dart';

class PlaceWidget extends StatefulWidget { 
  @override
  _BottomNav3State createState() => _BottomNav3State();

}

class _BottomNav3State  extends State<PlaceWidget> {
  @override
  Widget build(BuildContext context) {
        return Container(
              // child: CustomScrollView(
              //   slivers: <Widget>[ 
              //       SliverList(
              //       // Use a delegate to build items as they're scrolled on screen.
              //         delegate: SliverChildBuilderDelegate(                       
              //             // The builder function returns a ListTile with a title that
              //             // displays the index of the current item.
              //             (context, index) => ListTile(title: Text('MAP PAGE')),//'Item #$index'
              //             // Builds 200 ListTiles
              //             childCount: 10,
              //         )
              //      ),
              //   ],
              // )
              
              child: Padding(
                padding: const EdgeInsets.only(top: 40,left: 10,right: 10),
                child: Column(
                  
                  children:[
                    Text(
                      'Local',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold, 
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 20.0,
                          width: 30.0,
                          child: Divider(color: Colors.red[400],thickness: 3.0,)
                        ),
                        SizedBox(
                          height: 20.0,
                          width: 30.0,
                          child: Divider(color: Colors.orange[400],thickness: 3.0,)
                        ),
                        SizedBox(
                          height: 20.0,
                          width: 30.0,
                          child: Divider(color: Colors.green[400],thickness: 3.0,)
                        ),
                        SizedBox(
                          height: 20.0,
                          width: 30.0,
                          child: Divider(color: Colors.blue[400],thickness: 3.0,)
                        ),
                      ]
                    ),
                    Card(
                      
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  'SMARTNEWS FEATURE',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold, 
                                  ),
                                ),
                              ]
                            ),
                             Row(
                              children: [
                                Text(
                                  'Local News',
                                  style: TextStyle(
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.bold, 
                                  ),
                                ),
                              ]
                            ),
                            SizedBox(
                              height: 20.0,
                              width: 365.0,
                              child: Divider(color: Colors.grey[300]),
                            ),
                            Row(children: [
                              Icon(Icons.location_on, color: Colors.red,size: 16.0,),
                              Text(
                                  'MY LOCATION',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold, 
                                  ),
                                ),
                              ],
                            ),

                            Container(
                              height: 90,
                              child: Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(
                                      top: 10.0, left: 4.0,  right: 10.0, bottom: 4.0),
                                    width:MediaQuery.of(context).size.width/2,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Breaking sports news, restaurant,locallocal events,politics, and more!",
                                          maxLines: 3,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14.0
                                          )
                                        ),
                                        
                                        Expanded(
                                          child: Align(
                                          alignment: Alignment.bottomLeft,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Row(
                                                children: <Widget>[
                                                  Text(
                                                      "LOCAL NEWS",
                                                      style: TextStyle(
                                                          color: Colors.black38,
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: 10.0))
                                                ],
                                              ),
                                            ],
                                          ),
                                        ))
                                      ],
                                    )
                                  ),
                                  Expanded(
                                    child: Align(
                                      alignment: Alignment.topRight,
                                      child:  Image.asset(
                                      "assets/logos/bbc-news.png", 
                                      fit: BoxFit.fitHeight,
                                      )
                                    )
                                  ), 
                                ],
                              ),

                            ),

                          ],
                        ),
                      )
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: Column(
                        children: [
                          Text(
                            'Get the latest local news by',
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.black,
                              //fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'sharing your location',
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.black,
                              //fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),

                    Container(
                      width: 250,
                      child: Card(
                        color: Colors.blue,
                        margin: EdgeInsets.only(top: 20.0),
                        child: ListTile(
                          title : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.location_on, color: Colors.white,),
                              SizedBox(width: 7),
                              Text(
                                'SHARE LOCATION',
                                style: TextStyle(
                                  fontFamily: 'Source Sans Pro',
                                   //fontWeight: FontWeight.bold, 
                                  color: Colors.white,
                                  fontSize: 20.0
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20.0),
                      child: Text(
                        'Enter Zip Code',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ]
                ),
              ),
        );
  }
  
}
  