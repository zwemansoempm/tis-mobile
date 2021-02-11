import 'package:flutter/material.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:tis/bloc/get_city_bloc.dart';
import 'package:tis/bloc/get_link_bloc.dart';
import 'package:tis/model/city.dart';
import 'package:tis/model/city_response.dart';
import 'package:tis/bloc/get_tsp_bloc.dart';
import 'package:tis/model/job.dart';
import 'package:tis/model/occupation_child.dart';
import 'package:tis/model/township.dart';
import 'package:tis/model/township_response.dart';
import 'package:tis/model/occupation.dart';
import 'package:tis/model/occupation_response.dart';
import 'package:tis/bloc/get_occupation_bloc.dart';
import 'package:tis/bloc/get_job_bloc.dart';
import 'package:tis/model/job_response.dart';
import 'package:tis/presentation/custom_app_icons.dart';
import 'package:tis/views/bottom_nav_4_detail.dart';
import 'package:tis/views/shownoti.dart';

class JobWidget extends StatefulWidget {
  @override
  _BottomNav4State createState() => _BottomNav4State();
}

class _BottomNav4State extends State<JobWidget> {
  var stream; 
  Map<String, bool> cityList = {
    'item1': false,
    'item2': false,
    'item3': false,
    'item4': false,
  };
  CityResponse data;

  List<dynamic> result = [];

  //String _mySelection;

  static String _city;
  static String _township;
  String seiShaIn = "正社員";
  String conIn = "契約社員";
  String apartIn = "非常勤";
  String other = "その他";
  String textHolder = 'Old Sample Text...!!!';
  int value1 = 0;
  int value2 = 0;
  int value3 = 0;
  int value4 = 0;
  var arr = new List(4);
  bool isCheck = false;
  var valuefirst = false;
  var valueSecond = false;
  bool isTspCheck = false;

  Map<String, bool> jobTypeList = {
    '正社員': false,
    '契約社員': false,
    '非常勤': false,
    'その他': false,
  };

  
  @override
  void initState() {
    super.initState();
    getCityBloc..getCity();
    stream;
  }

  @override
  void dispose() {
    getCityBloc.drainStream();
    getTspBloc.drainStream();
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
    return Container(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top:40.0),// padding: const EdgeInsets.all(10.0),
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
               Stack(
                overflow: Overflow.visible,
                children: <Widget>[
                  // SizedBox(height: 20.0),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.blue
                        ), 
                        height: 36.0,
                        width: 10.0,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 30.0,
                        decoration: BoxDecoration(
                          color: Colors.grey[100]
                        ),
                        padding: EdgeInsets.all(8.0),
                        
                       child: Text("現在の検索条件" ,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                        ),// _header("現在の検索条件"),
                      ),
                    ],
                  ),
                  Container(
                    child: Align(
                          alignment: Alignment.bottomRight,
                          child:RawMaterialButton(
                            onPressed: () {
                                setState(() {
                                stream =getLinkNewsBloc..getLinkedNews('3');                               
                              });
                               return  
                               showDialog(                                 
                                          context: context,
                                          builder: (context) {
                                          return 
                                          StatefulBuilder(
                                            builder: (context, setState) {
                                              return AlertDialog(
                                                title: Text(
                                                  "Notifications",
                                                ),
                                                content: SingleChildScrollView(
                                                  child: ShowNoti().showNotification(),                                            
                                              ),
                                                actions: [
                                                  FlatButton(
                                                    child: Text("Close"),
                                                    onPressed: () {
                                                      Navigator.of(context).pop(); // dismiss dialog
                                                    },
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        }
                                      );                              
                            },
                            elevation: 1.0,
                            fillColor: Colors.blue,
                            child: Icon(
                              CustomApp.bell,
                              size: 30.0,
                            ),
                            padding: EdgeInsets.all(15.0),
                            shape: CircleBorder(),
                        )                       
                    ),
                  ),                
                ],
              ),  
            // _header("現在の検索条件"),
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[300]),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.all(8),
                    padding: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: Colors.white,
                        border: Border.all(color: Colors.grey[400])),
                    child: StreamBuilder<CityResponse>(
                        stream: getCityBloc.subject.stream,
                        builder:
                            (context, AsyncSnapshot<CityResponse> snapshot) {
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
                                        Icons.arrow_drop_down_outlined,
                                        size: 35.0,
                                      ),
                                      Text("市区町村"),
                                    ],
                                  ),

                                  value: _city,
                                  onChanged: (String newValue) {
                                    setState(() => _city = newValue);

                                    getTspBloc..getTownship(_city);
                                    getOccBloc..getOccupation(_city);
                                  },
                                  items: snapshot.data.city
                                      .toList()
                                      .map((CityModel cityModel) =>
                                          DropdownMenuItem(
                                              value: cityModel.id.toString(),
                                              child: Text(cityModel.city_name)))
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

                  //township
                  Container(
                    margin: EdgeInsets.all(8),
                    padding: EdgeInsets.all(0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: Colors.white,
                        border: Border.all(color: Colors.grey[400])),
                    child: StreamBuilder<TownshipResponse>(
                        stream: getTspBloc.subject.stream,
                        builder: (context,
                            AsyncSnapshot<TownshipResponse> snapshot) {
                          if (snapshot.hasData) {
                            if (snapshot.data.error != null &&
                                snapshot.data.error.length > 0) {
                              return Container();
                            }
                            List<TownshipModel> allTsp = snapshot.data.township;
                            List<int> selectedTsp = [];
                            // List<int> selectedTspText = [];
                            // print(selectedTspText.length.toString());

                            return Container(
                              child: Padding(
                                padding: const EdgeInsets.all(0),
                                child: RaisedButton(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 6, vertical: 1),
                                  child: ListTile(
                                    dense: true,
                                    contentPadding: EdgeInsets.zero,
                                    leading: Text(
                                      "市から探す" +
                                          "(" +
                                          //selectedTsp.length.toString() +
                                          ")",
                                      style: TextStyle(color: Colors.grey[600]),
                                    ),
                                    trailing:
                                        Icon(Icons.arrow_drop_down_outlined),
                                  ),
                                  color: Colors.white,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                          color: Colors.grey[400], width: 1),
                                      borderRadius: BorderRadius.circular(5.0)),
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return _TspDialog(
                                              tsp: allTsp,
                                              selectedTsp: selectedTsp,
                                              onSelectedTspListChanged: (tsp) {
                                                selectedTsp = tsp;
                                                // selectedTspText = selectedTsp;
                                                // print(selectedTspText.length);
                                              });
                                        });
                                  },
                                ),
                              ),
                            );
                          } else if (snapshot.hasError) {
                            return Container();
                          } else {
                            return Container(
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton(
                                    isExpanded: true,
                                    //value: _value,
                                    hint: Row(
                                      children: [
                                        Text("市から探す"),
                                      ],
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        //_value = value;
                                      });
                                    }),
                              ),
                            ); //buildLoadingWidget();
                          }
                        }),
                  ),

                  Divider(
                    color: Colors.grey[300],
                    thickness: 1,
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      "職種",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),

                  Container(
                    child: StreamBuilder<OccupationResponse>(
                        stream: getOccBloc.subject.stream,
                        builder: (context,
                            AsyncSnapshot<OccupationResponse> snapshot) {
                          if (snapshot.hasData) {
                            if (snapshot.data.error != null &&
                                snapshot.data.error.length > 0) {
                              return Container();
                            } else {
                              return Column(
                                  children:
                                      getTextWidgets(snapshot.data.occupation));
                            }
                          } else if (snapshot.hasError) {
                            return Container();
                          } else {
                            return Container(); //buildLoadingWidget();
                          }
                        }),
                  ),

                  Divider(
                    color: Colors.grey[300],
                    thickness: 1,
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                      child: ListTile(
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        leading: Text(
                          "雇用形態から探す",
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                        trailing: Icon(Icons.arrow_drop_down_outlined),
                      ),
                      color: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.grey[400], width: 1),
                          borderRadius: BorderRadius.circular(5.0)),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return _EmpTypeDialog(
                                  empType: allEmpType,
                                  selectedEmpType: selectedEmpType,
                                  onSelectedEmpTypeListChanged: (empType) {
                                    selectedEmpType = empType;
                                    //print(selectedCities);
                                  });
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
                  setState(() {
                    count = count + 1;
                    // stream = getJobBloc..getJob();
                    //print(stream);
                    getJobBloc..getJob();
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
            // Container(
            //   //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   child: Column(
            //     children: children,
            //   ),
            // ),

            // Container(
            //     child: StreamBuilder<JobResponse>(
            //         stream: getJobBloc.subject.stream,
            //         builder: (context, AsyncSnapshot<JobResponse> snapshot) {
            //           if (snapshot.connectionState == ConnectionState.waiting) {
            //             return Container(
            //               height: MediaQuery.of(context).size.height / 1.5,
            //               child: Column(
            //                   mainAxisAlignment: MainAxisAlignment.center,
            //                   children: [
            //                     SizedBox(
            //                         height: 35,
            //                         width: 35,
            //                         child: CircularProgressIndicator()),
            //                   ]),
            //             ); //
            //           } else if (snapshot.hasError) {
            //             return Container();
            //           } else if (snapshot.hasData) {
            //             //print(snapshot.data);
            //             if (snapshot.data.error != null &&
            //                 snapshot.data.error.length > 0) {
            //               return Container();
            //             }
            //             //return _getSearchResultWidget(snapshot.data);
            //             return Column(
            //                 children: _getSearchResultWidget(snapshot.data));
            //           } else {
            //             return Container(
            //               child: Column(
            //                   mainAxisAlignment: MainAxisAlignment.center,
            //                   children: [
            //                     SizedBox(
            //                         height: 35,
            //                         width: 35,
            //                         child: CircularProgressIndicator()),
            //                   ]),
            //             ); //return buildLoadingWidget();
            //           }
            //         })),

            Container(
              child: StreamBuilder<JobResponse>(
                  stream: getJobBloc.subject.stream,
                  builder: (context, AsyncSnapshot<JobResponse> snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data.error != null &&
                          snapshot.data.error.length > 0) {
                        return Container();
                      } else {
                        return Column(
                            children: _getSearchResultWidget(snapshot.data));
                      }
                    } else if (snapshot.hasError) {
                      return Container();
                    } else {
                      return Container(); //buildLoadingWidget();
                    }
                  }),
            ),

            // ListView.builder(
            //     padding: const EdgeInsets.all(0),
            //     itemCount: children.length,
            //     itemBuilder: (BuildContext context, int index) {
            //       return Container(
            //         // height: 50,
            //         // color: Colors.amber[colorCodes[index]],
            //         child: children[index],
            //       );
            //     }),
          ]),
        ),
      ),
    );
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
        decoration: BoxDecoration(border: Border.all(color: Colors.blueAccent)),
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
              child: Text("施設番号:" + jobLst[i].nearest_station.toString()),
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
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 8.0),
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
                  title: Text("最寄駅"),
                )),

            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1.0),
              ),
              child: ListTile(
                title: Text(
                  jobLst[i].nearest_station.toString(),
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
                    child: Text("¥",
                        style: TextStyle(fontSize: 20, color: Colors.blue)),
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
                    child: Text("時",
                        style: TextStyle(fontSize: 20, color: Colors.blue)),
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
                        color: Colors.blue,
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
                      new JobDetailWidget(value: jobLst[i]),
                );
                Navigator.of(context).push(route);
              },
              color: Colors.blue,
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
              showDialog(
                  context: context,
                  builder: (context) {
                    return _OccupationDialog(
                        occ: allOcc,
                        selectedOcc: selectedOcc,
                        onSelectedOccListChanged: (occ) {
                          selectedOcc = occ;
                          //print(selectedCities);
                        });
                  });
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

class _TspDialog extends StatefulWidget {
  _TspDialog({
    this.tsp,
    this.selectedTsp,
    this.onSelectedTspListChanged,
  });

  final List<TownshipModel> tsp;
  final List<int> selectedTsp;
  final ValueChanged<List<int>> onSelectedTspListChanged;

  @override
  _TspDialogState createState() => _TspDialogState();
}

class _TspDialogState extends State<_TspDialog> {
  List<int> _tempSelectedTsp = [];

  @override
  void initState() {
    _tempSelectedTsp = widget.selectedTsp;
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
                '市',
                style: TextStyle(fontSize: 18.0, color: Colors.black),
                textAlign: TextAlign.center,
              ),
              RaisedButton(
                onPressed: () {
                  String text = "Data that we want to pass. Can be anything.";
                  Navigator.pop(context, text);
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
                itemCount: widget.tsp.length,
                itemBuilder: (BuildContext context, int index) {
                  final tspObject = widget.tsp[index];
                  //print(cityName.township_name);
                  //return null;
                  return Container(
                    child: CheckboxListTile(
                        title: Text(tspObject.township_name),
                        value: _tempSelectedTsp.contains(tspObject.id),
                        onChanged: (bool value) {
                          if (value) {
                            if (!_tempSelectedTsp.contains(tspObject.id)) {
                              setState(() {
                                _tempSelectedTsp.add(tspObject.id);
                              });
                            }
                          } else {
                            if (_tempSelectedTsp.contains(tspObject.id)) {
                              setState(() {
                                _tempSelectedTsp.removeWhere(
                                    (int city) => city == tspObject.id);
                              });
                            }
                          }
                          widget.onSelectedTspListChanged(_tempSelectedTsp);
                        }),
                  );
                }),
          ),
        ],
      ),
    );
  }
}

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
