import 'package:flutter/material.dart';
import 'package:tis/views/send_completely.dart';

class NusingMail extends StatefulWidget {

  @override
  _NusingMailState createState() => _NusingMailState();
}

class _NusingMailState extends State<NusingMail> {
  int selectedRadio;

  @override
  void initState() {
    super.initState();
    selectedRadio = 0 ;
  }

  setSelectedRadio(int val){
    setState(() {
      selectedRadio = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nusing Mail"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("介護施設資料請求",
                  style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  ),
                ),
                SizedBox(height: 10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.blue[300],
                      ),
                      child: Text("1.入力",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue[300]),
                      ),
                      child: Text("2.確認",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 12
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue[300]),
                      ),
                      child: Text("3.完了",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 12
                        ),
                      ),
                    )
                  ],
                ),

                SizedBox(height: 10),
                Text("資料請求される方について",
                  style: TextStyle(
                  fontSize: 18.0,
                  ),
                ),
                 SizedBox(
                  height: 15.0,
                  width: 80.0,
                  child: Divider(color: Colors.blue[400],thickness: 5.0,)
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _orangeCard(),
                    Text("のついた項目は全て入力してくださいますようお願いいたします。",
                      style: TextStyle(
                        fontSize: 8,
                      ),
                    )
                  ]
                ),
                SizedBox(height: 10),
                _itemHeaderButton("お名前"),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey)
                  ), 
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'お名前を入力してください。',
                            contentPadding: EdgeInsets.all(8),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text("例）探し太郎"),
                      _error("※入力は必須です。"),
                    ],
                  )
                ),
                _itemHeaderButton("フリガナ"),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey)
                  ), 
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'フリガナを入力してください。',
                            contentPadding: EdgeInsets.all(8),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text("例）サガシタロウ"),
                    ],
                  )
                ),
                _itemHeader("生年月日"),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey)
                  ), 
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: '年 - 月 - 日',
                        contentPadding: EdgeInsets.all(8),
                    ),
                  ),
                ),
                _itemHeader("性別"),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey)
                  ),
                  child: Column(
                    children: <Widget>[
                      RadioListTile(
                        //contentPadding: EdgeInsets.zero,
                        title: const Text('男性'),
                        value: 1,
                        dense: true,
                        groupValue: selectedRadio,
                        onChanged: (val) {
                          setSelectedRadio(val);
                        },
                      ),
                      RadioListTile(
                        //contentPadding: EdgeInsets.zero,
                        title: const Text('女性'),
                        value: 2,
                        dense: true,
                        groupValue: selectedRadio,
                        onChanged: (val) { setSelectedRadio(val); },
                      ),
                      RadioListTile(
                        //contentPadding: EdgeInsets.zero,
                        title: const Text('夫婦'),
                        value: 3,
                        dense: true,
                        groupValue: selectedRadio,
                        onChanged: (val) { setSelectedRadio(val); },
                      ),
                    ],
                  )
                ),

                _itemHeader("ご住所"),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey)
                  ), 
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("郵便番号"),
                      SizedBox(height: 10.0),
                      TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: '郵便番号を入力してください。',
                            contentPadding: EdgeInsets.all(8),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          RaisedButton(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                            onPressed: () {},
                            color: Colors.green,
                            textColor: Colors.white,
                            child: Text('検索', style: TextStyle(fontSize: 16,)),
                          ),
                          Text("例）1006740 (郵便番号検索)"),
                        ]
                      ),
                      SizedBox(height: 10.0),
                      Row(
                        children: [
                          Text("都道府県"),
                          SizedBox(width: 20),
                          _orangeCard()
                        ],
                      ),
                      SizedBox(height: 10.0),
                      Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: Colors.white,
                        border: Border.all(color: Colors.grey)),
                        child: DropdownButtonHideUnderline(
                          child: ButtonTheme(
                               alignedDropdown: true,
                              child: DropdownButton(
                              isExpanded: true,
                            hint: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("選択してください。"),
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
                            ],
                            onChanged: (value) {
                            }),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),

                      Row(
                        children: [
                          Text("市区町村"),
                          SizedBox(width: 20),
                          _orangeCard()
                        ],
                      ),
                      SizedBox(height: 10.0),
                      Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: Colors.white,
                        border: Border.all()),
                        child: DropdownButtonHideUnderline(
                          child: ButtonTheme(
                              alignedDropdown: true,
                              child: DropdownButton(
                              isExpanded: true,
                            hint: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("選択してください。"),
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
                            ],
                            onChanged: (value) {
                            }),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),

                      Row(
                        children: [
                          Text("番地（建物名)"),
                          SizedBox(width: 20),
                          _orangeCard()
                        ],
                      ),
                      SizedBox(height: 10.0),
                      TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: '番地を入力してください。',
                            contentPadding: EdgeInsets.all(8),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text("例）区丸の内1-9-1 グラントウキョウノースタワー40階")
                    ],
                  ),
                ),

                _itemHeader("電話番号"),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey)
                  ), 
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("※ 電話番号またはメールアドレス必須"),
                      SizedBox(height: 10.0),
                      _orangeCard(),
                      SizedBox(height: 10.0),
                      TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: '番地を入力してください。',
                            contentPadding: EdgeInsets.all(8),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text("例）0312345678（半角）")
                    ],
                  )
                ),

                _itemHeader("メールアドレス"),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey)
                  ), 
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'メールアドレスを入力してください。',
                            contentPadding: EdgeInsets.all(8),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text("例）abc@example.jp （半角）")
                    ],
                  )
                ),
                SizedBox(height: 20.0),

                Center(
                  child: Text("※未入力の必須項目がございます。",
                    style: TextStyle(
                      color: Colors.red
                    ),
                  ),
                ),
                SizedBox(height: 10.0),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RaisedButton(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                      onPressed: () {
                        //Navigator.push(context, MaterialPageRoute(builder: (context)=> NusingMail()));
                      },
                      color: Colors.green,
                      textColor: Colors.white,
                      child: Text('確認ページに進む', style: TextStyle(fontSize: 16,)),
                    ),
                  ]
                ),
                
                SizedBox(height: 10),
                _blueLineHeader("入居対象者様について"),
                SizedBox(height: 10),

                _itemHeader("入居対象者様とのご関係"),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey)
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Colors.white,
                      border: Border.all()),
                    child: DropdownButtonHideUnderline(
                      child: ButtonTheme(
                           alignedDropdown: true,
                          child: DropdownButton(
                          isExpanded: true,
                        hint: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("選択してください。"),
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
                        ],
                        onChanged: (value) {
                        }),
                      ),
                    ),
                  ),
                ),
                _itemHeader("お名前"),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey)
                  ), 
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'お名前を入力してください。',
                            contentPadding: EdgeInsets.all(8),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text("例）探し太郎"),
                    ],
                  )
                ),
                _itemHeader("性別"),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey)
                  ), 
                  child: Column(
                    children: <Widget>[
                      RadioListTile(
                        //contentPadding: EdgeInsets.zero,
                        title: const Text('男性'),
                        value: 1,
                        dense: true,
                        groupValue: selectedRadio,
                        onChanged: (val) {
                          setSelectedRadio(val);
                        },
                      ),
                      RadioListTile(
                        //contentPadding: EdgeInsets.zero,
                        title: const Text('女性'),
                        value: 2,
                        dense: true,
                        groupValue: selectedRadio,
                        onChanged: (val) { setSelectedRadio(val); },
                      ),
                      RadioListTile(
                        //contentPadding: EdgeInsets.zero,
                        title: const Text('夫婦'),
                        value: 3,
                        dense: true,
                        groupValue: selectedRadio,
                        onChanged: (val) { setSelectedRadio(val); },
                      ),
                    ],
                  ),
                ),
                _itemHeader("年齢"),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey)
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Colors.white,
                      border: Border.all()),
                    child: DropdownButtonHideUnderline(
                      child: ButtonTheme(
                          alignedDropdown: true,
                          child: DropdownButton(
                          isExpanded: true,
                        hint: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("選択してください"),
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
                        ],
                        onChanged: (value) {
                        }),
                      ),
                    ),
                  ),
                ),

                _itemHeader("介護度"),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey)
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Colors.white,
                      border: Border.all()),
                    child: DropdownButtonHideUnderline(
                      child: ButtonTheme(
                          alignedDropdown: true,
                          child: DropdownButton(
                          isExpanded: true,
                        hint: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("選択してください"),
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
                        ],
                        onChanged: (value) {
                        }),
                      ),
                    ),
                  ),
                ),
                _itemHeader("認知症"),
                
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey)
                  ), 
                  child: Column(
                    children: <Widget>[
                      RadioListTile(
                        //contentPadding: EdgeInsets.zero,
                        title: const Text('あり'),
                        value: 1,
                        dense: true,
                        groupValue: selectedRadio,
                        onChanged: (val) {
                          setSelectedRadio(val);
                        },
                      ),
                      RadioListTile(
                        //contentPadding: EdgeInsets.zero,
                        title: const Text('なし'),
                        value: 2,
                        dense: true,
                        groupValue: selectedRadio,
                        onChanged: (val) { setSelectedRadio(val); },
                      ),
                      RadioListTile(
                        //contentPadding: EdgeInsets.zero,
                        title: const Text('わからない'),
                        value: 3,
                        dense: true,
                        groupValue: selectedRadio,
                        onChanged: (val) { setSelectedRadio(val); },
                      ),
                    ],
                  ),
                ),
                _itemHeader("ご要望や、お困りごと、その他お問い合わせ"),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey)
                  ),
                  child: TextFormField(
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: '',
                            contentPadding: EdgeInsets.all(8),
                        ),
                      ),
                ),
                SizedBox(height: 20.0),

                Center(
                  child: Text("※未入力の必須項目がございます。",
                    style: TextStyle(
                      color: Colors.red
                    ),
                  ),
                ),
                SizedBox(height: 10.0),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RaisedButton(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> SendCompletely()));
                      },
                      color: Colors.green,
                      textColor: Colors.white,
                      child: Text('確認ページに進む', style: TextStyle(fontSize: 16,)),
                    ),
                  ]
                ),

              ]
            ),
          ),
      )
    );
  }

  Widget _blueLineHeader(String header){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(header,
          style: TextStyle(
          fontSize: 18.0,
          ),
        ),
          SizedBox(
          height: 15.0,
          width: 80.0,
          child: Divider(color: Colors.blue[400],thickness: 5.0,)
        ),
      ]
    );
  }

  Widget _error(String name){
    return Text(name,
      style: TextStyle(
        fontSize: 12,
        color: Colors.red,
      ),
    );
  }

  Widget _itemHeaderButton(String header){
    return Container(
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        color: Colors.grey[200]
      ), 
      child: Row(
        children: [
          Text(header),
          SizedBox(width: 20),
          _orangeCard()
        ],
      )
    );
  }

  Widget _itemHeader(String header){
    return Container(
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        color: Colors.grey[200]
      ), 
      child: Row(
        children: [
          Text(header),
        ],
      )
    );
  }

  Widget _orangeCard(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.redAccent,
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      child: Text("必須",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 12
        ),
      ),
    );
  }
}