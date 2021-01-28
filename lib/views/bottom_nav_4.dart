import 'package:flutter/material.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:tis/bloc/get_city_bloc.dart';
import 'package:tis/model/city.dart';
import 'package:tis/model/city_response.dart';
import 'package:tis/bloc/get_tsp_bloc.dart';
import 'package:tis/model/occupation_child.dart';
import 'package:tis/model/township.dart';
import 'package:tis/model/township_response.dart';
import 'package:tis/model/occupation.dart';
import 'package:tis/model/occupation_response.dart';
import 'package:tis/bloc/get_occupation_bloc.dart';

class JobWidget extends StatefulWidget {
  @override
  _BottomNav4State createState() => _BottomNav4State();
}

class _BottomNav4State extends State<JobWidget> {
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

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
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
            _header("現在の検索条件"),
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
                                      "市から探す",
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
                                                print(selectedTsp);
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

                  // Divider(
                  //   color: Colors.grey[300],
                  //   thickness: 1,
                  // ),

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
                onPressed: () {},
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
          ]),
        ),
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
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.symmetric(horizontal: 5.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: Colors.white,
            border: Border.all(color: Colors.grey[400])),
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
                'CITIES',
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
                'CITIES',
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
                'CITIES',
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
