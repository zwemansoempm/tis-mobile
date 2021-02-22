import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildLoadingWidget() {
    return Center(
      child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 13,
        ),
        SizedBox(
                      height: 35.0,
                      width: 35.0,
                      child:CupertinoActivityIndicator(),// CircularProgressIndicator(),//   CupertinoActivityIndicator(),
        ),        
        // Text('Loading...',style: TextStyle(color: Colors.blueAccent),)
      ],
    ));
  }