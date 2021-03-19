import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_focus_watcher/flutter_focus_watcher.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:tis/bloc/get_hoscomments_bloc.dart';
import 'package:tis/bloc/get_hosdetailspecfeat_bloc.dart';
import 'package:tis/bloc/get_hospitaldetail_bloc.dart';
import 'package:tis/bloc/get_hostimetable_bloc.dart';
import 'package:tis/model/hos_comments.dart';
import 'package:tis/model/hos_comments_response.dart';
import 'package:tis/model/hosdetail_specfeat_response.dart';
import 'package:tis/model/hospital.dart';
import 'package:tis/model/hospital_detail_response.dart';
import 'package:tis/model/hospital_specfeat.dart';
import 'package:tis/model/hospital_timetable.dart';
import 'package:tis/model/hospital_timetable_responese.dart';
import 'package:tis/screens/hospital/hospital_comment.dart';
import 'package:tis/views/reviewone.dart';

import '../../app-format.dart';


class HospitalDetail extends StatefulWidget {
  final String hospitalID;
  HospitalDetail({Key key,@required this.hospitalID}) : super(key: key);

  @override
  _HospitalDetailState createState() => _HospitalDetailState();
}

class _HospitalDetailState extends State<HospitalDetail> {

  var stream;var stream1;var stream2;var stream3;var stream4;
  String tempsub;
  var subarr = [] ;

  @override
  void initState() {
    stream = getHospitalDetailBloc..getHospitalDetail(widget.hospitalID);
    stream1 = getHospitalTimetableBloc..getHosDetailTimeTable(widget.hospitalID);
    stream2 = getSpecFeatBloc..getHosDetailSpecFeat('hospital',widget.hospitalID);
    stream3 = gethoscommentsBloc..getHosComments('hospital', widget.hospitalID);
    super.initState();
  }

  @override
  void dispose() {
    getHospitalDetailBloc.drainStream();
    getHospitalTimetableBloc.drainStream();
    getSpecFeatBloc.drainStream();
    gethoscommentsBloc..drainStream();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return FocusWatcher(
        child: Scaffold(
        appBar: AppBar(
          title: Text("Hospital Detail"),
        backgroundColor:Color(0xff63b7ff),
        ),
        body: Padding(
        padding: const EdgeInsets.all(0),
        child: StreamBuilder<HospitalDetailResponse>(
                stream: getHospitalDetailBloc.subject.stream,
                builder: (context, AsyncSnapshot<HospitalDetailResponse> snapshot){
                  if (snapshot.hasData) {
                      if (snapshot.data.error != null &&
                          snapshot.data.error.length > 0) {
                        return Container();
                      } else {
                        return _getDetailResult(snapshot.data);
                      }
                    } else if (snapshot.hasError) {
                      return Container();
                    } else {
                      return Center(child: CircularProgressIndicator(),);
                    }
                },
              ),
      ),
        

      ),
    );
  }

  Widget _getDetailResult(HospitalDetailResponse detail){

    HospitalModel hos_detail = detail.hospital[0];
    Address address = detail.addressList[0];

    tempsub = hos_detail.subject;
    subarr = tempsub.split(',');
    var tempfaclistid = [];

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView(
        children: [

          // Testing Table 

            // detail.facility_list.length == 0 && detail.facility.length == 0 ? Padding(
            //   padding: const EdgeInsets.only(bottom:10.0),
            //   child: _noData(),
            // ) : Column(
            //   children: detail.facility_list.map((faclist) => 
            //   // _facility(f.description, Color(0xffdee2e6)),
            //   _getFacilityWidget(faclist ,detail.facility)
              
              
            //   ).toList(),
            // ),

            // SizedBox(height: 10,),

            // detail.facility.length == 0 ? Padding(
            //   padding: const EdgeInsets.only(bottom:10.0),
            //   child: _noData(),
            // ) : Column(
            //   children: detail.facility.map((fac) => 
            //   _facility(fac.id.toString(), Color(0xffdee2e6)),
            //   ).toList(),


              
            // ),


            Container(
              padding: EdgeInsets.all(5.0),
              margin: EdgeInsets.only(bottom: 10.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              
              child: Text("施設番号:${detail.profilenumbers.length == 0 ? '' : detail.profilenumbers[0].profilenumber}"),
            ),
            Text(
              // hos_detail.name,
              "${hos_detail.name == null ? '' : hos_detail.name}",
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            DottedLine(dashColor: Colors.blue,),
            SizedBox(height: 10.0),
                
            _header("病院情報"),
            SizedBox(height: 10.0),

            (hos_detail.logo == null ? Image.asset("assets/img/placeholder.jpg") : Image.asset("asset/img/${hos_detail.logo}")),

            // Center(
            //   child: Image.asset("assets/img/placeholder.jpg",),
            // ),
            SizedBox(height: 10.0),
                
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1.0),
              ), 
              child: ListTile(
                tileColor: Colors.grey[200],
                title: Text("住所" ,style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),),
              )
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1.0),
              ),
              child: ListTile(
                title: Text("${address.cityName}${address.townshipName}${hos_detail.address == null ? '' : hos_detail.address}", 
                  style: TextStyle(
                    fontSize: 14.0,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1.0),
              ), 
              child: ListTile(
                tileColor: Colors.grey[200],
                title: Text("電話番号" ,style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),),
              )
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1.0),
              ),
              child: ListTile(
                title: Text("${hos_detail.phone == null ? '' : hos_detail.phone}", 
                  style: TextStyle(
                    fontSize: 14.0,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1.0),
              ), 
              child: ListTile(
                tileColor: Colors.grey[200],
                title: Text("アクセス" ,style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),),
              )
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1.0),
              ),
              child: ListTile(
                title: Text("${hos_detail.access == null ? '-' : hos_detail.access}", 
                  style: TextStyle(
                    fontSize: 14.0,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1.0),
              ), 
              child: ListTile(
                tileColor: Colors.grey[200],
                title: Text("件名 " ,style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),),
              )
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1.0),
              ),
              child: ListTile(
                title: Text("${hos_detail.subject == null ? '' : hos_detail.subject}", 
                  style: TextStyle(
                    fontSize: 14.0,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Text("こだわりの特長",
              style: TextStyle(fontSize: 17, color: Colors.blue, fontWeight: FontWeight.bold)
            ),
            SizedBox(height:5),
            DottedLine(dashColor: Colors.blue),
            SizedBox(height: 10.0),

            Container(
              child: StreamBuilder<HosDetailSpecFeatResponse>(
                stream: getSpecFeatBloc.subject.stream,
                builder: (context, AsyncSnapshot<HosDetailSpecFeatResponse> snapshot){
                  if (snapshot.hasData) {
                      if (snapshot.data.error != null &&
                          snapshot.data.error.length > 0) {
                        return Container(child:Text(snapshot.data.error,
                          style: TextStyle(color: Colors.grey),
                        ),);
                      } else {
                        return Wrap(
                          children: snapshot.data.specialfeatures.map((s) => 
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 4,horizontal: 4),
                              padding: EdgeInsets.symmetric(horizontal: 10 , vertical: 4),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.blue, width: 1.0),
                                borderRadius: BorderRadius.circular(20)
                              ), 
                              child: Text(s.short_name,style: TextStyle(color: Colors.blue),),
                            )
                          ).toList()
                        );
                      }
                    } else if (snapshot.hasError) {
                      return Container(child:Text(snapshot.error,
                          style: TextStyle(color: Colors.grey),
                        ),);
                    } else {
                      return Center(child: CircularProgressIndicator(),);
                    }
                },
              ),
            ),

            SizedBox(height: 20.0),

            _subHeader("診療科目"),
            

            SizedBox(height: 10.0),
            Padding(

              padding: const EdgeInsets.only(left:10),
              child: Row(
                
                children: [

                  Wrap(children: subarr.map((item) => subarr.length != 0 ?
                  Row(
                    children: [
                      Text(item),
                      SizedBox(width: 10,)
                    ],
                  )
                  :  Container()).toList()),

                  
                  // Text(subarr[]),
                  // SizedBox(width: 10.0),
                  // Text("呼吸器科"),
                  // SizedBox(width: 10.0),
                  // Text("消化器科"),
                  // SizedBox(width: 10.0),
                  // Text("胃腸科"),
                ],
              ),
            ),
            SizedBox(height: 20.0),

            _subHeader("医院からのお知らせ"),
            SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.only(left:10),
              // child: Text(hos_detail.details_info),
              child: Text("${hos_detail.details_info == null ? '-' : parseHtmlString(hos_detail.details_info)}", 
                style: TextStyle(
                  fontSize: 14.0,
                ),
              ),
            ),
            SizedBox(height: 20.0),

            _subHeader("診療時間"),
            SizedBox(height: 10.0),
            _getTimeTableWidgets(),
            SizedBox(height: 20),

            Row(
              children: [
                Text("休診日：", style: TextStyle(fontWeight: FontWeight.bold),),
                Text("${hos_detail.closed_day == null ? '' : hos_detail.closed_day}"),
              ],
            ),
            SizedBox(height: 20.0),
            _subHeader("院内施設情報"),

            // Testing Table 

            detail.facility_list.length == 0 && detail.facility.length == 0 ? Padding(
              padding: const EdgeInsets.only(bottom:10.0),
              child: _noData(),
            ) : Column(
              children: detail.facility_list.map((faclist) => 
              // _facility(f.description, Color(0xffdee2e6)),
              _getFacilityWidget(faclist ,detail.facility)
              
              
              ).toList(),
            ),

            SizedBox(height: 10,),

            // detail.facility.length == 0 ? Padding(
            //   padding: const EdgeInsets.only(bottom:10.0),
            //   child: _noData(),
            // ) : Column(
            //   children: detail.facility.map((fac) => 
            //   _facility(fac.id.toString(), Color(0xffdee2e6)),
            //   ).toList(),


              
            // ),

            // _facility("駐車場",Color(0xffdee2e6)),
            // _facilityData(),
            // _facility("女医",Color(0xffdee2e6)),
            // _facilityData(Colors.white),
            // _facility("人間ドック",Color(0xffdee2e6)),
            // _facilityData(Colors.white),
            // _facility("カード",Color(0xffdee2e6)),
            // _facilityData(Colors.white),
            // _facility("院内処方",Color(0xffdee2e6)),
            // _facilityData(Colors.white),
            // _facility("意見",Color(0xffdee2e6)),
            // _facilityData(Colors.white),

            SizedBox(height: 20.0),
            _subHeader("フォトアルバム"),
            Row(
              children: [
                

                detail.images.length == 0 ? Padding(
                  padding: const EdgeInsets.only(bottom:10.0),
                  child: _noData(),
                ) : Row(
                  children: detail.images.map((img) => 
                    Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey,width: 2)
                    ),
                    width: MediaQuery.of(context).size.width / 2.3,
                    margin: EdgeInsets.only(right: 10),
                    // (img.id == null ? Image.asset("assets/img/placeholder.jpg") : Image.asset("asset/img/${img.photo}", fit: BoxFit.cover,)),
                    child: Image.asset(img.id == null ? "assets/img/placeholder.jpg" : "assets/img/placeholder.jpg",fit: BoxFit.cover,)),

                    // child: Image.asset("assets/img/placeholder.jpg",fit: BoxFit.cover,)),


                  ).toList(),
                ),
                
                // Container(
                //   decoration: BoxDecoration(
                //     border: Border.all(color: Colors.grey,width: 2)
                //   ),
                //   width: MediaQuery.of(context).size.width / 2.3,
                //   margin: EdgeInsets.only(right: 10),
                //   child: Image.asset("assets/img/placeholder.jpg",fit: BoxFit.cover,)),
                // Container(
                //    decoration: BoxDecoration(
                //     border: Border.all(color: Colors.grey,width: 2)
                //   ),
                //   width: MediaQuery.of(context).size.width  / 2.3,
                //   child: Image.asset("assets/img/placeholder.jpg",fit: BoxFit.cover,)),
              ],
            ),

            SizedBox(height: 20.0),
            _subHeader("動画"),

            detail.videos.length == 0 ? Padding(
              padding: const EdgeInsets.only(bottom:10.0),
              child: _noData(),
            ) : Container(
              
            ),

            

            // Text(detail.videos.length.toString()),


            // detail.videos.length == null ? Padding(
            //   padding: const EdgeInsets.only(bottom:10.0),
            //   child: Text('video')
            // ) : Column(
            //   children: [Text('data')],
            // ),

            // _noData(),
                
            SizedBox(height: 20.0),
            _itemHeader("公式サイト"),
            _itemData(hos_detail.website == null ? '-' : hos_detail.website),
            _itemHeader("メールアドレス"),
            _itemData(hos_detail.email == null ? '-' : hos_detail.email),
            _itemHeader("アクセス"),
            _itemData(hos_detail.access == null ? '-' : hos_detail.access.toString()),
            _itemHeader("混雑状況"),
            _itemData(hos_detail.congestion == null ? '-' : hos_detail.congestion.toString()),

            SizedBox(height: 20.0),
            _header("口コミ"),
            SizedBox(height: 10.0),

            Container(
              child: StreamBuilder<HosCommentsResponse>(
                stream: gethoscommentsBloc.subject.stream,
                builder: (context, AsyncSnapshot<HosCommentsResponse> snapshot){
                  if (snapshot.hasData) {
                      if (snapshot.data.error != null &&
                          snapshot.data.error.length > 0) {
                        return Container(child:Text(snapshot.data.error,
                          style: TextStyle(color: Colors.grey),
                        ),);
                      } else {

                        List<CommentsModel> cmt = snapshot.data.comments;

                        return cmt.length == 0 || cmt.length == null ?  Padding(
                          padding: const EdgeInsets.only(left:17.0),
                          child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            // Icon(Icons.chat_bubble_outline, size: 30,),
                            SizedBox(width: 4.0),
                            Text('口コミを投稿する', style: TextStyle(fontSize: 16,)),
                        ],)
                        ) : Container(
              
                        );

                        // return Padding(
                        //   padding: const EdgeInsets.only(bottom:10.0),
                        //   child: Row(
                        //   mainAxisAlignment: MainAxisAlignment.start,
                        //   children: [
                        //     Icon(Icons.chat_bubble_outline),
                        //     SizedBox(width: 4.0),
                        //     Text('口コミを投稿する', style: TextStyle(fontSize: 16,)),
                        // ],)
                        // );

                        // return Wrap(
                        //   children: snapshot.data.comments.map((s) => 
                        //     Container(
                        //       margin: EdgeInsets.symmetric(vertical: 4,horizontal: 4),
                        //       padding: EdgeInsets.symmetric(horizontal: 10 , vertical: 4),
                        //       decoration: BoxDecoration(
                        //         border: Border.all(color: Colors.blue, width: 1.0),
                        //         borderRadius: BorderRadius.circular(20)
                        //       ), 
                        //       child: Text(s.id.toString(),style: TextStyle(color: Colors.blue),),
                        //     )
                        //   ).toList()
                        // );
                      }
                    } else if (snapshot.hasError) {
                      return Container(child:Text(snapshot.error,
                          style: TextStyle(color: Colors.grey),
                        ),);
                    } else {
                      return Center(child: CircularProgressIndicator(),);
                    }
                },
              ),
            ),
            // Text("口コミはありません。",
            //   style: TextStyle(color: Colors.grey),
            // ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                RaisedButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> ReviewPost(hospitalID: hos_detail.id.toString())));
                    // Navigator.push(context, MaterialPageRoute(builder: (context)=> const HospitalComment()));

                  },
                  color: Colors.green,
                  textColor: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.chat_bubble_outline),
                      SizedBox(width: 4.0),
                      Text('口コミを投稿する', style: TextStyle(fontSize: 16,)),
                  ],)
                ),
              ],
            )

         ]
      )
    );
  }

  // Widget _getFacilityWidget(FacilityList faclist ,List<Facility> fac){
  //   return Container(
  //     child: Column(
  //       children: [
  //         _facility(faclist.description,Color(0xffdee2e6)),
  //         Column(
  //         children:fac.map((fac) => 
  //         (fac.id == faclist.id) ?
  //         _facilityData(Colors.white)
  //         : Container()
  //         ).toList(),
  //         ),

  //         SizedBox(width: 10),
  //     ],) 
  //   );
  // }

  Widget _getFacilityWidget(FacilityList faclist ,List<Facility> fac){
    var list = [];
    return Container(
      child: Column(
        children: [
          _facility(faclist.description,Color(0xffdee2e6)),

          // Column(
          //   children: fac.map((e) =>list.add(e.id)),
          // ),

          Column(
          children:fac.map((fac) => 
          (fac.id == faclist.id) ?
          _facilityData(Colors.white)
          : Container()
          ).toList(),
          ),

          SizedBox(width: 10),
      ],) 
    );
    
  }

   Widget _getSpecFeatWidgets()
  {
    return StreamBuilder<HosDetailSpecFeatResponse>(
                stream: getSpecFeatBloc.subject.stream,
                builder: (context, AsyncSnapshot<HosDetailSpecFeatResponse> snapshot){
                  if (snapshot.hasData) {
                      if (snapshot.data.error != null &&
                          snapshot.data.error.length > 0) {
                        return Container(child:Text(snapshot.data.error,
                          style: TextStyle(color: Colors.grey),
                        ),);
                      } else {

                        List<HospitalSpecFeatModel> specfeat = snapshot.data.specialfeatures;

                        return Container(
                          child: Row(
                            children: [
                              Text(specfeat[0].name.toString()),
                            ],
                          ),
                        );
                        // return Wrap(
                        //   children: snapshot.data.specialfeatures.map((s) => 
                        //     Container(
                        //       margin: EdgeInsets.symmetric(vertical: 4,horizontal: 4),
                        //       padding: EdgeInsets.symmetric(horizontal: 10 , vertical: 4),
                        //       decoration: BoxDecoration(
                        //         border: Border.all(color: Colors.blue, width: 1.0),
                        //         borderRadius: BorderRadius.circular(20)
                        //       ), 
                        //       child: Text(s.short_name.toString(),style: TextStyle(color: Colors.blue),),
                        //     )
                        //   ).toList()
                        // );
                      }
                    } else if (snapshot.hasError) {
                      return Container(child:Text(snapshot.error,
                          style: TextStyle(color: Colors.grey),
                        ),);
                    } else {
                      return Center(child: CircularProgressIndicator(),);
                    }
                },
              );
  }

  Widget _getTimeTableWidgets()
  {
    return StreamBuilder<HospitalTimetableResponse>(
                stream: getHospitalTimetableBloc.subject.stream,
                builder: (context, AsyncSnapshot<HospitalTimetableResponse> snapshot){
                  if (snapshot.hasData) {
                      if (snapshot.data.error != null &&
                          snapshot.data.error.length > 0) {
                        return Container(child:Text(snapshot.data.error,
                          style: TextStyle(color: Colors.grey),
                        ),);
                      } else {
                        List<HospitalTimeTableModel> Am = snapshot.data.am;
                        List<HospitalTimeTableModel> Pm = snapshot.data.pm;

                        return             Table(
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
                                _column("${Am[0].mon == null ? '' : Am[0].mon}" ,Color(0xffffffff), Colors.black),
                                _column("${Pm[0].mon == null ? '' : Pm[0].mon}" ,Color(0xffffffff), Colors.black),
                              ]
                            ),
                            TableRow(
                              children: [
                                _column("火" ,Color(0xff80919a), Colors.white),
                                _column("${Am[0].tue == null ? '' : Am[0].tue}" ,Color(0xffffffff), Colors.black),
                                _column("${Pm[0].tue == null ? '' : Pm[0].tue}" ,Color(0xffffffff), Colors.black),
                              ]
                            ),
                            TableRow(
                              children: [
                                _column("水" ,Color(0xff80919a), Colors.white),
                                _column("${Am[0].wed == null ? '' : Am[0].wed}" ,Color(0xffffffff), Colors.black),
                                _column("${Pm[0].wed == null ? '' : Pm[0].wed}" ,Color(0xffffffff), Colors.black),
                              ]
                            ),
                            TableRow(
                              children: [
                                _column("木" ,Color(0xff80919a), Colors.white),
                                _column("${Am[0].thu == null ? '' : Am[0].thu}" ,Color(0xffffffff), Colors.black),
                                _column("${Pm[0].thu == null ? '' : Pm[0].thu}" ,Color(0xffffffff), Colors.black),
                              ]
                            ),
                            TableRow(
                              children: [
                                _column("金" ,Color(0xff80919a), Colors.white),
                                _column("${Am[0].fri == null ? '' : Am[0].fri}" ,Color(0xffffffff), Colors.black),
                                _column("${Pm[0].fri == null ? '' : Pm[0].fri}" ,Color(0xffffffff), Colors.black),
                              ]
                            ),
                            TableRow(
                              children: [
                                _column("土" ,Color(0xff80919a), Colors.white),
                                _column("${Am[0].sat == null ? '' : Am[0].sat}" ,Color(0xffffffff), Colors.black),
                                _column("${Pm[0].sat == null ? '' : Pm[0].sat}" ,Color(0xffffffff), Colors.black),
                              ]
                            ),
                            TableRow(
                              children: [
                                _column("日" ,Color(0xff80919a), Colors.white),
                                _column("${Am[0].sun == null ? '' : Am[0].sun}" ,Color(0xffffffff), Colors.black),
                                _column("${Pm[0].sun == null ? '' : Pm[0].sun}" ,Color(0xffffffff), Colors.black),
                              ]
                            ),
                    
                          ]
                        );



                        return Wrap(
                          children: snapshot.data.am.map((s) => 
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 4,horizontal: 4),
                              padding: EdgeInsets.symmetric(horizontal: 10 , vertical: 4),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.blue, width: 1.0),
                                borderRadius: BorderRadius.circular(20)
                              ), 
                              child: Text(snapshot.data.am.toString(),style: TextStyle(color: Colors.blue),),
                            )
                          ).toList()
                        );
                      }
                    } else if (snapshot.hasError) {
                      return Container(child:Text(snapshot.error,
                          style: TextStyle(color: Colors.grey),
                        ),);
                    } else {
                      return Center(child: CircularProgressIndicator(),);
                    }
                },
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

  Widget _noData(){
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Text("データがありません。",
        style: TextStyle(color: Colors.grey),
      ),
    );
  }

  Widget _header(String name){
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.blue
          ), 
          height: 42.0,
          width: 10.0,
        ),
        Container(
          width: MediaQuery.of(context).size.width - 30.0,
          decoration: BoxDecoration(
            color: Colors.grey[200]
          ),
          padding: EdgeInsets.all(8.0),
          child: Text(name ,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
        ),
      ],
    );
  }

  Widget  _subHeader(String name){
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name, style: TextStyle(fontSize: 17,),),
          SizedBox(
            height: 20.0,
            width: 30.0,
            child: Divider(color: Colors.blue[400],thickness: 3.0,)
          ),
        ],
      )
    );
  }

  Widget _facility(String header, Color color){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[200]),
        color: color,
      ),
      child: Center(child: Text(header,style: TextStyle(fontSize: 14),))
    );
  }

  Widget _facilityData(Color color){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[200]),
        color: color,
      ),
      child: Center(child: Icon(Icons.circle, color: Color(0xff346e90)),)
    );
  }

  Widget _facilityData2(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[200]),
        color: Colors.white,
      ),
      child: Center(child: Icon(Icons.circle, color: Colors.white),)
    );
  }

  Widget _facilityData1(String data, Color color){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[200]),
        color: color,
      ),
      child: Center(child: Text(data,),)
    );
  }



  Widget _itemHeader(String header){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
      ), 
      child: ListTile(
        tileColor: Colors.grey[200],
        title: Text(header ,style: TextStyle(
          fontWeight: FontWeight.bold,
        ),),
      )
    );
  }

  Widget _itemData(String data){
    return  Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 1.0),
      ),
      child: ListTile(
        title: Text(data, 
          style: TextStyle(
            fontSize: 14.0,
          ),
        ),
      ),
    );
  }

}