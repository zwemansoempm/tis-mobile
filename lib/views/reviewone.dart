import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_focus_watcher/flutter_focus_watcher.dart';
import 'package:form_validator/form_validator.dart';
import 'package:tis/model/hospital_confirm.dart';
import 'package:tis/views/reviewtwo.dart';
import 'package:url_launcher/url_launcher.dart';

class ReviewPost extends StatefulWidget {
  // SELECT BOX variable
  final String hospitalID;
  ReviewPost({Key key,@required this.hospitalID}) : super(key: key);
  @override
  _ReviewPostState createState() => _ReviewPostState();
}

class _ReviewPostState extends State<ReviewPost> {
  final dropdownValue = ValueNotifier<String>('1970');
  // String dropdownValue = '1970';

  final holder = ValueNotifier<String>('');
  // String holder = '';

  List<String> items = [
    '1901','1902','1903','1904','1905','1906','1907','1908','1909','1910',
    '1911','1912','1913','1914','1915','1916','1917','1918','1919','1920',
    '1921','1922','1923','1924','1925','1926','1927','1928','1929','1930',
    '1931','1932','1933','1934','1935','1936','1937','1938','1939','1940',
    '1941','1942','1943','1944','1945','1946','1947','1948','1949','1950',
    '1951','1952','1953','1954','1955','1956','1957','1958','1959','1960',
    '1961','1962','1963','1964','1965','1966','1967','1968','1969','1970',
    '1971','1972','1973','1974','1975','1976','1977','1978','1979','1980',
    '1981','1982','1983','1984','1985','1986','1987','1988','1989','1990',
    '1991','1992','1993','1994','1995','1996','1997','1998','1999','2000',
    '2001','2002','2003','2004','2005','2006','2007','2008','2009','2010',
    '2011','2012','2013','2014','2015','2016','2017','2018','2019','2020',
    '2021'
  ];

  String _content;

  String _review;

  String _zipcode;

  String _name;

  String _email;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {
    return FocusWatcher(
        child: Scaffold(
        appBar: AppBar(
          title: Text("Comment"),
        backgroundColor:Colors.lightBlue,
        ),
        body: Padding(
        padding: const EdgeInsets.all(0),
        child: Container(
      //  margin: EdgeInsets.symmetric(vertical: 10),
      color: Colors.lightBlue[50],
      child: Padding(
        padding: const EdgeInsets.only(top:10.0),
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
                  color: Colors.white,
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

                    SizedBox(height: 20),

                    Padding(
                      padding: EdgeInsets.only(left: 3),
                      child: new RichText(
                        text: new TextSpan(
                          children: [
                            new TextSpan(
                              text: 'プライバシーポリシー」',
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  // fontWeight: FontWeight.bold,
                                  color: Colors.blue),
                              recognizer: new TapGestureRecognizer()
                                ..onTap = () {
                                  launch(
                                      'https://test.t-i-s.jp/privacyPolicy');
                                },
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 20,
                    ),

 

                    SizedBox(
                      height: 25,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                          onPressed: () {
                            // Navigator.pop(context);
                          },
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

                              _formKey.currentState.save();


                              HospitalConfirmModel comment = new HospitalConfirmModel(
                              _name,
                              holder.value,
                              _zipcode,
                              _email,
                              _review,
                              _content
                              );

                              var route = new MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    new ReviewTwo(
                                        hospitalID: widget.hospitalID,
                                        comment: comment),
                              );
                              Navigator.of(context).push(route);
                              

                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => ReviewTwo(
                              //               name: _name,
                              //               email: _email,
                              //               content: _content,
                              //               review: _review,
                              //               zipcode: _zipcode,
                              //               year: holder.value,
                              //             )));
                            }


                            // print(_name);
                            // print(_email);
                            // print(_content);
                            // print(_review);
                            // print(_zipcode);
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
        ),
      )),
      ),
        

      ),
    );
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

  Widget _buildNameField() {
    return TextFormField(
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: Colors.grey[300]),
        ),
        focusedBorder: OutlineInputBorder(
            // borderRadius: BorderRadius.circular(10),
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
      validator: ValidationBuilder()
      .regExp(
          RegExp(
              "(\\[w]+|[一-龠]+|[ぁ-ゔ]+|[ァ-ヴー]+|[a-zA-Z0-9]+|[ａ-ｚＡ-Ｚ０-９]+|[々〆〤]+)\\s+(\\[w]+|[一-龠]+|[ぁ-ゔ]+|[ァ-ヴー]+|[a-zA-Z0-9]+|[ａ-ｚＡ-Ｚ０-９]+|[々〆〤]+)",
              unicode: false),
          "お名前を入力してください。")
      .minLength(1)
      .maxLength(50)
      .build(),
      // validator: (String value) {
      //   if (value.isEmpty) {
      //     return 'お名前は必須です。';
      //   }

      //   if (RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]').hasMatch(value)) {
      //     return 'Name only accept character';
      //   }

      //   return null;
      // },
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
          borderSide: BorderSide(width: 2, color: Colors.grey[300]),
        ),
        focusedBorder: OutlineInputBorder(
            // borderRadius: BorderRadius.circular(10),
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
              borderSide: BorderSide(width: 2, color: Colors.grey[300]),
            ),
            focusedBorder: OutlineInputBorder(
                // borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(width: 2, color: Colors.blue[100])),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: Colors.blue[100]),
            ),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(width: 2, color: Colors.blue[100])),
          ),
          keyboardType: TextInputType.number,
          maxLength: 7,
          
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
        Padding(
          padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
          child: Row(children: [
            Text("例）1006740（"),
            GestureDetector(
                child: Text("郵便番号検索",
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.blue)),
                onTap: () {
                  _launchURL();
                }),
            Text(")"),
          ]),
        ),
      ],
    );
  }

  Widget _buildReviewField() {
    return TextFormField(
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: Colors.grey[300]),
        ),
        focusedBorder: OutlineInputBorder(
            // borderRadius: BorderRadius.circular(10),
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
          borderSide: BorderSide(width: 2, color: Colors.grey[300]),
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

  _launchURL() async {
    const url = 'https://www.post.japanpost.jp/zipcode/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget _buildSelectbox() {

    
    return Column(
      children: [
        Container(
        //padding: EdgeInsets.all(5.0),
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
                  child: (Text(holder.value == '' ? "選択してください。" : '${holder.value}',)),
                ),

            items: items.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: value != null ? Text(value)
              : Row(
                children: [
                  Icon(Icons.arrow_drop_down_outlined, size: 35.0,),
                  Text("市区町村"),
                ],
              ),
                
              );
            }).toList(),
            onChanged: (String data) {
              setState(() {
                holder.value = data;
                dropdownValue.value = data;
              });
            },
            ),
              ),
          ),
        ),
        SizedBox(height: 10,),
          Text('Selected Item = ' + '${holder.value}',
              style: TextStyle(fontSize: 12, color: Colors.black)),
      ],
    );


    // return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
    //   ValueListenableBuilder(
    //       valueListenable: dropdownValue,
    //       builder: (BuildContext context, value, Widget child) => Container(
    //       margin: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
    //       decoration: BoxDecoration(
    //           borderRadius: BorderRadius.circular(5.0),
    //           color: Colors.white,
    //           border: Border.all(color: Colors.blue[100], width: 2)),
    //       child: Padding(
    //         padding: const EdgeInsets.symmetric(horizontal: 10),
    //         child: Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           // crossAxisAlignment: CrossAxisAlignment.stretch,
    //           children: [
    //             // Icon(Icons.arrow_drop_down, size: 30,),

    //             Expanded(
    //               child: ButtonTheme(
    //                   alignedDropdown: true,
    //                   child: DropdownButton<String>(
    //                   itemHeight: 50,
    //                   dropdownColor: Colors.grey[100],
    //                   value: value,
    //                   icon: Icon(Icons.arrow_drop_down),
    //                   iconSize: 0,
    //                   elevation: 16,
    //                   style: TextStyle(color: Colors.black, fontSize: 18),
    //                   underline: Container(
    //                     height: 0,
    //                   ),
    //                   onChanged: (String data) {
    //                     // setState(() {
    //                       holder.value = data;
    //                       dropdownValue.value = data;
    //                     // });
    //                   },
    //                   items: items.map<DropdownMenuItem<String>>((String value) {
    //                     return DropdownMenuItem<String>(
    //                       value: value,
    //                       child: Padding(
    //                         padding: const EdgeInsets.only(left: 8.0),
    //                         child: Text(value),
    //                       ),
    //                     );
    //                   }).toList(),
    //                 ),
    //               ),
    //             ),
                

    //             Column(
    //               children: [
    //                 Icon(
    //                   Icons.arrow_drop_down,
    //                   size: 30,
    //                 ),
    //               ],
    //             ),
    //           ],
    //         ),
    //       ),
    //     ),         
         
    //   ),
    //   SizedBox(
    //     height: 20,
    //   ),

    //   //Printing Item on Text Widget
    //   Text('Selected Item = ' + '${holder.value}',
    //       style: TextStyle(fontSize: 12, color: Colors.black)),
    // ]);
  }

}
