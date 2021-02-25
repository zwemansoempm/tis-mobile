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
import 'package:tis/model/township.dart';
import 'package:tis/model/township_response.dart';
import 'package:tis/bloc/get_features_bloc.dart';
import 'package:tis/model/specialfeatures.dart';
import 'package:tis/model/speialfeatures_response.dart';
import 'package:tis/model/department.dart';
import 'package:tis/bloc/get_department_bloc.dart';
import 'package:tis/presentation/custom_app_icons.dart';
import 'package:tis/views/shownoti.dart';

class SearchHospital extends StatefulWidget {
  @override
  _SearchHospitalState createState() => _SearchHospitalState();
}

class _SearchHospitalState extends State<SearchHospital> {
  var stream;var stream1;var stream2;var stream3;int checkstream=0;
  Map<String, bool> cityList = {
    'item1': false,
    'item2': false,
    'item3': false,
    'item4': false,
  };

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
    getCityBloc..getCity();
    getFeaturesBloc..getFeatures();
    getDepBloc..getDepartment('1');

    stream;//=getLinkNewsBloc..getLinkedNews('2');
    stream1;
    stream2;
    stream3;
  }

  @override
  void dispose() {
    super.dispose();
    getTspBloc..drainStream();
    getDepBloc..drainStream();
    getCityBloc..drainStream();
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
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 10,left: 10,right: 10),//const EdgeInsets.all(10.0),
          child: Column(
            children: [
               Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text("病院検索",
                      style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),)),
                 ),
              // Row(
              //   children: [
               
              //     // SizedBox(width: 5.0),
              //     // Icon(Icons.map, color: Colors.blue),
              //     // SizedBox(width: 5.0),
              //     // Text("地図検索"),
              //   ],
              // ),
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
                                  value: _city,
                                  onChanged: (String newValue) {
                                    setState(() {
                                      checkstream=1;
                                      getTspBloc.drainStream();
                                      // getDepBloc.drainStream();
                                      _township = null;
                                      _city = newValue;
                                      stream1=getTspBloc..getTownship(_city);
                                      // stream2=getDepBloc..getDepartment(_city);
                                   
                                   
                                    });
                                  },
                                  items: 
                                   cityList.map((CityModel cityModel) =>
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
                                  // snapshot.data.city
                                  //     .toList()
                                  //     .map((CityModel cityModel) =>
                                  //         DropdownMenuItem(
                                  //             value: cityModel.id.toString(),
                                  //             child: Text(cityModel.city_name)))
                                  //     .toList(),
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
                            }
                          }),
                    ),

                    // //Township

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
                              List<TownshipModel> allTsp =snapshot.data.township;
                              List<int> selectedTsp = [];
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
                                      SizedBox(width:MediaQuery.of(context).size.width/1.76,),
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
                                    stream3=getFeaturesBloc..getFeatures();
                                    return Container();
                              }     
                              else if (snapshot.hasData) {
                                if (snapshot.data.error != null &&
                                    snapshot.data.error.length > 0) {
                                    stream3=getFeaturesBloc..getFeatures();
                                    return Container();
                              }

                              List<SpecialFeaturesModel> allSpec =
                                  snapshot.data.special_feature;
                              List<int> selectedSpec = [];

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
                                        "  特長から探す",
                                        // style: TextStyle(color: Colors.grey[600]),
                                      ),
                                      SizedBox(width:MediaQuery.of(context).size.width/1.76,),
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
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return _SpecFeaturesDialog(
                                              spec: allSpec,
                                              selectedSpec: selectedSpec,
                                              onSelectedSpecListChanged: (spec) {
                                                selectedSpec = spec;
                                                // selectedTspText = selectedTsp;
                                                // print(selectedTspText.length);
                                              });
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
                                                Text("  特長から探す"),
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
                                        child:buildLoadingWidget(),
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

                    Container(
                      child: StreamBuilder<DepartmentResponse>(
                          stream: getDepBloc.subject.stream,
                          builder: (context,
                              AsyncSnapshot<DepartmentResponse> snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Container(                              
                                child:  Center(
                                      child: Opacity(
                                        opacity:1.0, 
                                        child:buildLoadingWidget(),//CircularProgressIndicator(),
                                      ),
                                    ),
                              ); //
                            } else if (snapshot.hasError) {
                              return Container();
                            } else if (snapshot.hasData) {
                              if (snapshot.data.error != null &&
                                  snapshot.data.error.length > 0) {
                                return Container();
                              } else {
                                return Column(
                                    children: getTextWidgets(
                                        snapshot.data.department));
                              }
                            } else {
                              return buildLoadingWidget(); //buildLoadingWidget();
                            }
                          }),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  onPressed: () {
                    setState(() {
                      getHospitalBloc..getHospital();
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

              Container(
              child: StreamBuilder<HospitalResponse>(
                  stream: getHospitalBloc.subject.stream,
                  builder: (context, AsyncSnapshot<HospitalResponse> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Container(
                        // height: MediaQuery.of(context).size.height / 1.5,
                        // child: Column(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        // ),
                      ); //
                    } else if (snapshot.hasError) {
                      return Container();
                    } else if (snapshot.hasData) {
                      //print(snapshot.data);
                      if (snapshot.data.error != null &&
                          snapshot.data.error.length > 0) {
                        return Container();
                      }
                      //return _getSearchResultWidget(snapshot.data);
                      return Column(
                          children: _getSearchResultWidget(snapshot.data));
                    } else {
                      return Container(
                          child: Column()); //return buildLoadingWidget();
                    }
                  })),

            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _getSearchResultWidget(HospitalResponse data) {
    List<HospitalModel> hospitals = data.hospital;
    return searchListWidget(hospitals);
  }

  List<Widget> searchListWidget(hospitals) {
    List<HospitalModel> HospitalList = hospitals;
    List<Widget> list = new List<Widget>();
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
              child: Text("施設番号 : " + HospitalList[i].profilenumber.toString()),
            ),
            InkWell(
              child: Text(
                HospitalList[i].name.toString(),
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline)
              ),
              onTap: (){
                // Navigator.push(context, MaterialPageRoute(builder: (context) => HospitalDetail()));
              },
            ),
            Row(
              children: [
                Card(
                  color: Colors.blue,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text("神経内科", style: TextStyle(color: Colors.white),),
                  ),
                ),
                Card(
                  color: Colors.blue,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text("呼吸器科", style: TextStyle(color: Colors.white),),
                  ),
                ),
                Card(
                  color: Colors.blue,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text("消化器科", style: TextStyle(color: Colors.white),),
                  ),
                ),
                Card(
                  color: Colors.blue,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text("胃腸科", style: TextStyle(color: Colors.white),),
                  ),
                ),
              ]
            ),
            Divider( color: Colors.grey,),
            SizedBox(height: 10),

            Image.asset("assets/img/placeholder.jpg"),
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
              child: ListTile(title: Text(HospitalList[i].email.toString()),),
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
              child: ListTile(title: Text(HospitalList[i].address.toString()),),
            ),
                  
            SizedBox(height: 10.0),
            Text("こだわりの特長", style: TextStyle(fontWeight: FontWeight.bold),),
            SizedBox(height: 10.0),

            DottedLine(dashColor: Colors.blue,),
            SizedBox(height: 10.0),

            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10 , vertical: 4),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue, width: 1.0),
                    borderRadius: BorderRadius.circular(20)
                  ), 
                  child: Text("土曜診療",style: TextStyle(color: Colors.blue),),
                ),
                SizedBox(width: 3),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10 , vertical: 4),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue, width: 1.0),
                    borderRadius: BorderRadius.circular(20)
                  ), 
                  child: Text("日曜祝日診療",style: TextStyle(color: Colors.blue),),
                ),
                SizedBox(width: 3),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10 , vertical: 4),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue, width: 1.0),
                    borderRadius: BorderRadius.circular(20)
                  ), 
                  child: Text("日曜祝日診療",style: TextStyle(color: Colors.blue),),
                ),
              ],
            ),
            SizedBox(height: 10.0),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10 , vertical: 4),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue, width: 1.0),
                borderRadius: BorderRadius.circular(20)
              ), 
              child: Text("早朝(9時前より)",style: TextStyle(color: Colors.blue),),
            ),
            SizedBox(height: 10.0),
            Text("診療時間", style: TextStyle(fontWeight: FontWeight.bold),),
            SizedBox(height: 10.0),

            DottedLine(dashColor: Colors.blue,),
            SizedBox(height: 10.0),

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
                    _column("9-12" ,Color(0xffffffff), Colors.black),
                    _column("13-17" ,Color(0xffffffff), Colors.black),
                  ]
                ),
                TableRow(
                  children: [
                    _column("火" ,Color(0xff80919a), Colors.white),
                    _column("-" ,Color(0xffffffff), Colors.black),
                    _column("-" ,Color(0xffffffff), Colors.black),
                  ]
                ),
                TableRow(
                  children: [
                    _column("水" ,Color(0xff80919a), Colors.white),
                    _column("-" ,Color(0xffffffff), Colors.black),
                    _column("-" ,Color(0xffffffff), Colors.black),
                  ]
                ),
                TableRow(
                  children: [
                    _column("木" ,Color(0xff80919a), Colors.white),
                    _column("-" ,Color(0xffffffff), Colors.black),
                    _column("-" ,Color(0xffffffff), Colors.black),
                  ]
                ),
                TableRow(
                  children: [
                    _column("金" ,Color(0xff80919a), Colors.white),
                    _column("-" ,Color(0xffffffff), Colors.black),
                    _column("-" ,Color(0xffffffff), Colors.black),
                  ]
                ),
                TableRow(
                  children: [
                    _column("土" ,Color(0xff80919a), Colors.white),
                    _column("-" ,Color(0xffffffff), Colors.black),
                    _column("-" ,Color(0xffffffff), Colors.black),
                  ]
                ),
                TableRow(
                  children: [
                    _column("日" ,Color(0xff80919a), Colors.white),
                    _column("-" ,Color(0xffffffff), Colors.black),
                    _column("-" ,Color(0xffffffff), Colors.black),
                  ]
                ),
                        
              ]
            ),
            SizedBox(height: 10),

            Row(
              children: [
                Text("休診日：", style: TextStyle(fontWeight: FontWeight.bold),),
                Text(HospitalList[i].closed_day.toString()),
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
                  Text("09044446666",
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
              onPressed: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) => HospitalDetail()));
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
    List<int> selectedDep = [];
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

