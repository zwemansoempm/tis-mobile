import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import 'package:tis/model/job_confirm.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:tis/views/top.dart';
import 'package:tis/model/job_detail.dart';
import 'package:tis/bloc/get_job_detail_bloc.dart';
import 'package:tis/model/job_detail_response.dart';

class JobCompleteWidget extends StatefulWidget {
  final String value;
  final JobConfirmModel jobConfirmModel;

  const JobCompleteWidget({Key key, this.value, this.jobConfirmModel})
      : super(key: key);
  @override
  _BottomNav4CompleteState createState() => _BottomNav4CompleteState();
}

enum Gender { male, female }

class _BottomNav4CompleteState extends State<JobCompleteWidget> {
  var stream;
  final format = DateFormat("yyyy-mm-dd");
  Gender _gender = Gender.male;
  bool chkAgree = false;
  static String _city;

  void initState() {
    super.initState();
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
                return _jobCompleteData(snapshot.data.job);
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

  Widget _jobCompleteData(JobDetailModel jobObj) {
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
            _header("${jobObj.title}"),
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
                          color: Colors.blue,
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              "1.入力",
                              style: TextStyle(color: Colors.white),
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
                          color: Colors.blue,
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              "3.完了",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ]),
                  Row(
                    children: <Widget>[
                      Center(
                        child: Container(
                          //height: 120.0,
                          //width: 120.0,
                          //color: Colors.blue[50],
                          child: Align(
                            alignment: Alignment(0.0, 1.0),
                            child: Text(
                              "求人への応募が完了しました",
                              style: TextStyle(
                                //fontWeight: FontWeight.bold,
                                fontSize: 19.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Center(
                          child: Container(
                            //height: 120.0,
                            //width: 120.0,
                            //color: Colors.blue[50],
                            child: Align(
                              alignment: Alignment(0.0, 1.0),
                              child: Text("担当者より連絡があるまでしばらくおまちください。"),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
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
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const TopPage()));
                            },
                            color: Colors.green[600],
                            textColor: Colors.white,
                            child: Center(
                              child: Text("ホームへ戻る"),
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
