import 'package:flutter/material.dart';
import 'package:tis/views/comment_completely.dart';

class NusingComment extends StatefulWidget {
  const NusingComment();
  @override
  _NusingCommentState createState() => _NusingCommentState();
}

class _NusingCommentState extends State<NusingComment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Comment"),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(8),
          padding: EdgeInsets.symmetric(horizontal: 4.0 , vertical : 8.0),
          //height: 200,
          decoration: BoxDecoration(
            color: Colors.blue[50],
            border: Border.all(color: Colors.grey[400]),
            borderRadius: BorderRadius.circular(4.0)
          ),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(width: 20),
                  Icon(Icons.forum_rounded, color: Colors.blue,size: 30,),
                  Text(" 口コミ投稿",
                    style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    ),
                  ),
                ],
              ),
              Divider(color: Colors.grey,),
              SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 6),
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
                      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 6),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue[300]),
                        color: Colors.white
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
                      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 6),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue[300]),
                        color: Colors.white
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
              ),
              SizedBox(height: 10),
              Card(
                
                color: Colors.white,
                margin: EdgeInsets.only(top: 10.0),
                elevation: 0.0,
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1,color: Colors.grey[300]),
                  borderRadius: BorderRadius.circular(5.0)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _itemHeaderButton("口コミタイトル"),
                      SizedBox(height: 5),
                      TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: '',
                            contentPadding: EdgeInsets.all(8),
                        ),
                      ),
                      SizedBox(height: 10),

                      _itemHeaderButton("メールアドレス（半角英数字）"),
                      SizedBox(height: 5),
                      TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: '',
                            contentPadding: EdgeInsets.all(8),
                        ),
                      ),
                      SizedBox(height: 10),

                      _itemHeaderButton("お名前"),
                      SizedBox(height: 5),
                      TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: '',
                            contentPadding: EdgeInsets.all(8),
                        ),
                      ),
                      SizedBox(height: 10),

                      Text("生まれた年"),
                      SizedBox(height: 5),
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
                              }
                          ),
                            ),
                        ),
                      ),
                      SizedBox(height: 10),

                      Text("郵便番号(半角数字)"),
                      SizedBox(height: 5),
                      TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: '',
                            contentPadding: EdgeInsets.all(8),
                        ),
                      ),
                      Row(
                        children: [
                          Text("例）1006740 ("),
                          InkWell(
                            child: Text(
                              "郵便番号検索",
                              style: TextStyle(
                                color: Colors.blue,
                                decoration: TextDecoration.underline)
                            ),
                            onTap: (){
                            // Navigator.push(context, MaterialPageRoute(builder: (context)=> NusingDetail()));
                            },
                          ),
                          Text(")"),
                        ],
                      ),
                      SizedBox(height: 10),

                      _itemHeaderButton("口コミ内容"),
                      SizedBox(height: 5),
                      TextFormField(
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: '',
                                contentPadding: EdgeInsets.all(8),
                            ),
                          ),
                      SizedBox(height: 20.0),

                      InkWell(
                        child: Text(
                          "「プライバシーポリシー」",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 18.0,
                            //decoration: TextDecoration.underline
                          )
                        ),
                        onTap: (){
                        // Navigator.push(context, MaterialPageRoute(builder: (context)=> NusingDetail()));
                        },
                      ),
                      SizedBox(height: 12.0),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RaisedButton(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                            onPressed: () {
                              //Navigator.push(context, MaterialPageRoute(builder: (context)=> NusingMail()));
                              Navigator.pop(context);
                            },
                            color: Colors.redAccent,
                            textColor: Colors.white,
                            child: Text('キャンセル', style: TextStyle(fontSize: 16,)),
                          ),
                          SizedBox(
                            width: 10.0
                          ),
                          RaisedButton(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> const CommentCompletely()));
                            },
                            color: Colors.green,
                            textColor: Colors.white,
                            child: Text('確認画面へ進む', style: TextStyle(fontSize: 16,)),
                          ),
                        ]
                      ),
                      



                    ]
                  ),
                ),
              )





            ]
          ),
        ),
      ),
    );
  }


  Widget _itemHeaderButton(String header){
    return Row(
      children: [
        Text(header),
        SizedBox(width: 20),
        _orangeCard()
      ],
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