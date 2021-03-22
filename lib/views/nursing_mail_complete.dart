import 'package:flutter/material.dart';
import 'package:tis/views/top.dart';

class NursingMailComplete extends StatefulWidget {
  const NursingMailComplete();
  @override
  _NursingMailCompleteState createState() => _NursingMailCompleteState();
}

class _NursingMailCompleteState extends State<NursingMailComplete> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("介護施設資料請求"),
        backgroundColor:Color(0xff63b7ff),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Container(
                  //     padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                  //     decoration: BoxDecoration(
                  //       border: Border.all(color: Colors.blue[300]),
                  //     ),
                  //     child: Text("1.入力",
                  //       style: TextStyle(
                  //         color: Colors.blue,
                  //         fontWeight: FontWeight.bold,
                  //         fontSize: 12
                  //       ),
                  //     ),
                  //   ),
                  Container(
                    height: 30.0,
                    width: 110.0,
                    decoration: BoxDecoration(
                      color: Colors.blue[300],
                    ),
                    child: Center(
                      child: Text("1.必要事項のご入力",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 30.0,
                    width: 110.0,
                    decoration: BoxDecoration(
                      //border: Border.all(color: Colors.blue[300]),
                      color: Colors.blue[300],
                    ),
                    child: Center(
                      child: Text("2.内容のご確",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 30.0,
                    width: 110.0,
                    decoration: BoxDecoration(
                      //border: Border.all(color: Colors.blue[300]),
                      color: Colors.blue[300],
                    ),
                    child: Center(
                      child: Text("3.送信完了",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 10.0),
            Center(
              child: Text(
                "資料請求が完了いたしました" ,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14 ),
              child: Text(
                "この度は「TIS ティーズ」をご利用いただきましてありがとうございました。",
                textAlign: TextAlign.center,),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14 ),
              child: Text(
                "お申込みいただいた資料の送付およびお問い合わせいただいた内容につきましては、各施設よりご対応させていただきます。",
                textAlign: TextAlign.center,),
            ),
            SizedBox(height: 30.0),
            Center(
              child: RaisedButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                onPressed: () {
                  Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const TopPage()));
                },
                color: Colors.blue[300],
                textColor: Colors.white,
                child: Text('ホームへ戻る', style: TextStyle(fontSize: 16,)),
              ),
            ),
          ]
        ),
      ),
      
    );
  }
}