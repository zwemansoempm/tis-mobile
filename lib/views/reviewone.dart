import 'package:flutter/material.dart';
import 'package:tis/views/reviewtwo.dart';

class ReviewPost extends StatefulWidget {
  // SELECT BOX variable

  @override
  _ReviewPostState createState() => _ReviewPostState();
}

class _ReviewPostState extends State<ReviewPost> {
  String dropdownValue = '1970';

  String holder = '';

  List<String> items = [
    '1970',
    '1971',
    '1972',
    '1973',
    '1974',
    '1975',
    '1976',
    '1977',
    '1978',
    '1979',
    '1980',
    '1981',
    '1982',


  ];

  String _content;

  String _review;

  String _zipcode;

  String _name;

  String _email;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildNameField() {
    return TextFormField(
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: Colors.blue[100]),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(width: 2, color: Colors.blue[100])),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: Colors.blue[100]),
        ),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(width: 2, color: Colors.blue[100])),
      ),
      // autofocus: true,
      textInputAction: TextInputAction.next,
      validator: (String value) {
        if (value.isEmpty) {
          return 'お名前は必須です。';
        }

        if (RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]').hasMatch(value)) {
          return 'Name only accept character';
        }

        return null;
      },
      onSaved: (String value) {
        _name = value;
      },
    );
  }

  Widget _buildEmailField() {
    return TextFormField(
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: Colors.blue[100]),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(width: 2, color: Colors.blue[100])),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: Colors.blue[100]),
        ),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(width: 2, color: Colors.blue[100])),
      ),
      textInputAction: TextInputAction.next,
      // autofocus: true,
      validator: (String value) {
        if (value.isEmpty) {
          return 'メールアドレスは必須です。';
        }
        if (!RegExp(
                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(value)) {
          return '※メールアドレスが正しくありません。\n もう一度入力してください。';
        }

        return null;
      },
      onSaved: (String value) {
        _email = value;
      },
    );
  }

  Widget _buildZipcodeField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: Colors.blue[100]),
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(width: 2, color: Colors.blue[100])),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: Colors.blue[100]),
            ),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(width: 2, color: Colors.blue[100])),
          ),
          keyboardType: TextInputType.number,
          // validator: (String value){
          //   if(value.isEmpty){
          //     return '※入力は必須です。';
          //   }

          //   return null;

          // },
          onSaved: (String value) {
            _zipcode = value;
          },
        ),
        SizedBox(
          height: 10,
        ),
        Text('例）1006740 (郵便番号検索)'),
      ],
    );
  }

  Widget _buildReviewField() {
    return TextFormField(
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: Colors.blue[100]),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(width: 2, color: Colors.blue[100])),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: Colors.blue[100]),
        ),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(width: 2, color: Colors.blue[100])),
      ),
      textInputAction: TextInputAction.next,

      validator: (String value) {
        if (value.isEmpty) {
          return '口コミタイトルは必須です。';
        }

        return null;
      },
      onSaved: (String value) {
        _review = value;
      },
    );
  }

  Widget _buildContentField() {
    return TextFormField(
      keyboardType: TextInputType.multiline,
      minLines: 4,
      maxLines: 15,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: Colors.blue[100]),
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: Colors.blue[100])),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: Colors.blue[100]),
        ),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: Colors.blue[100])),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return '口コミは必須です。';
        }

        return null;
      },
      onSaved: (String value) {
        _content = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.lightBlue[50],
        child: ListView(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 15.0,
                ),
                Icon(Icons.chat_outlined, size: 30, color: Colors.grey),
                SizedBox(
                  width: 15.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 6.0),
                  child: Text(
                    '口コミ投稿',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: SizedBox(
                width: 100,
                child: Divider(
                  color: Colors.grey,
                  thickness: 1,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.blue),
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
                          border: Border.all(width: 1, color: Colors.blue),
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
                          border: Border.all(width: 1, color: Colors.blue),
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
            Container(
              padding: EdgeInsets.all(10.0),
              margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(10)),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildColumnOne('口コミタイトル'),

                    _buildReviewField(),

                    _buildColumnOne('メールアドレス（半角英数字）'),

                    _buildEmailField(),

                    _buildColumnOne('お名前'),

                    _buildNameField(),

                    _buildColumTwo('生まれた年'),

                    _buildSelectbox(),

                    _buildColumTwo('郵便番号(半角数字)'),

                    _buildZipcodeField(),

                    _buildColumnOne('口コミ内容'),

                    _buildContentField(),

                    SizedBox(
                      height: 40,
                    ),

                    InkWell(
                      child: Text(
                        '「プライバシーポリシー」',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: (){

                      },
                    ),

                    SizedBox(
                      height: 25,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                          onPressed: () {},
                          color: Colors.red,
                          child: Text(
                            "キャンセル ",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                          onPressed: () {
                            if (!_formKey.currentState.validate()) {}
                            if (_formKey.currentState.validate()) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ReviewTwo(
                                            name: _name,
                                            email: _email,
                                            content: _content,
                                            review: _review,
                                            zipcode: _zipcode,
                                            year: holder,
                                          )));
                            }

                            _formKey.currentState.save();

                            print(_name);
                            print(_email);
                            print(_content);
                            print(_review);
                            print(_zipcode);
                          },
                          color: Colors.green,
                          child: Text(
                            "確認画面へ進む",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 30,
                    ),

                    // SizedBox(
                    //   height: 100,
                    // ),
                    // RaisedButton(
                    //     child: Text(
                    //       'Click',
                    //       style: TextStyle(
                    //         color: Colors.blue,
                    //         fontSize: 16,
                    //       ),
                    //     ),
                    //     onPressed: () {
                    //       if(!_formKey.currentState.validate()){

                    //       }

                    //       _formKey.currentState.save();

                    //       print(_name);
                    //       print(_email);

                    //     },
                    //     )
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  Widget _buildColumnOne(String name) {
    return Container(
        margin: EdgeInsets.only(top: 20.0),
        child: Row(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10),
              child: Text(
                name,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            Container(
              // margin: EdgeInsets.only(top: 10),
              // color: Colors.red,
              padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 2),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4), color: Colors.red),
              child: Text(
                "必須",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ));
  }

  Widget _buildColumTwo(String name) {
    return Container(
        margin: EdgeInsets.only(top: 20.0),
        child: Row(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10),
              child: Text(
                name,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ));
  }

  Widget _buildSelectbox() {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Container(
        margin: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: Colors.white,
            border: Border.all(color: Colors.blue[100], width: 2)),
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
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(value),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),

              Column(
                children: [
                  Icon(
                    Icons.arrow_drop_down,
                    size: 30,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      SizedBox(
        height: 20,
      ),

      //Printing Item on Text Widget
      Text('Selected Item = ' + '$holder',
          style: TextStyle(fontSize: 12, color: Colors.black)),
    ]);
  }
}
