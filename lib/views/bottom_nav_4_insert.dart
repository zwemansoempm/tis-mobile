import 'package:flutter/material.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';
import 'package:tis/model/city.dart';
import 'package:tis/model/city_response.dart';
import 'package:tis/bloc/get_city_bloc.dart';

class JobInsertWidget extends StatefulWidget {
  final String value;

  JobInsertWidget({Key key, this.value}) : super(key: key);
  @override
  _BottomNav4InsertState createState() => _BottomNav4InsertState();
}

enum Gender { male, female }

class _BottomNav4InsertState extends State<JobInsertWidget> {
  var stream;
  final format = DateFormat("yyyy-mm-dd");
  Gender _gender = Gender.male;
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
                        title: Text("お名前"),
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

                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1.0),
                      ),
                      child: ListTile(
                        title: Text("フリガナ"),
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

                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1.0),
                      ),
                      child: ListTile(
                        title: Text("生年月日"),
                        trailing: Card(
                          margin: EdgeInsets.all(10.0),
                          color: Colors.red,
                        ),
                      ),
                    ),

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
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1.0),
                      ),
                      child: ListTile(
                        title: Text("性別"),
                        trailing: Card(
                          margin: EdgeInsets.all(10.0),
                          color: Colors.red,
                        ),
                      ),
                    ),
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
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1.0),
                      ),
                      child: ListTile(
                        title: Text("ご住所"),
                        trailing: Card(
                          margin: EdgeInsets.all(10.0),
                          color: Colors.red,
                        ),
                      ),
                    ),

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
                            Text("区丸の内1-9-1 グラントウキョウサウスタワー40階")
                          ],
                        ),
                      ]),
                    ),

                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1.0),
                      ),
                      child: ListTile(
                        title: Text("電話番号"),
                        trailing: Card(
                          margin: EdgeInsets.all(10.0),
                          color: Colors.red,
                        ),
                      ),
                    ),
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

                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1.0),
                      ),
                      child: ListTile(
                        title: Text("メールアドレス"),
                        trailing: Card(
                          margin: EdgeInsets.all(10.0),
                          color: Colors.red,
                        ),
                      ),
                    ),
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

                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1.0),
                      ),
                      child: ListTile(
                        title: Text("ご希望等"),
                      ),
                    ),

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
