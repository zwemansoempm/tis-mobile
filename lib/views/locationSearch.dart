import 'package:flutter/material.dart';

class LocationSearch extends StatefulWidget {
  const LocationSearch({Key key}) : super(key: key);

  @override
  _LocationSearchState createState() => _LocationSearchState();
}

class _LocationSearchState extends State<LocationSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Color(0xffffffff),
        leading: BackButton(
          color: Colors.black
        ),
        title: Text('Location Search',style: TextStyle(
          color: Colors.black
        )),
      ),
    );
  }
}