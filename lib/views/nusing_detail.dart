import 'package:flutter/material.dart';


class NusingDetail extends StatefulWidget {
  NusingDetail({Key key}) : super(key: key);

  @override
  _NusingDetailState createState() => _NusingDetailState();
}

class _NusingDetailState extends State<NusingDetail> {
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