import 'package:flutter/material.dart';

import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';

import 'package:tis/model/city.dart';
import 'package:tis/model/city_response.dart';
import 'package:tis/bloc/get_city_bloc.dart';
import 'package:tis/model/job.dart';
import 'package:tis/model/job_confirm.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:tis/views/bottom_nav_4_confirm.dart';

import 'package:tis/model/township.dart';
import 'package:tis/model/township_response.dart';
import 'package:tis/bloc/get_tsp_bloc.dart';
import 'package:tis/model/postal_list.dart';
import 'package:tis/model/postal_list_response.dart';
import 'package:tis/bloc/get_postalList_block.dart';
import 'package:tis/elements/loader.dart';

class JobInsertWidget extends StatefulWidget {
  final JobModel value;

  JobInsertWidget({Key key, this.value}) : super(key: key);
  @override
  _BottomNav4InsertState createState() => _BottomNav4InsertState();
}

enum Gender { male, female }

class _BottomNav4InsertState extends State<JobInsertWidget> {
  TextEditingController nameController = TextEditingController();
  TextEditingController furiganaController = TextEditingController();
  TextEditingController birthdayController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController zipCodeController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneNoController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController wishController = TextEditingController();

  var stream;
  final format = DateFormat("yyyy-MM-dd");
  Gender _gender = Gender.male;
  bool chkAgree = false;
  String _city;

  var stream1;
  var checkstream = 0;

  String dropdownValue = 'One';

  String _township;

  String pref;
  String city;
  String _street;
  int city_id;
  String township_id;
  //String _township;

  List<PostalList> postalList;
  List<TownshipModel> tspIdList;

  @override
  void initState() {
    getCityBloc..getCity();

    super.initState();
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

                              controller: nameController,
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
                              controller: furiganaController,
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
                            )
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
                              //controller: nameController,
                              value: Gender.male,
                              groupValue: _gender,
                              onChanged: (Gender value) {
                                setState(() {
                                  _gender = value;
                                  genderController.text = '男性';
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
                                  genderController.text = '女性';
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
                              controller: zipCodeController,
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
                                  setState(() {
                                    if (zipCodeController.text != "") {
                                      getPostalBloc
                                        ..getPostalList(zipCodeController.text);
                                    } else {
                                      //print(zipCodeController.text);
                                    }
                                  });
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
                            Row(children: [
                              Text("例）1006740（"),
                              GestureDetector(
                                  child: Text("郵便番号検索",
                                      style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          color: Colors.blue)),
                                  onTap: () {
                                    _launchURL();
                                  }),
                              Text(")"),
                            ]),
                          ],
                        ),
                        Container(
                            child: StreamBuilder<PostalListResponse>(
                                stream: getPostalBloc.subject.stream,
                                builder: (context,
                                    AsyncSnapshot<PostalListResponse>
                                        snapshot) {
                                  if (snapshot.hasData) {
                                    if (snapshot.data.error != null &&
                                        snapshot.data.error.length > 0) {
                                      return Container();
                                    }

                                    postalList = snapshot.data.postalList;
                                    tspIdList = snapshot.data.tspList;
                                    city_id = postalList[0].city_id;
                                    _city = city_id.toString();
                                    township_id = tspIdList[0].id.toString();
                                    _street = postalList[0].street;
                                    addressController.text = _street;
                                    print(township_id);
                                    return Container();
                                  } else if (snapshot.hasError) {
                                    return Container();
                                  } else {
                                    return Container();
                                  }
                                })),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Container(
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
                              //padding: EdgeInsets.all(5.0),
                              padding: EdgeInsets.only(left: 5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: Colors.white,
                                  border: Border.all(color: Colors.grey[400])),
                              child: StreamBuilder<CityResponse>(
                                  stream: getCityBloc.subject.stream,
                                  builder: (context,
                                      AsyncSnapshot<CityResponse> snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return Stack(
                                        children: <Widget>[
                                          _dropDown("市区町村"),
                                          Center(
                                            child: Opacity(
                                              opacity: 1.0,
                                              child:
                                                  buildLoadingWidget(), //CircularProgressIndicator(),
                                            ),
                                          ),
                                        ],
                                      );
                                    } else if (snapshot.hasError) {
                                      return Container();
                                    } else if (snapshot.hasData) {
                                      if (snapshot.data.error != null &&
                                          snapshot.data.error.length > 0) {
                                        return Container();
                                      }
                                      List<CityModel> cityList = List();
                                      cityList.add(new CityModel(-1, ""));
                                      snapshot.data.city.forEach((e) {
                                        cityList.add(e);
                                      });

                                      return Container(
                                          //width: 320.0,
                                          child: DropdownButtonHideUnderline(
                                        child: new DropdownButton<String>(
                                          //isDense: true,
                                          isExpanded: true,
                                          hint: Row(
                                            children: [
                                              Icon(
                                                Icons.arrow_drop_down_outlined,
                                                size: 35.0,
                                              ),
                                              Text("市区町村"),
                                            ],
                                          ),
                                          value: _city,
                                          onChanged: (String newValue) {
                                            setState(() {
                                              _township = null;
                                              getTspBloc.drainStream();
                                              stream1 = getTspBloc
                                                ..getTownship(newValue);
                                              checkstream = 1;
                                              _city = newValue;
                                            });
                                          },

                                          items: cityList
                                              .map((CityModel cityModel) =>
                                                  DropdownMenuItem(
                                                    value:
                                                        cityModel.id.toString(),
                                                    child: cityModel.id != -1
                                                        ? Text(
                                                            cityModel.city_name)
                                                        : Row(
                                                            children: [
                                                              Icon(
                                                                Icons
                                                                    .arrow_drop_down_outlined,
                                                                size: 35.0,
                                                              ),
                                                              Text("市区町村"),
                                                            ],
                                                          ),
                                                  ))
                                              .toList(),
                                        ),
                                      ));
                                    } else {
                                      return Stack(
                                        children: <Widget>[
                                          _dropDown("市区町村"),
                                          Center(
                                            child: Opacity(
                                              opacity: 1.0,
                                              child:
                                                  buildLoadingWidget(), //CircularProgressIndicator(),
                                            ),
                                          ),
                                        ],
                                      );
                                      // );//_dropDown("市区町村"); //buildLoadingWidget();
                                    }
                                  }),
                            ),
                            Container(
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
                              padding: EdgeInsets.only(left: 5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: Colors.white,
                                  border: Border.all(color: Colors.grey[400])),
                              child: StreamBuilder<TownshipResponse>(
                                  stream: getTspBloc.subject.stream,
                                  builder: (context,
                                      AsyncSnapshot<TownshipResponse>
                                          snapshot) {
                                    if (snapshot.connectionState ==
                                            ConnectionState.waiting &&
                                        checkstream == 1) {
                                      return Stack(
                                        children: <Widget>[
                                          _dropDown("市区町村"),
                                          Center(
                                            child: Opacity(
                                              opacity: 1.0,
                                              child:
                                                  buildLoadingWidget(), //CircularProgressIndicator(),
                                            ),
                                          ),
                                        ],
                                      );
                                    } else if (snapshot.hasError) {
                                      return Container();
                                    } else if (snapshot.hasData) {
                                      if (snapshot.data.error != null &&
                                          snapshot.data.error.length > 0) {
                                        return Container();
                                      }
                                      checkstream = 0;
                                      List<TownshipModel> townships = List();
                                      townships
                                          .add(new TownshipModel(-1, "", ""));
                                      snapshot.data.township.forEach((e) {
                                        townships.add(e);
                                      });
                                      return Container(
                                          child: DropdownButtonHideUnderline(
                                        child: new DropdownButton<String>(
                                          //isDense: true,
                                          isExpanded: true,
                                          hint: Row(
                                            children: [
                                              Icon(
                                                Icons.arrow_drop_down_outlined,
                                                size: 35.0,
                                              ),
                                              Text("市区町村"),
                                            ],
                                          ),
                                          value: _township,
                                          onChanged: (String newValue) {
                                            setState(
                                                () => _township = newValue);
                                          },
                                          items: townships
                                              .map((TownshipModel tspModel) =>
                                                  DropdownMenuItem(
                                                    value:
                                                        tspModel.id.toString(),
                                                    //child: Text(tspModel.township_name)
                                                    child: tspModel.id != -1
                                                        ? Text(tspModel
                                                            .township_name)
                                                        : Row(
                                                            children: [
                                                              Icon(
                                                                Icons
                                                                    .arrow_drop_down_outlined,
                                                                size: 35.0,
                                                              ),
                                                              Text("市区町村"),
                                                            ],
                                                          ),
                                                  ))
                                              .toList(),
                                        ),
                                      ));
                                    } else {
                                      return Stack(
                                        children: <Widget>[
                                          _dropDown("市区町村"),
                                          Center(
                                            child: Opacity(
                                              opacity: 1.0,
                                              child: checkstream == 1
                                                  ? buildLoadingWidget()
                                                  : Container(), //CircularProgressIndicator(),
                                            ),
                                          ),
                                        ],
                                      );
                                    }
                                  }),
                            ),
                            Container(
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
                            Padding(
                              padding: EdgeInsets.all(15),
                              child: Theme(
                                child: TextField(
                                  //obscureText: true,
                                  controller: addressController,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    fillColor: Colors.grey,
                                    //labelText: 'Password',
                                    hintText: '番地を入力してください。',
                                  ),
                                ),
                                data: Theme.of(context).copyWith(
                                  primaryColor: Colors.blue,
                                ),
                              ),
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
                              controller: phoneNoController,
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
                              controller: mailController,
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
                              controller: wishController,
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
                    Container(
                      padding: EdgeInsets.only(left: 80.0),
                      child: SizedBox(
                        width: 160,

                        //height: 100.0,
                        child: RaisedButton(
                          onPressed: () {
                            JobConfirmModel user = new JobConfirmModel(
                                nameController.text,
                                furiganaController.text,
                                birthdayController.text,
                                genderController.text,
                                "zipCode",
                                "state",
                                "city",
                                addressController.text,
                                phoneNoController.text,
                                mailController.text,
                                wishController.text);
                            var route = new MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  new JobConfirmWidget(
                                      value: widget.value,
                                      jobConfirmModel: user),
                            );
                            Navigator.of(context).push(route);
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

  Widget _dropDown(String hintText) {
    return DropdownButtonHideUnderline(
      child: new DropdownButton<String>(
        //isDense: true,
        isExpanded: true,
        hint: Row(
          children: [
            Icon(
              Icons.arrow_drop_down_outlined,
              size: 35.0,
            ),
            Text(hintText),
          ],
        ),
        onChanged: (String newValue) {},
        items: [],
      ),
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

  _launchURL() async {
    const url = 'https://www.post.japanpost.jp/zipcode/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
