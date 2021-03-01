import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tis/model/job.dart';
import 'package:tis/views/bottom_nav_4_insert.dart';
import 'package:tis/views/top.dart';

class JobDetailWidget extends StatefulWidget {
  final JobModel value;

  JobDetailWidget({Key key, this.value}) : super(key: key);
  @override
  _BottomNav4DetailState createState() => _BottomNav4DetailState();
}

class _BottomNav4DetailState extends State<JobDetailWidget> {
  var stream;
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
            padding: const EdgeInsets.only(left: 20, right: 20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(children: <Widget>[
                InkWell(
                  child: Text(
                    "ホーム",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 18,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => TopPage()));
                  },
                ),
                Icon(
                  Icons.chevron_right,
                  color: Colors.grey,
                ),
                Text(
                  "求人詳細",
                  style: TextStyle(
                    //color: Colors.blue,
                    fontSize: 18,
                  ),
                ),
              ]),
              Container(
                padding: EdgeInsets.all(5.0),
                margin: EdgeInsets.only(bottom: 8.0),
                child: Text(
                  "施設名:" + "",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              Container(
                height: 90,
                child: Row(
                  children: [
                    Container(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.ballot_rounded,
                          color: Colors.grey,
                        ),
                        Expanded(
                            child: Align(
                          alignment: Alignment.topRight,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: <Widget>[],
                              ),
                            ],
                          ),
                        ))
                      ],
                    )),
                    Expanded(
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          "${widget.value.title}",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(5.0),
                margin: EdgeInsets.only(bottom: 8.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Text("施設番号: ${widget.value.jobnum}",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              _jobTitle(
                  Icon(
                    Icons.insert_drive_file,
                    color: Colors.blue,
                  ),
                  "仕事内容"),
              _jobValue("${widget.value.description}"),
              _jobTitle(
                  Icon(
                    Icons.star,
                    color: Colors.blue,
                  ),
                  "経験．スキル"),
              _jobValue("${widget.value.skills}"),
              _jobTitle(
                  Icon(
                    Icons.location_on,
                    color: Colors.blue,
                  ),
                  "都道府県"),
              _jobValue("${widget.value.city_name}"),
              _jobTitle(
                  Icon(
                    Icons.location_on,
                    color: Colors.blue,
                  ),
                  "市区町村"),
              _jobValue(""),
              _jobTitle(
                  Icon(
                    Icons.location_on,
                    color: Colors.blue,
                  ),
                  "勤務地"),
              _jobValue("${widget.value.location}"),
              _jobTitle(
                  Icon(
                    CupertinoIcons.flowchart_fill,
                    color: Colors.blue,
                  ),
                  "最寄駅"),
              _jobValue("${widget.value.nearest_station}"),
              _jobTitleWithIcon("類", "雇用形態"),
              Container(
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1.0),
                ),
                child: Row(
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width / 2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Card(
                              margin: EdgeInsets.all(10.0),
                              color: Colors.blue,
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  "${widget.value.employment_status}",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            //employment_status
                            // Expanded(
                            //     child: Align(
                            //   alignment: Alignment.bottomLeft,
                            //   child: Row(
                            //     mainAxisAlignment:
                            //         MainAxisAlignment.spaceBetween,
                            //     children: <Widget>[
                            //       Row(
                            //         children: <Widget>[],
                            //       ),
                            //     ],
                            //   ),
                            // ))
                          ],
                        )),
                    // Expanded(
                    //   child: Align(
                    //     alignment: Alignment.topRight,
                    //     // child: Image.asset(
                    //     //   "assets/logos/bbc-news.png",
                    //     //   fit: BoxFit.fitHeight,
                    //     // ),
                    //   ),
                    // ),
                  ],
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
                      child: Text("¥",
                          style: TextStyle(fontSize: 20, color: Colors.blue)),
                    ),
                    title: Text("給料"),
                  )),
              _jobValue("${widget.value.salary_remark}"),
              _jobTitle(
                  Icon(
                    CupertinoIcons.briefcase_fill,
                    color: Colors.blue,
                  ),
                  "特別な条件"),
              _jobValue("${widget.value.allowances}"),
              _jobTitle(
                  Icon(
                    Icons.badge,
                    color: Colors.blue,
                  ),
                  "各種保険"),
              _jobValue("${widget.value.insurance}"),
              _jobTitle(Icon(Icons.badge, color: Colors.blue), "就業時間"),
              _jobValue("${widget.value.working_hours}"),
              _jobTitleWithIcon("休", "休日休暇"),
              _jobValue("${widget.value.holidays}"),
              _jobTitle(
                  Icon(
                    Icons.location_city_rounded,
                    color: Colors.blue,
                  ),
                  "放設名"),
              _jobValue(""),
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
                          var route = new MaterialPageRoute(
                            builder: (BuildContext context) =>
                                new JobInsertWidget(value: widget.value),
                          );
                          Navigator.of(context).push(route);
                        },
                        color: Colors.grey,
                        textColor: Colors.white,
                        child: Center(
                          child: Text("この条件に対応する"),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }

  Widget _jobValue(String name) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 1.0),
      ),
      child: ListTile(
        title: Text(name),
      ),
    );
  }

  Widget _jobTitle(Icon icon, String name) {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 1.0),
          color: Colors.grey[300],
        ),
        child: ListTile(
          leading: CircleAvatar(
            foregroundColor: Colors.black,
            radius: 18.0,
            backgroundColor: Colors.grey[200],
            child: icon,
          ),
          title: Text(name),
        ));
  }

  Widget _jobTitleWithIcon(String icon, String name) {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 1.0),
          color: Colors.grey[300],
        ),
        child: ListTile(
          leading: CircleAvatar(
            foregroundColor: Colors.black,
            radius: 18.0,
            backgroundColor: Colors.grey[200],
            child:
                Text(icon, style: TextStyle(fontSize: 20, color: Colors.blue)),
          ),
          title: Text(name),
        ));
  }
}
