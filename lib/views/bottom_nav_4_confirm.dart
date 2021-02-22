import 'package:flutter/material.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';
import 'package:tis/model/city.dart';
import 'package:tis/model/city_response.dart';
import 'package:tis/bloc/get_city_bloc.dart';
import 'package:tis/model/job.dart';
import 'package:tis/model/job_confirm.dart';
import 'package:url_launcher/url_launcher.dart';

class JobConfirmWidget extends StatefulWidget {
  final JobModel value;
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

  void initState() {
    super.initState();
    getCityBloc..getCity();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
              _header("${widget.value.title}"),
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
                    Container(
                      padding: EdgeInsets.only(left: 80.0),
                      child: SizedBox(
                        width: 160,

                        //height: 100.0,
                        child: RaisedButton(
                          onPressed: () {
                            // var route = new MaterialPageRoute(
                            //   builder: (BuildContext context) =>
                            //       new JobInsertWidget(value: widget.value),
                            // );
                            // Navigator.of(context).push(route);
                          },
                          color: Colors.green[600],
                          textColor: Colors.white,
                          child: Center(
                            child: Text("確認画面へ進む"),
                          ),
                        ),
                      ),
                    )
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

    //}
    // return Container(
    //   decoration: BoxDecoration(
    //     border: Border.all(color: Colors.grey, width: 1.0),
    //     color: Colors.grey[300],
    //   ),
    //   child: ListTile(
    //     title: Text(name),
    //     trailing: Card(
    //       margin: EdgeInsets.all(10.0),
    //       color: Colors.red,
    //       child: Padding(
    //         padding: const EdgeInsets.all(4.0),
    //         child: Text(
    //           chkImp,
    //           style: TextStyle(color: Colors.white),
    //         ),
    //       ),
    //     ),
    //   ),
    // );
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
