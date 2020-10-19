import 'package:flutter/material.dart';

class SearchWidget extends StatefulWidget { 
  @override
  _BottomNav2State createState() => _BottomNav2State();

}

class _BottomNav2State  extends State<SearchWidget> {
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
                          (context, index) => ListTile(title: Text('SEARCH PAGE')),//'Item #$index'
                          // Builds 200 ListTiles
                          childCount: 10,
                      )
                   ),
                ],
              )
        );
  }
  
}
  