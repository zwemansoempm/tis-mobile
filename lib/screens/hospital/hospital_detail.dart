import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:tis/screens/hospital/hospital_comment.dart';


class HospitalDetail extends StatefulWidget {
  HospitalDetail({Key key}) : super(key: key);

  @override
  _HospitalDetailState createState() => _HospitalDetailState();
}

class _HospitalDetailState extends State<HospitalDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hospital Detail"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
              Container(
                padding: EdgeInsets.all(5.0),
                margin: EdgeInsets.only(bottom: 10.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Text("施設番号:200025-0001"),
              ),
              Text(
                "Test Hospital" , 
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

              Center(
                child: Image.asset("assets/img/placeholder.jpg",),
              ),
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
                  title: Text("北海道札幌市中央区Marunouchi 1-9-1 Gran Tokyo North Tower 40th floor", 
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
                  title: Text("09044446666", 
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
                  title: Text("-", 
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
                  title: Text("神経内科 , 呼吸器科 , 消化器科 , 胃腸科 , ", 
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Text("こだわりの特長",
                style: TextStyle(color: Colors.blue),
              ),
              DottedLine(dashColor: Colors.blue),
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
                    child: Text("日曜診療",style: TextStyle(color: Colors.blue),),
                  ),
                  SizedBox(width: 3),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10 , vertical: 4),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue, width: 1.0),
                      borderRadius: BorderRadius.circular(20)
                    ), 
                    child: Text("祝日診療",style: TextStyle(color: Colors.blue),),
                  ),
                  SizedBox(width: 3),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10 , vertical: 4),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue, width: 1.0),
                      borderRadius: BorderRadius.circular(20)
                    ), 
                    child: Text("早朝診療",style: TextStyle(color: Colors.blue),),
                  ),
                ],
              ),
              SizedBox(height: 20.0),

              _subHeader("診療科目"),
              SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.only(left:10),
                child: Row(
                  children: [
                    Text("神経内科"),
                    SizedBox(width: 10.0),
                    Text("呼吸器科"),
                    SizedBox(width: 10.0),
                    Text("消化器科"),
                    SizedBox(width: 10.0),
                    Text("胃腸科"),
                  ],
                ),
              ),
              SizedBox(height: 20.0),

              _subHeader("医院からのお知らせ"),
              SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.only(left:10),
                child: Text("Test Notic"),
              ),
              SizedBox(height: 20.0),

              _subHeader("診療時間"),
              SizedBox(height: 10.0),
              Table(
                border: TableBorder.all(color: Colors.grey),
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: [
                  TableRow(
                    children: [
                      _column("日付" ,Color(0xff80919a), Colors.white),
                      _column("午前" ,Color(0xffffffff), Colors.black),
                      _column("午後" ,Color(0xffffffff), Colors.black),
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
                  Text("Sat,Sun"),
                ],
              ),
              SizedBox(height: 20.0),
              _subHeader("院内施設情報"),

              _facility("駐車場",Color(0xffdee2e6)),
              _facilityData(Colors.white),
              _facility("女医",Color(0xffdee2e6)),
              _facilityData(Colors.white),
              _facility("人間ドック",Color(0xffdee2e6)),
              _facilityData(Colors.white),
              _facility("カード",Color(0xffdee2e6)),
              _facilityData(Colors.white),
              _facility("院内処方",Color(0xffdee2e6)),
              _facilityData(Colors.white),
              _facility("意見",Color(0xffdee2e6)),
              _facilityData(Colors.white),

              SizedBox(height: 20.0),
              _subHeader("フォトアルバム"),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey,width: 2)
                    ),
                    width: MediaQuery.of(context).size.width / 2.3,
                    margin: EdgeInsets.only(right: 10),
                    child: Image.asset("assets/img/placeholder.jpg",fit: BoxFit.cover,)),
                  Container(
                     decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey,width: 2)
                    ),
                    width: MediaQuery.of(context).size.width  / 2.3,
                    child: Image.asset("assets/img/placeholder.jpg",fit: BoxFit.cover,)),
                ],
              ),

              SizedBox(height: 20.0),
              _subHeader("動画"),
              _noData(),
            
              SizedBox(height: 20.0),
              _header("地図"),
              //SizedBox(height: 10.0),
              
              //Map
              // Container(
              //   alignment: Alignment.center,
              //   height: 200,
              //   width: 300,
              //   child: Text("Map"),
              //   color: Colors.blueGrey,
              // ),

              SizedBox(height: 20.0),
              _itemHeader("公式サイト"),
              _itemData("www.google.com"),
              _itemHeader("メールアドレス"),
              _itemData("info@asmokaigo.co.jp"),
              _itemHeader("アクセス"),
              _itemData("-"),
              _itemHeader("混雑状況"),
              _itemData("Test"),

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
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> HospitalComment()));
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
      ),
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