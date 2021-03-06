import 'package:flutter/material.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:tis/bloc/get_city_bloc.dart';
import 'package:tis/bloc/get_link_bloc.dart';
import 'package:tis/model/city.dart';
import 'package:tis/bloc/get_tsp_bloc.dart';
import 'package:tis/model/job.dart';
import 'package:tis/model/occupation_child.dart';
import 'package:tis/model/township.dart';
import 'package:tis/model/township_response.dart';
import 'package:tis/model/occupation.dart';
import 'package:tis/bloc/get_job_bloc.dart';
import 'package:tis/model/job_response.dart';
import 'package:tis/presentation/custom_app_icons.dart';
import 'package:tis/views/bottom_nav_4_detail.dart';
import 'package:tis/views/shownoti.dart';
import 'package:tis/model/city_occ_response.dart';
import 'package:tis/bloc/get_city_occ_bloc.dart';
import 'package:tis/elements/loader.dart';

class JobWidget extends StatefulWidget {
  const JobWidget();
  @override
  _BottomNav4State createState() => _BottomNav4State();
}

class _BottomNav4State extends State<JobWidget> {
  var stream;
  var stream1;
  String _city;
  String _township;
  String _move;
  int checkstream = 0;
  Map<String, bool> jobTypeList = {
    '正社員': false,
    '契約社員': false,
    '非常勤': false,
    'その他': false,
  };
  bool _load = false;

  var selectedTspID = [];
  var selectedOccID = [];
  var selectedEmpstatus = [];
  int countTspID = 0;
  int countOccId = 0;
  int countEmpStatus = 0;
  String tspText = "市から探す";
  List<String> searchDisplayData;
  List<CityModel> cityList;
  List<TownshipModel> allTsp;
  var selectedOccName = [];

  @override
  void initState() {
    super.initState();
    searchDisplayData = List();
    getCityOccBloc..getCityOccList();
  }

  @override
  void dispose() {
    getLinkNewsBloc.drainStream();
    super.dispose();
  }

  bool checkboxValueCity = false;
  List<String> allEmpType = ['正社員', '契約社員', '非常勤', 'その他'];
  List<String> selectedEmpType = [];
  int count = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> children =
        new List.generate(count, (int i) => new InputWidget(i));
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
              top: 10, left: 10, right: 10), //const EdgeInsets.all(10.0),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                  child: Text(
                "求人検索",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              )),
            ),
            DottedLine(
              dashColor: Color(int.parse("0xff828282")), //Colors.blue,
            ),
            SizedBox(height: 20),
            Stack(
              overflow: Overflow.visible,
              children: <Widget>[
                // SizedBox(height: 20.0),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Color(int.parse("0xff828282")),
                      ),
                      height: 36.0,
                      width: 10.0,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width - 30.0,
                      decoration: BoxDecoration(color: Colors.grey[100]),
                      padding: EdgeInsets.all(8.0),

                      child: Text(
                        "現在の検索条件",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ), // _header("現在の検索条件"),
                    ),
                  ],
                ),
                Container(
                  child: Align(
                      alignment: Alignment.bottomRight,
                      child: RawMaterialButton(
                        onPressed: () {
                          getLinkNewsBloc.drainStream();
                          setState(() {                        
                            stream = getLinkNewsBloc..getLinkedNews('3');
                          });
                          return showDialog(
                              context: context,
                              builder: (context) {
                                return StatefulBuilder(
                                  builder: (context, setState) {
                                    return AlertDialog(
                                      title: Text(
                                        "通知",
                                      ),
                                      content: SingleChildScrollView(
                                        child: const ShowNoti().showNotification(),
                                      ),
                                      actions: [
                                        FlatButton(
                                          child: Text("閉じ"),
                                          onPressed: () {
                                            Navigator.of(context)
                                                .pop(); // dismiss dialog
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              });
                        },
                        elevation: 1.0,
                        fillColor: Color(int.parse("0xff828282")),
                        child: Icon(
                          CustomApp.bell,
                          size: 30.0,
                          color: Colors.white,
                        ),
                        padding: EdgeInsets.all(15.0),
                        shape: CircleBorder(),
                      )),
                ),
              ],
            ),
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[300]),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: const EdgeInsets.only(
                          top: 10.0, left: 20.0, right: 20.0),
                      child: Container(
                        //padding: EdgeInsets.all(5.0),
                        padding: EdgeInsets.only(left: 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            color: Colors.white,
                            border: Border.all(color: Colors.grey[400])),
                        child: StreamBuilder<CityOccListResponse>(
                            stream: getCityOccBloc.subject.stream,
                            builder: (context,
                                AsyncSnapshot<CityOccListResponse> snapshot) {
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
                                cityList = List();
                                cityList.add(new CityModel(-1, ""));
                                snapshot.data.cityList.forEach((e) {
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
                                              value: cityModel.id.toString(),
                                              child: cityModel.id != -1
                                                  ? Text(cityModel.city_name)
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
                      )),

                  countTspID != 0
                      ? Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 10, top: 10),
                          child: Text(
                            "[${countTspID.toString()}]件選択されました.",
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ))
                      : Container(),
                  //township
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, bottom: 10, top: 10),
                    child: Container(
                      //padding: EdgeInsets.all(5.0),
                      padding: EdgeInsets.only(left: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: Colors.white,
                          border: Border.all(color: Colors.grey[400])),
                      child: StreamBuilder<TownshipResponse>(
                          stream: getTspBloc.subject.stream,
                          builder: (context,
                              AsyncSnapshot<TownshipResponse> snapshot) {
                            if (snapshot.connectionState ==
                                    ConnectionState.waiting &&
                                checkstream == 1) {
                              return Stack(
                                children: <Widget>[
                                  _dropDown("  市から探す"),
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
                              allTsp = snapshot.data.township;
                              List<int> selectedTsp = [];

                              return RaisedButton(
                                padding: const EdgeInsets.only(
                                    left: 0, top: 0.0, right: 0.0),
                                child: Row(
                                  children: [
                                    // Icon(
                                    //   Icons.arrow_drop_down_outlined,
                                    //   size: 35.0,
                                    // ),
                                    Text(
                                      "  市から探す",
                                      // style: TextStyle(color: Colors.grey[600]),
                                    ),
                                    Expanded(
                                      child: SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.71,
                                      ),
                                    ),
                                    Icon(
                                      Icons.arrow_drop_down_outlined,
                                    ),
                                  ],
                                ),

                                // ListTile(
                                //   // dense: true,
                                //   // contentPadding: EdgeInsets.only(left: 10.0),
                                //   leading: Text(
                                //     "市から探す",
                                //     style: TextStyle(color: Colors.grey[600]),
                                //   ),
                                //   trailing:
                                //       Icon(Icons.arrow_drop_down_outlined),
                                // ),
                                color: Colors.white,
                                elevation: 0,
                                // shape: RoundedRectangleBorder(
                                //     side: BorderSide(
                                //         color: Colors.grey[400], width: 1),
                                //     borderRadius: BorderRadius.circular(5.0)),
                                onPressed: () async {
                                  // showDialog(
                                  //     context: context,
                                  //     builder: (context) {
                                  //       return _TspDialog(
                                  //           tsp: allTsp,
                                  //           selectedTsp: selectedTsp,
                                  //           onSelectedTspListChanged: (tsp) {
                                  //             selectedTsp = tsp;
                                  //             // selectedTspText = selectedTsp;
                                  //           });
                                  //     });

                                  int result = await showDialog(
                                      barrierDismissible: false,
                                      context: context,
                                      builder: (BuildContext context) {
                                        return StatefulBuilder(
                                          builder: (context, setState) {
                                            return AlertDialog(
                                              title: Text(tspText),
                                              actions: <Widget>[
                                                FlatButton(
                                                  onPressed: () {
                                                    Navigator.pop(context,
                                                        selectedTspID.length);
                                                  },
                                                  child: Text('Done'),
                                                ),
                                              ],
                                              content: Container(
                                                width: double.minPositive,
                                                height: 400,
                                                child: ListView.builder(                                               
                                                  shrinkWrap: true,
                                                  itemCount: allTsp.length,
                                                  itemBuilder:
                                                      (BuildContext context,
                                                          int index) {
                                                    String _move = allTsp[index]
                                                        .township_name;
                                                    String _id = allTsp[index]
                                                        .id
                                                        .toString();
                                                    return CheckboxListTile(
                                                        value: selectedTspID
                                                            .contains(_id),
                                                        title: Text(_move),
                                                        onChanged:
                                                            (bool value) {
                                                          if (value) {
                                                            if (!selectedTspID
                                                                .contains(
                                                                    _id)) {
                                                              setState(() {
                                                                selectedTspID
                                                                    .add(_id);
                                                              });
                                                            }
                                                          } else {
                                                            if (selectedTspID
                                                                .contains(
                                                                    _id)) {
                                                              setState(() {
                                                                selectedTspID
                                                                    .removeWhere(
                                                                        (s) =>
                                                                            s ==
                                                                            _id);
                                                              });
                                                            }
                                                          }
                                                        });
                                                  },
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      });
                                  setState(() {
                                    countTspID = result;
                                  });
                                },

                                //),
                              );
                            } else {
                              return Stack(
                                children: <Widget>[
                                  Container(
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton(
                                          isExpanded: true,
                                          //value: _value,
                                          hint: Row(
                                            children: [
                                              Text("  市から探す"),
                                            ],
                                          ),
                                          onChanged: (value) {
                                            setState(() {
                                              //_value = value;
                                            });
                                          }),
                                    ),
                                  ),
                                  Center(
                                    child: Opacity(
                                      opacity: 1.0,
                                      child: checkstream == 1
                                          ? buildLoadingWidget()
                                          : Container(),
                                    ),
                                  ),
                                ],
                              );
                            }
                          }),
                    ),
                  ),

                  Divider(
                    color: Colors.grey[300],
                    thickness: 1,
                  ),

                  countOccId != 0
                      ? Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 10, top: 10),
                          child: Text(
                            "[${countOccId.toString()}]件選択されました.",
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ))
                      : Container(),
                  Container(
                    child: StreamBuilder<CityOccListResponse>(
                        stream: getCityOccBloc.subject.stream,
                        builder: (context,
                            AsyncSnapshot<CityOccListResponse> snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Stack(
                              children: <Widget>[
                                _paddings("  職種"),
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
                            } else {
                              List products = [];
                              //List<int> selectedOcc = [];
                              List<OccupationModel> occList =
                                  snapshot.data.occList;
                              var j = 0;

                              for (var i = 0; i < occList.length; i++) {
                                j = j + 1;
                                var productMap = {
                                  'item' + j.toString(): false,
                                  'id': occList[i].id,
                                  'name': occList[i].name
                                };

                                products.add(productMap);
                              }

                              List<Widget> list = new List<Widget>();
                              list.add(_paddings("  職種"));
                              for (var i = 0; i < occList.length; i++) {
                                List<OccupationChildModel> allOcc =
                                    occList[i].child;
                                list.add(new Container(
                                  //margin: EdgeInsets.all(8),
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 5.0),
                                  // decoration: BoxDecoration(
                                  //     borderRadius: BorderRadius.circular(5.0),
                                  //     color: Colors.white,
                                  //     border: Border.all(color: Colors.grey[400])),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: RaisedButton(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 6, vertical: 1),
                                      child: ListTile(
                                        dense: true,
                                        contentPadding: EdgeInsets.zero,
                                        leading: Text("   " + occList[i].name),
                                        trailing: Icon(
                                            Icons.arrow_drop_down_outlined),
                                      ),
                                      color: Colors.white,
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                              color: Colors.grey[400],
                                              width: 1),
                                          borderRadius:
                                              BorderRadius.circular(5.0)),
                                      onPressed: () async {
                                        // showDialog(
                                        //     context: context,
                                        //     builder: (context) {
                                        //       return _OccupationDialog(
                                        //           occ: allOcc,
                                        //           selectedOcc: selectedOcc,
                                        //           onSelectedOccListChanged: (occ) {
                                        //             selectedOcc = occ;
                                        //             //print(selectedCities);
                                        //           });
                                        //     });

                                        int result = await showDialog(
                                            barrierDismissible: false,
                                            context: context,
                                            builder: (BuildContext context) {
                                              return StatefulBuilder(
                                                builder: (context, setState) {
                                                  return AlertDialog(
                                                    title:
                                                        Text(occList[i].name),
                                                    actions: <Widget>[
                                                      FlatButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context,
                                                              selectedOccID
                                                                  .length);
                                                        },
                                                        child: Text('Done'),
                                                      ),
                                                    ],
                                                    content: Container(
                                                      width: double.minPositive,
                                                      height: 400,
                                                      child: ListView.builder(                                                      
                                                        shrinkWrap: true,
                                                        itemCount:
                                                            allOcc.length,
                                                        itemBuilder:
                                                            (BuildContext
                                                                    context,
                                                                int index) {
                                                          String _move =
                                                              allOcc[index]
                                                                  .name;
                                                          String _id =
                                                              allOcc[index]
                                                                  .id
                                                                  .toString();
                                                          return CheckboxListTile(
                                                              value:
                                                                  selectedOccID
                                                                      .contains(
                                                                          _id),
                                                              title:
                                                                  Text(_move),
                                                              onChanged:
                                                                  (bool value) {
                                                                if (value) {
                                                                  if (!selectedOccID
                                                                      .contains(
                                                                          _id)) {
                                                                    setState(
                                                                        () {
                                                                      selectedOccID
                                                                          .add(
                                                                              _id);
                                                                      selectedOccName.add(
                                                                          allOcc[index]
                                                                              .name);
                                                                    });
                                                                  }
                                                                } else {
                                                                  if (selectedOccID
                                                                      .contains(
                                                                          _id)) {
                                                                    setState(
                                                                        () {
                                                                      selectedOccID.removeWhere(
                                                                          (s) =>
                                                                              s ==
                                                                              _id);
                                                                      selectedOccName.removeWhere((s) =>
                                                                          s ==
                                                                          allOcc[index]
                                                                              .name);
                                                                    });
                                                                  }
                                                                }
                                                              });
                                                        },
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            });
                                        setState(() {
                                          countOccId = result;
                                        });
                                      },
                                    ),
                                  ),
                                ));
                              }
                              return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: list
                                  //getTextWidgets(snapshot.data.occList)
                                  );
                            }
                          } else {
                            return Stack(
                              children: <Widget>[
                                _paddings("  職種"),
                                Center(
                                  child: Opacity(
                                    opacity: 1.0,
                                    child:
                                        buildLoadingWidget(), //CircularProgressIndicator(),
                                  ),
                                ),
                              ],
                            );
                          }
                        }),
                  ),

                  Divider(
                    color: Colors.grey[300],
                    thickness: 1,
                  ),

                  countEmpStatus != 0
                      ? Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 10, top: 10),
                          child: Text(
                            "[${countEmpStatus.toString()}]件選択されました.",
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ))
                      : Container(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                      child: ListTile(
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        leading: Text(
                          "   雇用形態から探す",
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                        trailing: Icon(Icons.arrow_drop_down_outlined),
                      ),
                      color: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.grey[400], width: 1),
                          borderRadius: BorderRadius.circular(5.0)),
                      onPressed: () async {
                        // showDialog(
                        //     context: context,
                        //     builder: (context) {
                        //       return _EmpTypeDialog(
                        //           empType: allEmpType,
                        //           selectedEmpType: selectedEmpType,
                        //           onSelectedEmpTypeListChanged: (empType) {
                        //             selectedEmpType = empType;
                        //             //print(selectedCities);
                        //           });
                        //     });
                        int result = await showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (BuildContext context) {
                              return StatefulBuilder(
                                builder: (context, setState) {
                                  return AlertDialog(
                                    title: Text("雇用形態から探す"),
                                    actions: <Widget>[
                                      FlatButton(
                                        onPressed: () {
                                          Navigator.pop(context,
                                              selectedEmpstatus.length);
                                        },
                                        child: Text('Done'),
                                      ),
                                    ],
                                    content: Container(
                                      width: double.minPositive,
                                      height: 400,
                                      child: ListView.builder(                                    
                                        shrinkWrap: true,
                                        itemCount: allEmpType.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          String _move = allEmpType[index];
                                          return CheckboxListTile(
                                              value: selectedEmpstatus
                                                  .contains(allEmpType[index]),
                                              title: Text(_move),
                                              onChanged: (bool value) {
                                                if (value) {
                                                  if (!selectedEmpstatus
                                                      .contains(
                                                          allEmpType[index])) {
                                                    setState(() {
                                                      selectedEmpstatus.add(
                                                          allEmpType[index]);
                                                    });
                                                  }
                                                } else {
                                                  if (selectedEmpstatus
                                                      .contains(
                                                          allEmpType[index])) {
                                                    setState(() {
                                                      selectedEmpstatus
                                                          .removeWhere((s) =>
                                                              s ==
                                                              allEmpType[
                                                                  index]);
                                                    });
                                                  }
                                                }
                                              });
                                        },
                                      ),
                                    ),
                                  );
                                },
                              );
                            });
                        setState(() {
                          countEmpStatus = result;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                onPressed: () {
                  _load = true;

                  getJobBloc
                    ..getJob(_city.toString(), selectedTspID, selectedOccID,
                        selectedEmpstatus);
                  setState(() {
                    // count = count + 1;
                    // // stream = getJobBloc..getJob();
                    // //print(stream);
                    searchDisplayData = _getDisplaySearchData();
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
                          fontSize: 16,
                        )),
                  ],
                )),
            searchDisplayData.length > 0
                ? Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(searchDisplayData.join(", ")),
                    ),
                  )
                : Container(),
            _load
                ? Container(
                    child: StreamBuilder<JobResponse>(
                        stream: getJobBloc.subject.stream,
                        builder:
                            (context, AsyncSnapshot<JobResponse> snapshot) {
                          if (snapshot.hasError) {
                            return Container(child: Text("error"));
                          } else if (snapshot.hasData) {
                            if (snapshot.data.error != null &&
                                snapshot.data.error.length > 0) {
                              return Container(
                                  child: Text(snapshot.data.error));
                            } else if (snapshot.data.job.isEmpty) {
                              return Container(
                                  child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Card(
                                        color: Colors.grey[300],
                                        child: Padding(
                                          padding: const EdgeInsets.all(6.0),
                                          child: Icon(Icons.search_off_sharp,
                                              color: Colors.grey[600]),
                                        ),
                                      ),
                                      Text(
                                        "お探しの条件に合う施設は見つかりませんでした。",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Color(0xff2980b9),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                      Text(
                                        "条件の変更を行い再度ご検索いだだくと見つかる可能性がございます。",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.grey[600],
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                    ]),
                              ));
                            } else {
                              return Column(
                                  children:
                                      _getSearchResultWidget(snapshot.data));
                            }
                          } else {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: buildLoadingWidget(),
                            );
                          }
                        }),
                  )
                : Container(),
          ]),
        ),
      ),
    );
  }

  List<String> _getDisplaySearchData() {
    List<String> st = List();

    cityList
        .map((e) => (e.id.toString() == _city && e.id != -1)
            ? st.add(e.city_name)
            : null)
        .toList();

    if (selectedTspID.length > 0) {
      allTsp
          .map((e) => selectedTspID.contains(e.id.toString())
              ? st.add(e.township_name)
              : null)
          .toList();
    }

    for (var i = 0; i < selectedOccID.length; i++) {
      st.add(selectedOccName[0].toString());
    }

    selectedEmpstatus.map((e) => st.add(e.toString())).toList();
    print(st);

    //print(allTsp);

    return st;
  }

  List<Widget> _getSearchResultWidget(JobResponse data) {
    List<JobModel> jobs = data.job;
    return searchListWidget(jobs);
  }

  List<Widget> searchListWidget(jobs) {
    List<JobModel> jobLst = jobs;

    List<Widget> list = new List<Widget>();
    for (int i = 0; i < jobLst.length; i++) {
      list.add(new Container(
        padding: EdgeInsets.all(10.0),
        margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
        decoration: BoxDecoration(
            border: Border.all(
          color: Color(int.parse("0xff828282")),
        )), //Colors.blueAccent
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
              child: Text("施設番号:" + jobLst[i].jobnum),
            ),
            InkWell(
              child: Text(jobLst[i].title,
                  style: TextStyle(
                      // color: Color(int.parse("0xff828282")),
                      // //fontSize: 18.0,
                      // decoration: TextDecoration.underline,
                      )),
              onTap: () {
                var route = new MaterialPageRoute(
                  builder: (BuildContext context) =>
                      new JobDetailWidget(value: jobLst[i].id.toString()),
                );
                Navigator.of(context).push(route);
              },
            ),
            Card(
              margin: EdgeInsets.all(10.0),
              color: Colors.blue,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  jobLst[i].employment_status,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Divider(thickness: 2),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 8.0),
              child: Row(children: []),
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
                        color: Color(int.parse("0xff828282")),
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
                  jobLst[i].nearest_station.toString(),
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
                    child: Text("¥",
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(int.parse("0xff828282")),
                        )),
                  ),
                  title: Text("給料"),
                )),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1.0),
              ),
              child: ListTile(
                title: Text(
                  jobLst[i].salary.toString(),
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
                    child: Text("時",
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(int.parse("0xff828282")),
                        )),
                  ),
                  title: Text("就業時間/休日休暇"),
                )),

            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1.0),
              ),
              child: ListTile(
                title: Text(jobLst[i].working_hours.toString()),
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
                        Icons.shopping_bag_sharp,
                        color: Color(int.parse("0xff828282")),
                      )),
                  title: Text("特別な条件"),
                )),
            Container(
              margin: EdgeInsets.only(bottom: 10.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1.0),
              ),
              child: ListTile(
                title: Text(jobLst[i].allowances.toString()),
              ),
            ),
            SizedBox(height: 10.0),

            //SizedBox(height: 10.0),
            RaisedButton(
              onPressed: () {
                var route = new MaterialPageRoute(
                  builder: (BuildContext context) =>
                      new JobDetailWidget(value: jobLst[i].id.toString()),
                );
                Navigator.of(context).push(route);
              },
              //
              color: Color(int.parse("0xff828282")),
              textColor: Colors.white,
              child: Center(
                child: Text("詳細を見る"),
              ),
            ),
          ],
        ),
      ));
    }
    return list;
  }

  Widget _paddings(String name) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Text(
        name,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15,
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

  Widget _column(String name, Color bgColor, Color txtColor) {
    return Container(
      padding: EdgeInsets.all(8),
      color: bgColor,
      child: Center(
          child: Text(
        name,
        style: TextStyle(
            fontWeight: FontWeight.bold, color: txtColor, fontSize: 14),
      )),
    );
  }

  Widget _header(String name) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Color(int.parse("0xff828282")),
          ),
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

  List<Widget> getTextWidgets(List<OccupationModel> occ) {
    List products = [];
    List<int> selectedOcc = [];
    var j = 0;

    for (var i = 0; i < occ.length; i++) {
      j = j + 1;
      var productMap = {
        'item' + j.toString(): false,
        'id': occ[i].id,
        'name': occ[i].name
      };

      products.add(productMap);
    }

    List<Widget> list = new List<Widget>();

    for (var i = 0; i < occ.length; i++) {
      List<OccupationChildModel> allOcc = occ[i].child;

      list.add(new Container(
        //margin: EdgeInsets.all(8),
        padding: EdgeInsets.symmetric(horizontal: 5.0),
        // decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(5.0),
        //     color: Colors.white,
        //     border: Border.all(color: Colors.grey[400])),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: RaisedButton(
            padding: EdgeInsets.symmetric(horizontal: 6, vertical: 1),
            child: ListTile(
              dense: true,
              contentPadding: EdgeInsets.zero,
              leading: Text(occ[i].name),
              trailing: Icon(Icons.arrow_drop_down_outlined),
            ),
            color: Colors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.grey[400], width: 1),
                borderRadius: BorderRadius.circular(5.0)),
            onPressed: () {
              // showDialog(
              //     context: context,
              //     builder: (context) {
              //       return _OccupationDialog(
              //           occ: allOcc,
              //           selectedOcc: selectedOcc,
              //           onSelectedOccListChanged: (occ) {
              //             selectedOcc = occ;
              //             //print(selectedCities);
              //           });
              //     });
            },
          ),
        ),
      ));
    }
    return list;
  }
}

class _EmpTypeDialog extends StatefulWidget {
  _EmpTypeDialog({
    this.empType,
    this.selectedEmpType,
    this.onSelectedEmpTypeListChanged,
  });

  final List<String> empType;
  final List<String> selectedEmpType;
  final ValueChanged<List<String>> onSelectedEmpTypeListChanged;

  @override
  _EmpTypeDialogState createState() => _EmpTypeDialogState();
}

class _EmpTypeDialogState extends State<_EmpTypeDialog> {
  List<String> _tempSelectedEmpType = [];

  @override
  void initState() {
    _tempSelectedEmpType = widget.selectedEmpType;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                '雇用形態',
                style: TextStyle(fontSize: 18.0, color: Colors.black),
                textAlign: TextAlign.center,
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                color: Color(0xFFfab82b),
                child: Text(
                  'Done',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(             
                itemCount: widget.empType.length,
                itemBuilder: (BuildContext context, int index) {
                  final empTypeObj = widget.empType[index];
                  return Container(
                    child: CheckboxListTile(
                        title: Text(empTypeObj),
                        value: _tempSelectedEmpType.contains(empTypeObj),
                        onChanged: (bool value) {
                          if (value) {
                            if (!_tempSelectedEmpType.contains(empTypeObj)) {
                              setState(() {
                                _tempSelectedEmpType.add(empTypeObj);
                              });
                            }
                          } else {
                            if (_tempSelectedEmpType.contains(empTypeObj)) {
                              setState(() {
                                _tempSelectedEmpType.removeWhere(
                                    (String city) => city == empTypeObj);
                              });
                            }
                          }
                          widget.onSelectedEmpTypeListChanged(
                              _tempSelectedEmpType);
                        }),
                  );
                }),
          ),
        ],
      ),
    );
  }
}

// class _TspDialog extends StatefulWidget {
//   _TspDialog({
//     this.tsp,
//     this.selectedTsp,
//     this.onSelectedTspListChanged,
//   });

//   final List<TownshipModel> tsp;
//   final List<int> selectedTsp;
//   final ValueChanged<List<int>> onSelectedTspListChanged;

//   @override
//   _TspDialogState createState() => _TspDialogState();
// }

// class _TspDialogState extends State<_TspDialog> {
//   List<int> _tempSelectedTsp = [];

//   @override
//   void initState() {
//     _tempSelectedTsp = widget.selectedTsp;
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       child: Column(
//         children: <Widget>[
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: <Widget>[
//               Text(
//                 '市',
//                 style: TextStyle(fontSize: 18.0, color: Colors.black),
//                 textAlign: TextAlign.center,
//               ),
//               RaisedButton(
//                 onPressed: () {
//                   String text = "Data that we want to pass. Can be anything.";
//                   Navigator.pop(context, _tempSelectedTsp.length);
//                 },
//                 color: Color(0xFFfab82b),
//                 child: Text(
//                   'Done',
//                   style: TextStyle(color: Colors.white),
//                 ),
//               ),
//             ],
//           ),
//           Expanded(
//             child: ListView.builder(
//                 itemCount: widget.tsp.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   final tspObject = widget.tsp[index];
//                   //print(tspObject);
//                   //return null;
//                   return Container(
//                     child: CheckboxListTile(
//                         title: Text(tspObject.township_name),
//                         value: _tempSelectedTsp.contains(tspObject.id),
//                         onChanged: (bool value) {
//                           if (value) {
//                             if (!_tempSelectedTsp.contains(tspObject.id)) {
//                               setState(() {
//                                 print(tspObject.id);
//                                 _tempSelectedTsp.add(tspObject.id);
//                               });
//                             }
//                           } else {
//                             if (_tempSelectedTsp.contains(tspObject.id)) {
//                               setState(() {
//                                 _tempSelectedTsp.removeWhere(
//                                     (int city) => city == tspObject.id);
//                               });
//                             }
//                           }
//                           widget.onSelectedTspListChanged(_tempSelectedTsp);
//                         }),
//                   );
//                 }),
//           ),
//         ],
//       ),
//     );
//   }
// }

class _OccupationDialog extends StatefulWidget {
  _OccupationDialog({
    this.occ,
    this.selectedOcc,
    this.onSelectedOccListChanged,
  });

  final List<OccupationChildModel> occ;
  final List<int> selectedOcc;
  final ValueChanged<List<int>> onSelectedOccListChanged;

  @override
  _OccupationDialogState createState() => _OccupationDialogState();
}

class _OccupationDialogState extends State<_OccupationDialog> {
  List<int> _tempSelectedOcc = [];

  @override
  void initState() {
    _tempSelectedOcc = widget.selectedOcc;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                '職種',
                style: TextStyle(fontSize: 18.0, color: Colors.black),
                textAlign: TextAlign.center,
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                color: Color(0xFFfab82b),
                child: Text(
                  'Done',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(            
                itemCount: widget.occ.length,
                itemBuilder: (BuildContext context, int index) {
                  final tspObject = widget.occ[index];
                  //print(cityName.township_name);
                  //return null;
                  return Container(
                    child: CheckboxListTile(
                        title: Text(tspObject.name),
                        value: _tempSelectedOcc.contains(tspObject.id),
                        onChanged: (bool value) {
                          if (value) {
                            if (!_tempSelectedOcc.contains(tspObject.id)) {
                              setState(() {
                                _tempSelectedOcc.add(tspObject.id);
                              });
                            }
                          } else {
                            if (_tempSelectedOcc.contains(tspObject.id)) {
                              setState(() {
                                _tempSelectedOcc.removeWhere(
                                    (int occId) => occId == tspObject.id);
                              });
                            }
                          }
                          widget.onSelectedOccListChanged(_tempSelectedOcc);
                        }),
                  );
                }),
          ),
        ],
      ),
    );
  }
}

class InputWidget extends StatelessWidget {
  final int index;

  InputWidget(this.index);

  @override
  Widget build(BuildContext context) {
    return new Text("InputWidget: " + index.toString());
  }
}
