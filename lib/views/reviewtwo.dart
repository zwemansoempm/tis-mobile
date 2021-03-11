import 'package:flutter/material.dart';
import 'package:tis/views/reviewone.dart';
import 'package:tis/views/reviewthree.dart';

class ReviewTwo extends StatelessWidget {
 
  String name, email, review, content, zipcode='', year='';
  ReviewTwo({this.name, this.email, this.review, this.content, this.zipcode, this.year});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Two'),
      ),
      body: Container(
    color: Colors.lightBlue[50],
    child: ListView(   
      children: [
        Padding(
          padding: const EdgeInsets.only(top:10.0),
          child: Row(
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
                      color: Colors.blue,
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 25.0),
                        child: Text(
                          '2.確認',
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
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                _buildColumTwo('口コミタイトル'),

                _buildData(review),

                _buildColumTwo('メールアドレス（半角英数字）'),

                _buildData(email),

                _buildColumTwo('お名前'),

                _buildData(name),

                _buildColumTwo('生まれた年'),

                _buildData(year),

                _buildColumTwo('郵便番号(半角数字)'),

                _buildData(zipcode),

                _buildColumTwo('口コミ内容'),

                _buildData(content),


                SizedBox(
                  height: 25,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                      onPressed: (){
                        Navigator.pop(context);
                        // Navigator.push(context, MaterialPageRoute(builder: (context)=> const ReviewPost()));
                      },
                      color: Colors.red,
                      child: Text(
                        "入力画面へ戻る ",
                        style: TextStyle(
                            fontSize: 16, color: Colors.white),
                      ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                    RaisedButton(
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> const ReviewThree()));
                    },
                    color: Colors.green,
                    child: Text(
                      "投稿する",
                      style: TextStyle(
                          fontSize: 16, color: Colors.white),
                    ),
                    ),

                        
                  ],
                ),

                SizedBox(
                  height: 30,
                ),


              ],
            ),
        ),
      ],
    )),
    );
  }

  Widget _buildColumnOne(String name) {
    return Container(
      margin: EdgeInsets.only(top:20.0),
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
      margin: EdgeInsets.only(top:20.0),
        child: Row(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10),
              child: Text(
                name,
                style: TextStyle(
                  fontSize: 18,
                  // fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ));
  }

  Widget _buildData(String data){
    return Padding(
      padding: const EdgeInsets.only(left: 28.0),
      child: Text(data, style: TextStyle(
        fontSize: 16,
        
      )
      ),
    );
  }

}
