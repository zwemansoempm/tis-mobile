import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:tis/app-format.dart';
import 'package:tis/bloc/get_city_bloc.dart';
import 'package:tis/bloc/get_link_bloc.dart';
import 'package:tis/bloc/get_nursing_result_bloc.dart';
import 'package:tis/bloc/get_nursing_search_data_bloc.dart';
import 'package:tis/bloc/get_tsp_bloc.dart';
import 'package:tis/elements/loader.dart';
import 'package:tis/model/city.dart';
import 'package:tis/model/city_response.dart';
import 'package:tis/model/nursing.dart';
import 'package:tis/model/nursingSearch_response.dart';
import 'package:tis/model/specialFeatures.dart';
import 'package:tis/model/specialfeature.dart';
import 'package:tis/model/township.dart';
import 'package:tis/model/township_response.dart';
import 'package:tis/presentation/custom_app_icons.dart';
import 'package:tis/views/nusing_detail.dart';
import 'package:tis/views/shownoti.dart';

class NusingSearch extends StatefulWidget {
  NusingSearch({Key key}) : super(key: key);

  @override
  _NusingSearchState createState() => _NusingSearchState();
}

class _NusingSearchState extends State<NusingSearch> {

  String _city;
  String _township;
  String _movingIn;
  String _perMonth;
  int countMove = 0;
  int countFeature = 0;
  int countAcceptance = 0;
  int countFacType = 0;
  var selectedMoveId =[];
  var selectedSpeFeature = [];
  var selectedMedAcceptance = [];
  var selectedFacType = [];

  String moveText = "入居時の条件から探す";
  String specFeatureText = "特長から探す";
  String medAcceptanceText = "施設の種類から探す";
  String facTypeText = "医療面・診療科目から探す";

  List<String> moveList = [
    '自立', '要支援' , '要介護',
  ];
  var stream;var stream1;var stream2;var resultStream; int checkstream=0;
  bool _load = false;

  @override
  void initState() {
    super.initState();
    getCityBloc..getCity();  
    stream;//getLinkNewsBloc..getLinkedNews("1");
    stream1;
    stream2=getNursingSearchDataBloc..getNursingSearchData("-1");
    resultStream;
  }

  @override
  void dispose() {
    super.dispose();
    getCityBloc.drainStream();
    getNursingSearchDataBloc.drainStream();
    getTspBloc.drainStream();
    getLinkNewsBloc.drainStream();
    getNursingResultBloc.drainStream();
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
       child: SingleChildScrollView(
          child: Padding(
          padding: const EdgeInsets.only(top: 10,left: 10,right: 10),//const EdgeInsets.all(10.0),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text("介護施設検索",
                    style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),)),
              ),
              DottedLine(dashColor: Colors.blue,),

              SizedBox(height: 20.0),
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
                        ),
                      ),
                    ],
                  ),
                  Container(
                    child: Align(
                          alignment: Alignment.bottomRight,
                          child:RawMaterialButton(
                            onPressed: () {
                                setState(() {
                                stream =getLinkNewsBloc..getLinkedNews('1');                               
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
              SizedBox(height: 10.0),

              Text("地域"),
              
              Card(
                color: Colors.grey[300],
                child: Column(
                  
                  children:[
                    //city
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0 , left : 20.0 , right: 20.0),
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
                            if (snapshot.connectionState == ConnectionState.waiting) {
                                return Stack(
                                  children: <Widget>[
                                    _dropDown("市区町村"),                            
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
                            List<CityModel> cityList = List();
                            cityList.add(new CityModel(-1,""));
                            snapshot.data.city.forEach((e) {
                              cityList.add(e);
                            });
                            return Container(
                              //width: 320.0,
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
                                        getTspBloc.drainStream();
                                        stream1=getTspBloc..getTownship(newValue);
                                        checkstream=1;
                                      _city = newValue;
                                    });
                                  },
                                  
                                  items: cityList.map((CityModel cityModel) =>
                                      DropdownMenuItem(
                                        value: cityModel.id.toString(),
                                        child: cityModel.id != -1 ? Text(cityModel.city_name) 
                                          : Row(
                                            children: [
                                              Icon(Icons.arrow_drop_down_outlined, size: 35.0,),
                                              Text("市区町村"),
                                            ],
                                          ),
                                      )
                                      )
                                    .toList(),
                                ),
                              ));
                          } else {
                            return Stack(
                              children: <Widget>[
                                _dropDown("市区町村"),                            
                                Center(
                                  child: Opacity(
                                    opacity:1.0, 
                                    child:buildLoadingWidget(),//CircularProgressIndicator(),
                                  ),
                                ),
                              ],
                            );
                            // );//_dropDown("市区町村"); //buildLoadingWidget();
                          }
                        }),
              
                      )
                    ),
                    
                    //Township
                    Padding(
                      padding: const EdgeInsets.only(left: 20,right: 20,bottom: 10,top: 10),
                      //township
                      child: Container(
                      padding: EdgeInsets.only(left: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: Colors.white,
                        border: Border.all(color: Colors.grey[400])),
                      child: StreamBuilder<TownshipResponse>(
                        stream: getTspBloc.subject.stream,
                        builder: (context,AsyncSnapshot<TownshipResponse> snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting && checkstream==1) {
                                return Stack(
                                  children: <Widget>[
                                    _dropDown("市区町村"),                            
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
                            List<TownshipModel> townships = List();
                            townships.add(new TownshipModel(-1,"",""));
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
                                      Icon(Icons.arrow_drop_down_outlined, size: 35.0,),
                                      Text("市区町村"),
                                    ],
                                  ),
                                  value: _township,
                                  onChanged: (String newValue) {
                                    setState(() => _township = newValue);
                                  },
                                  items: townships.map((TownshipModel tspModel) =>
                                      DropdownMenuItem(
                                        value: tspModel.id.toString(),
                                        //child: Text(tspModel.township_name)
                                        child: tspModel.id != -1 ? Text(tspModel.township_name) 
                                          : Row(
                                            children: [
                                              Icon(Icons.arrow_drop_down_outlined, size: 35.0,),
                                              Text("市区町村"),
                                            ],
                                          ),
                                      )
                                    )
                                    .toList(),
                                  
                                ),
                            ));
                          } else {
                            return Stack(
                              children: <Widget>[
                                _dropDown("市区町村"),                            
                                 Center(
                                  child: Opacity(
                                    opacity:1.0, 
                                    child:checkstream==1?buildLoadingWidget():Container(),//CircularProgressIndicator(),
                                  ),
                                ),
                              ],
                            );
                          }
                        }),
                  ),
                    ),
                  ]
                )
              ),
              
              SizedBox(height: 10.0),
              Text("料金"),
              Card(
                color: Colors.grey[300],
                child: Column(
                  children:[
                    //moving_in
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0 , left : 20.0 , right: 20.0),
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
                              value: _movingIn,
                              onChanged: (String newValue) {
                                setState(() => _movingIn = newValue);
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
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                              value: _perMonth,
                              onChanged: (String newValue) {
                                setState(() => _perMonth = newValue);
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
              
              SizedBox(height: 10.0),
              Text("その他"),
              SizedBox(height: 2.0),
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
                        (countMove != null && countMove != 0) ?Text("[${countMove.toString()}]件選択されました.", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),): Container(),
                        RaisedButton(
                          padding: EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                          child: ListTile(
                            dense: true,
                            contentPadding: EdgeInsets.zero,
                            leading: Text(moveText),
                            trailing: Icon(Icons.arrow_drop_down_outlined),
                          ),
                          color: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.grey[400], width: 1),
                            borderRadius: BorderRadius.circular(5.0)
                          ),
                          onPressed: () async {
                            int result = await showDialog(
                              barrierDismissible: false,
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
                                                          (s) => s == _move);
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
                                if(result != null){
                                  countMove = result;
                                }
                              });
                          },
                        ),
                        ]
                      ),
                    ),
              ),
              
              StreamBuilder<NursingSearchDataResponse>(
                stream:getNursingSearchDataBloc.subject.stream,
                builder: (context,
                    AsyncSnapshot<NursingSearchDataResponse> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                          return Stack(
                            children: <Widget>[
                              // _dropDown("市区町村"),     
                               Opacity(
                                  opacity:0.3, 
                                  child: Column(
                                  children: [
                                    _checkBoxLoadBuildWidget(specFeatureText),
                                    _checkBoxLoadBuildWidget(medAcceptanceText),
                                    _checkBoxLoadBuildWidget(facTypeText),
                                  ],
                                 ),
                               ), //buil                       
                                Positioned(
                                    top:75,
                                    left:  MediaQuery.of(context).size.width/2.2,   
                                    child: Center(                                
                                    child: Opacity(
                                      opacity:1.0, 
                                      child:buildLoadingWidget(),//CircularProgressIndicator(),
                                    ),
                                  ),
                                ),                             
                            ],
                          );
                      }
                      else if (snapshot.hasError) {
                         stream2=getNursingSearchDataBloc..getNursingSearchData("-1");
                         return Container();
                      } 
                     else if (snapshot.hasData) {
                      if (snapshot.data.error != null &&
                          snapshot.data.error.length > 0) {
                         stream2=getNursingSearchDataBloc..getNursingSearchData("-1");
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
                                              leading: Text(specFeatureText),
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
                                                barrierDismissible: false,
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
                                                                            (s) => s == special.id);
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
                                              leading: Text(medAcceptanceText),
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
                                                barrierDismissible: false,
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
                                                                            (m) => m == medAcceptance.id);
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
                                              leading: Text(facTypeText),
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
                                                barrierDismissible: false,
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
                                                                            (m) => m == facType.id);
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
                    }else {

                      return Stack(
                              children: <Widget>[
                              Opacity(
                                  opacity:0.3, 
                                  child: Column(
                                  children: [
                                    _checkBoxLoadBuildWidget(specFeatureText),
                                    _checkBoxLoadBuildWidget(medAcceptanceText),
                                    _checkBoxLoadBuildWidget(facTypeText),
                                  ],
                                 ),
                               ), //buil                       
                                Positioned(
                                    top:75,
                                    left:  MediaQuery.of(context).size.width/2.2,   
                                    child: Center(                                
                                    child: Opacity(
                                      opacity:1.0, 
                                      child:buildLoadingWidget(),//CircularProgressIndicator(),
                                    ),
                                  ),
                                ), 
                              ],
                      );
                      // return Column(
                      //   children: [
                      //      _checkBoxLoadBuildWidget(specFeatureText),
                      //      _checkBoxLoadBuildWidget(medAcceptanceText),
                      //      _checkBoxLoadBuildWidget(facTypeText),
                      //   ],
                      // ); //buildLoadingWidget();
                    }
              }),

              //search button
              Container(
                margin: EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1.0),
                ), 
                padding: EdgeInsets.symmetric(vertical: 4,horizontal: 8),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  onPressed: () {
                    getNursingResultBloc.drainStream();
                    resultStream = getNursingResultBloc..getNursingResult(_city,_township,_movingIn,_perMonth,selectedMoveId,selectedSpeFeature,selectedMedAcceptance,selectedFacType);
                    setState((){
                      _load=true;
                    });
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

              //ResultData
              _load ? Container(
                child: StreamBuilder<NursingResponse>(
                  stream: getNursingResultBloc.subject.stream,
                  builder: (context, AsyncSnapshot<NursingResponse> snapshot) {
                    if (snapshot.hasError) {
                      return Container(child: Text("error"));
                    } 
                    else if (snapshot.hasData) {
                      if (snapshot.data.error != null &&
                          snapshot.data.error.length > 0) {
                        return Container(child: Text(snapshot.data.error));
                      } else  if (snapshot.data.nursingList.isEmpty){
                        return Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Card(
                                  color: Colors.grey[300],
                                  child:Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Icon(Icons.search_off_sharp, color: Colors.grey[600]),
                                  ), 
                                ),
                                Text("お探しの条件に合う施設は見つかりませんでした。",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xff2980b9),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16
                                  ),
                                ),
                                Text("条件の変更を行い再度ご検索いだだくと見つかる可能性がございます。",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16
                                  ),
                                ),
                              ]
                            ),
                          )
                        );
                      } else {
                        return Column(
                            children: _getSearchResultWidget(snapshot.data));
                      }
                    }else {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: buildLoadingWidget(),
                      );   
                    }
                  }
                ),
              ): Container(),
             ],
            )
         ),
       ),
    );
  
  }

  List<Widget> _getSearchResultWidget(NursingResponse data) {
    List<NursingModel> nursingList = data.nursingList;
    List<SpecialFeature> featureList = data.specialFeatureList;
    return searchListWidget(nursingList, featureList);
  }

  List<Widget> searchListWidget(nursingList, featureList) {

    List<Widget> list = new List<Widget>();
    for (int i = 0; i < nursingList.length; i++) {
      list.add(new Container(
                padding: EdgeInsets.all(10.0),
                margin: EdgeInsets.only(top: 10.0 , bottom: 10.0),
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
                      child: Text("施設番号:${nursingList[i].profilenumber}"),
                    ),
                    InkWell(
                      child: Text(
                        nursingList[i].name,
                        style: TextStyle(
                          color: Colors.blue,
                          //fontSize: 18.0,
                          decoration: TextDecoration.underline)
                      ),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> NusingDetail()));
                      },
                    ),
                    Divider( thickness: 2),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0 , bottom: 8.0, left: 8.0),
                      child: Row(
                        children: [
                          Text(nursingList[i].city_name),
                          SizedBox(width: 4.0),
                          Icon(Icons.double_arrow ),
                          SizedBox(width: 4.0),
                          Text(nursingList[i].township_name)
                        ]
                      ),
                    ),
                   
                    Center(
                      // child: Image.asset("assets/logos/bbc-news.png", width: 200, height: 150,),
                      child: (nursingList[i].logo != null && nursingList[i].logo !='') ?
                        FadeInImage(
                          placeholder: AssetImage('assets/img/placeholder.jpg'),
                          image: NetworkImage(
                            "https://test.t-i-s.jp/upload/nursing_profile/${nursingList[i].logo}",
                          ),
                          imageErrorBuilder: (context, error, stackTrace) { 
                            return Image.asset(
                              "assets/img/placeholder.jpg",
                            );
                          },                                                                           
                        )
                        : Image.asset("assets/img/placeholder.jpg"),
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
                      child: ListTile(title: Text(moneyChangeFormat(nursingList[i].moving_in_from)+"円 ~ "+moneyChangeFormat(nursingList[i].moving_in_to) +"円", style: TextStyle(color: Colors.red),),),
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
                      child: ListTile(title: Text(moneyChangeFormat(nursingList[i].per_month_from)+"円 ~ "+moneyChangeFormat(nursingList[i].per_month_to) +"円", style: TextStyle(color: Colors.red),),),
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
                        title: Text("住所"),
                      )
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1.0),
                      ), 
                      child: ListTile(title: Text("${nursingList[i].city_name}${nursingList[i].township_name}${nursingList[i].address ==null ? '' : nursingList[i].address}"),),
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
                        title: Text("アクセス"),
                      )
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1.0),
                      ), 
                      child: ListTile(title: Text("${nursingList[i].access == null ? '' : parseHtmlString(nursingList[i].access)}"),),
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
                      child: ListTile(title: Text("${nursingList[i].cus_name == null ? '' : nursingList[i].cus_name}"),),
                    ),
                    SizedBox(height: 10.0),
                    Text("こだわりの特長",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                    DottedLine(dashColor: Colors.blue,),
                    SizedBox(height: 10.0),

                    getTextWidgets(featureList, nursingList[i].id),
                    
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
              ));
    }
    return list;
  }

  Widget getTextWidgets(List<SpecialFeature> features,int nursingId)
  {
    return new Wrap(children: features.map((item) => item.profile_id == nursingId ?
      Container(
        margin: EdgeInsets.symmetric(vertical: 4,horizontal: 4),
        padding: EdgeInsets.symmetric(horizontal: 10 , vertical: 4),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blue, width: 1.0),
          borderRadius: BorderRadius.circular(20)
        ), 
        child: Text(item.name,style: TextStyle(color: Colors.blue),),
      )
      :  Container()).toList());
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

  final List<SpecialFeaturesModel> cities;
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
