import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildLoadingWidget() {
    return Center(
      child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
                      height: 35.0,
                      width: 35.0,
                      child:CircularProgressIndicator(),// CupertinoActivityIndicator(),
        ),
        SizedBox(
          height: 10,
        ),
        Text('Loading...',style: TextStyle(color: Colors.blueAccent),)
      ],
    ));
  }