import 'package:flutter/material.dart';
import 'package:tis/views/jobapply.dart';
import 'package:tis/views/jobapplythree.dart';

class JobApplyTwo extends StatefulWidget {
  const JobApplyTwo();
  @override
  _JobApplyTwoState createState() => _JobApplyTwoState();
}

class _JobApplyTwoState extends State<JobApplyTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Step Two'),
      ),
      body: Container(
        child: ListView(       
          children: [
            Container(
              //padding: EdgeInsets.all(10.0),
              margin: EdgeInsets.only(
                  bottom: 20.0, left: 10.0, right: 10.0, top: 10.0),
              decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20.0),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        children: [
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
                                border:
                                    Border.all(width: 1, color: Colors.blue),
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
                                border:
                                    Border.all(width: 1, color: Colors.blue),
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
                                border:
                                    Border.all(width: 1, color: Colors.blue),
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
                  _buildTitleOne("お名前"),
                  _buildTitleTwo(),
                  _buildTitleOne("お名前フリガナ"),
                  _buildTitleTwo(),
                  _buildTitleOne("生年月日"),
                  _buildTitleTwo(),
                  _buildTitleOne("性別"),
                  _buildTitleTwo(),
                  _buildTitleOne("郵便番号"),
                  _buildTitleTwo(),
                  _buildTitleOne("都道府県"),
                  _buildTitleTwo(),
                  _buildTitleOne("市区町村"),
                  _buildTitleTwo(),
                  _buildTitleOne("番地（建物名)"),
                  _buildTitleTwo(),
                  _buildTitleOne("電話番号"),
                  _buildTitleTwo(),
                  _buildTitleOne("メールアドレス"),
                  _buildTitleTwo(),
                  _buildTitleOne("ご希望等"),
                  _buildTitleTwo(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical:8.0, horizontal: 10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SizedBox(
                              width: 130,
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0)),
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> JobScreen()));
                                },
                                color: Colors.red,
                                child: Center(
                                  child: Text(
                                    "入力画面へ戻る",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 130,
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    side: BorderSide(color: Colors.black)),
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> JobApplyThree()));
                                },
                                color: Colors.green[300],
                                child: Center(
                                  child: Text(
                                    "確認画面",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.white),
                                  ),
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

  Widget _buildTitleOne(String text) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[500], width: 1),
          color: Colors.grey[200],
        ),
        child: Row(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ));
  }

  @override
  Widget _buildTitleTwo() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[500], width: 1),
        color: Colors.grey[100],
      ),
      child: ListTile(
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Text(
            "月公休9日（2月16日～3月15日のシフトのみ8日とする",
            style: TextStyle(
                // fontSize: 16,
                ),
          ),
        ),
      ),
    );
  }
}
