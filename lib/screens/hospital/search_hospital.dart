import 'package:flutter/material.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:tis/bloc/get_city_bloc.dart';
import 'package:tis/bloc/get_link_bloc.dart';
import 'package:tis/model/city.dart';
import 'package:tis/model/city_response.dart';
import 'package:tis/bloc/get_tsp_bloc.dart';
import 'package:tis/model/department_child.dart';
import 'package:tis/model/link.dart';
import 'package:tis/model/link_response.dart';
import 'package:tis/model/township.dart';
import 'package:tis/model/township_response.dart';
import 'package:tis/bloc/get_features_bloc.dart';
import 'package:tis/model/specialfeatures.dart';
import 'package:tis/model/speialfeatures_response.dart';
import 'package:tis/model/department.dart';
import 'package:tis/model/department_response.dart';
import 'package:tis/bloc/get_department_bloc.dart';
import 'package:tis/presentation/custom_app_icons.dart';
import 'package:tis/views/shownoti.dart';

class SearchHospital extends StatefulWidget {
  @override
  _SearchHospitalState createState() => _SearchHospitalState();
}

class _SearchHospitalState extends State<SearchHospital> {
  var stream; 
  Map<String, bool> cityList = {
    'item1': false,
    'item2': false,
    'item3': false,
    'item4': false,
  };

  CityResponse data;

  SpecialFeaturesResponse sdata;

  static String _township;

  static String _city;

  static String _feature;

  List _selectetsp = List();
  List _selectedfea = List();

  @override
  void initState() {
    super.initState();
    getCityBloc..getCity();
    getFeaturesBloc..getFeatures();
    stream;//=getLinkNewsBloc..getLinkedNews('2');
  }

  @override
  void dispose() {
    super.dispose();
    getCityBloc.drainStream();
    getFeaturesBloc..drainStream();
    getLinkNewsBloc.drainStream();
    
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

  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top:40.0),//const EdgeInsets.all(10.0),//  padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(width: 5.0),
                  Icon(Icons.map, color: Colors.blue),
                  SizedBox(width: 5.0),
                  Text("地図検索"),
                ],
              ),
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
                                stream =getLinkNewsBloc..getLinkedNews('2');                               
                              });
                               return  showDialog(                                 
                                          context: context,
                                          builder: (context) {
                                          return StatefulBuilder(
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
                    //City

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
                                  hint: new Text("市区町村"),
                                  value: _city,
                                  onChanged: (String newValue) {
                                    setState(() {
                                      _township = null;
                                      _city = newValue;
                                      getTspBloc..getTownship(_city);
                                      getDepBloc..getDepartment(_city);
                                    });
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
                            } else if (snapshot.hasError) {
                              return Container();
                            } else {
                              return Container(); //buildLoadingWidget();
                            }
                          }),
                    ),

                    // //Township

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
                                  //hint: Text("市から探す"),
                                  hint: Row(
                                    children: [
                                      // Icon(
                                      //   Icons.arrow_drop_down_outlined,
                                      //   size: 35.0,
                                      // ),
                                      Text("市から探す"),
                                    ],
                                  ),
                                  value: _township,
                                  onChanged: (String newValue) {
                                    //setState(() => _township = newValue);
                                    // _onCategorySelected(
                                    //     _township, newValue, _selectetsp);
                                  },
                                  items: snapshot.data.township
                                      .map<DropdownMenuItem<String>>(
                                          (TownshipModel tspModel) =>
                                              DropdownMenuItem(
                                                child: Row(
                                                  children: <Widget>[
                                                    Checkbox(
                                                      value: _selectetsp
                                                          .contains(tspModel.id),
                                                      onChanged: (bool value) {
                                                        // _onCategorySelected(
                                                        //     value,
                                                        //     tspModel.id,
                                                        //     _selectetsp);
                                                      },
                                                    ),
                                                    Text(tspModel.township_name
                                                        .toString()),
                                                  ],
                                                ),
                                              ))
                                      .toList(),
                                ),
                              ));
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

                    // //Special Features

                    Container(
                      margin: EdgeInsets.all(8),
                      padding: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: Colors.white,
                          border: Border.all(color: Colors.grey[400])),
                      child: StreamBuilder<SpecialFeaturesResponse>(
                          stream: getFeaturesBloc.subject.stream,
                          builder: (context,
                              AsyncSnapshot<SpecialFeaturesResponse> snapshot) {
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
                                  hint: Row(
                                    children: [
                                      Text("特長から探す"),
                                    ],
                                  ),
                                  value: _feature,
                                  onChanged: (String newValue) {
                                    setState(() {
                                      // _township = null;
                                      // _feature = newValue;
                                    });
                                  },
                                  items: snapshot.data.special_feature
                                      .toList()
                                      .map<DropdownMenuItem<String>>((SpecialFeaturesModel
                                              featuresModel) =>
                                          DropdownMenuItem(
                                              child: Row(
                                                children: [
                                                  Checkbox(
                                                    value: _selectedfea.contains(featuresModel.id),
                                                  ),
                                                  Text(featuresModel.name.toString()),
                                                ],
                                              )
                                              ))
                                      .toList(),
                                ),
                              ));
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
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        "診療科目",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),

                    //Department

                    // Container(
                    //   child: StreamBuilder<DepartmentResponse>(
                    //       stream: getDepBloc.subject.stream,
                    //       builder: (context,
                    //           AsyncSnapshot<DepartmentResponse> snapshot) {
                    //         if (snapshot.connectionState ==
                    //             ConnectionState.waiting) {
                    //           return Container(
                    //             height:
                    //                 MediaQuery.of(context).size.height / 1.5,
                    //             child: Column(
                    //                 mainAxisAlignment: MainAxisAlignment.center,
                    //                 children: [
                    //                   Center(
                    //                       child: CircularProgressIndicator()),
                    //                 ]),
                    //           ); //
                    //         } else if (snapshot.hasError) {
                    //           return Container();
                    //         } else if (snapshot.hasData) {
                    //           if (snapshot.data.error != null &&
                    //               snapshot.data.error.length > 0) {
                    //             return Container();
                    //           } else {
                    //             return Column(
                    //                 children: getTextWidgets(
                    //                     snapshot.data.department));
                    //           }
                    //         } else {
                    //           return Container(); //buildLoadingWidget();
                    //         }
                    //       }),
                    // ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
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
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 14.0, horizontal: 10),
                        child: Text('検索',
                            style: TextStyle(
                              fontSize: 16,
                            )),
                      ),
                    ],
                  )),
            ],
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

List<Widget> getTextWidgets(List<DepartmentModel> dep) {
  List<Widget> list = new List<Widget>();
  for (var i = 0; i < dep.length; i++) {
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
          hint: new Text(dep[i].name),
          //value: _township,
          onChanged: (String newValue) {
            //setState(() => _township = newValue);
          },
          items: dep[i]
              .child
              .map((DepartmentChildModel depChildModel) => DropdownMenuItem(
                  value: depChildModel.id.toString(),
                  child: Row(
                    children: <Widget>[
                      Checkbox(
                        //value: _selectedOcc.contains(occChildModel.id),
                        value: false,
                        onChanged: (bool value) {},
                      ),
                      Text(depChildModel.name.toString()),
                    ],
                  )))
              .toList(),
        ))));
  }
  return list;
}
