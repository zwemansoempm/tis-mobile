import 'package:flutter/material.dart';

class SendCompletely extends StatefulWidget {
  const SendCompletely();
  @override
  _SendCompletelyState createState() => _SendCompletelyState();
}

class _SendCompletelyState extends State<SendCompletely> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Send Completely"),
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
                  Container(
                    height: 30.0,
                    width: 100.0,
                    decoration: BoxDecoration(
                      color: Colors.blue[300],
                    ),
                    child: Center(
                      child: Text("1.必要事項のご入力",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 10
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 30.0,
                    width: 100.0,
                    decoration: BoxDecoration(
                      //border: Border.all(color: Colors.blue[300]),
                      color: Colors.blue[300],
                    ),
                    child: Center(
                      child: Text("2.内容のご確",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 10
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 30.0,
                    width: 100.0,
                    decoration: BoxDecoration(
                      //border: Border.all(color: Colors.blue[300]),
                      color: Colors.blue[300],
                    ),
                    child: Center(
                      child: Text("3.送信完了",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 10
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
            SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Text("この度は「TIS ティーズ」をご利用いただきましてありがとうございました。お申込みいただいた資料の送付およびお問い合わせいただいた内容につきましては、各施設よりご対応させていただきます。"),
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
        ),
      ),
      
    );
  }
}