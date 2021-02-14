import 'package:flutter/material.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';
import 'package:tis/model/city.dart';
import 'package:tis/model/city_response.dart';
import 'package:tis/bloc/get_city_bloc.dart';
import 'package:tis/model/job.dart';
import 'package:cupertino_icons/cupertino_icons.dart';

class JobInsertWidget extends StatefulWidget {
  final JobModel value;

  JobInsertWidget({Key key, this.value}) : super(key: key);
  @override
  _BottomNav4InsertState createState() => _BottomNav4InsertState();
}

enum Gender { male, female }

class _BottomNav4InsertState extends State<JobInsertWidget> {
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
              Row(children: [
                // SizedBox(width: 5.0),
                // Icon(Icons.map, color: Colors.blue),
                // SizedBox(width: 5.0),
                // Text("地図検索"),
              ]),
              // DottedLine(
              //   dashColor: Colors.blue,
              // ),
              _header("${widget.value.title}"),
              Container(
                padding: EdgeInsets.all(10.0),
                margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                // decoration:
                //     BoxDecoration(border: Border.all(color: Colors.blueAccent)),
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
                            //color: Colors.blue,
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                "2.確認",
                                style: TextStyle(color: Colors.blue),
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

                    _jobHeader("お名前", "必須"),
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
                        ListTile(
                          title: Text("例）探し太郎"),
                        ),
                        //Text('例）探し太郎')
                      ]),
                    ),

                    _jobHeader("フリガナ", "必須"),

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
                        ListTile(
                          title: Text("例）サガシタロウ"),
                        ),
                        //Text('例）探し太郎')
                      ]),
                    ),

                    // Container(
                    //   decoration: BoxDecoration(
                    //     border: Border.all(color: Colors.grey, width: 1.0),
                    //   ),
                    //   child: ListTile(
                    //     title: Text("生年月日"),
                    //     trailing: Card(
                    //       margin: EdgeInsets.all(10.0),
                    //       color: Colors.red,
                    //     ),
                    //   ),
                    // ),

                    _jobHeader("生年月日", ""),
                    Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 1.0),
                        ),
                        child: Container(
                          child: Column(children: <Widget>[
                            Text('${format.pattern}'),
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
                          ]),
                        )),

                    _jobHeader("性別", ""),
                    Container(
                        margin: EdgeInsets.only(bottom: 10.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 1.0),
                        ),
                        child: Column(children: <Widget>[
                          ListTile(
                            title: const Text('男性'),
                            leading: Radio(
                              value: Gender.male,
                              groupValue: _gender,
                              onChanged: (Gender value) {
                                setState(() {
                                  _gender = value;
                                });
                              },
                            ),
                          ),
                          ListTile(
                            title: const Text('女性'),
                            leading: Radio(
                              value: Gender.female,
                              groupValue: _gender,
                              onChanged: (Gender value) {
                                setState(() {
                                  _gender = value;
                                });
                              },
                            ),
                          ),
                        ])),
                    _jobHeader("ご住所", ""),

                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1.0),
                      ),
                      child: Column(children: <Widget>[
                        ListTile(
                          title: Text("郵便番号"),
                        ),
                        Padding(
                          padding: EdgeInsets.all(15),
                          child: Theme(
                            child: TextField(
                              //obscureText: true,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                fillColor: Colors.grey,
                                //labelText: 'Password',
                                hintText: '郵便番号を入力してください。',
                              ),
                            ),
                            data: Theme.of(context).copyWith(
                              primaryColor: Colors.blue,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                                onPressed: () {
                                  setState(() {});
                                },
                                color: Colors.green,
                                textColor: Colors.white,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.search),
                                    SizedBox(width: 6),
                                    Text('検索',
                                        style: TextStyle(
                                          fontSize: 12,
                                        )),
                                  ],
                                )),
                            Text(
                              "例）1006740（郵便番号検索）",
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Container(
                              // decoration: BoxDecoration(
                              //   border:
                              //       Border.all(color: Colors.grey, width: 1.0),
                              // ),
                              child: ListTile(
                                title: Text("都道府県"),
                                trailing: Card(
                                  margin: EdgeInsets.all(10.0),
                                  color: Colors.red,
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(
                                      "必須",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(8),
                              padding: EdgeInsets.symmetric(horizontal: 5.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: Colors.white,
                                  border: Border.all(color: Colors.grey[400])),
                              child: StreamBuilder<CityResponse>(
                                  stream: getCityBloc.subject.stream,
                                  builder: (context,
                                      AsyncSnapshot<CityResponse> snapshot) {
                                    if (snapshot.hasData) {
                                      if (snapshot.data.error != null &&
                                          snapshot.data.error.length > 0) {
                                        return Container();
                                      }

                                      return Container(
                                        child: DropdownButtonHideUnderline(
                                          child: new DropdownButton<String>(
                                            //isDense: true,
                                            isExpanded: true,
                                            //hint: new Text("市区町"),
                                            hint: Row(
                                              children: [
                                                Icon(
                                                  Icons
                                                      .arrow_drop_down_outlined,
                                                  size: 35.0,
                                                ),
                                                Text("選択してください。"),
                                              ],
                                            ),

                                            value: _city,
                                            onChanged: (String newValue) {
                                              setState(() => _city = newValue);
                                            },
                                            items: snapshot.data.city
                                                .toList()
                                                .map((CityModel cityModel) =>
                                                    DropdownMenuItem(
                                                        value: cityModel.id
                                                            .toString(),
                                                        child: Text(cityModel
                                                            .city_name)))
                                                .toList(),
                                          ),
                                        ),
                                      );
                                    } else if (snapshot.hasError) {
                                      return Container();
                                    } else {
                                      return Container(); //buildLoadingWidget();
                                    }
                                  }),
                            ),
                            Container(
                              // decoration: BoxDecoration(
                              //   border:
                              //       Border.all(color: Colors.grey, width: 1.0),
                              // ),
                              child: ListTile(
                                title: Text("市区町村"),
                                trailing: Card(
                                  margin: EdgeInsets.all(10.0),
                                  color: Colors.red,
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(
                                      "必須",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(8),
                              padding: EdgeInsets.symmetric(horizontal: 5.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: Colors.white,
                                  border: Border.all(color: Colors.grey[400])),
                              child: StreamBuilder<CityResponse>(
                                  stream: getCityBloc.subject.stream,
                                  builder: (context,
                                      AsyncSnapshot<CityResponse> snapshot) {
                                    if (snapshot.hasData) {
                                      if (snapshot.data.error != null &&
                                          snapshot.data.error.length > 0) {
                                        return Container();
                                      }

                                      return Container(
                                        child: DropdownButtonHideUnderline(
                                          child: new DropdownButton<String>(
                                            //isDense: true,
                                            isExpanded: true,
                                            //hint: new Text("市区町"),
                                            hint: Row(
                                              children: [
                                                Icon(
                                                  Icons
                                                      .arrow_drop_down_outlined,
                                                  size: 35.0,
                                                ),
                                                Text("選択してください。"),
                                              ],
                                            ),

                                            value: _city,
                                            onChanged: (String newValue) {
                                              setState(() => _city = newValue);
                                            },
                                            items: snapshot.data.city
                                                .toList()
                                                .map((CityModel cityModel) =>
                                                    DropdownMenuItem(
                                                        value: cityModel.id
                                                            .toString(),
                                                        child: Text(cityModel
                                                            .city_name)))
                                                .toList(),
                                          ),
                                        ),
                                      );
                                    } else if (snapshot.hasError) {
                                      return Container();
                                    } else {
                                      return Container(); //buildLoadingWidget();
                                    }
                                  }),
                            ),
                            Container(
                              // decoration: BoxDecoration(
                              //   border:
                              //       Border.all(color: Colors.grey, width: 1.0),
                              // ),
                              child: ListTile(
                                title: Text("番地（建物名）"),
                                trailing: Card(
                                  margin: EdgeInsets.all(10.0),
                                  color: Colors.red,
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(
                                      "必須",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(8),
                              padding: EdgeInsets.symmetric(horizontal: 5.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: Colors.white,
                                  border: Border.all(color: Colors.grey[400])),
                              child: StreamBuilder<CityResponse>(
                                  stream: getCityBloc.subject.stream,
                                  builder: (context,
                                      AsyncSnapshot<CityResponse> snapshot) {
                                    if (snapshot.hasData) {
                                      if (snapshot.data.error != null &&
                                          snapshot.data.error.length > 0) {
                                        return Container();
                                      }

                                      return Container(
                                        child: DropdownButtonHideUnderline(
                                          child: new DropdownButton<String>(
                                            //isDense: true,
                                            isExpanded: true,
                                            //hint: new Text("市区町"),
                                            hint: Row(
                                              children: [
                                                Icon(
                                                  Icons
                                                      .arrow_drop_down_outlined,
                                                  size: 35.0,
                                                ),
                                                Text("番地を入力してください。"),
                                              ],
                                            ),

                                            value: _city,
                                            onChanged: (String newValue) {
                                              setState(() => _city = newValue);
                                            },
                                            items: snapshot.data.city
                                                .toList()
                                                .map((CityModel cityModel) =>
                                                    DropdownMenuItem(
                                                        value: cityModel.id
                                                            .toString(),
                                                        child: Text(cityModel
                                                            .city_name)))
                                                .toList(),
                                          ),
                                        ),
                                      );
                                    } else if (snapshot.hasError) {
                                      return Container();
                                    } else {
                                      return Container(); //buildLoadingWidget();
                                    }
                                  }),
                            ),
                            Text("例）区丸の内1-9-1 グラントウキョウサウスタワー40階")
                          ],
                        ),
                      ]),
                    ),

                    _jobHeader("電話番号", ""),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1.0),
                      ),
                      child: Column(children: <Widget>[
                        ListTile(
                          title: Text("※電話番号またはメールアドレス必須"),
                        ),
                        Row(children: <Widget>[
                          Card(
                            margin: EdgeInsets.all(10.0),
                            color: Colors.red,
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                "必須",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          )
                        ]),
                        Padding(
                          padding: EdgeInsets.all(15),
                          child: Theme(
                            child: TextField(
                              //obscureText: true,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                fillColor: Colors.grey,
                                //labelText: 'Password',
                                hintText: '電話番号を入力してください。',
                              ),
                            ),
                            data: Theme.of(context).copyWith(
                              primaryColor: Colors.blue,
                            ),
                          ),
                        ),
                        Container(
                          // decoration: BoxDecoration(
                          //   border: Border.all(color: Colors.grey, width: 1.0),
                          // ),
                          child: Column(children: <Widget>[
                            ListTile(
                              title: Text("例）0312345678　(半角)"),
                            ),
                          ]),
                        ),
                      ]),
                    ),

                    _jobHeader("メールアドレス", ""),

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
                                hintText: 'メールアドレスを入力してください。',
                              ),
                            ),
                            data: Theme.of(context).copyWith(
                              primaryColor: Colors.blue,
                            ),
                          ),
                        ),
                        Container(
                          child: Column(children: <Widget>[
                            ListTile(
                              title: Text("例）abc@example.jp(半角)"),
                            ),
                          ]),
                        ),
                      ]),
                    ),

                    _jobHeader("ご希望等", ""),

                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1.0),
                      ),
                      child: Column(children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(15),
                          child: Theme(
                            child: TextFormField(
                              //obscureText: true,
                              maxLines: 3,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                fillColor: Colors.grey,
                              ),
                            ),
                            data: Theme.of(context).copyWith(
                              primaryColor: Colors.blue,
                            ),
                          ),
                        ),
                      ]),
                    ),

                    _jobHeader("個人情報について", "必須"),

                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1.0),
                      ),
                      child: Column(children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 3),
                          child: Text(
                            '「プライバシーポリシー」をご確認いただき、よろしければ「同意する」にチェックをして、内容を送信してください。',
                          ),
                        ),

                        // ListTile(
                        //   title: Text("例）探し太郎"),
                        // ),
                        Row(
                          children: <Widget>[
                            Checkbox(
                              value: this.chkAgree,
                              onChanged: (bool value) {
                                setState(() {
                                  this.chkAgree = value;
                                });
                              },
                            ),
                            Text("同意する"),
                          ],
                        )
                        //Text('例）探し太郎')
                      ]),
                    ),

                    Container(
                        child: Text(
                      "※未入力の必須項目がございます。",
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    )),
                    SizedBox(height: 10.0),

                    //SizedBox(height: 10.0),
                    // RaisedButton(
                    //   onPressed: () {
                    //     // var route = new MaterialPageRoute(
                    //     //   builder: (BuildContext context) =>
                    //     //       new JobDetailWidget(),
                    //     // );
                    //     // Navigator.of(context).push(route);
                    //   },
                    //   color: Colors.green[600],
                    //   textColor: Colors.white,
                    //   child: Center(
                    //     child: Text("確認画面へ進む"),
                    //   ),
                    // ),

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

  Widget _jobHeader(String name, String chkImp) {
    if (chkImp == "") {
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
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 1.0),
        color: Colors.grey[300],
      ),
      child: ListTile(
        title: Text(name),
        trailing: Card(
          margin: EdgeInsets.all(10.0),
          color: Colors.red,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              chkImp,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
