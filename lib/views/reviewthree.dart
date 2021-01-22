import 'package:flutter/material.dart';

class ReviewThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Three'),
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
                      color: Colors.blue,
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 25.0),
                        child: Text(
                          '3.完了',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),

                  
                ],
              ),

              SizedBox(
                height: 30,
              ),

              Text('入力内容は送信されました', style: TextStyle(
                fontSize: 24,
              fontWeight: FontWeight.bold,
              ),),

              SizedBox(
                height: 20,
              ),

              Center(
                child: Text('口コミの投稿ありがとうございました。\n サイト管理者による承認後、口コミが公開されます。', style: TextStyle(
                  fontSize: 18,
                  // fontWeight: FontWeight.bold,
                ),),
                
              ),

              SizedBox(
                height: 30,
              ),

              RaisedButton(
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
              side: BorderSide(color: Colors.grey),
              ),
              onPressed: (){
                // Navigator.push(context, MaterialPageRoute(builder: (context)=> ReviewThree()));
              },
              color: Colors.lightBlue[300],
              child: Text(
                "ホームへ戻る",
                style: TextStyle(
                    fontSize: 16, color: Colors.white),
              ),
              ),

              // Center(
              //   child: Text('サイト管理者による承認後、口コミが公開されます。', style: TextStyle(
              //     fontSize: 14,
              //   ),),
              // ),

            ],
          ),
        ),
      ],
    )),
    );
  }
}