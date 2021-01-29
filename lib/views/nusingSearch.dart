import 'dart:convert';

import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:tis/bloc/get_city_bloc.dart';
import 'package:tis/bloc/get_nursing_search_data_bloc.dart';
import 'package:tis/bloc/get_occupation_bloc.dart';
import 'package:tis/bloc/get_specialFeatures_bloc.dart';
import 'package:tis/bloc/get_tsp_bloc.dart';
import 'package:tis/model/city.dart';
import 'package:tis/model/city_response.dart';
import 'package:tis/model/nursingSearch_response.dart';
import 'package:tis/model/occupation.dart';
import 'package:tis/model/occupation_response.dart';
import 'package:tis/model/specialFeatures.dart';
import 'package:tis/model/township.dart';
import 'package:tis/model/township_response.dart';
import 'package:tis/views/nusing_detail.dart';

class NusingSearch extends StatefulWidget {
  NusingSearch({Key key}) : super(key: key);

  @override
  _NusingSearchState createState() => _NusingSearchState();
}

class _NusingSearchState extends State<NusingSearch> {

  String _city;
  String _township;
  String _moving_in;
  String _per_month;
  int countMove = 0;
  int countFeature = 0;
  int countAcceptance = 0;
  int countFacType = 0;
  List<String> selectedMoveId = [];
  List<int> selectedSpeFeature = [];
  List<int> selectedMedAcceptance = [];
  List<int> selectedFacType = [];

  String moveText = "入居時の条件から探す";
  String specFeatureText = "特長から探す";
  String medAcceptanceText = "施設の種類から探す";
  String facTypeText = "医療面・診療科目から探す";

  List<String> moveList = [
    '自立', '要支援' , '要介護',
  ];

  @override
  void initState() {
    super.initState();
    getCityBloc..getCity();
    getNursingSearchDataBloc..getNursingSearchData("1");
  }

  @override
  void dispose() {
    super.dispose();
    getCityBloc.drainStream();
    getNursingSearchDataBloc.drainStream();
  }

  @override
  Widget build(BuildContext context) {
    
    return Container(
       child: SingleChildScrollView(
                child: Padding(
           padding: const EdgeInsets.all(10.0),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [

              Row(
                children: [
                  SizedBox(width: 5.0),
                  Icon(Icons.map,color: Colors.blue),
                  SizedBox(width: 5.0),
                  Text("地図検索"),
                  Text("「全国の介護施設 6件」"),
                ]
              ),
              DottedLine(dashColor: Colors.blue,),

              SizedBox(height: 20.0),

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
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.0),

              Text("地域で絞り込む"),
              
              Card(
                color: Colors.grey[300],
                child: Column(
                  
                  children:[
                    //city
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0 , left : 10.0 , right: 10.0),
                      child: Container(
                        //padding: EdgeInsets.all(5.0),
                        padding: EdgeInsets.only(left: 5),
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
                                  hint:  Row(
                                    children: [
                                      Icon(Icons.arrow_drop_down_outlined, size: 35.0,),
                                      Text("市区町村"),
                                    ],
                                  ),
                                  value: _city,
                                  onChanged: (String newValue) {
                                    setState(() {
                                      _township = null;
                                      _city = newValue;
                                      getTspBloc..getTownship(_city);
                                    });
                                  },
                                  items: snapshot.data.city.toList()
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
                            return _dropDown("市区町村"); //buildLoadingWidget();
                          }
                        }),
              
                      )
                    ),
                    
                    //Township
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      //township
                      child: Container(
                      padding: EdgeInsets.only(left: 5),
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
                                  hint: Row(
                                    children: [
                                      Icon(Icons.arrow_drop_down_outlined, size: 35.0,),
                                      Text("市区町村"),
                                    ],
                                  ),
                                  value: _township,
                                  onChanged: (String newValue) {
                                    setState(() => _township = newValue);
                                  },
                                  items: snapshot.data.township
                                    .toList()
                                    .map((TownshipModel tspModel) =>
                                      DropdownMenuItem(
                                        value: tspModel.id.toString(),
                                        child: Text(tspModel.township_name)))
                                    .toList(),
                                ),
                            ));
                          } else if (snapshot.hasError) {
                            return Container();
                          } else {
                            return _dropDown("市区町村");
                          }
                        }),
                  ),
                    ),
                  ]
                )
              ),
              
              SizedBox(height: 10.0),
              Text("料金で絞り込む"),
              Card(
                color: Colors.grey[300],
                child: Column(
                  children:[
                    //moving_in
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0 , left : 10.0 , right: 10.0),
                      child: Container(
                        padding: EdgeInsets.only(left: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: Colors.white,
                          border: Border.all(color: Colors.grey[400])),
                          child: DropdownButtonHideUnderline(
                            child: new DropdownButton<String>(
                              //isDense: true,
                              isExpanded: true,
                              hint:  Row(
                                children: [
                                  Icon(Icons.arrow_drop_down_outlined, size: 35.0,),
                                  Text("入居一時金"),
                                ],
                              ),
                              value: _moving_in,
                              onChanged: (String newValue) {
                                setState(() => _moving_in = newValue);
                              },
                              items: [
                                DropdownMenuItem(
                                  child: Row(
                                    children: [
                                      Icon(Icons.arrow_drop_down_outlined, size: 35.0,),
                                      Text("入居一時金"),
                                    ],
                                  ),
                                  value: "-1",
                                ),
                                DropdownMenuItem(
                                  child: Text("50万円以下"),
                                  value: "500000",
                                ),
                                DropdownMenuItem(
                                  child: Text("100万円以下"),
                                  value: "1000000",
                                ),
                                DropdownMenuItem(
                                  child: Text("200万円以下"),
                                  value: "2000000",
                                ),
                                DropdownMenuItem(
                                  child: Text("300万円以下"),
                                  value: "3000000",
                                ),
                                DropdownMenuItem(
                                  child: Text("400万円以下"),
                                  value: "4000000",
                                ),
                                DropdownMenuItem(
                                  child: Text("500万円以下"),
                                  value: "5000000",
                                ),
                                DropdownMenuItem(
                                  child: Text("600万円以下"),
                                  value: "6000000",
                                ),
                                DropdownMenuItem(
                                  child: Text("700万円以下"),
                                  value: "7000000",
                                ),
                                DropdownMenuItem(
                                  child: Text("800万円以下"),
                                  value: "8000000",
                                ),
                                DropdownMenuItem(
                                  child: Text("900万円以下"),
                                  value: "9000000",
                                ),
                                DropdownMenuItem(
                                  child: Text("1,000万円以下"),
                                  value: "10000000",
                                ),
                                DropdownMenuItem(
                                  child: Text("2,000万円以下"),
                                  value: "20000000",
                                ),
                                DropdownMenuItem(
                                  child: Text("3,000万円以下"),
                                  value: "30000000",
                                ),
                                DropdownMenuItem(
                                  child: Text("3,000万円以上"),
                                  value: "30000000", // more
                                ),
                              ],
                            ),
                          )
              
                      )
                    ),

                    //per_month
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      //child: _dropDownBox("月額利用料")
                      child: Container(
                        padding: EdgeInsets.only(left: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: Colors.white,
                          border: Border.all(color: Colors.grey[400])),
                          child: DropdownButtonHideUnderline(
                            child: new DropdownButton<String>(
                              //isDense: true,
                              isExpanded: true,
                              hint:  Row(
                                children: [
                                  Icon(Icons.arrow_drop_down_outlined, size: 35.0,),
                                  Text("月額利用料"),
                                ],
                              ),
                              value: _per_month,
                              onChanged: (String newValue) {
                                setState(() => _per_month = newValue);
                              },
                              items: [
                                DropdownMenuItem(
                                  child: Row(
                                    children: [
                                      Icon(Icons.arrow_drop_down_outlined, size: 35.0,),
                                      Text("月額利用料"),
                                    ],
                                  ),
                                  value: "-1",
                                ),
                                DropdownMenuItem(
                                  child: Text("10万円以下"),
                                  value: "100000",
                                ),
                                DropdownMenuItem(
                                  child: Text("12万円以下"),
                                  value: "120000",
                                ),
                                DropdownMenuItem(
                                  child: Text("14万円以下"),
                                  value: "140000",
                                ),
                                DropdownMenuItem(
                                  child: Text("16万円以下"),
                                  value: "160000",
                                ),
                                DropdownMenuItem(
                                  child: Text("18万円以下"),
                                  value: "180000",
                                ),
                                DropdownMenuItem(
                                  child: Text("20万円以下"),
                                  value: "200000",
                                ),
                                DropdownMenuItem(
                                  child: Text("22万円以下"),
                                  value: "220000",
                                ),
                                DropdownMenuItem(
                                  child: Text("24万円以下"),
                                  value: "240000",
                                ),
                                DropdownMenuItem(
                                  child: Text("26万円以下"),
                                  value: "260000",
                                ),
                                DropdownMenuItem(
                                  child: Text("28万円以下"),
                                  value: "280000",
                                ),
                                DropdownMenuItem(
                                  child: Text("30万円以下"),
                                  value: "300000",
                                ),
                                DropdownMenuItem(
                                  child: Text("35万円以下"),
                                  value: "350000",
                                ),
                                DropdownMenuItem(
                                  child: Text("40万円以下"),
                                  value: "400000",
                                ),
                                DropdownMenuItem(
                                  child: Text("45万円以下"),
                                  value: "450000",
                                ),
                                DropdownMenuItem(
                                  child: Text("50万円以下"),
                                  value: "500000",
                                ),
                                DropdownMenuItem(
                                  child: Text("50万円以上"),
                                  value: "500000", //more
                                ),
                              ],
                            ),
                          )
              
                      )
                    ),
                  ]
                )
              ),
              
              SizedBox(height: 20.0),
              Text("もっと探す条件"),
              Row(children: [ 
                SizedBox(
                  height: 20.0,
                  width: 40.0,
                  child: Divider(color: Colors.blue[400],thickness: 3.0,)
                ),]
              ),
 
              //MoveId
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1.0),
                ), 
                child:Padding(
                  padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        countMove != 0 ?Text("[${countMove.toString()}]件選択されました.", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),): Container(),
                        RaisedButton(
                          padding: EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                          child: ListTile(
                            dense: true,
                            contentPadding: EdgeInsets.zero,
                            leading: Text(moveText, style: TextStyle(color: Colors.grey[600]),),
                            trailing: Icon(Icons.arrow_drop_down_outlined),
                          ),
                          color: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.grey[400], width: 1),
                            borderRadius: BorderRadius.circular(5.0)
                          ),
                          onPressed: () async {
                            // _checkBoxList();
                            int result = await showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return StatefulBuilder(
                                  builder: (context, setState) {
                                    return AlertDialog(
                                      title: Text(moveText),
                                      actions: <Widget>[
                                        FlatButton(
                                          onPressed: () {
                                            Navigator.pop(context, selectedMoveId.length);
                                          },
                                          child: Text('Done'),
                                        ),
                                      ],
                                      content: Container(
                                        width: double.minPositive,
                                        height: 300,
                                        child: ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: moveList.length,
                                          itemBuilder: (BuildContext context, int index) {
                                            String _move = moveList[index];
                                            return CheckboxListTile(
                                              value: selectedMoveId.contains(_move),
                                              title: Text(_move),
                                              onChanged: (bool value) {
                                                if (value) {
                                                  if (!selectedMoveId.contains(_move)) {
                                                    setState(() {
                                                      selectedMoveId.add(_move);
                                                    });
                                                  }
                                                } else {
                                                  if (selectedMoveId.contains(_move)) {
                                                    setState(() {
                                                      selectedMoveId.removeWhere(
                                                          (String s) => s == _move);
                                                    });
                                                  }
                                                }
                                              }
                                            );
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                );
                              });
                              setState(() {
                                countMove = result;
                              });
                          },
                        ),
                        ]
                      ),
                    ),
              ),
              
              StreamBuilder<NursingSearchDataResponse>(
                stream: getNursingSearchDataBloc.subject.stream,
                builder: (context,
                    AsyncSnapshot<NursingSearchDataResponse> snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data.error != null &&
                          snapshot.data.error.length > 0) {
                        return Container();
                      }else {
                        return Container(
                          child: Column(
                            children: [
                              Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey, width: 1.0),
                                  ), 
                                  child:Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            countFeature != 0 ? Text("[${countFeature.toString()}]件選択されました.", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),)
                                              : Container(),
                                            RaisedButton(
                                            padding: EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                                            child: ListTile(
                                              dense: true,
                                              contentPadding: EdgeInsets.zero,
                                              leading: Text(specFeatureText, style: TextStyle(color: Colors.grey[600]),),
                                              trailing: Icon(Icons.arrow_drop_down_outlined),
                                            ),
                                            color: Colors.white,
                                            elevation: 0,
                                            shape: RoundedRectangleBorder(
                                              side: BorderSide(color: Colors.grey[400], width: 1),
                                              borderRadius: BorderRadius.circular(5.0)
                                            ),
                                            onPressed: () async  {
                                              var result = await showDialog(
                                                context: context,
                                                builder: (BuildContext context) {
                                                  return StatefulBuilder(
                                                    builder: (context, setState) {
                                                      return AlertDialog(
                                                        title: Text(specFeatureText),
                                                        actions: <Widget>[
                                                          FlatButton(
                                                            onPressed: () {
                                                              Navigator.pop(context, selectedSpeFeature.length);
                                                            },
                                                            child: Text('Done'),
                                                          ),
                                                        ],
                                                        content: Container(
                                                          width: double.minPositive,
                                                          height: 300,
                                                          child: ListView.builder(
                                                            shrinkWrap: true,
                                                            itemCount: snapshot.data.specialFeatures.length,
                                                            itemBuilder: (BuildContext context, int index) {
                                                              final special = snapshot.data.specialFeatures[index];
                                                              return CheckboxListTile(
                                                                value: selectedSpeFeature.contains(special.id),
                                                                title: Text(special.name),
                                                                onChanged: (bool value) {
                                                                  if (value) {
                                                                    if (!selectedSpeFeature.contains(special.id)) {
                                                                      setState(() {
                                                                        selectedSpeFeature.add(special.id);
                                                                      });
                                                                    }
                                                                  } else {
                                                                    if (selectedSpeFeature.contains(special.id)) {
                                                                      setState(() {
                                                                        selectedSpeFeature.removeWhere(
                                                                            (int s) => s == special.id);
                                                                      });
                                                                    }
                                                                  }
                                                                }
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                });
                                                setState(() {
                                                  countFeature = result;
                                                });
                                            },
                                          ),
                                          ]
                                        ),
                                      ),
                                ),
                              Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey, width: 1.0),
                                  ), 
                                  child:Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            countAcceptance != 0 ? Text("[${countAcceptance.toString()}]件選択されました.", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),)
                                              : Container(),
                                            RaisedButton(
                                            padding: EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                                            child: ListTile(
                                              dense: true,
                                              contentPadding: EdgeInsets.zero,
                                              leading: Text(medAcceptanceText, style: TextStyle(color: Colors.grey[600]),),
                                              trailing: Icon(Icons.arrow_drop_down_outlined),
                                            ),
                                            color: Colors.white,
                                            elevation: 0,
                                            shape: RoundedRectangleBorder(
                                              side: BorderSide(color: Colors.grey[400], width: 1),
                                              borderRadius: BorderRadius.circular(5.0)
                                            ),
                                            onPressed: () async {
                                              var result = await showDialog(
                                                context: context,
                                                builder: (BuildContext context) {
                                                  return StatefulBuilder(
                                                    builder: (context, setState) {
                                                      return AlertDialog(
                                                        title: Text(medAcceptanceText),
                                                        actions: <Widget>[
                                                          FlatButton(
                                                            onPressed: () {
                                                              Navigator.pop(context, selectedMedAcceptance.length);
                                                            },
                                                            child: Text('Done'),
                                                          ),
                                                        ],
                                                        content: Container(
                                                          width: double.minPositive,
                                                          height: 300,
                                                          child: ListView.builder(
                                                            shrinkWrap: true,
                                                            itemCount: snapshot.data.medicalAcceptances.length,
                                                            itemBuilder: (BuildContext context, int index) {
                                                              final medAcceptance = snapshot.data.medicalAcceptances[index];
                                                              return CheckboxListTile(
                                                                value: selectedMedAcceptance.contains(medAcceptance.id),
                                                                title: Text(medAcceptance.name),
                                                                onChanged: (bool value) {
                                                                  if (value) {
                                                                    if (!selectedMedAcceptance.contains(medAcceptance.id)) {
                                                                      setState(() {
                                                                        selectedMedAcceptance.add(medAcceptance.id);
                                                                      });
                                                                    }
                                                                  } else {
                                                                    if (selectedMedAcceptance.contains(medAcceptance.id)) {
                                                                      setState(() {
                                                                        selectedMedAcceptance.removeWhere(
                                                                            (int m) => m == medAcceptance.id);
                                                                      });
                                                                    }
                                                                  }
                                                                }
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                });
                                              setState(() {
                                                countAcceptance = result;
                                              });
                                            },
                                          ),
                                          ]
                                        ),
                                      ),
                                ),
                            Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey, width: 1.0),
                                  ), 
                                  child:Padding(
                                    padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          countFacType != 0 ? Text("[${countFacType.toString()}]件選択されました.", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),)
                                              : Container(),
                                          RaisedButton(
                                            padding: EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                                            child: ListTile(
                                              dense: true,
                                              contentPadding: EdgeInsets.zero,
                                              leading: Text(facTypeText, style: TextStyle(color: Colors.grey[600]),),
                                              trailing: Icon(Icons.arrow_drop_down_outlined),
                                            ),
                                            color: Colors.white,
                                            elevation: 0,
                                            shape: RoundedRectangleBorder(
                                              side: BorderSide(color: Colors.grey[400], width: 1),
                                              borderRadius: BorderRadius.circular(5.0)
                                            ),
                                            onPressed: () async {
                                              var result = await showDialog(
                                                context: context,
                                                builder: (BuildContext context) {
                                                  return StatefulBuilder(
                                                    builder: (context, setState) {
                                                      return AlertDialog(
                                                        title: Text(facTypeText),
                                                        actions: <Widget>[
                                                          FlatButton(
                                                            onPressed: () {
                                                              Navigator.pop(context, selectedFacType.length);
                                                            },
                                                            child: Text('Done'),
                                                          ),
                                                        ],
                                                        content: Container(
                                                          width: double.minPositive,
                                                          height: 300,
                                                          child: ListView.builder(
                                                            shrinkWrap: true,
                                                            itemCount: snapshot.data.facTypes.length,
                                                            itemBuilder: (BuildContext context, int index) {
                                                              final facType = snapshot.data.facTypes[index];
                                                              return CheckboxListTile(
                                                                value: selectedFacType.contains(facType.id),
                                                                title: Text(facType.description),
                                                                onChanged: (bool value) {
                                                                  if (value) {
                                                                    if (!selectedFacType.contains(facType.id)) {
                                                                      setState(() {
                                                                        selectedFacType.add(facType.id);
                                                                      });
                                                                    }
                                                                  } else {
                                                                    if (selectedFacType.contains(facType.id)) {
                                                                      setState(() {
                                                                        selectedFacType.removeWhere(
                                                                            (int m) => m == facType.id);
                                                                      });
                                                                    }
                                                                  }
                                                                }
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                });
                                              setState(() {
                                                countFacType = result;
                                              });
                                            },
                                          ),
                                          ]
                                        ),
                                      ),
                                ),


                            ]
                          ),
                        );
                      }
                    } else if (snapshot.hasError) {
                      return Container();
                    } else {
                      return Column(
                        children: [
                           _checkBoxLoadBuildWidget(specFeatureText),
                           _checkBoxLoadBuildWidget(medAcceptanceText),
                           _checkBoxLoadBuildWidget(facTypeText),
                        ],
                      ); //buildLoadingWidget();
                    }
                  }),


              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1.0),
                ), 
                padding: EdgeInsets.symmetric(vertical: 4,horizontal: 8),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  onPressed: () {
                    print(selectedMoveId);
                    print(selectedMedAcceptance);
                    print(selectedFacType);
                  },
                  color: Colors.green,
                  textColor: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.search),
                      Text('検索', style: TextStyle(fontSize: 16,)),
                  ],)

                ),
              ),

              Container(
                padding: EdgeInsets.all(10.0),
                margin: EdgeInsets.only(top: 20.0 , bottom: 20.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueAccent)
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
                      child: Text("施設番号:500009-0001"),
                    ),
                    InkWell(
                      child: Text(
                        "ベストライフ三鷹",
                        style: TextStyle(
                          color: Colors.blue,
                          //fontSize: 18.0,
                          decoration: TextDecoration.underline)
                      ),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> NusingDetail()));
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0 , bottom: 0.0),
                      child: Row(
                        children: [
                          Text("開設年月日 :",style: TextStyle(color: Colors.green)),
                          Text("2017-04-01")
                        ]
                      ),
                    ),
                    Divider( thickness: 2),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0 , bottom: 8.0, left: 8.0),
                      child: Row(
                        children: [
                          Text("東京都"),
                          SizedBox(width: 4.0),
                          Icon(Icons.double_arrow ),
                          SizedBox(width: 4.0),
                          Text("三鷹市")
                        ]
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.all(10.0),
                      color: Colors.blue,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text("64室(全室個室)", style: TextStyle(color: Colors.white),),
                      ),
                    ),
                    Center(
                      child: Image.asset("assets/logos/bbc-news.png", width: 200, height: 150,),
                    ),
                    
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
                          child: Text("¥" ,style: TextStyle(fontSize: 20,color: Colors.blue)),
                        ),
                        title: Text("入居時費用"),
                      )
                    ),
                    
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1.0),
                      ), 
                      child: ListTile(title: Text("0円 ~ 380万円", style: TextStyle(color: Colors.red),),),
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
                          child: Text("¥" ,style: TextStyle(fontSize: 20,color: Colors.blue)),
                        ),
                        title: Text("月額費用"),
                      )
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1.0),
                      ), 
                      child: ListTile(title: Text("0円 ~ 380万円", style: TextStyle(color: Colors.red),),),
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
                      child: ListTile(title: Text("東京都三鷹市中原3-4-7"),),
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
                        title: Text("アクセス"),
                      )
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1.0),
                      ), 
                      child: ListTile(title: Text("京王線「仙川」駅から徒歩3分「仙川」バス停より小田急バス乗車「中原小学校」バス停下車徒歩約4分京王線「つつじヶ丘」駅よりみたかシティバス 「杏林大学病院」行「中原高架下児童公園」バス停から徒歩2分"),),
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
                          child: Icon(Icons.apartment ,color: Colors.blue,)
                        ),
                        title: Text("運営事業者名"),
                      )
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 10.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1.0),
                      ), 
                      child: ListTile(title: Text("株式会社アスモ介護サービス"),),
                    ),
                    SizedBox(height: 10.0),
                    Text("こだわりの特長"),
                    DottedLine(dashColor: Colors.blue,),
                    
                    SizedBox(height: 10.0),
                    RaisedButton(
                      onPressed: () {
                         Navigator.push(context, MaterialPageRoute(builder: (context)=> NusingDetail()));
                      },
                      color: Colors.blue,
                      textColor: Colors.white,
                      child: Center(child: Text("詳細を見る"),),
                    ),
                   ],
                 ),
                 
              ),

              //News
              // Row(
              //   children: [
              //     Container(
              //       decoration: BoxDecoration(
              //         color: Colors.blue
              //       ), 
              //       height: 36.0,
              //       width: 10.0,
              //     ),
              //     Container(
              //       width: MediaQuery.of(context).size.width - 30.0,
              //       decoration: BoxDecoration(
              //         color: Colors.blue[100]
              //       ),
              //       padding: EdgeInsets.all(8.0),
              //       child: Text("News" ,
              //         style: TextStyle(
              //           color: Colors.blue,
              //           fontWeight: FontWeight.bold,
              //           fontSize: 18.0,
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              // SizedBox(
              //   height: 10.0
              // ),

              // Row(
              //   children: [
              //     RaisedButton(
              //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
              //       onPressed: () {},
              //       color: Colors.grey,
              //       child: Center(child: Text("2020年"),),
              //     ),
              //   ],
              // ),
              // SizedBox(
              //   height: 10.0
              // ),
              
              // _news()

             ],
      ),
         ),
       ),
    );
  }

  Widget _news(){
    return Column(
      children: [
        Row(
              children: [
                Text("2020-11-06"),
                SizedBox(width: 20.0),
                Card(
                  color: Colors.blue,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
                    child: Text("お知らせ" , style: TextStyle(color: Colors.white),)
                  ),
                ),
              ]
            ),
            SizedBox(
              height: 5.0
            ),
            Text("介護施設検索サービスを開設しました。登録・サイト利用等サービスをご利用出来ますので、皆様奮ってご利用下さい。"),
            Divider(thickness: 2,),
      ]
        
    );
  }

  Widget _checkBoxLoadBuildWidget(String name){
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 1.0),
      ), 
      child:Padding(
        padding: const EdgeInsets.all(8.0),
        child: RaisedButton(
          padding: EdgeInsets.symmetric(horizontal: 6, vertical: 1),
          child: ListTile(
            dense: true,
            contentPadding: EdgeInsets.zero,
            leading: Text(name, style: TextStyle(color: Colors.grey[600]),),
            trailing: Icon(Icons.arrow_drop_down_outlined),
          ),
          color: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.grey[400], width: 1),
            borderRadius: BorderRadius.circular(5.0)
          ),
          onPressed: ()  {}
        )
      )
    );
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
}


class _MyDialog extends StatefulWidget {
  _MyDialog({
    this.cities,
    this.selectedCities,
    this.onSelectedCitiesListChanged,
  });

  final List<SpecialFeatureModel> cities;
  final List<String> selectedCities;
  final ValueChanged<List<String>> onSelectedCitiesListChanged;

  @override
  _MyDialogState createState() => _MyDialogState();
}

class _MyDialogState extends State<_MyDialog> {
  List<String> _tempSelectedCities = [];

  @override
  void initState() {
    _tempSelectedCities = widget.selectedCities;
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
                itemCount: widget.cities.length,
                itemBuilder: (BuildContext context, int index) {
                  final cityName = widget.cities[index];
                  return Container(
                    child: CheckboxListTile(
                        title: Text(cityName.name),
                        value: _tempSelectedCities.contains(cityName.id),
                        onChanged: (bool value) {
                          if (value) {
                            if (!_tempSelectedCities.contains(cityName)) {
                              setState(() {
                                _tempSelectedCities.add(cityName.name);
                              });
                            }
                          } else {
                            if (_tempSelectedCities.contains(cityName.name)) {
                              setState(() {
                                _tempSelectedCities.removeWhere(
                                    (String city) => city == cityName.name);
                              });
                            }
                          }
                          widget
                              .onSelectedCitiesListChanged(_tempSelectedCities);
                        }),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
