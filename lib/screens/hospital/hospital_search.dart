import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:tis/screens/hospital/hospital_detail.dart';

class HospitalSearch extends StatefulWidget {
  @override
  _HospitalSearchState createState() => _HospitalSearchState();
}

class _HospitalSearchState extends State<HospitalSearch> {

  Map<String, bool> cityList = {
    'item1': false, 'item2': false, 'item3': false, 'item4': false,
  };

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
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(width: 5.0),
                  Icon(Icons.map,color: Colors.blue),
                  SizedBox(width: 5.0),
                  Text("地図検索"),
                  Text("「北海道の病院 1 件」"),
                ]
              ),
              DottedLine(dashColor: Colors.blue,),
              SizedBox(height: 20),
              _header("現在の検索条件"),

              SizedBox(height: 10),

              Container(
                //padding: EdgeInsets.all(8),
               
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[300]),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _dropDownBox("市区町村"),
                    //SizedBox(height: 10),

                    Container(
                      margin: EdgeInsets.all(8),
                      padding: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: Colors.white,
                        border: Border.all(color: Colors.grey[400])),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          isExpanded: true,
                        //value: _value,
                        hint: Text("市から探す"),
                        items: [
                          DropdownMenuItem(
                            child: Text("First Item"),
                            value: 1,
                          ),
                          DropdownMenuItem(
                            child: Text("Second Item"),
                            value: 2,
                          ),
                          DropdownMenuItem(
                            child: Text("Third Item"),
                            value: 3
                          ),
                          DropdownMenuItem(
                              child: Text("Fourth Item"),
                              value: 4
                          )
                        ],
                        onChanged: (value) {
                          setState(() {
                            //_value = value;
                          });
                        }),
                      ),
                    ),
                    Divider(color: Colors.grey[300],thickness: 1,),
                    
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                        padding: EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                        child: ListTile(
                          dense: true,
                          contentPadding: EdgeInsets.zero,
                          leading: Text("特長から探す", style: TextStyle(color: Colors.grey[600]),),
                          trailing: Icon(Icons.arrow_drop_down_outlined),
                        ),
                        color: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.grey[400], width: 1),
                          borderRadius: BorderRadius.circular(5.0)
                        ),
                        onPressed: ()  {
                          _checkBoxList();
                        },
                      ),
                    ),

                    Divider(color: Colors.grey[300],thickness: 1,),
                    
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text("診療科目",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                        padding: EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                        child: ListTile(
                          dense: true,
                          contentPadding: EdgeInsets.zero,
                          leading: Text("内科", style: TextStyle(color: Colors.grey[600]),),
                          trailing: Icon(Icons.arrow_drop_down_outlined),
                        ),
                        color: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.grey[400], width: 1),
                          borderRadius: BorderRadius.circular(5.0)
                        ),
                        onPressed: ()  {
                          _checkBoxList();
                        },
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                        padding: EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                        child: ListTile(
                          dense: true,
                          contentPadding: EdgeInsets.zero,
                          leading: Text("小児医療", style: TextStyle(color: Colors.grey[600]),),
                          trailing: Icon(Icons.arrow_drop_down_outlined),
                        ),
                        color: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.grey[400], width: 1),
                          borderRadius: BorderRadius.circular(5.0)
                        ),
                        onPressed: ()  {
                          _checkBoxList();
                        },
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                        padding: EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                        child: ListTile(
                          dense: true,
                          contentPadding: EdgeInsets.zero,
                          leading: Text("眼科・耳鼻咽喉科", style: TextStyle(color: Colors.grey[600]),),
                          trailing: Icon(Icons.arrow_drop_down_outlined),
                        ),
                        color: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.grey[400], width: 1),
                          borderRadius: BorderRadius.circular(5.0)
                        ),
                        onPressed: ()  {
                          _checkBoxList();
                        },
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                        padding: EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                        child: ListTile(
                          dense: true,
                          contentPadding: EdgeInsets.zero,
                          leading: Text("外科", style: TextStyle(color: Colors.grey[600]),),
                          trailing: Icon(Icons.arrow_drop_down_outlined),
                        ),
                        color: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.grey[400], width: 1),
                          borderRadius: BorderRadius.circular(5.0)
                        ),
                        onPressed: ()  {
                          _checkBoxList();
                        },
                      ),
                    ),
                    
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                        padding: EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                        child: ListTile(
                          dense: true,
                          contentPadding: EdgeInsets.zero,
                          leading: Text("泌尿器科・肛門科", style: TextStyle(color: Colors.grey[600]),),
                          trailing: Icon(Icons.arrow_drop_down_outlined),
                        ),
                        color: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.grey[400], width: 1),
                          borderRadius: BorderRadius.circular(5.0)
                        ),
                        onPressed: ()  {
                          _checkBoxList();
                        },
                      ),
                    ),
                    
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                        padding: EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                        child: ListTile(
                          dense: true,
                          contentPadding: EdgeInsets.zero,
                          leading: Text("皮膚科", style: TextStyle(color: Colors.grey[600]),),
                          trailing: Icon(Icons.arrow_drop_down_outlined),
                        ),
                        color: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.grey[400], width: 1),
                          borderRadius: BorderRadius.circular(5.0)
                        ),
                        onPressed: ()  {
                          _checkBoxList();
                        },
                      ),
                    ),
                    
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                        padding: EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                        child: ListTile(
                          dense: true,
                          contentPadding: EdgeInsets.zero,
                          leading: Text("心療内科・精神科", style: TextStyle(color: Colors.grey[600]),),
                          trailing: Icon(Icons.arrow_drop_down_outlined),
                        ),
                        color: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.grey[400], width: 1),
                          borderRadius: BorderRadius.circular(5.0)
                        ),
                        onPressed: ()  {
                          _checkBoxList();
                        },
                      ),
                    ),
                    
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                        padding: EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                        child: ListTile(
                          dense: true,
                          contentPadding: EdgeInsets.zero,
                          leading: Text("女性医療", style: TextStyle(color: Colors.grey[600]),),
                          trailing: Icon(Icons.arrow_drop_down_outlined),
                        ),
                        color: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.grey[400], width: 1),
                          borderRadius: BorderRadius.circular(5.0)
                        ),
                        onPressed: ()  {
                          _checkBoxList();
                        },
                      ),
                    ),
                    
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                        padding: EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                        child: ListTile(
                          dense: true,
                          contentPadding: EdgeInsets.zero,
                          leading: Text("その他", style: TextStyle(color: Colors.grey[600]),),
                          trailing: Icon(Icons.arrow_drop_down_outlined),
                        ),
                        color: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.grey[400], width: 1),
                          borderRadius: BorderRadius.circular(5.0)
                        ),
                        onPressed: ()  {
                          _checkBoxList();
                        },
                      ),
                    ),
                    
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                        padding: EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                        child: ListTile(
                          dense: true,
                          contentPadding: EdgeInsets.zero,
                          leading: Text("歯科医療", style: TextStyle(color: Colors.grey[600]),),
                          trailing: Icon(Icons.arrow_drop_down_outlined),
                        ),
                        color: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.grey[400], width: 1),
                          borderRadius: BorderRadius.circular(5.0)
                        ),
                        onPressed: ()  {
                          _checkBoxList();
                        },
                      ),
                    ),
                  
                  ],
                ),
              ),

              RaisedButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                onPressed: () {},
                color: Colors.green,
                textColor: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.search),
                    SizedBox(width: 6),
                    Text('検索', style: TextStyle(fontSize: 16,)),
                ],)
              ),

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
                      child: Text("施設番号:200025-0001"),
                    ),
                    InkWell(
                      child: Text(
                        "Test Hospital",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline)
                      ),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => HospitalDetail()));
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
                      child: ListTile(title: Text("aa@gmail.com"),),
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
                  
                    SizedBox(height: 10.0),
                    Text("こだわりの特長", style: TextStyle(fontWeight: FontWeight.bold),),
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
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10 , vertical: 4),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.blue, width: 1.0),
                            borderRadius: BorderRadius.circular(20)
                          ), 
                          child: Text("日曜祝日診療",style: TextStyle(color: Colors.blue),),
                        ),
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
                    DottedLine(dashColor: Colors.blue,),
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
                                   
                    SizedBox(height: 10.0),
                    RaisedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => HospitalDetail()));
                      },
                      color: Colors.blue,
                      textColor: Colors.white,
                      child: Center(child: Text("詳細を見る"),),
                    ),
                 ],
               ),
               
              ),

              //News
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.blue
                    ), 
                    height: 37.0,
                    width: 10.0,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 30.0,
                    decoration: BoxDecoration(
                      color: Colors.blue[100]
                    ),
                    padding: EdgeInsets.all(8.0),
                    child: Text("News" ,
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.0
              ),

              Row(
                children: [
                  RaisedButton(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                    onPressed: () {},
                    color: Colors.grey,
                    child: Center(child: Text("2020年"),),
                  ),
                ],
              ),
              SizedBox(
                height: 10.0
              ),
              
              _news()



            ]
          ),
        ),
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

  Widget _news(){
    return Column(
      children: [
        Row(
          children: [
            Text("2020-11-06"),
            SizedBox(width: 20.0),
            Card(
              color: Colors.yellow[700],
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
                child: Text("メディア掲載" , style: TextStyle(color: Colors.white),)
              ),
            ),
          ]
        ),
        SizedBox(
          height: 5.0
        ),
        Text("介護士リクルート に医療福祉サービスに関する内容が掲載されました。\n介護士リクルートは、介護業界で働いている方向けに転職・派遣・働き方に関する\n情報を掲載してるメディアです。"),
        Divider(thickness: 2,),
      ]  
    );
  }

  Widget _dropDownBox(String hintText){
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
                    Icon(Icons.arrow_drop_down_outlined, size: 35.0,),
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
                  DropdownMenuItem(
                    child: Text("Third Item"),
                    value: 3
                  ),
                  DropdownMenuItem(
                      child: Text("Fourth Item"),
                      value: 4
                  )
                ],
                onChanged: (value) {
                  setState(() {
                    //_value = value;
                  });
                }),
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
}