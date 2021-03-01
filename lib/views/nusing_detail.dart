import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:tis/app-format.dart';
import 'package:tis/bloc/get_nursing_detail_bloc.dart';
import 'package:tis/bloc/get_profile_features_bloc.dart';
import 'package:tis/model/cooperateMedical.dart';
import 'package:tis/model/method_payment.dart';
import 'package:tis/model/nursing.dart';
import 'package:tis/model/nursing_detail_response.dart';
import 'package:tis/model/profile_features_response.dart';
import 'package:tis/model/staff.dart';
import 'package:tis/views/nusing_comment.dart';
import 'package:tis/views/nusing_favourite_mail.dart';


class NusingDetail extends StatefulWidget {

  final String nursingId;

  NusingDetail({Key key,@required this.nursingId}) : super(key: key);

  @override
  _NusingDetailState createState() => _NusingDetailState();
}

class _NusingDetailState extends State<NusingDetail> {

  var stream;var stream1;

  List<int> _visibleId = List();
  
    // void showToast() {
    //   setState(() {
    //     _isVisible = !_isVisible;
    //   });
    // }

  @override
  void initState() {
    stream = getNursingDetailBloc..getNursingDetailData(widget.nursingId);
    stream1 = getProfileFeaturesBloc..getProfileFeatures("nursing", widget.nursingId);
    super.initState();
  }

  @override
  void dispose() {
    getNursingDetailBloc.drainStream();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("介護施設詳細"),
        backgroundColor:Color(0xff63b7ff),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: StreamBuilder<NursingDetailResponse>(
                stream: getNursingDetailBloc.subject.stream,
                builder: (context, AsyncSnapshot<NursingDetailResponse> snapshot){
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
    );
  }

  Widget _getDetailResult(NursingDetailResponse detail){
    NursingModel nursingData = detail.nursingList[0];
    Address address = detail.addressList[0];
    
    return ListView(
       children: [
          Row(
            children:[ 
              Container(
                padding: EdgeInsets.all(5.0),
                margin: EdgeInsets.only(bottom: 10.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Text("施設番号:${detail.profilenumbers[0].profilenumber}"),
              ),
            ]
          ),
          Text(
            nursingData.name , 
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
          DottedLine(dashColor: Colors.blue,),
          SizedBox(height: 10.0),
          
          _header("現在の検索条件"),
          SizedBox(height: 10.0),
         
          _mailButton(),
          SizedBox(height: 10.0),

          Padding(
            padding: const EdgeInsets.all(8.0),
            
            child: (nursingData.logo != null && nursingData.logo !='') ?
              FadeInImage(
                placeholder: AssetImage('assets/img/placeholder.jpg'),
                image: NetworkImage(
                  "https://test.t-i-s.jp/upload/nursing_profile/${nursingData.logo}",
                ),
                imageErrorBuilder: (context, error, stackTrace) { 
                  return Image.asset(
                    "assets/img/placeholder.jpg",
                  );
                },                                                                           
              )
              : Image.asset("assets/img/placeholder.jpg"),
          ),
          SizedBox(height: 10.0),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1.0),
            ),
            child: ListTile(
              tileColor: Colors.grey[200],
              title: Text("入居時費用", style: TextStyle(
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
              title: Text(moneyChangeFormat(nursingData.moving_in_from)+"円 ~ "+moneyChangeFormat(nursingData.moving_in_to) +"円", 
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
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
              title: Text("月額費用" ,style: TextStyle(
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
              title: Text(moneyChangeFormat(nursingData.per_month_from)+"円 ~ "+moneyChangeFormat(nursingData.per_month_to) +"円", 
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
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
              title: Text("${address.cityName}${address.townshipName}${nursingData.address == null ? '' : nursingData.address}", 
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
              title: Text("${nursingData.phone == null ? '-' : nursingData.phone}" , 
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
              title: Text("${nursingData.access == null ? '-' : parseHtmlString(nursingData.access)}", 
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
              title: Text("運営事業者" ,style: TextStyle(
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
              title: Text("${nursingData.operatorName == null ? '-' : nursingData.operatorName}", 
                style: TextStyle(
                  fontSize: 14.0,
                ),
              ),
            ),
          ),
          SizedBox(height: 20.0),
          
          Text("こだわりの特長",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold, fontSize: 18),),
          DottedLine(dashColor: Colors.blue),
          SizedBox(height: 10.0),
          _getFeatureWidgets(),
          SizedBox(height: 10.0),
          
          _header("特長"),
          SizedBox(height: 10.0),
          _mailButton(),
          SizedBox(height: 10.0),
          nursingData.feature == null ? _noData() : Html(data: nursingData.feature,),
          SizedBox(height: 10.0),
          
          _header("費用"),
          SizedBox(height: 10.0),
          _mailButton(),
          SizedBox(height: 10.0),
          detail.methodPayments.length == 0 ? Padding(
            padding: const EdgeInsets.only(bottom:10.0),
            child: _noData(),
          ) : Column(
            children: detail.methodPayments.map((payment) => 
              _getCostWidget(payment)
            ).toList(),
          ),

          _header("施設の概要"),
          SizedBox(height: 10.0),
          _mailButton(),

          _itemHeader('事業主体'),
          _itemData(nursingData.businessEntity),

          _itemHeader('開設年月日'),
          _itemData(nursingData.dateOfEstablishment),

          _itemHeader('土地の権利形態'),
          _itemData(nursingData.landRightForm),

          _itemHeader('建物の権利形態'),
          _itemData(nursingData.buildingRightForm),

          _itemHeader('敷地面積'),
          _itemData(nursingData.siteArea),

          _itemHeader('延床面積'),
          _itemData(nursingData.floorArea),

          _itemHeader('構造'),
          _itemData(nursingData.construction),

          _itemHeader('定員'),
          _itemData(nursingData.capacity),

          _itemHeader('総居室・戸数'),
          _itemData(nursingData.numRooms),

          _itemHeader('居住の権利形態'),
          _itemData(parseHtmlString(nursingData.residenceForm)),

          _itemHeader('類型'),
          _itemData(nursingData.facType.toString()),

          _itemHeader('入居条件'),
          _itemData(nursingData.occupancyCondition),

          _itemHeader('居室区分・間取り等'),
          _itemData(nursingData.roomFloor),

          _itemHeader('居室設備'),
          _itemData(nursingData.livingRoomFacilities),

          _itemHeader('共用施設・設備'),
          _itemData(nursingData.equipment),

          SizedBox(height: 20.0),

          _subHeader("フォトアルバム"),
          _noData(),
          SizedBox(height: 10.0),

          _subHeader("協力医療機関"),
          detail.cooperateMedicals.length == 0 ? Padding(
            padding: const EdgeInsets.only(bottom:10.0),
            child: _noData(),
          ) : Column(
            children: detail.cooperateMedicals.map((coopMedical) => 
              _getCooperateMedicalWidget(coopMedical)
            ).toList(),
          ),

          //MedicalAcceptance
          _subHeader("医療面の受入れ"),
          Column(
            children: detail.medicalAcceptances.map((acceptance) => 
              _getMedicalAcceptWidget(acceptance ,detail.medicals)
            ).toList()
          ),
          
          Row(
            children: [
              Icon(Icons.check,color: Colors.green),
              Text(" 受入れ可"),
              SizedBox(width: 12.0),
              Icon(Icons.clear,color: Colors.red),
              Text(" 受入れ不可"),
              SizedBox(width: 12.0),
              Icon(Icons.adjust_outlined, color: Colors.blue[600],),
              Text(" 応相談"),
            ],
          ),
          SizedBox(height: 20.0),
          //職員体制
          _subHeader("職員体制"),
          detail.staffs.length == 0 ? Padding(
            padding: const EdgeInsets.only(bottom:10.0),
            child: _noData(),
          ) : Column(
            children: detail.staffs.map((staff) => 
              _getStaffWidget(staff)
            ).toList(),
          ),

          SizedBox(height: 10.0),
          _itemHeader("公式サイト"),
          _itemData(nursingData.website),
          _itemHeader("メールアドレス"),
          _itemData(nursingData.email ),
          _itemHeader("アクセス"),
          _itemData("${nursingData.access == null ? '-' : parseHtmlString(nursingData.access)}"),

          SizedBox(height: 20.0),
          _header("口コミ"),
          SizedBox(height: 10.0),
          Text("口コミはありません。",
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              RaisedButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> NusingComment()));
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
    );
  }

  Widget _getFeatureWidgets()
  {
    return StreamBuilder<ProfileFeaturesResponse>(
                stream: getProfileFeaturesBloc.subject.stream,
                builder: (context, AsyncSnapshot<ProfileFeaturesResponse> snapshot){
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
              );
  }

  Widget _getCooperateMedicalWidget(CooperateMedical coopMedical){
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          _itemHeader('診療科目'),
          _itemData(coopMedical.clinicalSubject),

          _itemHeader('協力内容'),
          _itemData(coopMedical.details),

          _itemHeader('診療費用'),
          _itemData(coopMedical.medicalExpense),

          _itemHeader('備考'),
          _itemData(coopMedical.remark),
        ],
      ),
    );
  }

  Widget _getCostWidget(MethodPayment payment){
    
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1.0),
                color: Colors.grey[200],
              ),
              padding: EdgeInsets.all(8.0),
              margin: EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [Text(payment.paymentName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),]
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1.0),
              ), 
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical:4 ),
                        margin: EdgeInsets.only(left: 10.0,bottom: 10.0,top: 10.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 1.0),
                          color: Colors.blue[200],
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Text('初期', style: TextStyle(fontSize: 16,))
                      ),
                      SizedBox(width: 10.0),
                      Text(payment.expenseMoving, 
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                    ]
                  ),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical:4 ),
                        margin: EdgeInsets.only(left: 10.0,bottom: 10.0,top:10.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 1.0),
                          color: Colors.blue[200],
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Text('月額', style: TextStyle(fontSize: 16,))
                      ),
                      SizedBox(width: 10.0),
                      Text(payment.monthlyFees, 
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                    ]
                  )
                ]
              ),
            ),
            GestureDetector(
              onTap: (){
                setState(() {
                  _visibleId.contains(payment.id) ? 
                    _visibleId.remove(payment.id) : _visibleId.add(payment.id);
                });
              },
              child:Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1.0),
                  color: Colors.blue[200],
                ),
                padding: EdgeInsets.all(8.0),
                margin: EdgeInsets.symmetric(horizontal: 8),
                child: Center(child: Text("詳細はこちら", style: TextStyle(fontSize: 12.0,fontWeight: FontWeight.bold),)),
              ),
            ),

            _visibleId.contains(payment.id) ?
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1.0), //color: Colors.blue[200],
                ),
                padding: EdgeInsets.all(8.0),
                margin: EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.blue
                          ), 
                          height: 35.0,
                          width: 8.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(payment.paymentName ,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height:10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text("￥ 入居にかかる費用",style: TextStyle(fontWeight: FontWeight.bold),)
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Table(
                        border: TableBorder.all(color: Colors.grey),
                        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                        children: [
                          TableRow(
                            children: [
                              _column("入居一時金または" ,Colors.grey[200], Colors.black, true),
                            ]
                          ),
                          TableRow(
                            children: [
                              _column(payment.deposit,Color(0xffffffff), Colors.red, true),
                            ]
                          ),
                          TableRow(
                            children: [
                              _column("その他（使途）" ,Colors.grey[200], Colors.black, true),
                            ]
                          ),
                          TableRow(
                            children: [
                              _column(payment.otherUse ,Color(0xffffffff), Colors.red, true),
                            ]
                          ),
                        ]
                      ),
                    ),
                    SizedBox(height:10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text("￥ 月額費用",style: TextStyle(fontWeight: FontWeight.bold),)
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Table(
                        border: TableBorder.all(color: Colors.grey),
                        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                        children: [
                          TableRow(
                            children: [
                              _column("賃料" ,Colors.grey[200], Colors.black, true),
                            ]
                          ),
                          TableRow(
                            children: [
                              _column(payment.rent ,Color(0xffffffff), Colors.red, true),
                            ]
                          ),
                          TableRow(
                            children: [
                              _column("管理費" ,Colors.grey[200], Colors.black, true),
                            ]
                          ),
                          TableRow(
                            children: [
                              _column(payment.adminExpense ,Color(0xffffffff), Colors.red, true),
                            ]
                          ),
                          TableRow(
                            children: [
                              _column("食費 " ,Colors.grey[200], Colors.black, true),
                            ]
                          ),
                          TableRow(
                            children: [
                              _column(payment.foodExpense ,Color(0xffffffff), Colors.red, true),
                            ]
                          ),
                          TableRow(
                            children: [
                              _column("介護上乗せ金（生活サービス費" ,Colors.grey[200], Colors.black, true),
                            ]
                          ),
                          TableRow(
                            children: [
                              _column(payment.nurseCareSurcharge ,Color(0xffffffff), Colors.red, true),
                            ]
                          ),
                          TableRow(
                            children: [
                              _column("その他 " ,Colors.grey[200], Colors.black, true),
                            ]
                          ),
                          TableRow(
                            children: [
                              _column(payment.otherMonthlyCost ,Color(0xffffffff), Colors.red, true),
                            ]
                          ),
                        ]
                      ),
                    ),
                    SizedBox(height:10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text("￥ 返還金について",style: TextStyle(fontWeight: FontWeight.bold),)
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Table(
                        border: TableBorder.all(color: Colors.grey),
                        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                        children: [
                          TableRow(
                            children: [
                              _column("返還制度" ,Colors.grey[200], Colors.black, true),
                            ]
                          ),
                          TableRow(
                            children: [
                              _column(payment.refundSystem ,Color(0xffffffff), Colors.black, false),
                            ]
                          ),
                          TableRow(
                            children: [
                              _column("償却期間" ,Colors.grey[200], Colors.black, true),
                            ]
                          ),
                          TableRow(
                            children: [
                              _column(payment.depreciationPeriod ,Color(0xffffffff), Colors.black, false),
                            ]
                          ),
                          TableRow(
                            children: [
                              _column("初期償却" ,Colors.grey[200], Colors.black, true),
                            ]
                          ),
                          TableRow(
                            children: [
                              _column(payment.initialDeprecration ,Color(0xffffffff), Colors.black, false),
                            ]
                          ),
                          TableRow(
                            children: [
                              _column("その他メッセージ" ,Colors.grey[200], Colors.black, true),
                            ]
                          ),
                          TableRow(
                            children: [
                              _column(payment.otherMessageRefund ,Color(0xffffffff), Colors.black, false),
                            ]
                          ),
                        ]
                      ),
                    ),
                  ]
                )
              ) : Container(),
        ]
      ),
    );
  }

  Widget _getMedicalAcceptWidget(MedicalAcceptance acceptance ,List<MedicalAcceptance> medicals){
    String acceptType = medicals.length != 0 ? medicals.firstWhere((m) => m.name == acceptance.name).acceptType : "";
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 10.0,vertical: 6),
      padding: EdgeInsets.symmetric(horizontal: 10 ,vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.all(Radius.circular(5))
      ),
      child: Row(
        children: [
          acceptType == 'accept' ? Icon(Icons.check,color: Colors.green) : Container(),
          acceptType == 'unaccept' ? Icon(Icons.clear,color: Colors.red) : Container(),
          acceptType == 'negotiate' ? Icon(Icons.adjust_outlined, color: Colors.blue[600],) : Container(),
          SizedBox(width: 10),
          Text(acceptance.name),
      ],) 
    );
  }

  Widget _getStaffWidget(StaffModel staff){
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          _itemHeader('介護に関わる職員体制（入居者：職員）'),
          _itemData(staff.staff),

          _itemHeader('介護職員'),
          _itemData(staff.nursingStaff),

          _itemHeader('夜間の最少職員数'),
          _itemData(staff.minNumStaff),

          _itemHeader('看護職員数'),
          _itemData(staff.numStaff),

          // _staffItem("介護に関わる職員体制（入居者：職員）",Colors.grey[200]),
          // _staffItem(staff.staff,Colors.white),
          // _staffItem("介護職員",Colors.grey[200]),
          // _staffItem(staff.nursingStaff,Colors.white),
          // _staffItem(" 夜間の最少職員数",Colors.grey[200]),
          // _staffItem(staff.minNumStaff,Colors.white),
          // _staffItem("看護職員数",Colors.grey[200]),
          // _staffItem(staff.numStaff,Colors.white),
        ],
      ),
    );
  }

  Widget _column(String name, Color bgColor, Color txtColor,bool isfontBold){
    return Container(
      padding: EdgeInsets.all(10),
      color: bgColor,
      child: Text(name != null ? name : '', 
        style: TextStyle(
          fontWeight: isfontBold ? FontWeight.bold : FontWeight.normal,
          color: txtColor,
          fontSize: 16
        ),),
    );
  }

  Widget _noData(){
    return Text("データがありません。",
      style: TextStyle(color: Colors.grey),
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
          Text(name),
          SizedBox(
            height: 20.0,
            width: 30.0,
            child: Divider(color: Colors.blue[400],thickness: 3.0,)
          ),
        ],
      )
    );
  }

  Widget _staffItem(String data, Color color){
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        color: color,
      ),
      child: Text((data == null || data == "0")? "-": data,style: TextStyle(fontSize: 16),)
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
          fontSize: 15
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
        title: Text((data == null || data == "0")? "-": data, 
          style: TextStyle(
            fontSize: 15.0,
          ),
        ),
      ),
    );
  }

  Widget _mailButton(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        RaisedButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=> NusingMail()));
          },
          color: Colors.green,
          textColor: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.mail_outline),
              SizedBox(width: 4.0),
              Text('資料請求', style: TextStyle(fontSize: 16,)),
          ],)
        ),
      ],
    );
  }


}