import 'package:flutter/material.dart';

class CommentCompletely extends StatefulWidget {
  const CommentCompletely();
  @override
  _CommentCompletelyState createState() => _CommentCompletelyState();
}

class _CommentCompletelyState extends State<CommentCompletely> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Comment Complete"),
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
              Center(
                child: Text(
                  "入力内容は送信されました" ,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Text("口コミの投稿ありがとうございました。\nサイト管理者による承認後、口コミが公開されます。"),
              ),
              SizedBox(height: 14.0),
              Center(
                child: RaisedButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                  onPressed: () {},
                  color: Colors.blue[300],
                  textColor: Colors.white,
                  child: Text('確認ページに進む', style: TextStyle(fontSize: 16,)),
                ),
              ),


            ]
          )
        ),

      )
    );
  }
}