import 'package:flutter/material.dart';
import 'package:tis/views/jobsearch.dart';

class JobApplyThree extends StatefulWidget {
  @override
  _JobApplyThreeState createState() => _JobApplyThreeState();
}

class _JobApplyThreeState extends State<JobApplyThree> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title : Text('Step Three')
      ),
      body: Container(
      child: ListView(
        children: [
          Container(
            //padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.only(
                bottom: 20.0, left: 10.0, right: 10.0, top: 10.0),
            decoration:
                BoxDecoration(border: Border.all(color: Colors.grey)),
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
                      horizontal: 10.0, vertical: 8.0),
                  child: SizedBox(
                    child: Divider(
                      color: Colors.black,
                      thickness: 0.8,
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(
                  horizontal: 10.0, vertical: 8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1, color: Colors.blue),
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
                              border: Border.all(
                                  width: 1, color: Colors.blue),
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
                              border: Border.all(
                                  width: 1, color: Colors.blue),
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
                      )
                    ],
                  ),
                ),

                Column(
                  children: [

                    SizedBox(height: 30,),

                    Text('求人への応募が完了しました', style: TextStyle(
                      fontSize: 20,
                    ),),

                    SizedBox(height: 30,),


                    Text('担当者より連絡があるまでしばらくおまちください。', style: TextStyle(
                      fontSize: 12,
                    ),),

                    SizedBox(height: 20,),

                    // SizedBox(height: 20,),

                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
                      child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                              side: BorderSide(color: Colors.black),
                              ),
                            
                          onPressed: () {
                            // Navigator.push(context, MaterialPageRoute(builder: (context)=> JobSearch()));
                          },
                          color: Colors.blue[400],
                          textColor: Colors.white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                                child: Text('ホームへ戻る',
                                    style: TextStyle(
                                      fontSize: 16,
                                    )),
                              ),
                            ],
                          )),
                    ),
                  ],
                ),


              ],
            ),
          ),
        ],
      ),
      ),
      );
  }
}