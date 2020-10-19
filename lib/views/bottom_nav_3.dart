import 'package:flutter/material.dart';

class PlaceWidget extends StatefulWidget { 
  @override
  _BottomNav3State createState() => _BottomNav3State();

}

class _BottomNav3State  extends State<PlaceWidget> {
  @override
  Widget build(BuildContext context) {
        return Container(
              child: CustomScrollView(
                slivers: <Widget>[ 
                    SliverList(
                    // Use a delegate to build items as they're scrolled on screen.
                      delegate: SliverChildBuilderDelegate(                       
                          // The builder function returns a ListTile with a title that
                          // displays the index of the current item.
                          (context, index) => ListTile(title: Text('MAP PAGE')),//'Item #$index'
                          // Builds 200 ListTiles
                          childCount: 10,
                      )
                   ),
                ],
              )
        );
  }
  
}
  