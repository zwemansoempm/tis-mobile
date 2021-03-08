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
import 'package:tis/model/facTypes.dart';
import 'package:tis/model/medicalAcceptance.dart';
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

  List<CityModel> cityList;
  List<TownshipModel> townshipList;
  List<SpecialFeaturesModel> specialFeatList;
  List<MedicalAcceptanceModel> medicalAptList;
  List<FacTypeModel> facTypeList;
  List<String> searchDisplayData;

  String _city;
  String _township;
  String _movingIn;
  String _perMonth;
  int countMove = 0;
  int countFeature = 0;
  int countAcceptance = 0;
  int countFacType = 0;
  
  var selectedMoveId =["0"];
  var selectedSpeFeature = ["0"];
  var selectedMedAcceptance = ["0"];
  var selectedFacType = ["0"];

  String moveText = "入居時の条件から探す";
  String specFeatureText = "特長から探す";
  String facTypeText = "施設の種類から探す";
  String medAcceptanceText = "医療面・診療科目から探す";

  Map<String, String> movingInList = {
    '入居一時金' : '-1',
    '50万円以下': '500000', '100万円以下': '1000000', '200万円以下': '2000000', 
    '300万円以下': '3000000', '400万円以下': '4000000', '500万円以下': '5000000', 
    '600万円以下': '6000000', '700万円以下': '7000000', '800万円以下': '8000000', 
    '900万円以下': '9000000', '10,00万円以下': '10000000', '2,000万円以下': '20000000', 
    '3,000万円以下': '30000000', '3,000万円以上': '30000001',
  };

  Map<String, String> perMonthList = {
    '月額利用料' : '-1',
    '10万円以下': '100000', '12万円以下': '120000', '14万円以下': '140000', 
    '16万円以下': '160000', '18万円以下': '180000', '20万円以下': '200000', 
    '22万円以下': '220000', '24万円以下': '240000', '26万円以下': '260000', 
    '28万円以下': '280000', '30万円以下': '300000', '35万円以下': '350000', 
    '40万円以下': '400000', '45万円以下': '450000', '50万円以下': '500000',
    '50万円以上': '500001',
  };

  List<String> moveList = [
    '自立', '要支援' , '要介護',
  ];
  var stream;var stream1;var stream2;var resultStream; int checkstream=0;
  bool _load = false;

  @override
  void initState() {
    super.initState();
    cityList = List();
    townshipList = List();
    specialFeatList = List();
    medicalAptList = List();
    facTypeList = List();
    searchDisplayData = List();
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
                              //return Container();
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
                            else if (snapshot.hasData) {
                              if (snapshot.data.error != null &&
                                  snapshot.data.error.length > 0) {
                                //return Container();
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
                            cityList = List();
                            cityList.add(new CityModel(-1,""));
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
                                          child: cityModel.id != -1 ? Text("  "+cityModel.city_name) 
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
                            townshipList = List();
                            townshipList.add(new TownshipModel(-1,"",""));
                            snapshot.data.township.forEach((e) {
                              townshipList.add(e);
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
                                        Icon(Icons.arrow_drop_down_outlined, size: 35.0,),
                                        Text("市区町村"),
                                      ],
                                    ),
                                    value: _township,
                                    onChanged: (String newValue) {
                                      setState(() => _township = newValue);
                                    },
                                    items: townshipList.map((TownshipModel tspModel) =>
                                        DropdownMenuItem(
                                          value: tspModel.id.toString(),
                                          child: tspModel.id != -1 ? Text("  "+tspModel.township_name) 
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
                            child: ButtonTheme(
                                alignedDropdown: true,
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
                                items: movingInList.keys.map((String key) => key == "入居一時金"? 
                                  DropdownMenuItem(
                                    child: Row(
                                      children: [
                                        Icon(Icons.arrow_drop_down_outlined, size: 35.0,),
                                        Text(key),
                                      ],
                                    ),
                                    value: movingInList[key],
                                  ) :
                                  DropdownMenuItem(
                                    child: Text("  "+key),
                                    value: movingInList[key],
                                  ),
                                ).toList(),
                              ),
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
                            child: ButtonTheme(
                                alignedDropdown: true,
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
                                items: perMonthList.keys.map((String key) => key == "月額利用料"? 
                                  DropdownMenuItem(
                                    child: Row(
                                      children: [
                                        Icon(Icons.arrow_drop_down_outlined, size: 35.0,),
                                        Text(key),
                                      ],
                                    ),
                                    value: perMonthList[key],
                                  ) :
                                  DropdownMenuItem(
                                    child: Text("  "+key),
                                    value: perMonthList[key],
                                  ),
                                ).toList(),
                              ),
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
                margin: EdgeInsets.only(bottom: 8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[400], width: 1.0),
                ), 
                child:Padding(
                  //padding: const EdgeInsets.all(8.0),
                  padding: EdgeInsets.zero,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        (selectedMoveId.length > 1) ? 
                          Padding(
                            padding: const EdgeInsets.only(left: 8,top: 8),
                            child: Text("[${selectedMoveId.length-1}]件選択されました.", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),),
                          )
                          : Container(padding: EdgeInsets.only(top: 8),),
                        Padding(
                          padding: const EdgeInsets.only(left: 8,right: 8),
                          child: RaisedButton(
                            padding: EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                            child: ListTile(
                              dense: true,
                              contentPadding: EdgeInsets.only(left: 7),
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
                              var result = await showDialog(
                                barrierDismissible: true,
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
                                  countMove = result;
                                });
                            },
                          ),
                        ),
                        Divider(
                          color: Colors.grey[400],
                          thickness: 1,
                        ),

                        StreamBuilder<NursingSearchDataResponse>(
                          stream:getNursingSearchDataBloc.subject.stream,
                          builder: (context,
                            AsyncSnapshot<NursingSearchDataResponse> snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) {
                             return _otherNoDataWidget();
                            }
                            else if (snapshot.hasError) {
                              stream2=getNursingSearchDataBloc..getNursingSearchData("-1");
                              return _otherNoDataWidget();
                            }
                            else if (snapshot.hasData) {
                              if (snapshot.data.error != null &&
                                snapshot.data.error.length > 0) {
                                stream2=getNursingSearchDataBloc..getNursingSearchData("-1");
                                return _otherNoDataWidget();

                              }else {
                                specialFeatList = snapshot.data.specialFeatures;
                                medicalAptList = snapshot.data.medicalAcceptances;
                                facTypeList = snapshot.data.facTypes;
                                return Container(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      (selectedSpeFeature.length > 1) ?
                                        Padding(
                                          padding: const EdgeInsets.only(left:  8),
                                          child: Text("[${selectedSpeFeature.length-1}]件選択されました.", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),),
                                        )
                                        : Container(),
                                      //countFeature != 0 ? Text("[${countFeature.toString()}]件選択されました.", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),) : Container(),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8,right: 8),
                                        child: RaisedButton(
                                        padding: EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                                        child: ListTile(
                                          dense: true,
                                          contentPadding: EdgeInsets.only(left: 7),
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
                                            barrierDismissible: true,
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
                                                            value: selectedSpeFeature.contains(special.id.toString()),
                                                            title: Text(special.name),
                                                            onChanged: (bool value) {
                                                              if (value) {
                                                                if (!selectedSpeFeature.contains(special.id.toString())) {
                                                                  setState(() {
                                                                    selectedSpeFeature.add(special.id.toString());
                                                                  });
                                                                }
                                                              } else {
                                                                if (selectedSpeFeature.contains(special.id.toString())) {
                                                                  setState(() {
                                                                    selectedSpeFeature.removeWhere(
                                                                        (s) => s == special.id.toString());
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
                                      ),
                                      Divider(
                                        color: Colors.grey[300],
                                        thickness: 1,
                                      ),
                                      (selectedFacType.length > 1) ?
                                        Padding(
                                          padding: const EdgeInsets.only(left: 8),
                                          child: Text("[${selectedFacType.length-1}]件選択されました.", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),),
                                        )
                                        : Container(),
                                      Padding(
                                        padding: const EdgeInsets.only(left:8, right: 8),
                                        child: RaisedButton(
                                          padding: EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                                          child: ListTile(
                                            dense: true,
                                            contentPadding: EdgeInsets.only(left: 7),
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
                                              barrierDismissible: true,
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
                                                              value: selectedFacType.contains(facType.id.toString()),
                                                              title: Text(facType.description),
                                                              onChanged: (bool value) {
                                                                if (value) {
                                                                  if (!selectedFacType.contains(facType.id.toString())) {
                                                                    setState(() {
                                                                      selectedFacType.add(facType.id.toString());
                                                                    });
                                                                  }
                                                                } else {
                                                                  if (selectedFacType.contains(facType.id.toString())) {
                                                                    setState(() {
                                                                      selectedFacType.removeWhere(
                                                                          (m) => m == facType.id.toString());
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
                                        ),
                                      Divider(
                                        color: Colors.grey[300],
                                        thickness: 1,
                                      ), 
                                      (selectedMedAcceptance.length > 1) ?
                                        Padding(
                                          padding: const EdgeInsets.only(left: 8),
                                          child: Text("[${selectedMedAcceptance.length-1}]件選択されました.", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),),
                                        )
                                        : Container(),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8 , right: 8),
                                        child: RaisedButton(
                                          padding: EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                                          child: ListTile(
                                            dense: true,
                                            contentPadding: EdgeInsets.only(left: 7),
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
                                              barrierDismissible: true,
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
                                                              value: selectedMedAcceptance.contains(medAcceptance.id.toString()),
                                                              title: Text(medAcceptance.name),
                                                              onChanged: (bool value) {
                                                                if (value) {
                                                                  if (!selectedMedAcceptance.contains(medAcceptance.id.toString())) {
                                                                    setState(() {
                                                                      selectedMedAcceptance.add(medAcceptance.id.toString());
                                                                    });
                                                                  }
                                                                } else {
                                                                  if (selectedMedAcceptance.contains(medAcceptance.id.toString())) {
                                                                    setState(() {
                                                                      selectedMedAcceptance.removeWhere(
                                                                          (m) => m == medAcceptance.id.toString());
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
                                      ),
                                      
                                      
                                      ]
                                    ),
                                  );
                                }
                              }else {
                               
                                return _otherNoDataWidget();
                              }
                        }),
                        Divider(
                          color: Colors.grey[300],
                          thickness: 1,
                        ),

                        //search button
                        Padding(
                          padding: EdgeInsets.only(left: 8, right:8,bottom: 8,),
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            onPressed: () {
                              getNursingResultBloc.drainStream();
                              resultStream = getNursingResultBloc..getNursingResult(_city,_township,_movingIn,_perMonth,selectedMoveId,selectedSpeFeature,selectedMedAcceptance,selectedFacType);
                              setState((){
                                _load=true;
                                searchDisplayData = List();
                                searchDisplayData = _getDisplaySearchData();
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
                      ]
                    ),
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
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  margin: EdgeInsets.only(top: 10),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey, width: 1.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Column (
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                      searchDisplayData.length > 0 ? Text(searchDisplayData.join(", ")) : Container(),
                                      snapshot.data.nursingList.length != null ?  
                                        Text("${snapshot.data.nursingList.length}「件」検索されました。") : Container(),
                                    ],),
                                  ),
                                ),
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
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.only(top: 10),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey, width: 1.0),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(8),
                                child: Column (
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                  searchDisplayData.length > 0 ? Text(searchDisplayData.join(", ")) : Container(),
                                  snapshot.data.nursingList.length != null ?  
                                    Text("${snapshot.data.nursingList.length}「件」検索されました。") : Container(),
                                ],),
                              ),
                            ),
                            Column(
                              children:_getSearchResultWidget(snapshot.data),
                            )
                          ]
                        );
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

  List<String> _getDisplaySearchData(){
    List<String> st = List();
    cityList.map((e) => (e.id.toString() == _city && e.id != -1 ) ? st.add(e.city_name): null).toList();
    townshipList.map((e) => (e.id.toString() == _township && e.id != -1 ) ? st.add(e.township_name): null).toList();
    movingInList.entries.map((e) => (e.value == _movingIn && e.value != "-1" ) ? st.add(e.key): null).toList();
    perMonthList.entries.map((e) => (e.value == _perMonth && e.value != "-1" ) ? st.add(e.key):null).toList();
    selectedMoveId.map((e) => e != "0" ? st.add(e.toString()) : null).toList();
    specialFeatList.map((e) => selectedSpeFeature.contains(e.id.toString())? st.add(e.name) : null).toList();
    medicalAptList.map((e) => selectedMedAcceptance.contains(e.id.toString())? st.add(e.name) : null).toList();
    facTypeList.map((e) => selectedFacType.contains(e.id.toString()) ? st.add(e.description) : null).toList();
    
    return st;
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
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline)
                      ),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> NusingDetail(nursingId: nursingList[i].id.toString(),)));
                      },
                    ),
                    Divider( thickness: 2),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0 , bottom: 8.0, left: 8.0),
                      child: Row(
                        children: [
                          Text(nursingList[i].city_name),
                          SizedBox(width: 4.0),
                          Icon(Icons.double_arrow_rounded,color: Colors.grey,size: 18, ),
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
                         Navigator.push(context, MaterialPageRoute(builder: (context)=> NusingDetail(nursingId: nursingList[i].id.toString())));
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

  Widget _otherNoDataWidget(){
    return Stack(
      children: <Widget>[
        Opacity(
          opacity:0.3, 
          child: Column(
            children: [
              _checkBoxLoadBuildWidget(specFeatureText),
              Divider(
                color: Colors.grey[300],
                thickness: 1,
              ),
              _checkBoxLoadBuildWidget(facTypeText),
              Divider(
                color: Colors.grey[300],
                thickness: 1,
              ),
              _checkBoxLoadBuildWidget(medAcceptanceText),
            ],
          ),
        ),                       
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

  Widget _checkBoxLoadBuildWidget(String name){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
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
    );
  }

  Widget _dropDown(String hintText){
    return  DropdownButtonHideUnderline(
      child: ButtonTheme(
          alignedDropdown: true,
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
