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
  //static String _occupation;

  @override
  void initState() {
    super.initState();
    getCityBloc..getCity();
  }

  @override
  void dispose() {
    // getSourceNewsBloc.drainStream();
    getCityBloc.drainStream();
    getTspBloc.drainStream();

    super.dispose();
  }

  Future<Map<String, bool>> _checkBoxList() async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (context, setState) {
              return AlertDialog(
                //title: Text('Preferred Location'),
                actions: <Widget>[
                  FlatButton(
                    onPressed: () {
                      Navigator.pop(context, cityList);
                    },
                    child: Text('Done'),
                  ),
                ],
                content: Container(
                  width: double.minPositive,
                  height: 300,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: cityList.length,
                    itemBuilder: (BuildContext context, int index) {
                      String _key = cityList.keys.elementAt(index);
                      return CheckboxListTile(
                        value: cityList[_key],
                        title: Text(_key),
                        onChanged: (val) {
                          setState(() {
                            cityList[_key] = val;
                          });
                        },
                      );
                    },
                  ),
                ),
              );
            },
          );
        });
  }

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
                                if (snapshot.connectionState == ConnectionState.waiting) {
                                    return Container(
                                        height:MediaQuery.of(context).size.height/1.5,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [SizedBox(
                                            height: 35,
                                            width: 35,
                                            child: CircularProgressIndicator()),
                                          ]),
                                    );//
                                }
                                else if (snapshot.hasError) {
                                    return Container();
                                } 
                                else if (snapshot.hasData) {
                                    if (snapshot.data.error != null &&
                                        snapshot.data.error.length > 0) {
                                      return Container();
                                    }

                                      return Container(
                                        child: DropdownButtonHideUnderline(
                                        child: new DropdownButton<String>(
                                          //isDense: true,
                                          isExpanded: true,
                                          hint: new Text("市区町"),
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
                                      ));
                                } else {
                                    return Container(); //buildLoadingWidget();
                                }
                        }),
                  ),

                  //township
                  Container(
                    margin: EdgeInsets.all(8),
                    padding: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: Colors.white,
                        border: Border.all(color: Colors.grey[400])),
                    child: StreamBuilder<TownshipResponse>(
                        stream: getTspBloc.subject.stream,
                        builder: (context,
                            AsyncSnapshot<TownshipResponse> snapshot) {
                                if (snapshot.connectionState == ConnectionState.waiting) {
                                    return Container(
                                        height:MediaQuery.of(context).size.height/1.5,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [SizedBox(
                                            height: 35,
                                            width: 35,
                                            child: CircularProgressIndicator()),
                                          ]),
                                    );//
                                 }
                                else if (snapshot.hasError) {
                                            return Container();
                                } 
                                else if (snapshot.hasData) {
                                          if (snapshot.data.error != null &&
                                              snapshot.data.error.length > 0) {
                                            return Container();
                                          }

                                            return Container(
                                                child: DropdownButtonHideUnderline(
                                              child: new DropdownButton<String>(
                                                //isDense: true,
                                                isExpanded: true,
                                                hint: new Text("市から探す"),
                                                value: _township,
                                                onChanged: (String newValue) {
                                                  setState(() => _township = newValue);
                                                },
                                                items: snapshot.data.township
                                                    .toList()
                                                    .map((TownshipModel tspModel) =>
                                                        DropdownMenuItem(
                                                            value: tspModel.id.toString(),
                                                            child:
                                                                Text(tspModel.township_name)))
                                                    .toList(),
                                              ),
                                            ));
                                  } else {
                                            return Container(
                                              child: DropdownButtonHideUnderline(
                                                child: DropdownButton(
                                                    isExpanded: true,
                                                    //value: _value,
                                                    hint: Row(
                                                      children: [
                                                        Icon(
                                                          Icons.arrow_drop_down_outlined,
                                                          size: 35.0,
                                                        ),
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
                    // margin: EdgeInsets.all(8),
                    // padding: EdgeInsets.symmetric(horizontal: 5.0),
                    // decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(5.0),
                    //     color: Colors.white,
                    //     border: Border.all(color: Colors.grey[400])),
                    child: StreamBuilder<OccupationResponse>(
                        stream: getOccBloc.subject.stream,
                        builder: (context,
                            AsyncSnapshot<OccupationResponse> snapshot) {
                                if (snapshot.connectionState == ConnectionState.waiting) {
                                      return Container(
                                          height:MediaQuery.of(context).size.height/1.5,
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [SizedBox(
                                              height: 35,
                                              width: 35,
                                              child: CircularProgressIndicator()),
                                            ]),
                                      );//
                                 }
                                else if (snapshot.hasError) {
                                            return Container();
                                } 
                                else if (snapshot.hasData) {
                                  if (snapshot.data.error != null &&
                                      snapshot.data.error.length > 0) {
                                    return Container();
                                  } else {
                                    return Column(
                                        children:
                                            getTextWidgets(snapshot.data.occupation));
                                  }
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
                          "雇用形態",
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
                        _checkBoxList();
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

  Widget _dropDownBox(String hintText) {
    return Container(
      //margin: EdgeInsets.only(top: 8,left: 8.0, right: 8.0),
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.white,
          border: Border.all(color: Colors.grey[400])),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
            isExpanded: true,
            //value: _value,
            hint: Row(
              children: [
                Icon(
                  Icons.arrow_drop_down_outlined,
                  size: 35.0,
                ),
                Text(hintText),
              ],
            ),
            items: [
              DropdownMenuItem(
                child: Text("First Item"),
                value: 1,
              ),
              DropdownMenuItem(
                child: Text("Second Item"),
                value: 2,
              ),
              DropdownMenuItem(child: Text("Third Item"), value: 3),
              DropdownMenuItem(child: Text("Fourth Item"), value: 4)
            ],
            onChanged: (value) {
              setState(() {
                //_value = value;
              });
            }),
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

List<Widget> getTextWidgets(List<OccupationModel> occ) {
  List<Widget> list = new List<Widget>();
  for (var i = 0; i < occ.length; i++) {
    list.add(new Container(
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.symmetric(horizontal: 5.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: Colors.white,
            border: Border.all(color: Colors.grey[400])),
        child: DropdownButtonHideUnderline(
            child: new DropdownButton<String>(
          //isDense: true,
          isExpanded: true,
          hint: new Text(occ[i].name),
          //value: _township,
          onChanged: (String newValue) {
            //setState(() => _township = newValue);
          },
          items: occ[i]
              .child
              .map((OccupationChildModel occChildModel) => DropdownMenuItem(
                  value: occChildModel.id.toString(),
                  child: Text(occChildModel.name)))
              .toList(),
        ))));
  }
  return list;
}
