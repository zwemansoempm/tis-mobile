import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/services.dart';
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
import 'package:tis/model/job_detail.dart';
import 'package:tis/bloc/get_job_detail_bloc.dart';
import 'package:tis/model/job_detail_response.dart';
import 'package:form_validator/form_validator.dart';
import 'package:flutter_focus_watcher/flutter_focus_watcher.dart';

class JobInsertWidget extends StatefulWidget {
  final String value;

  const JobInsertWidget({Key key, this.value}) : super(key: key);
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
  TextEditingController townshipId = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneNoController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController wishController = TextEditingController();

  DateTime _selectedDate;
  var stream;
  final format = DateFormat("yyyy-MM-dd");
  Gender _gender;
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
  // String _cityId;
  String township_id;
  //String _township;
  int checkSearch = 0;

  List<PostalList> postalList;
  List<TownshipModel> tspIdList;
  GlobalKey<FormState> _form = GlobalKey<FormState>();
  ScrollController _scrollController = new ScrollController();

  _validate() {
    return _form.currentState.validate();
  }

  @override
  void initState() {
    getCityBloc..getCity();
    // getPostalBloc..getPostalList('1006740');
    stream;
    stream1;
    getJobDetailBloc..getJobDetetail(widget.value);
    super.initState();
  }

  @override
  void dispose() {
    getCityBloc.drainStream();
    getPostalBloc.drainStream();
    getTspBloc.drainStream();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FocusWatcher(
      child: Scaffold(
        body: Form(
          key: _form,
          child: Padding(
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
                    return _postJobData(snapshot.data.job);
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
        ),
      ),
    );
  }

  _selectDate(BuildContext context) async {
    DateTime newSelectedDate = await showDatePicker(
        context: context,
        initialDate: _selectedDate != null ? _selectedDate : DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2040),
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: ThemeData.dark().copyWith(
              colorScheme: ColorScheme.dark(
                primary: Colors.white,
                onPrimary: Colors.blueGrey,
                surface: Colors.blueAccent,
                onSurface: Colors.white,
              ),
              dialogBackgroundColor: Colors.brown,
            ),
            child: child,
          );
        });

    if (newSelectedDate != null) {
      _selectedDate = newSelectedDate;
      birthdayController
        ..text = DateFormat("yyyy-MM-dd").format(_selectedDate)
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: birthdayController.text.length,
            affinity: TextAffinity.upstream));
    }
  }

  Widget columnData() {
    return Column(
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
              builder: (context, AsyncSnapshot<CityResponse> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Stack(
                    children: <Widget>[
                      _dropDown("選択してください。"),
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
                    child: ButtonTheme(
                      alignedDropdown: true,
                      child: new DropdownButton<String>(
                        //isDense: true,
                        isExpanded: true,
                        hint: Row(
                          children: [
                            Icon(
                              Icons.arrow_drop_down_outlined,
                              size: 35.0,
                            ),
                            Text("選択してください。"),
                          ],
                        ),
                        value: _city,
                        onChanged: (String newValue) {
                          _city = '';
                          setState(() {
                            stateController.text = cityList[int.parse(newValue)]
                                .city_name
                                .toString();

                            if (checkSearch == 1) {
                              checkSearch = 0;
                            }
                            checkstream = 1;

                            //  else{
                            //    checkSearch=1;
                            //  }
                            // township_id='';
                            // _township = newValue;

                            _township = null;
                            // _township=newValue;
                            getTspBloc.drainStream();
                            stream1 = getTspBloc..getTownship(newValue);
                            _city = newValue;
                            if (township_id != '') {
                              township_id = '';
                            }
                          });
                        },

                        items: cityList
                            .map((CityModel cityModel) => DropdownMenuItem(
                                  value: cityModel.id.toString(),
                                  child: cityModel.id != -1
                                      ? Text(cityModel.city_name)
                                      : Row(
                                          children: [
                                            Icon(
                                              Icons.arrow_drop_down_outlined,
                                              size: 35.0,
                                            ),
                                            Text("選択してください。"),
                                          ],
                                        ),
                                ))
                            .toList(),
                      ),
                    ),
                  ));
                } else {
                  return Stack(
                    children: <Widget>[
                      _dropDown("選択してください。"),
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
              builder: (context, AsyncSnapshot<TownshipResponse> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting &&
                    checkstream == 1) {
                  //
                  return Stack(
                    children: <Widget>[
                      _dropDown("選択してください。"),
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
                } else if (snapshot.hasData && checkstream == 1) {
                  if (snapshot.data.error != null &&
                      snapshot.data.error.length > 0) {
                    return Container();
                  }

                  List<TownshipModel> townships = List();
                  townships.add(new TownshipModel(-1, "", ""));
                  snapshot.data.township.forEach((e) {
                    townships.add(e);
                  });
                  // print('t1');
                  // print(township_id);
                  // print(_township);
                  return Container(
                      child: DropdownButtonHideUnderline(
                    child: ButtonTheme(
                      alignedDropdown: true,
                      child: new DropdownButton<String>(
                        //isDense: true,
                        isExpanded: true,
                        hint: Row(
                          children: [
                            Icon(
                              Icons.arrow_drop_down_outlined,
                              size: 35.0,
                            ),
                            Text("選択してください。"),
                          ],
                        ),
                        value: township_id == '' ? _township : township_id,
                        onChanged: (String newValue) {
                          setState(() {
                            townships.map((TownshipModel tspModel) {
                              if (tspModel.id.toString() == newValue) {
                                cityController.text =
                                    tspModel.township_name.toString();
                                townshipId.text = tspModel.id.toString();
                              }
                            }).toList();
                            if (checkSearch == 1) {
                              checkSearch = 0;
                            }
                            township_id = '';
                            _township = newValue;
                          });
                        },
                        items: townships
                            .map((TownshipModel tspModel) => DropdownMenuItem(
                                  value: tspModel.id.toString(),
                                  //child: Text(tspModel.township_name)
                                  child: tspModel.id != -1
                                      ? Text(tspModel.township_name)
                                      : Row(
                                          children: [
                                            Icon(
                                              Icons.arrow_drop_down_outlined,
                                              size: 35.0,
                                            ),
                                            Text("選択してください。"),
                                          ],
                                        ),
                                ))
                            .toList(),
                      ),
                    ),
                  ));
                } else {
                  // print('t12');
                  // print(township_id);
                  // print(checkstream);
                  return Stack(
                    children: <Widget>[
                      _dropDown("選択してください。"),
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
            child: TextFormField(
              //obscureText: true,
              // validator:
              //     ValidationBuilder().minLength(1).maxLength(200).build(),
              controller: addressController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                fillColor: Colors.grey,
                //labelText: 'Password',
                labelText: '番地を入力してください。',
              ),
            ),
            data: Theme.of(context).copyWith(
              primaryColor: Colors.blue,
            ),
          ),
        ),
        Text("例）区丸の内1-9-1 グラントウキョウサウスタワー40階")
      ],
    );
  }

  Widget _postJobData(JobDetailModel jobObj) {
    String pattern =
        '^([0-9]{4}|[0-9]{2})[-]([0]?[1-9]|[1][0-2])[-]([0]?[1-9]|[1|2][0-9]|[3][0|1])';
    RegExp regExp = new RegExp(pattern);
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
        controller: _scrollController, //reverse: true,
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
                          child: TextFormField(
                            //obscureText: true,
                            validator: ValidationBuilder()
                                .regExp(
                                    RegExp(
                                        "(\\[w]+|[一-龠]+|[ぁ-ゔ]+|[ァ-ヴー]+|[a-zA-Z0-9]+|[ａ-ｚＡ-Ｚ０-９]+|[々〆〤]+)\\s+(\\[w]+|[一-龠]+|[ぁ-ゔ]+|[ァ-ヴー]+|[a-zA-Z0-9]+|[ａ-ｚＡ-Ｚ０-９]+|[々〆〤]+)",
                                        unicode: false),
                                    "お名前を入力してください。")
                                .minLength(1)
                                .maxLength(50)
                                .build(),
                            controller: nameController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              fillColor: Colors.grey,
                              //labelText: 'Password',
                              // hintText: '',
                              //labelText: 'お名前を入力してください。',
                              // helperText: 'Min length: 5, max length: 50',
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
                          child: TextFormField(
                            validator: new ValidationBuilder()
                                .regExp(
                                    RegExp("/[ぁ-ゔ]+|[ァ-ヴー]+|[a-zA-Z0-9]+/u",
                                        unicode: false),
                                    "フリガナを入力してください。")
                                .minLength(1)
                                .maxLength(50)
                                .build(),
                            controller: furiganaController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              fillColor: Colors.grey,
                              //labelText: 'Password',
                              //labelText: 'フリガナを入力してください。',
                              hintStyle: TextStyle(fontSize: 15),
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
                          Padding(
                            padding: EdgeInsets.all(0),
                            child: Theme(
                              data: Theme.of(context).copyWith(
                                primaryColor: Colors.blue,
                              ),
                              child: TextFormField(
                                validator: (value) => value.isNotEmpty
                                    ? regExp
                                            .hasMatch(value)
                                            .toString()
                                            .endsWith("false")
                                        ? "生年月日の書式を確認して\nください。"
                                        : null
                                    : null,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  fillColor: Colors.grey,
                                  contentPadding: EdgeInsets.fromLTRB(
                                      30.0, 10.0, 100.0, 10.0),
                                  labelText: '年 - 月 - 日',
                                  hintStyle: TextStyle(fontSize: 15),
                                ),
                                controller: birthdayController,
                                onTap: () {
                                  _selectDate(context);
                                },
                              ),
                            ),
                          ),

                          // Text('${format.pattern}'),
                          // DateTimeField(
                          //   decoration: const InputDecoration(
                          //      labelText: '年 - 月 - 日',
                          //   ),
                          //   format: format,
                          //   onShowPicker: (context, currentValue) {
                          //     return showDatePicker(
                          //         context: context,
                          //         firstDate: DateTime(1900),
                          //         initialDate: currentValue ?? DateTime.now(),
                          //         lastDate: DateTime(2100));
                          //   },
                          // )
                        ]),
                      )),
                  _jobHeader("性別", ""),
                  Container(
                      // margin: EdgeInsets.only(bottom: 10.0),
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
                          child: TextFormField(
                            //obscureText: true,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            // validator:new ValidationBuilder()
                            // .minLength(1).maxLength(10).build(),
                            maxLength: 7,
                            controller: zipCodeController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              fillColor: Colors.grey,
                              //labelText: 'Password',
                              labelText: '郵便番号',
                              hintStyle: TextStyle(fontSize: 15),
                            ),
                          ),
                          data: Theme.of(context).copyWith(
                            primaryColor: Colors.blue,
                          ),
                        ),
                      ),
                      Column(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                            child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                                onPressed: () {
                                  if (zipCodeController.text != "") {
                                    stream = getPostalBloc
                                      ..getPostalList(zipCodeController.text);
                                  }
                                  setState(() {
                                    _city = null;
                                    _township = null;
                                    township_id = null;
                                    if (zipCodeController.text != "") {
                                      checkSearch = 1;
                                    } else {
                                      checkSearch = 0;
                                    }
                                    FocusScope.of(context).unfocus();
                                  });
                                },
                                color: Colors.green,
                                textColor: Colors.white,
                                child: Container(
                                  width: 100,
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
                                  ),
                                )),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                            child: Row(children: [
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
                          ),
                        ],
                      ),
                      checkSearch == 0
                          ? columnData()
                          : Container(
                              child: StreamBuilder<PostalListResponse>(
                                  stream: getPostalBloc.subject.stream,
                                  builder: (context,
                                      AsyncSnapshot<PostalListResponse>
                                          snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return Stack(
                                        children: <Widget>[
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
                                        return columnErrorData();
                                      }

                                      postalList = snapshot.data.postalList;
                                      tspIdList = snapshot.data.tspList;
                                      city_id = postalList[0].city_id;
                                      _city = city_id.toString();
                                      // _cityId =checkSearch==1?city_id.toString():'';
                                      getTspBloc.drainStream();
                                      stream1 = getTspBloc..getTownship(_city);

                                      township_id = checkSearch == 1
                                          ? tspIdList[0].id.toString()
                                          : '';

                                      // print('txp');
                                      // print(township_id);
                                      _street = postalList[0].street;
                                      stateController.text = postalList[0].pref;
                                      cityController.text = postalList[0].city;

                                      addressController.text = _street;

                                      print(stateController.text);
                                      print(cityController.text);
                                      print(addressController.text);
                                      checkstream = 1;

                                      return columnData();
                                    } else {
                                      return Center(
                                        child: Opacity(
                                          opacity: 1.0,
                                          child:
                                              buildLoadingWidget(), //CircularProgressIndicator(),
                                        ),
                                      );
                                    }
                                  })),
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
                          child: TextFormField(
                            //obscureText: true,
                            validator: ValidationBuilder()
                                .phone('電話番号を入力してください。')
                                .minLength(1)
                                .maxLength(50)
                                .build(),
                            controller: phoneNoController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              fillColor: Colors.grey,
                              //labelText: 'Password',
                              //labelText: '電話番号を入力してください。',
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
                          child: TextFormField(
                            // validator: ValidationBuilder()
                            //     .email('メールアドレスを入力してください。')
                            //     .minLength(1)
                            //     .maxLength(50)
                            //     .build(),
                            controller: mailController,
                            //obscureText: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              fillColor: Colors.grey,
                              //labelText: 'Password',
                              //labelText: 'メールアドレス',
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
                            //validator: ValidationBuilder().minLength(1).build(),
                            controller: wishController,
                            maxLines: 3,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              fillColor: Colors.grey,
                              //labelText: 'ご希望等',
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
                        child: new RichText(
                          text: new TextSpan(
                            children: [
                              new TextSpan(
                                text: 'プライバシーポリシー」',
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Colors.blue),
                                recognizer: new TapGestureRecognizer()
                                  ..onTap = () {
                                    launch(
                                        'https://test.t-i-s.jp/privacyPolicy');
                                  },
                              ),
                              new TextSpan(
                                text:
                                    'をご確認いただき、よろしければ「同意する」にチェックをして、内容を送信してください。',
                                style: new TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
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
                              var validate = _validate();
                              if (validate == true && this.chkAgree == true) {
                                JobConfirmModel user = new JobConfirmModel(
                                    nameController.text,
                                    furiganaController.text,
                                    birthdayController.text,
                                    genderController.text,
                                    zipCodeController.text,
                                    stateController.text,
                                    cityController.text,
                                    townshipId.text,
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
                              } else {
                                _scrollController.animateTo(
                                  0.0,
                                  curve: Curves.easeOut,
                                  duration: const Duration(milliseconds: 300),
                                );
                              }
                              FocusScope.of(context).unfocus();
                            },
                            color: Colors.green[600],
                            textColor: Colors.white,
                            child: Center(
                              child: Text("確認画面へ進む"),
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

  Widget _dropDown(String hintText) {
    return DropdownButtonHideUnderline(
      child: ButtonTheme(
        alignedDropdown: true,
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

  Widget columnErrorData() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        // Container(
        //   width: 100,
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       Icon(Icons.search),
        //       SizedBox(width: 6),
        //       Text('Error',
        //           style: TextStyle(
        //             fontSize: 12,
        //           )),
        //     ],
        //   ),
        // ),
        // Container(
        //   width: 100,
        //   child:
        Row(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Icon(Icons.search),
            //SizedBox(width: 6),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text('郵便番号の書式を確認してください。',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.red,
                  )),
            )
          ],
        ),
        //),
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
              builder: (context, AsyncSnapshot<CityResponse> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Stack(
                    children: <Widget>[
                      _dropDown("選択してください。"),
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
                    child: ButtonTheme(
                      alignedDropdown: true,
                      child: new DropdownButton<String>(
                        //isDense: true,
                        isExpanded: true,
                        hint: Row(
                          children: [
                            Icon(
                              Icons.arrow_drop_down_outlined,
                              size: 35.0,
                            ),
                            Text("選択してください。"),
                          ],
                        ),
                        value: _city,
                        onChanged: (String newValue) {
                          _city = '';
                          setState(() {
                            stateController.text = cityList[int.parse(newValue)]
                                .city_name
                                .toString();

                            if (checkSearch == 1) {
                              checkSearch = 0;
                            }
                            checkstream = 1;

                            //  else{
                            //    checkSearch=1;
                            //  }
                            // township_id='';
                            // _township = newValue;

                            _township = null;
                            // _township=newValue;
                            getTspBloc.drainStream();
                            stream1 = getTspBloc..getTownship(newValue);
                            _city = newValue;
                            if (township_id != '') {
                              township_id = '';
                            }
                          });
                        },

                        items: cityList
                            .map((CityModel cityModel) => DropdownMenuItem(
                                  value: cityModel.id.toString(),
                                  child: cityModel.id != -1
                                      ? Text(cityModel.city_name)
                                      : Row(
                                          children: [
                                            Icon(
                                              Icons.arrow_drop_down_outlined,
                                              size: 35.0,
                                            ),
                                            Text("選択してください。"),
                                          ],
                                        ),
                                ))
                            .toList(),
                      ),
                    ),
                  ));
                } else {
                  return Stack(
                    children: <Widget>[
                      _dropDown("選択してください。"),
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
              builder: (context, AsyncSnapshot<TownshipResponse> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting &&
                    checkstream == 1) {
                  //
                  return Stack(
                    children: <Widget>[
                      _dropDown("選択してください。"),
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
                } else if (snapshot.hasData && checkstream == 1) {
                  if (snapshot.data.error != null &&
                      snapshot.data.error.length > 0) {
                    return Container();
                  }

                  List<TownshipModel> townships = List();
                  townships.add(new TownshipModel(-1, "", ""));
                  snapshot.data.township.forEach((e) {
                    townships.add(e);
                  });
                  return Container(
                      child: DropdownButtonHideUnderline(
                    child: ButtonTheme(
                      alignedDropdown: true,
                      child: new DropdownButton<String>(
                        //isDense: true,
                        isExpanded: true,
                        hint: Row(
                          children: [
                            Icon(
                              Icons.arrow_drop_down_outlined,
                              size: 35.0,
                            ),
                            Text("選択してください。"),
                          ],
                        ),
                        value: township_id == '' ? _township : township_id,
                        onChanged: (String newValue) {
                          setState(() {
                            townships.map((TownshipModel tspModel) {
                              if (tspModel.id.toString() == newValue) {
                                cityController.text =
                                    tspModel.township_name.toString();
                                townshipId.text = tspModel.id.toString();
                              }
                            }).toList();
                            if (checkSearch == 1) {
                              checkSearch = 0;
                            }
                            township_id = '';
                            _township = newValue;
                          });
                        },
                        items: townships
                            .map((TownshipModel tspModel) => DropdownMenuItem(
                                  value: tspModel.id.toString(),
                                  //child: Text(tspModel.township_name)
                                  child: tspModel.id != -1
                                      ? Text(tspModel.township_name)
                                      : Row(
                                          children: [
                                            Icon(
                                              Icons.arrow_drop_down_outlined,
                                              size: 35.0,
                                            ),
                                            Text("選択してください。"),
                                          ],
                                        ),
                                ))
                            .toList(),
                      ),
                    ),
                  ));
                } else {
                  return Stack(
                    children: <Widget>[
                      _dropDown("選択してください。"),
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
            child: TextFormField(
              //obscureText: true,
              // validator:
              //     ValidationBuilder().minLength(1).maxLength(200).build(),
              controller: addressController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                fillColor: Colors.grey,
                //labelText: 'Password',
                labelText: '番地を入力してください。',
              ),
            ),
            data: Theme.of(context).copyWith(
              primaryColor: Colors.blue,
            ),
          ),
        ),
        Text("例）区丸の内1-9-1 グラントウキョウサウスタワー40階")
      ],
    );
  }
}
