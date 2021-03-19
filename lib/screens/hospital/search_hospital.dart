import 'package:flutter/material.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:tis/bloc/get_city_bloc.dart';
import 'package:tis/bloc/get_hospital_bloc.dart';
import 'package:tis/bloc/get_link_bloc.dart';
import 'package:tis/elements/loader.dart';
import 'package:tis/model/city.dart';
import 'package:tis/model/city_response.dart';
import 'package:tis/bloc/get_tsp_bloc.dart';
import 'package:tis/model/department_child.dart';
import 'package:tis/model/department_response.dart';
import 'package:tis/model/hospital.dart';
import 'package:tis/model/hospital_response.dart';
import 'package:tis/model/hospital_specfeat.dart';
import 'package:tis/model/hospital_timetable.dart';
import 'package:tis/model/township.dart';
import 'package:tis/model/township_response.dart';
import 'package:tis/bloc/get_features_bloc.dart';
import 'package:tis/model/specialfeatures.dart';
import 'package:tis/model/speialfeatures_response.dart';
import 'package:tis/model/department.dart';
import 'package:tis/bloc/get_department_bloc.dart';
import 'package:tis/presentation/custom_app_icons.dart';
import 'package:tis/screens/hospital/search_hospital_detail.dart';
import 'package:tis/views/shownoti.dart';

class SearchHospital extends StatefulWidget {
  const SearchHospital({Key key}) : super(key: key);
  @override
  _SearchHospitalState createState() => _SearchHospitalState();
}

class _SearchHospitalState extends State<SearchHospital> {
  var stream;var stream1;var stream2;int checkstream=0;
  // Map<String, bool> cityList = {
  //   'item1': false,
  //   'item2': false,
  //   'item3': false,
  //   'item4': false,
  // };

  // int countMove = 0;
  bool _load = false;
  List<int> selectedTsp = [];
  List<int> selectedSpec = [];
  List<int> selectedDep = [];
  List<String> searchDisplayData;
  List<CityModel> cityList;
  List<TownshipModel> allTsp;

  
  

  String tspText = "市から探す";
  String speText = "市から探す";

  var selectedTspID = [];
  var selectedSepID = [];
  var selectedDepID = [];

  var selectedODepartmentName = [];

  var selectedTspName = [];
  var selectedSepName = [];
  var selectedDepName = [];
  int countTspID = 0;
  int countSpeID = 0;
  int countDepId = 0;



  CityResponse data;

  SpecialFeaturesResponse sdata;

  String _township;

  String _city;

  String _feature;

  List _selectetsp = List();
  List _selectedfea = List();


  @override
  void initState() {
    super.initState();
    cityList = List();
    allTsp = List();
    getCityBloc..getCity();
    getFeaturesBloc..getFeatures();
    getDepBloc..getDepartment('1');
    // getHospitalTimeTableBloc..getHospitalTimetable();
    // getHospitalSpecFeatBloc..getHospitalSpecFeature();
    searchDisplayData = List();

    stream;//=getLinkNewsBloc..getLinkedNews('2');
    stream1;
    stream2;
  }

  @override
  void dispose() {
    super.dispose();
    getTspBloc..drainStream();
    getDepBloc..drainStream();
    getCityBloc..drainStream();
    getFeaturesBloc..drainStream();
    getLinkNewsBloc.drainStream();
    getHospitalBloc..drainStream();
    // getHospitalSpecFeatBloc..drainStream();
    
  }



  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 10,left: 10,right: 10),//const EdgeInsets.all(10.0),
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

                        Padding(
                          padding: const EdgeInsets.only(
                          top: 10.0, left: 10.0, right: 10.0),
                          child: Container(
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
                                    cityList = List();
                                    cityList.add(new CityModel(-1, ""));
                                    snapshot.data.city.forEach((e) {
                                      cityList.add(e);
                                    });
                                    return Padding(
                                      padding: const EdgeInsets.only(
                                      top: 0.0, left: 10.0, right: 10.0),
                                      child: Container(
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
                                      )),
                                    );
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
                        ),

                        SizedBox(height: 10,),

                        // Container(
                        //   margin: EdgeInsets.all(8),
                        //   padding: EdgeInsets.symmetric(horizontal: 0.0),
                        //   decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(5.0),
                        //       color: Colors.white,
                        //       border: Border.all(color: Colors.grey[400])),
                        //   child: StreamBuilder<CityResponse>(
                        //       stream: getCityBloc.subject.stream,
                        //       builder:
                        //         (context, AsyncSnapshot<CityResponse> snapshot) {
                        //           if (snapshot.connectionState == ConnectionState.waiting) {
                        //             return Stack(
                        //               children: <Widget>[
                        //                 _dropDown("市区町村"),                            
                        //                 Center(
                        //                   child: Opacity(
                        //                     opacity:1.0, 
                        //                     child:buildLoadingWidget(),//CircularProgressIndicator(),
                        //                   ),
                        //                 ),
                        //               ],
                        //             );
                        //         }
                        //         else if (snapshot.hasError) {
                        //               return Container();
                        //         } 
                        //         else if (snapshot.hasData) {
                        //           if (snapshot.data.error != null &&
                        //               snapshot.data.error.length > 0) {
                        //             return Container();
                        //           }
                        //           List<CityModel> cityList = List();
                        //             cityList.add(new CityModel(-1,""));
                        //             snapshot.data.city.forEach((e) {
                        //               cityList.add(e);
                        //           });
                        //           return Container(                               
                        //               child: DropdownButtonHideUnderline(
                        //             child: ButtonTheme(                               
                        //                 alignedDropdown: true,
                        //                 child: new DropdownButton<String>(
                        //                 //isDense: true,
                        //                 isExpanded: true,
                        //                 hint:  Row(
                        //                   children: [
                        //                     Icon(Icons.arrow_drop_down_outlined, size: 35.0,),
                        //                     Text("市区町村"),
                        //                   ],
                        //                 ),
                        //                 value: _city,
                        //                 onChanged: (String newValue) {
                        //                   setState(() {
                        //                     checkstream=1;
                        //                     getTspBloc.drainStream();
                        //                     // getDepBloc.drainStream();
                        //                     _township = null;
                        //                     _city = newValue;     
                        //                     stream1=getTspBloc..getTownship(_city);
                                     
                                     
                        //                   });
                        //                 },
                        //                 items: 
                        //                  cityList.map((CityModel cityModel) =>
                        //                     DropdownMenuItem(
                        //                       value: cityModel.id.toString(),
                        //                       child: cityModel.id != -1 ? Text("  "+cityModel.city_name) 
                        //                         : Row(
                        //                           children: [
                        //                             Icon(Icons.arrow_drop_down_outlined, size: 35.0,),
                        //                             Text("市区町村"),
                        //                           ],
                        //                         ),
                        //                     )
                        //                     )
                        //                   .toList(),
                        //               ),
                        //             ),
                        //           ));
                        //         } else {
                        //           return Stack(
                        //           children: <Widget>[
                        //             _dropDown("市区町村"),                         
                        //             Center(
                        //               child: Opacity(
                        //                 opacity:1.0, 
                        //                 child:buildLoadingWidget(),//CircularProgressIndicator(),
                        //               ),
                        //             ),
                        //           ],
                        //         );
                        //         }
                        //       }),
                        // ),

                    // //Township
                    (countTspID != null && countTspID != 0) ?Text("[${countTspID.toString()}]件選択されました.", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),): Container(),

                    Container(
                      margin: EdgeInsets.all(8),
                      padding: EdgeInsets.symmetric(horizontal: 0.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: Colors.white,
                          border: Border.all(color: Colors.grey[400])),
                      child: StreamBuilder<TownshipResponse>(
                          stream: getTspBloc.subject.stream,
                          builder: (context,
                              AsyncSnapshot<TownshipResponse> snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting && checkstream==1) {
                                return Stack(
                                  children: <Widget>[
                                    _dropDown("  市から探す"),                            
                                    Center(
                                      child: Opacity(
                                        opacity:1.0, 
                                        child:buildLoadingWidget(),//CircularProgressIndicator(),
                                      ),
                                    ),
                                  ],
                                );
                            }
                            else if (snapshot.hasError) {
                                  return Container();
                            }     
                            else if (snapshot.hasData) {
                              if (snapshot.data.error != null &&
                                  snapshot.data.error.length > 0) {
                                return Container();
                              }
                              checkstream=0;
                              allTsp =snapshot.data.township;
                              return RaisedButton(
                                  padding: const EdgeInsets.only(
                                      left:0,top: 0.0, right: 0.0),
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
                                      SizedBox(width:MediaQuery.of(context).size.width/1.71,),
                                      Icon(Icons.arrow_drop_down_outlined,),
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
                                  // onPressed: () {
                                  //   showDialog(
                                  //       context: context,
                                  //       builder: (context) {
                                  //         return _TspDialog(
                                  //             tsp: allTsp,
                                  //             selectedTsp: selectedTsp,
                                  //             onSelectedTspListChanged: (tsp) {
                                  //               selectedTsp = tsp;
                                  //               // selectedTspText = selectedTsp;
                                  //               // print(selectedTspText.length);
                                  //             });
                                  //       });
                                  // },

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
                                                    return CheckboxListTile(
                                                        value: selectedTspID
                                                            .contains(
                                                                allTsp[index]
                                                                    .id),
                                                        title: Text(_move),
                                                        onChanged:
                                                            (bool value) {
                                                          if (value) {
                                                            if (!selectedTspID
                                                                .contains(
                                                                    allTsp[index]
                                                                        .id)) {
                                                              setState(() {
                                                                selectedTspID
                                                                    .add(allTsp[
                                                                            index]
                                                                        .id);
                                                                selectedTspName.add(allTsp[index].township_name);
                                                              });
                                                            }
                                                          } else {
                                                            if (selectedTspID
                                                                .contains(
                                                                    allTsp[index]
                                                                        .id)) {
                                                              setState(() {
                                                                selectedTspID
                                                                    .removeWhere((s) =>
                                                                        s ==
                                                                        allTsp[index]
                                                                            .id);
                                                                selectedTspName
                                                                .removeWhere((s) =>
                                                                    s ==
                                                                    allTsp[index]
                                                                        .township_name);
                                                                            
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
                                      opacity:1.0, 
                                      child:checkstream==1?buildLoadingWidget():Container(),
                                    ),
                                  ),
                                ],
                               );
                              // return Container(
                              //   child: DropdownButtonHideUnderline(
                              //     child: DropdownButton(
                              //         isExpanded: true,
                              //         //value: _value,
                              //         hint: Row(
                              //           children: [
                              //             Text("市から探す"),
                              //           ],
                              //         ),
                              //         onChanged: (value) {
                              //           setState(() {
                              //             //_value = value;
                              //           });
                              //         }),
                              //   ),
                              // ); //buildLoadingWidget();
                            }
                          }),
                    ),

                    // //Special Features
                    (countSpeID!= null && countSpeID != 0) ?Text("[${countSpeID.toString()}]件選択されました.", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),): Container(),
                    Container(
                      margin: EdgeInsets.all(8),
                      padding: EdgeInsets.symmetric(horizontal: 0.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: Colors.white,
                          border: Border.all(color: Colors.grey[400])),
                      child: StreamBuilder<SpecialFeaturesResponse>(
                          stream: getFeaturesBloc.subject.stream,
                          builder: (context,
                              AsyncSnapshot<SpecialFeaturesResponse> snapshot) {
                                if (snapshot.connectionState == ConnectionState.waiting) {
                                  return Stack(
                                    children: <Widget>[
                                     Container(
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton(
                                              isExpanded: true,
                                              //value: _value,
                                              hint: Row(
                                                children: [
                                                  Text("  特長から探す"),
                                                ],
                                              ),
                                           ),
                                        ),
                                      ),                   
                                      Center(
                                        child: Opacity(
                                          opacity:1.0, 
                                          child:buildLoadingWidget(),//CircularProgressIndicator(),
                                        ),
                                      ),
                                    ],
                                  );
                              }
                              else if (snapshot.hasError) {
                                      return Container();
                              }     
                              else if (snapshot.hasData) {
                                if (snapshot.data.error != null &&
                                    snapshot.data.error.length > 0) {
                                    return Container();
                              }

                              checkstream=0;
                              List<SpecialFeaturesModel> allSpec =
                                  snapshot.data.special_feature;
                              // List<int> selectedSpec = [];

                              return RaisedButton(
                                  padding: const EdgeInsets.only(
                                      left:0,top: 0.0, right: 0.0),
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
                                      SizedBox(width:MediaQuery.of(context).size.width/1.71,),
                                      Icon(Icons.arrow_drop_down_outlined,),
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
                                  // onPressed: () {
                                  //   showDialog(
                                  //       context: context,
                                  //       builder: (context) {
                                  //         return _SpecFeaturesDialog(
                                  //             spec: allSpec,
                                  //             selectedSpec: selectedSpec,
                                  //             onSelectedSpecListChanged: (spec) {
                                  //               selectedSpec = spec;
                                  //               // selectedTspText = selectedTsp;
                                  //               // print(selectedTspText.length);
                                  //             });
                                  //       });

                                  //   setState(() {
                                  //       selectedSpec = selectedSpec;
                                  //   });

                                  // },
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
                                              title: Text(speText),
                                              actions: <Widget>[
                                                FlatButton(
                                                  onPressed: () {
                                                    Navigator.pop(context,
                                                        selectedSepID.length);
                                                  },
                                                  child: Text('Done'),
                                                ),
                                              ],
                                              content: Container(
                                                width: double.minPositive,
                                                height: 400,
                                                child: ListView.builder(
                                                  shrinkWrap: true,
                                                  itemCount: allSpec.length,
                                                  itemBuilder:
                                                      (BuildContext context,
                                                          int index) {
                                                    String _move = allSpec[index]
                                                        .name;
                                                    return CheckboxListTile(
                                                        value: selectedSepID
                                                            .contains(
                                                                allSpec[index]
                                                                    .id),
                                                        title: Text(_move),
                                                        onChanged:
                                                            (bool value) {
                                                          if (value) {
                                                            if (!selectedSepID
                                                                .contains(
                                                                    allSpec[index]
                                                                        .id)) {
                                                              setState(() {
                                                                selectedSepID
                                                                    .add(allSpec[
                                                                            index]
                                                                        .id);
                                                              selectedSepName.add(allSpec[index].name);
                                                              });
                                                            }
                                                          } else {
                                                            if (selectedSepID
                                                                .contains(
                                                                    allSpec[index]
                                                                        .id)) {
                                                              setState(() {
                                                                selectedSepID
                                                                    .removeWhere((s) =>
                                                                        s ==
                                                                        allSpec[index]
                                                                            .id);
                                                                selectedSepName
                                                                .removeWhere((s) =>
                                                                    s ==
                                                                    allSpec[index]
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
                                    countSpeID = result;
                                  });
                                },
                                
                                //),
                              );
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

                    // Padding(
                    //   padding: const EdgeInsets.only(left: 8.0),
                    //   child: Text(
                    //     "診療科目",
                    //     style: TextStyle(
                    //       fontWeight: FontWeight.bold,
                    //       fontSize: 18,
                    //     ),
                    //   ),
                    // ),

                    //Department
                    (countDepId != null && countDepId != 0) ?Text("[${countDepId.toString()}]件選択されました.", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),): Container(),

                    Container(
                      child: StreamBuilder<DepartmentResponse>(
                          stream: getDepBloc.subject.stream,
                          builder: (context,
                              AsyncSnapshot<DepartmentResponse> snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Container(
                                height:
                                    MediaQuery.of(context).size.height / 1.5,
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      // Center(child: CircularProgressIndicator()),
                                    ]),
                              ); //
                            } else if (snapshot.hasError) {
                              return Container();
                            } else if (snapshot.hasData) {
                              if (snapshot.data.error != null &&
                                  snapshot.data.error.length > 0) {
                                return Container();
                              } 
                              // else {
                              //   return Column(
                              //       children: getTextWidgets(
                              //           snapshot.data.department));
                              // }
                              else {
                                List products = [];
                                //List<int> selectedOcc = [];
                                List<DepartmentModel> depList =
                                    snapshot.data.department;
                                var j = 0;

                                for (var i = 0; i < depList.length; i++) {
                                  j = j + 1;
                                  var productMap = {
                                    'item' + j.toString(): false,
                                    'id': depList[i].id,
                                    'name': depList[i].name
                                  };

                                  products.add(productMap);
                                }

                                List<Widget> list = new List<Widget>();
                                list.add(_paddings("  診療科目"));
                                for (var i = 0; i < depList.length; i++) {
                                  List<DepartmentChildModel> allDep =
                                      depList[i].child;                               
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
                                          leading: Text("   "+depList[i].name),
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
                                                          Text(depList[i].name),
                                                      actions: <Widget>[
                                                        FlatButton(
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context,
                                                                selectedDepID
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
                                                              allDep.length,
                                                          itemBuilder:
                                                              (BuildContext
                                                                      context,
                                                                  int index) {
                                                            String _move =
                                                                allDep[index]
                                                                    .name;
                                                            return CheckboxListTile(
                                                                value: selectedDepID
                                                                    .contains(
                                                                        allDep[index]
                                                                            .id),
                                                                title:
                                                                    Text(_move),
                                                                onChanged:
                                                                    (bool value) {
                                                                  if (value) {
                                                                    if (!selectedDepID
                                                                        .contains(
                                                                            allDep[index]
                                                                                .id)) {
                                                                      setState(
                                                                          () {
                                                                        selectedDepID.add(
                                                                            allDep[index]
                                                                                .id);
                                                                        selectedDepName.add(allDep[index].name);
                                                                      });
                                                                    }
                                                                  } else {
                                                                    if (selectedDepID
                                                                        .contains(
                                                                            allDep[index]
                                                                                .id)) {
                                                                      setState(
                                                                          () {
                                                                        selectedDepID.removeWhere((s) =>
                                                                            s ==
                                                                            allDep[index]
                                                                                .id);
                                                                        selectedDepName.removeWhere((s) =>
                                                                        s ==
                                                                        allDep[index]
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
                                            countDepId = result;
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
                              return Container(); //buildLoadingWidget();
                            }
                          }),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),

              //Search Button 

              RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  onPressed: () {
                    setState(() {
                      _load=true;
                      searchDisplayData = List();
                      searchDisplayData = _getDisplaySearchData();
                      getHospitalBloc..getHospital(_city.toString(), selectedTspID, selectedSepID, selectedDepID);
                      
                    });
                  },
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
                
              SizedBox(
                height: 15,
              ),

              searchDisplayData.length > 0 ? Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1.0),
                ),
               
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(searchDisplayData.join(", ")),
                ),
              ): Container(),

              _load ? Container(
              child: StreamBuilder<HospitalResponse>(
                  stream: getHospitalBloc.subject.stream,
                  builder: (context, AsyncSnapshot<HospitalResponse> snapshot) {
                    if (snapshot.hasError) {
                      return Container(child: Text("error"));
                    } 
                    else if (snapshot.hasData) {
                      if (snapshot.data.error != null &&
                          snapshot.data.error.length > 0) {
                        return Container(
                            child: Text(snapshot.data.error));
                      } 
                      else if (snapshot.data.hospital.isEmpty) {
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
                      } 
                      else {
                        return Column(
                            children:_getSearchResultWidget(snapshot.data));
                      }
                    } 
                    else {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: buildLoadingWidget(),
                      );
                    }

                  })): Container(),

            ],
          ),
        ),
      ),
    );
  }

  List<String> _getDisplaySearchData(){
    List<String> st = List();
    cityList.map((e) => (e.id.toString() == _city && e.id != -1 ) ? st.add(e.city_name): null).toList();

    print(st);
    // ??
    (selectedTspName.length > 0 ? st.add(selectedTspName.toString()) : null);
    (selectedSepName.length > 0 ? st.add(selectedSepName.toString()) : null);
    (selectedDepName.length > 0 ? st.add(selectedDepName.toString()) : null);



    // st.add(selectedTspName.toString());
    // st.add(selectedSepName.toString());
    // st.add(selectedDepName.toString());
    
    return st;
  }

  List<Widget> _getSearchResultWidget(HospitalResponse data) {
    List<HospitalModel> hospitals = data.hospital;
    return searchListWidget(hospitals);
  }

  List<Widget> searchListWidget(hospitals) {
    List<HospitalModel> HospitalList = hospitals;
    List<Widget> list = new List<Widget>();
    String tempsub;
    var subarr = [];
    tempsub = HospitalList[0].subject;
    subarr = tempsub.split(',');

    



    




    for (int i = 0; i < HospitalList.length; i++) {
      list.add(new 
      Container(
        padding: EdgeInsets.all(10.0),
        margin: EdgeInsets.only(top: 20.0 , bottom: 20.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blueAccent),
          borderRadius: BorderRadius.circular(5.0)
        ),
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
              child: Text("施設番号:${HospitalList[i].profilenumber.length == 0 ? '' : HospitalList[i].profilenumber}"),
              
            ),
            InkWell(
              child: Text(
                "${HospitalList[i].name == null ? '' : HospitalList[i].name}",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline)
              ),
              onTap: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context)=> HospitalDetail(hospitalID: HospitalList[i].id.toString())));
              },
            ),
            SizedBox(height: 5,),

            
            Row(
              children: [

                Wrap(children: subarr.map((item) => subarr.length != 0 ?
                Row(
                  children: [
                    Card(
                      color: Colors.blue,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(item, style: TextStyle(color: Colors.white),),
                      ),
                    ),
                  ],
                )
                :  Container()).toList()),

              ]
            ),
            Divider( color: Colors.grey,),
            SizedBox(height: 10),

            (HospitalList[i].logo == null ? Image.asset("assets/img/placeholder.jpg") : Image.asset("asset/img/${HospitalList[i].logo}")),
            
            SizedBox(height: 10),
                  
            Container(
              margin: EdgeInsets.only(top: 12.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1.0),
              ), 
              child: ListTile(
                leading: CircleAvatar(
                  foregroundColor: Colors.black,
                  radius: 18.0,
                  backgroundColor: Colors.grey[200],
                  child: Icon(Icons.mail, color: Colors.blue),
                ),
                title: Text("メールアドレス"),
              )
            ),
                  
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1.0),
              ), 
              child: ListTile(title: Text("${HospitalList[i].email == null ? '' : HospitalList[i].email}",),),
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
                  child: Icon(Icons.location_on,color: Colors.blue,)
                ),
                //leading: Icon(Icons.location_on,color: Colors.blue,),
                title: Text("住所"),
              )
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1.0),
              ), 
              child: ListTile(title: Text("${HospitalList[i].city_name}${HospitalList[i].township_name}${HospitalList[i].address == null ? '' : HospitalList[i].address}"),),
            ),
                  
            SizedBox(height: 10.0),
            Text("こだわりの特長", style: TextStyle(fontWeight: FontWeight.bold),),



            SizedBox(height: 10.0),

            DottedLine(dashColor: Colors.blue,),
            SizedBox(height: 10.0),
            

            Container(
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.symmetric(horizontal: 0.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.white,
                  // border: Border.all(color: Colors.grey[400]),
                  ),
              child: StreamBuilder<HospitalResponse>(
                  stream: getHospitalBloc.subject.stream,
                  builder: (context,
                      AsyncSnapshot<HospitalResponse> snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                      }
                      else if (snapshot.hasError) {
                              return Container();
                      }     
                      else if (snapshot.hasData) {
                        if (snapshot.data.error != null &&
                            snapshot.data.error.length > 0) {
                            return Container();
                      }

                      checkstream=0;
                      List<HospitalSpecFeatModel> specfeat =
                          snapshot.data.specialfeature;
                      return new Wrap(children: specfeat.map((item) => item.name != null ?
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal:3.0),
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 10 , vertical: 4),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.blue, width: 1.0),
                                      borderRadius: BorderRadius.circular(20)
                                    ), 
                              child: Text(item.name,style: TextStyle(color: Colors.blue),),
                            ),
                          ),
                          SizedBox(height: 10,)
                        ],
                      )
                      :  Container()).toList());
                    } else if (snapshot.hasError) {
                      return Container();
                    } else {
                      return Container(); //buildLoadingWidget();
                    }
                  }),
            ),

            Text("診療時間", style: TextStyle(fontWeight: FontWeight.bold),),
            SizedBox(height: 10.0),

            DottedLine(dashColor: Colors.blue,),
            SizedBox(height: 10.0),


            Container(
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.symmetric(horizontal: 0.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.white,
                  border: Border.all(color: Colors.grey[400])),
              child: StreamBuilder<HospitalResponse>(
                  stream: getHospitalBloc.subject.stream,
                  builder: (context,
                      AsyncSnapshot<HospitalResponse> snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return Stack(
                            children: <Widget>[                
                              Center(
                                child: Opacity(
                                  opacity:1.0, 
                                  child:buildLoadingWidget(),//CircularProgressIndicator(),
                                ),
                              ),
                            ],
                          );
                      }
                      else if (snapshot.hasError) {
                              return Container();
                      }     
                      else if (snapshot.hasData) {
                        if (snapshot.data.error != null &&
                            snapshot.data.error.length > 0) {
                            return Container();
                      }

                      checkstream=0;
                      List<HospitalTimeTableModel> hos_timetable =
                          snapshot.data.timetable;
                      List<int> temp_timetable = [];
                      List<HospitalTimeTableModel> first_timetable = [];

                      hos_timetable.map((item) => item.profile_id == HospitalList[i].id ?

                      first_timetable.add(item)
                      :  null).toList();
                      return Container(
                        child: Column(
                          children: [

                            Table(
                              border: TableBorder.all(color: Colors.grey),
                              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                              children: [
                                TableRow(
                                  children: [
                                    _column("日付" ,Color(0xff80919a), Colors.white),
                                    _column("午前" ,Color(0xffecf8ff), Colors.black),
                                    _column("午後" ,Color(0xffecf8ff), Colors.black),
                                  ]
                                ),
                                TableRow(
                                  children: [
                                    _column("月" ,Color(0xff80919a), Colors.white),
                                    _column(first_timetable[0].mon ,Color(0xffffffff), Colors.black),
                                    _column(first_timetable[1].mon ,Color(0xffffffff), Colors.black),
                                  ]
                                ),
                                TableRow(
                                  children: [
                                    _column("火" ,Color(0xff80919a), Colors.white),
                                    _column(first_timetable[0].tue ,Color(0xffffffff), Colors.black),
                                    _column(first_timetable[1].tue ,Color(0xffffffff), Colors.black),
                                  ]
                                ),
                                TableRow(
                                  children: [
                                    _column("水" ,Color(0xff80919a), Colors.white),
                                    _column(first_timetable[0].wed ,Color(0xffffffff), Colors.black),
                                    _column(first_timetable[1].wed ,Color(0xffffffff), Colors.black),
                                  ]
                                ),
                                TableRow(
                                  children: [
                                    _column("木" ,Color(0xff80919a), Colors.white),
                                    _column(first_timetable[0].thu ,Color(0xffffffff), Colors.black),
                                    _column(first_timetable[1].thu ,Color(0xffffffff), Colors.black),
                                  ]
                                ),
                                TableRow(
                                  children: [
                                    _column("金" ,Color(0xff80919a), Colors.white),
                                    _column(first_timetable[0].fri ,Color(0xffffffff), Colors.black),
                                    _column(first_timetable[1].fri ,Color(0xffffffff), Colors.black),
                                  ]
                                ),
                                TableRow(
                                  children: [
                                    _column("土" ,Color(0xff80919a), Colors.white),
                                    _column(first_timetable[0].sat ,Color(0xffffffff), Colors.black),
                                    _column(first_timetable[1].sat ,Color(0xffffffff), Colors.black),
                                  ]
                                ),
                                TableRow(
                                  children: [
                                    _column("日" ,Color(0xff80919a), Colors.white),
                                    _column(first_timetable[0].sun ,Color(0xffffffff), Colors.black),
                                    _column(first_timetable[1].sun ,Color(0xffffffff), Colors.black),
                                  ]
                                ),
                        
                              ]
                            ),

                            
                            // Text(first_timetable[0].mon.toString()),
                            // Text(first_timetable[1].mon.toString()),

                          ],
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Container();
                    } else {
                      return Container(); //buildLoadingWidget();
                    }
                  }),
            ),

            
            SizedBox(height: 10),

            Row(
              children: [
                Text("休診日：", style: TextStyle(fontWeight: FontWeight.bold),),
                Text("${HospitalList[i].closed_day == null ? '' : HospitalList[i].closed_day}"),
              ],
            ),

            SizedBox(height: 10),

            Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xffc40000), width: 2),
                borderRadius: BorderRadius.circular(4)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    foregroundColor: Colors.black,
                    radius: 18.0,
                    backgroundColor: Colors.grey[200],
                    child: Icon(Icons.phone, color: Color(0xffc40000)),
                  ),
                  SizedBox(width: 10),
                  Text("${HospitalList[i].phone == null ? '' : HospitalList[i].phone}",
                    style: TextStyle(
                      color: Color(0xffc40000),
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                    ),
                          
                  )
                ],
              ),
            ),

            SizedBox(
              height: 10,
            ),

            Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2),
                borderRadius: BorderRadius.circular(4)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    foregroundColor: Colors.black,
                    radius: 18.0,
                    backgroundColor: Colors.grey[200],
                    child: Icon(Icons.local_hospital_sharp, color: Color(0xffc40000)),
                  ),
                  SizedBox(width: 10),
                  Text("  お気に入りに追加",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16
                    ),
                          
                  )
                ],
              ),
            ),
                                   
            SizedBox(height: 10.0),
            RaisedButton(
              // onPressed: () {
              //   // Navigator.push(context, MaterialPageRoute(builder: (context) => HospitalDetail()));
              // },
              onPressed: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context)=> HospitalDetail(hospitalID: HospitalList[i].id.toString())));
              },
              color: Colors.blue,
              textColor: Colors.white,
              child: Center(child: Text("詳細を見る"),),
            ),
         ],
       ),
               
      ),
      );
    }
    return list;
  }
    
  Widget _dropDown(String hintText){
    return  DropdownButtonHideUnderline(
      child: new DropdownButton<String>(
        //isDense: true,
        isExpanded: true,
        hint:  Row(
          children: [
            Icon(Icons.arrow_drop_down_outlined, size: 35.0,),
            Text(hintText),
          ],
        ),
        onChanged: (String newValue) {},
        items: [],
      ),
    );
  }

  Widget _paddings(String name){
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

  Widget _column(String name, Color bgColor, Color txtColor){
    return Container(
            padding: EdgeInsets.all(8),
            color: bgColor,
            child: Center(
              child: Text(name, 
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: txtColor,
                  fontSize: 14
                ),)),
          );
  }

  List<Widget> getTextWidgets(List<DepartmentModel> dep) {
    List products = [];
    var j = 0;

    for (var i = 0; i < dep.length; i++) {
      j = j + 1;
      var productMap = {
        'item' + j.toString(): false,
        'id': dep[i].id,
        'name': dep[i].name
      };

      products.add(productMap);
    }

    List<Widget> list = new List<Widget>();

    for (var i = 0; i < dep.length; i++) {
      List<DepartmentChildModel> allDep = dep[i].child;

      list.add(new Container(
        //margin: EdgeInsets.all(8),
        padding: EdgeInsets.symmetric(horizontal: 5.0),
        // decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(5.0),
        //     color: Colors.white,
        //     border: Border.all(color: Colors.grey[400])),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text('Selected Item'),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              RaisedButton(
                padding: EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                child: ListTile(
                  dense: true,
                  contentPadding: EdgeInsets.zero,
                  leading: Text(dep[i].name),
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
                            dep: allDep,
                            selectedDep: selectedDep,
                            onSelectedOccListChanged: (dep) {
                              selectedDep = dep;
                              //print(selectedCities);
                            });
                      });
                },
              ),
            ],
          )
        ),
      ));
    }
    return list;
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

class _SpecFeaturesDialog extends StatefulWidget {
  _SpecFeaturesDialog({
    this.spec,
    this.selectedSpec,
    this.onSelectedSpecListChanged,
  });

  final List<SpecialFeaturesModel> spec;
  final List<int> selectedSpec;
  final ValueChanged<List<int>> onSelectedSpecListChanged;

  @override
  _SpecFeaturesDialogState createState() => _SpecFeaturesDialogState();
}

class _SpecFeaturesDialogState extends State<_SpecFeaturesDialog> {
  List<int> _tempSelectedSpec = [];

  @override
  void initState() {
    _tempSelectedSpec = widget.selectedSpec;
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
                itemCount: widget.spec.length,
                itemBuilder: (BuildContext context, int index) {
                  final specObject = widget.spec[index];
                  //print(cityName.township_name);
                  //return null;
                  return Container(
                    child: CheckboxListTile(
                        title: Text(specObject.name),
                        value: _tempSelectedSpec.contains(specObject.id),
                        onChanged: (bool value) {
                          if (value) {
                            if (!_tempSelectedSpec.contains(specObject.id)) {
                              setState(() {
                                _tempSelectedSpec.add(specObject.id);
                              });
                            }
                          } else {
                            if (_tempSelectedSpec.contains(specObject.id)) {
                              setState(() {
                                    _tempSelectedSpec.removeWhere(
                                    (int city) => city == specObject.id);
                              });
                            }
                          }
                          widget.onSelectedSpecListChanged(_tempSelectedSpec);
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
    this.dep,
    this.selectedDep,
    this.onSelectedOccListChanged,
  });

  final List<DepartmentChildModel> dep;
  final List<int> selectedDep;
  final ValueChanged<List<int>> onSelectedOccListChanged;

  @override
  _OccupationDialogState createState() => _OccupationDialogState();
}

class _OccupationDialogState extends State<_OccupationDialog> {
  List<int> _tempSelectedOcc = [];

  @override
  void initState() {
    _tempSelectedOcc = widget.selectedDep;
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
                itemCount: widget.dep.length,
                itemBuilder: (BuildContext context, int index) {
                  final tspObject = widget.dep[index];
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

