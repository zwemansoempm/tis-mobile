import 'package:flutter/material.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';

class JobInsertWidget extends StatefulWidget {
  final String value;

  JobInsertWidget({Key key, this.value}) : super(key: key);
  @override
  _BottomNav4InsertState createState() => _BottomNav4InsertState();
}

class _BottomNav4InsertState extends State<JobInsertWidget> {
  var stream;
  final format = DateFormat("yyyy-MM-dd");
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 40, left: 10, right: 10),
            child: Column(children: [
              Row(children: [
                SizedBox(width: 5.0),
                Icon(Icons.map, color: Colors.blue),
                SizedBox(width: 5.0),
                Text("地図検索"),
              ]),
              DottedLine(
                dashColor: Colors.blue,
              ),
              SizedBox(height: 20),
              //_header("${widget.value.title}"),
              SizedBox(height: 10),
              Divider(thickness: 2),
              Container(
                padding: EdgeInsets.all(10.0),
                margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.blueAccent)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(5.0),
                      margin: EdgeInsets.only(bottom: 8.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Text("施設番号:" + ""),
                    ),
                    InkWell(
                      child: Text("ベストライフ三鷹",
                          style: TextStyle(
                              color: Colors.blue,
                              //fontSize: 18.0,
                              decoration: TextDecoration.underline)),
                      onTap: () {
                        //Navigator.push(context, MaterialPageRoute(builder: (context)=> NusingDetail()));
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 0.0),
                      child: Row(children: [
                        Text("開設年月日 :", style: TextStyle(color: Colors.green)),
                        Text("2017-04-01")
                      ]),
                    ),
                    Divider(thickness: 2),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 8.0, bottom: 8.0, left: 8.0),
                      child: Row(children: [
                        Text("東京都"),
                        SizedBox(width: 4.0),
                        Icon(Icons.double_arrow),
                        SizedBox(width: 4.0),
                        Text("三鷹市")
                      ]),
                    ),
                    Card(
                      margin: EdgeInsets.all(10.0),
                      color: Colors.blue,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          "64室(全室個室)",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 1.0),
                        ),
                        child: ListTile(
                          leading: CircleAvatar(
                              foregroundColor: Colors.black,
                              radius: 18.0,
                              backgroundColor: Colors.grey[200],
                              child: Icon(
                                Icons.location_on,
                                color: Colors.blue,
                              )),
                          //leading: Icon(Icons.location_on,color: Colors.blue,),
                          title: Text("お名前"),
                        )),

                    // Container(
                    //   decoration: BoxDecoration(
                    //     border: Border.all(color: Colors.grey, width: 1.0),
                    //   ),
                    //   // child: ListView(
                    //   //   children: <Widget>[
                    // Theme(
                    //   child: TextField(
                    //     //obscureText: true,
                    //     decoration: InputDecoration(
                    //       border: OutlineInputBorder(),
                    //       fillColor: Colors.grey,
                    //       //labelText: 'Password',
                    //       hintText: 'お名前を入力してください。',
                    //     ),
                    //   ),
                    //   data: Theme.of(context).copyWith(
                    //     primaryColor: Colors.blue,
                    //   ),
                    // ),
                    //   //   ],
                    //   //padding: EdgeInsets.all(15),
                    //   //child:
                    // ),

                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1.0),
                      ),
                      child: Column(children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(15),
                          child: Theme(
                            child: TextField(
                              //obscureText: true,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                fillColor: Colors.grey,
                                //labelText: 'Password',
                                hintText: 'お名前を入力してください。',
                              ),
                            ),
                            data: Theme.of(context).copyWith(
                              primaryColor: Colors.blue,
                            ),
                          ),
                        ),
                        Text('例）探し太郎')
                      ]),
                    ),
                    Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 1.0),
                        ),
                        child: ListTile(
                          leading: CircleAvatar(
                            foregroundColor: Colors.black,
                            radius: 18.0,
                            backgroundColor: Colors.grey[200],
                            child: Text("¥",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.blue)),
                          ),
                          title: Text("フリガナ"),
                        )),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1.0),
                      ),
                      child: Column(children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(15),
                          child: Theme(
                            child: TextField(
                              //obscureText: true,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                fillColor: Colors.grey,
                                //labelText: 'Password',
                                hintText: 'フリガナを入力してください。',
                              ),
                            ),
                            data: Theme.of(context).copyWith(
                              primaryColor: Colors.blue,
                            ),
                          ),
                        ),
                        Text('例）サガシタロウ')
                      ]),
                    ),

                    Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 1.0),
                        ),
                        child: ListTile(
                          leading: CircleAvatar(
                            foregroundColor: Colors.black,
                            radius: 18.0,
                            backgroundColor: Colors.grey[200],
                            child: Text("時",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.blue)),
                          ),
                          title: Text("生年月日"),
                        )),

                    Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 1.0),
                        ),
                        child: Column(children: <Widget>[
                          Text('Basic date field (${format.pattern})'),
                          DateTimeField(
                            format: format,
                            onShowPicker: (context, currentValue) {
                              return showDatePicker(
                                  context: context,
                                  firstDate: DateTime(1900),
                                  initialDate: currentValue ?? DateTime.now(),
                                  lastDate: DateTime(2100));
                            },
                          ),
                        ])),
                    Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 1.0),
                        ),
                        child: ListTile(
                          leading: CircleAvatar(
                              foregroundColor: Colors.black,
                              radius: 18.0,
                              backgroundColor: Colors.grey[200],
                              child: Icon(
                                Icons.shopping_bag_sharp,
                                color: Colors.blue,
                              )),
                          title: Text("市区町村"),
                        )),
                    Container(
                      margin: EdgeInsets.only(bottom: 10.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1.0),
                      ),
                      child: ListTile(
                        title: Text(""),
                      ),
                    ),
                    Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 1.0),
                        ),
                        child: ListTile(
                          leading: CircleAvatar(
                              foregroundColor: Colors.black,
                              radius: 18.0,
                              backgroundColor: Colors.grey[200],
                              child: Icon(
                                Icons.location_on,
                                color: Colors.blue,
                              )),
                          //leading: Icon(Icons.location_on,color: Colors.blue,),
                          title: Text("勤務地"),
                        )),

                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1.0),
                      ),
                      child: ListTile(
                        title: Text(
                          "",
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ),
                    Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 1.0),
                        ),
                        child: ListTile(
                          leading: CircleAvatar(
                              foregroundColor: Colors.black,
                              radius: 18.0,
                              backgroundColor: Colors.grey[200],
                              child: Icon(
                                Icons.location_on,
                                color: Colors.blue,
                              )),
                          //leading: Icon(Icons.location_on,color: Colors.blue,),
                          title: Text("最寄駅"),
                        )),

                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1.0),
                      ),
                      child: ListTile(
                        title: Text(
                          "",
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ),
                    Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 1.0),
                        ),
                        child: ListTile(
                          leading: CircleAvatar(
                              foregroundColor: Colors.black,
                              radius: 18.0,
                              backgroundColor: Colors.grey[200],
                              child: Icon(
                                Icons.location_on,
                                color: Colors.blue,
                              )),
                          //leading: Icon(Icons.location_on,color: Colors.blue,),
                          title: Text("給料"),
                        )),

                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1.0),
                      ),
                      child: ListTile(
                        title: Text(
                          "",
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ),
                    Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 1.0),
                        ),
                        child: ListTile(
                          leading: CircleAvatar(
                              foregroundColor: Colors.black,
                              radius: 18.0,
                              backgroundColor: Colors.grey[200],
                              child: Icon(
                                Icons.location_on,
                                color: Colors.blue,
                              )),
                          //leading: Icon(Icons.location_on,color: Colors.blue,),
                          title: Text("特別な条件"),
                        )),

                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1.0),
                      ),
                      child: ListTile(
                        title: Text(
                          "",
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ),
                    Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 1.0),
                        ),
                        child: ListTile(
                          leading: CircleAvatar(
                              foregroundColor: Colors.black,
                              radius: 18.0,
                              backgroundColor: Colors.grey[200],
                              child: Icon(
                                Icons.location_on,
                                color: Colors.blue,
                              )),
                          //leading: Icon(Icons.location_on,color: Colors.blue,),
                          title: Text("各種保険"),
                        )),

                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1.0),
                      ),
                      child: ListTile(
                        title: Text(
                          "}",
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ),
                    Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 1.0),
                        ),
                        child: ListTile(
                          leading: CircleAvatar(
                              foregroundColor: Colors.black,
                              radius: 18.0,
                              backgroundColor: Colors.grey[200],
                              child: Icon(
                                Icons.location_on,
                                color: Colors.blue,
                              )),
                          //leading: Icon(Icons.location_on,color: Colors.blue,),
                          title: Text("就業時間"),
                        )),

                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1.0),
                      ),
                      child: ListTile(
                        title: Text(
                          "",
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ),
                    Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 1.0),
                        ),
                        child: ListTile(
                          leading: CircleAvatar(
                              foregroundColor: Colors.black,
                              radius: 18.0,
                              backgroundColor: Colors.grey[200],
                              child: Icon(
                                Icons.location_on,
                                color: Colors.blue,
                              )),
                          //leading: Icon(Icons.location_on,color: Colors.blue,),
                          title: Text("就業時間"),
                        )),

                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1.0),
                      ),
                      child: ListTile(
                        title: Text(
                          "",
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ),
                    Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 1.0),
                        ),
                        child: ListTile(
                          leading: CircleAvatar(
                              foregroundColor: Colors.black,
                              radius: 18.0,
                              backgroundColor: Colors.grey[200],
                              child: Icon(
                                Icons.location_on,
                                color: Colors.blue,
                              )),
                          //leading: Icon(Icons.location_on,color: Colors.blue,),
                          title: Text("放設名"),
                        )),

                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1.0),
                      ),
                      child: ListTile(
                        title: Text(
                          "",
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0),

                    //SizedBox(height: 10.0),
                    RaisedButton(
                      onPressed: () {
                        // var route = new MaterialPageRoute(
                        //   builder: (BuildContext context) =>
                        //       new JobDetailWidget(),
                        // );
                        // Navigator.of(context).push(route);
                      },
                      color: Colors.blue,
                      textColor: Colors.white,
                      child: Center(
                        child: Text("この条件に対応する"),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }

  Widget _header(String name) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(color: Colors.blue),
          height: 42.0,
          width: 10.0,
        ),
        Container(
          width: MediaQuery.of(context).size.width - 30.0,
          decoration: BoxDecoration(color: Colors.grey[200]),
          padding: EdgeInsets.all(8.0),
          child: Text(
            name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
        ),
      ],
    );
  }
}
