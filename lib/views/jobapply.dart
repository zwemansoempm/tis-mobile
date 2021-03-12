import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tis/views/jobapplytwo.dart';

class GenderList {
  String name;
  int index;
  GenderList({this.name, this.index});
}

class JobScreen extends StatefulWidget {
  @override
  _JobScreenState createState() => _JobScreenState();
}

class _JobScreenState extends State<JobScreen> {

  String dropdownValue = 'Item One';

  // To show Selected Item in Text.
  String holder = '' ;

  List <String> items = [
    'Item One', 
    'Item Two', 
    'Item Three', 
    'Item Four', 
    'Item Five'
    ] ;

  String dropdownValue1 = '市区町村';

  String holder1 = '' ;

  List <String> items1 = [
    '市区町村', 
    '北海道', 
    '青森県', 
    '岩手県', 
    '宮城県'
    ] ;

  DateTime currentDate = DateTime.now();

  var agree = false;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != currentDate)
      setState(() {
        currentDate = pickedDate;
      });
  }
  String radioItem = '男性';

  int id = 1;

  List<GenderList> GenList = [
    GenderList(
      index: 1,
      name: "男性",
    ),
    GenderList(
      index: 2,
      name: "女性",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title : Text('Step One')
      ),
      body: Container(
          child: ListView(
            children: [
              Container(
                //padding: EdgeInsets.all(10.0),
                margin: EdgeInsets.only(
                    bottom: 20.0, left: 10.0, right: 10.0, top: 10.0),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.grey)),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20.0),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          children: [
                            // Icon(
                            //   Icons.article,
                            //   size: 30.0,
                            //   color: Colors.blue,
                            // ),
                            SizedBox(
                              width: 4.0,
                            ),
                            Expanded(
                              child: Text(
                                '介護スタッフ【パート】アスモ介護サービス鳩ヶ谷(鳩ヶ谷)',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 4.0),
                      child: SizedBox(
                        child: Divider(
                          color: Colors.black,
                          thickness: 0.8,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                      left: 10.0, right: 10.0, bottom: 20.0, top: 10),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: Colors.blue),
                                  color: Colors.blue,
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0, horizontal: 25.0),
                                    child: Text(
                                      '1.入力',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),

                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: Colors.blue),
                                  color: Colors.white,
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0, horizontal: 25.0),
                                    child: Text(
                                      '2.確認',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blue),
                                    ),
                                  ),
                                ),
                              ),

                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: Colors.blue),
                                  color: Colors.white,
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0, horizontal: 25.0),
                                    child: Text(
                                      '3.完了',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blue),
                                    ),
                                  ),
                                ),
                              ),

                            ],
                          )
                        ],
                      ),
                    ),

                    _buildColumnOne('お名前'),

                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[500], width: 0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          ListTile(
                            title: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5.0),
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'お名前を入力してください。',
                                  // errorText: '※入力は必須です。',
                                  filled: true,
                                  // helperText: '例）サガシタロウ',
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1, color: Colors.grey[500]),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        width: 4, color: Colors.blue[100])),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1, color: Colors.grey[500]),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        width: 4, color: Colors.blue[100])),
                                ),
                              ),
                            ),
                          ),
                          
                          Padding(
                            padding: const EdgeInsets.only(top:8, bottom:16.0, left: 20),
                            child: Text('例）探し太郎', style: TextStyle(
                              fontSize: 16,
                            ),),
                          ),
                        ],
                      )
                      
                      
                      
                    ),
                    

                    _buildColumnOne('フリガナ'),

                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[500], width: 0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          ListTile(
                            title: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5.0),
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'フリガナを入力してください。',
                                  // errorText: '※入力は必須です。',
                                  filled: true,
                                  // helperText: '例）サガシタロウ',
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1, color: Colors.grey[500]),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        width: 4, color: Colors.blue[100])),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1, color: Colors.grey[500]),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        width: 4, color: Colors.blue[100])),
                                ),
                              ),
                            ),
                          ),
                          
                          Padding(
                            padding: const EdgeInsets.only(top:8, bottom:16.0, left: 20),
                            child: Text('例）サガシタロウ', style: TextStyle(
                              fontSize: 16,
                            ),),
                          ),
                        ],
                      )
                      
                      
                      
                    ),

                    _buildColumnTwo('生年月日'),
                    
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[500], width: 0),
                      ),
                      child: Column(
                        
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          
                          Text( currentDate == null ? 'Choose Date' : currentDate.toString()),
                          Padding(
                            padding: const EdgeInsets.only(left:30.0, top: 15, bottom: 15, right: 30.0),
                            child: RaisedButton(
                              color: Colors.white,
                              onPressed: () => _selectDate(context),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal:8.0, vertical: 14),
                                    child: Text('年 - 月 - 日', style: TextStyle(
                                      fontSize: 18,
                                    ),),
                                  )
                                ],
                              ),
                            ),
                          ),

                          // Text( currentDate == null ? 'Choose Date' : currentDate.toString()),

                          
                        ],
                      ),
                      
                      
                      
                      
                    ),
                    

                    _buildColumnTwo('性別'),
                      
                    Container(
                          margin: EdgeInsets.symmetric(horizontal: 10.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey[500], width: 0),
                            color: Colors.white,
                          ),
                          child: Column(
                            children: GenList.map((data) => RadioListTile(
                                  title: Text("${data.name}"),
                                  groupValue: id,
                                  value: data.index,
                                  onChanged: (val) {
                                    setState(() {
                                      radioItem = data.name;
                                      id = data.index;
                                    });
                                  },
                                )).toList(),

                                
                          ),

                          
                    ),
                    
                    Row(
                      children: [
                         Text('$radioItem', style: TextStyle(fontSize: 23, color: Colors.green)),
                      ],
                    ),

                    Container(
                        margin: EdgeInsets.symmetric(horizontal: 10.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey[500], width: 0),
                          color: Colors.grey[300],
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15.0, vertical: 8),
                              child: Column(
                                children: [
                                  Text(
                                    "ご住所 ",
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 15.0),
                                    child: SizedBox(
                                      width: 40.0,
                                      child: Divider(
                                        color: Colors.blue,
                                        thickness: 3,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                    ),

                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[500], width: 0),
                      ),
                      child: ListTile(
                        title: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top:8, bottom:16.0),
                                child: Text('郵便番号 ', style: TextStyle(
                                  fontSize: 18,
                                ),),
                              ),
                              TextField(
                                decoration: InputDecoration(
                                  hintText: '郵便番号を入力してください。',
                                  filled: true,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1, color: Colors.grey[500]),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          width: 4, color: Colors.blue[100])),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1, color: Colors.grey[500]),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          width: 4, color: Colors.blue[100])),
                                ),
                              ),

                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        RaisedButton(
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(5.0),
                                              side: BorderSide(color: Colors.black),
                                              ),
                                          onPressed: () {},
                                          color: Colors.green,
                                          child: Center(
                                            child: Text(
                                              "検索",
                                              style: TextStyle(fontSize: 18, color: Colors.white),
                                            ),
                                          ),
                                        ),

                                        SizedBox(
                                          width: 2,
                                        ),

                                        Text(' 例）1006740', style: TextStyle(fontSize: 14),),

                                        SizedBox(
                                          width: 5,
                                        ),

                                        Text('郵便番号検索', style: TextStyle(fontSize: 14),)

                                        

                                      ],
                                    ),

                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5.0, vertical: 15),
                                          child: Text(
                                            "都道府県",
                                            style: TextStyle(
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 15),
                                          // color: Colors.red,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5.0, vertical: 2),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(4),
                                              color: Colors.red),
                                          child: Text(
                                            "必須",
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),

                                    Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5.0, vertical: 10.0),
                                          child: _buildSelectbox(),
                                        ),
                                      ],
                                    ),

                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5.0, vertical: 15),
                                          child: Text(
                                            "市区町村",
                                            style: TextStyle(
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 15),
                                          // color: Colors.red,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5.0, vertical: 2),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(4),
                                              color: Colors.red),
                                          child: Text(
                                            "必須",
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),

                                    Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5.0, vertical: 10.0),
                                          child: _buildSelectbox2(),
                                        ),
                                      ],
                                    ),

                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5.0, vertical: 15),
                                          child: Text(
                                            "番地（建物名)",
                                            style: TextStyle(
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                        
                                      ],
                                    ),

                                    Column(
                                      children: [
                                        TextField(
                                          decoration: InputDecoration(
                                            hintText: '番地を入力してください。',
                                            filled: true,
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 1, color: Colors.grey[500]),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(10),
                                                borderSide: BorderSide(
                                                    width: 4, color: Colors.blue[100])),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 1, color: Colors.grey[500]),
                                            ),
                                            focusedErrorBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(10),
                                                borderSide: BorderSide(
                                                    width: 4, color: Colors.blue[100])),
                                          ),
                                        ),
                                      ],
                                    ),

                                    Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(vertical:10.0, horizontal: 0),
                                          child: Text('例）丸の内1-9-1 グラントウキョウノースタワー40階',style: TextStyle(
                                          fontSize: 16,
                                        ),),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                
                                
                                
                                
                              ),
                              
                              
                            ],
                          ),
                        ),
                      ),
                    ),

                    _buildColumnTwo('電話番号'),

                    Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[500], width: 0),
                    ),
                    child: ListTile(
                      title: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top:8, bottom:16.0),
                              child: Text('※ 電話番号またはメールアドレス必須', style: TextStyle(
                                fontSize: 16,
                              ),),
                            ),

                            Container(
                              margin: EdgeInsets.only(top: 0, bottom: 15, left: 10,),
                              // color: Colors.red,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5.0, vertical: 2),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: Colors.red),
                              child: Text(
                                "必須",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ),

                            TextField(
                              decoration: InputDecoration(
                                hintText: '電話番号を入力してください。',
                                filled: true,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1, color: Colors.grey[500]),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        width: 4, color: Colors.blue[100])),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1, color: Colors.grey[500]),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        width: 4, color: Colors.blue[100])),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(top:8, bottom:16.0),
                              child: Text('例）0312345678（半角）', style: TextStyle(
                                fontSize: 16,
                              ),),
                            ),

                          ],
                        ),
                      ),),
                    ),

                    _buildColumnTwo('メールアドレス'),

                    
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[500], width: 0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          ListTile(
                            title: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5.0),
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'メールアドレスを入力してください。',
                                  // errorText: '※入力は必須です。',
                                  filled: true,
                                  // helperText: '例）サガシタロウ',
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1, color: Colors.grey[500]),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        width: 4, color: Colors.blue[100])),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1, color: Colors.grey[500]),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        width: 4, color: Colors.blue[100])),
                                ),
                              ),
                            ),
                          ),
                          
                          Padding(
                            padding: const EdgeInsets.only(top:8, bottom:16.0, left: 20),
                            child: Text('例）abc@example.jp （半角）', style: TextStyle(
                              fontSize: 16,
                            ),),
                          ),
                        ],
                      )
                      
                      
                      
                    ),

                    _buildColumnTwo('ご希望等'),

                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[500], width: 0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          ListTile(
                            title: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5.0),
                              child: TextFormField(
                              decoration: InputDecoration(
                                  // hintText: "Input your opinion",
                                  // hintStyle: TextStyle(color: Colors.white30),
                                  focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      width: 4, color: Colors.blue[100])),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.all(new Radius.circular(5.0))),
                                  labelStyle: TextStyle(color: Colors.white)),
                              // textAlign: TextAlign.center,
                              // style: TextStyle(
                              //   color: Colors.white,
                              //   fontSize: 25.0,
                              // ),

                            )
                            ),
                          ),
                          
                        ],
                      )
                      
                      
                      
                    ),

                    _buildColumnOne('個人情報について'),


                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[500], width: 0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                            child: Text('「プライバシーポリシー」をご確認いただき、よろしければ「同意する」にチェックをして、内容を送信してください。 ', style: TextStyle(
                              fontSize: 16,
                            ),),
                          ),

                          Row(
                            children: [
                              Checkbox(
                                value: agree,
                                onChanged: (value) {
                                  setState(() {
                                    agree = value;
                                  });
                                },
                              ),

                              Text(
                                '同意する,',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),


                        ],
                      )
                      
                      
                      
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 28),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Text('※未入力の必須項目がございます。', style: TextStyle(
                                fontSize: 18,
                                color: Colors.red
                              ),),
                              SizedBox(height: 30,),
                              RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    side: BorderSide(color: Colors.black)),
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const JobApplyTwo()));
                                },
                                color: Colors.green[300],
                                child: Center(
                                  child: Text(
                                    "確認画面へ進む",
                                    style: TextStyle(fontSize: 18, color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )



                        
                    
                  ],
                ),
              ),
            ],
          ),
    ),
    );
  }

  Widget _dropDownCheckBox(String hintText){
    return Container(
      // width: 200,
      padding: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.grey[200],
          border: Border.all(color: Colors.grey[500])),
      child: DropdownButtonHideUnderline(
           child: ButtonTheme(
              alignedDropdown: true,
              child: DropdownButton(
              isExpanded: true,
              //value: _value,
              hint: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(hintText),
                  ),
                ],
              ),
              items: [
                   
                DropdownMenuItem(
                  child: Text("選択してください。1"),
                  value: 2,
                ),
                DropdownMenuItem(
                  child: Text("選択してください。2"),
                  value: 3
                ),
                DropdownMenuItem(
                    child: Text("選択してください。3"),
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
    );
  }

  Widget _buildColumnOne(String name){
    return Container(
    margin: EdgeInsets.symmetric(horizontal: 10.0),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey[500], width: 0),
      color: Colors.grey[300],
    ),
    child: Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 15.0, vertical: 15),
          child: Text(
            name,
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
        Container(
          // margin: EdgeInsets.only(top: 10),
          // color: Colors.red,
          padding: const EdgeInsets.symmetric(
              horizontal: 5.0, vertical: 2),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Colors.red),
          child: Text(
            "必須",
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
      ],
    ));
  }

  Widget _buildColumnTwo(String data){
    return Container(
    margin: EdgeInsets.symmetric(horizontal: 10.0),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey[500], width: 0),
      color: Colors.grey[300],
    ),
    child: Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 15.0, vertical: 15),
          child: Text(
            data,
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
      ],
    ));
  }

  Widget _buildSelectbox(){
    return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [

    Container(
      margin: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5.0),
      color: Colors.grey[200],
      border: Border.all(color: Colors.grey[300])),
            
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Icon(Icons.arrow_drop_down, size: 30,),
                  
            Expanded(
                child: ButtonTheme(
                  alignedDropdown: true,
                  child: DropdownButton<String>(
                        
                  itemHeight: 50,
                  dropdownColor: Colors.grey[100],
                  value: dropdownValue,
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: 0,
                  elevation: 16,
                  style: TextStyle(color: Colors.black, fontSize: 18),
                  underline: Container(
                    height: 0,
                  ),
                  onChanged: (String data) {
                    setState(() {
                      holder = data;
                      dropdownValue = data;
                    });
                  },
                  items: items.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
              ),
                ),
            ),

            Column(
              children: [
                Icon(Icons.arrow_drop_down, size: 20,),

              ],
            ),



          ],
        ),
      ),
    ),
    SizedBox(height: 20,),
          
      //Printing Item on Text Widget 
      Text('Selected Item = ' + '$holder', 
      style: TextStyle
          (fontSize: 12, 
          color: Colors.black)),

    ]);
  }

  Widget _buildSelectbox2(){
    return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [

    Container(
      margin: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5.0),
      color: Colors.grey[200],
      border: Border.all(color: Colors.grey[300])),
            
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Icon(Icons.arrow_drop_down, size: 30,),
                  
            Expanded(
                child: ButtonTheme(
                alignedDropdown: true,
                child: DropdownButton<String>(
                      
                itemHeight: 50,
                dropdownColor: Colors.grey[100],
                value: dropdownValue1,
                icon: Icon(Icons.arrow_drop_down),
                iconSize: 0,
                elevation: 16,
                style: TextStyle(color: Colors.black, fontSize: 18),
                underline: Container(
                  height: 0,
                ),
                onChanged: (String data) {
                  setState(() {
                    holder1 = data;
                    dropdownValue1 = data;
                  });
                },
                items: items1.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
                                ),
            ),

            Column(
              children: [
                Icon(Icons.arrow_drop_down, size: 20,),

              ],
            ),



          ],
        ),
      ),
    ),
    SizedBox(height: 20,),
          
      //Printing Item on Text Widget 
      Text('Selected Item = ' + '$holder1', 
      style: TextStyle
          (fontSize: 12, 
          color: Colors.black)),

    ]);
  }

}

// class RadioGroup extends StatefulWidget {
//   @override
//   RadioGroupWidget createState() => RadioGroupWidget();
// }

// class GenderList {
//   String name;
//   int index;
//   GenderList({this.name, this.index});
// }

// class RadioGroupWidget extends State {
//   String radioItem = 'Male';

//   int id = 1;

//   List<GenderList> GenList = [
//     GenderList(
//       index: 1,
//       name: "Male",
//     ),
//     GenderList(
//       index: 2,
//       name: "Female",
//     ),
//   ];

//   Widget build(BuildContext context) {
//     return Column(
//       children: <Widget>[
//         //  Padding(
//         //   padding : EdgeInsets.all(14.0),
//         //   child: Text('$radioItem', style: TextStyle(fontSize: 23))
//         //     ),

//         Expanded(
//             child: Container(
//           height: 350.0,
//           child: Column(
//             children: GenList.map((data) => RadioListTile(
//                   title: Text("${data.name}"),
//                   groupValue: id,
//                   value: data.index,
//                   onChanged: (val) {
//                     setState(() {
//                       radioItem = data.name;
//                       id = data.index;
//                     });
//                   },
//                 )).toList(),
//           ),
//         )),
//       ],
//     );
//   }
// }
