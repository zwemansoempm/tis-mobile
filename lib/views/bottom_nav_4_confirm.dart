import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tis/bloc/get_city_bloc.dart';
import 'package:tis/model/job_confirm.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:tis/views/bottom_nav_4_complete.dart';
import 'package:tis/model/job_detail.dart';
import 'package:tis/bloc/get_job_detail_bloc.dart';
import 'package:tis/model/job_detail_response.dart';
import 'package:http/http.dart' as http;

class JobConfirmWidget extends StatefulWidget {
  final String value;
  final JobConfirmModel jobConfirmModel;

  JobConfirmWidget({Key key, this.value, this.jobConfirmModel})
      : super(key: key);
  @override
  _BottomNav4ConfirmState createState() => _BottomNav4ConfirmState();
}

enum Gender { male, female }

class _BottomNav4ConfirmState extends State<JobConfirmWidget> {
  var stream;
  final format = DateFormat("yyyy-mm-dd");
  Gender _gender = Gender.male;
  bool chkAgree = false;
  static String _city;
  var lastName=null;

  void initState() {
    super.initState();
    getCityBloc..getCity();
    getJobDetailBloc..getJobDetetail(widget.value);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: StreamBuilder<JobDetailResponse>(
          stream: getJobDetailBloc.subject.stream,
          builder: (context, AsyncSnapshot<JobDetailResponse> snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data.error != null &&
                  snapshot.data.error.length > 0) {
                return Container();
              } else {
                //print(snapshot.data.job);
                return _jobConfirmData(snapshot.data.job);
                //return Container();
              }
            } else if (snapshot.hasError) {
              return Container();
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }

  Widget _jobConfirmData(JobDetailModel obj) {
    return Container(
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.only(
        top: 40.0,
        bottom: 20.0,
        left: 10,
        right: 10,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 40, left: 10, right: 10),
          child: Column(children: [
            Row(children: []),
            _header("${obj.title}"),
            Container(
              padding: EdgeInsets.all(10.0),
              margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(thickness: 2),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Card(
                          margin: EdgeInsets.all(10.0),
                          //color: Colors.blue,
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              "1.入力",
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                        ),
                        Card(
                          margin: EdgeInsets.all(10.0),
                          color: Colors.blue,
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              "2.確認",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        Card(
                          margin: EdgeInsets.all(10.0),
                          //color: Colors.blue,
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              "3.完了",
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                        ),
                      ]),
                  _jobHeader("お名前"),
                  _jobObject("${widget.jobConfirmModel.name}"),
                  _jobHeader("フリガナ"),
                  _jobObject("${widget.jobConfirmModel.furigana}"),
                  _jobHeader("生年月日"),
                  _jobObject("${widget.jobConfirmModel.birthday}"),
                  _jobHeader("性別"),
                  _jobObject("${widget.jobConfirmModel.gender}"),
                  _jobHeader("郵便番号"),
                  _jobObject("${widget.jobConfirmModel.zip_code}"),
                  _jobHeader("都道府県"),
                  _jobObject("${widget.jobConfirmModel.state}"),
                  _jobHeader("市区町村"),
                  _jobObject("${widget.jobConfirmModel.city}"),
                  _jobHeader("番地（建物名）"),
                  _jobObject("${widget.jobConfirmModel.address}"),
                  _jobHeader("電話番号"),
                  _jobObject("${widget.jobConfirmModel.phoneno}"),
                  _jobHeader("メールアドレス"),
                  _jobObject("${widget.jobConfirmModel.mail}"),
                  _jobHeader("ご希望等"),
                  _jobObject("${widget.jobConfirmModel.wish}"),
                  SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        // padding: EdgeInsets.only(left: 80.0),
                        child: SizedBox(
                          width: 160,

                          //height: 100.0,
                          child: RaisedButton(
                            onPressed: () async {
                              var splitName=widget.jobConfirmModel.name.split(' ');

                                if(splitName.asMap().containsKey(1)){
                                  lastName=splitName[1];
                                }
                                var params = { 
                                   "job_id" : widget.value, 
                                  "first_name": splitName[0],
                                  "last_name": lastName,                                  
                                  "birthday" : widget.jobConfirmModel.birthday,
                                  "gender":widget.jobConfirmModel.gender,
                                  "postal":widget.jobConfirmModel.zip_code,
                                  "street_address":widget.jobConfirmModel.state,
                                  "township_id":widget.jobConfirmModel.townshipId,
                                  "home_address":widget.jobConfirmModel.address,    
                                  "phone":widget.jobConfirmModel.phoneno,
                                  "email":widget.jobConfirmModel.mail,
                                  "remark":widget.jobConfirmModel.wish,
                                  "skills":[]
                                };  

                              final http.Response response = await http.post(
                                   'https://test.t-i-s.jp/api/jobapply',                               
                                headers: {                              
                                 "Content-type": "application/json",
                                },
                                body:jsonEncode(params),
                                ); 
                                if(response.statusCode==200){
                                  var route = new MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        new JobCompleteWidget(value: widget.value),
                                  );
                                  Navigator.of(context).push(route);
                                }else{ 
                                      // set up the button
                                      Widget okButton = FlatButton(
                                        child: Text("OK"),
                                        onPressed: () {
                                           Navigator.pop(context);
                                         },
                                      );

                                      // set up the AlertDialog
                                      AlertDialog alert = AlertDialog(
                                        title: Text("失敗！！"),
                                        content: Text("データ登録は失敗しました。"),
                                        actions: [
                                          okButton,
                                        ],
                                      );

                                      // show the dialog
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return alert;
                                        },
                                      );                                 
                                }
                               
                            },
                            color: Colors.green[600],
                            textColor: Colors.white,
                            child: Center(
                              child: Text("対応する"),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ]),
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
        Expanded(
            child: Align(
          alignment: Alignment.topRight,
          child: Text(
            name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
        )),
      ],
    );
  }

  Widget _jobHeader(String name) {
    //if (chkImp == "") {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 1.0),
        color: Colors.grey[300],
      ),
      child: ListTile(
        title: Text(name),
      ),
    );
  }

  Widget _jobObject(String name) {
    //if (chkImp == "") {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 1.0),
        //color: Colors.grey[300],
      ),
      child: ListTile(
        title: Text(name),
      ),
    );
  }

  _launchURL() async {
    const url = 'https://www.post.japanpost.jp/zipcode/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
