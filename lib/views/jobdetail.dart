import 'package:flutter/material.dart';
import 'package:tis/views/jobapply.dart';

class JobDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Job Detail'),
      ),
      body: Container(
      child: ListView(
        children: [
          Container(
            //padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.only(bottom: 20.0, left: 10.0, right: 10.0, top: 10.0),
            decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
            // width: 250,

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: Row(
                    //     children: [
                    //       Text(
                    //         'ホーム',
                    //         style: TextStyle(
                    //           fontSize: 18,
                    //           color: Colors.blue,
                    //           fontWeight: FontWeight.bold,
                    //         ),
                    //       ),
                    //       SizedBox(
                    //         width: 4.0,
                    //       ),
                    //       Icon(
                    //         Icons.arrow_forward_ios_rounded,
                    //         size: 20.0,
                    //       ),
                    //       SizedBox(
                    //         width: 4.0,
                    //       ),
                    //       Text(
                    //         '求人詳細',
                    //         style: TextStyle(
                    //           fontSize: 18,
                    //           color: Colors.grey,
                    //           fontWeight: FontWeight.bold,
                    //         ),
                    //       )
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0, left: 10.0),
                      child: Text(
                        '施設名: ベストライフ船橋薬園台',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: SizedBox(
                        width: 38.0,
                        child: Divider(
                          color: Colors.blue,
                          thickness: 3,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              '介護職【正社員】アスモ介護サービス薬園台(船橋薬園台)★未経験の方も安心!',
                              style: TextStyle(
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SizedBox(
                            width: 320.0,
                            child: Divider(
                              color: Colors.grey,
                              thickness: 2,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Row(
                      // crossAxisAlignment: CrossAxisAlignment.end,
                      
                      mainAxisAlignment: MainAxisAlignment.end,
                      
                      children: [
                        
                        Container(
                          padding: EdgeInsets.all(5.0),
                          margin: EdgeInsets.only(right: 20, bottom: 20),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Text("求人番号:500009-0001-0005"),
                        ),
                      ],
                    ),
                    
                  ],
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.end,
                //   children: [
                //     Container(
                //       padding: EdgeInsets.all(5.0),
                //       margin: EdgeInsets.all(10.0),
                //       decoration: BoxDecoration(
                //         border: Border.all(
                //           color: Colors.grey,
                //         ),
                //         borderRadius: BorderRadius.circular(10.0),
                //       ),
                //       child: Text("求人番号: 500009-0001-0001"),
                //     ),
                //   ],
                // ),
                
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [

                      _buildColumnOne('仕事内容'),
                      

                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey[500], width: 1),
                        ),
                        child: ListTile(
                          title: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: Text(
                              "介護を必要とされる方の日常生活のお手伝いをします。 食事、入浴、衣類の着脱、体位交換、排泄の介助、移動の介助など生活全般にわたりサポートし、一人ひとりのケアプランに沿って介護サービスを提供します。 必要に応じてケアマネジャー、看護師さんと連携して介護を行っていただきます。季節の行事や毎日レクリエーションを通してご利用者様の健やかな暮らしをサポートします。 ◎子育てなどからブランク復帰された主婦の方も多数活躍中！ 　介護業界ブランクのある方も大歓迎♪",
                              style: TextStyle(
                                  // fontSize: 16,
                                  ),
                            ),
                          ),
                        ),
                      ),

                      _buildColumnOne('経験・スキル'),

                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey[500], width: 1),
                        ),
                        child: ListTile(
                          title: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: Text(
                              "初任者研修修了(旧ヘルパー2級)以上 ☆入職時無資格の方には、介護職員初任者研修資格取得支援制度あり 　資格のいらない範囲で働きながら勉強し、資格取得できます。 　※正社員のみ(月給18万7000～19万1000円) 　※当社規程有",
                              style: TextStyle(
                                  // fontSize: 16,
                                  ),
                            ),
                          ),
                        ),
                      ),

                      _buildColumnTwo('都道府県'),

                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey[500], width: 1),
                        ),
                        child: ListTile(
                          title: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: Text(
                              "千葉県",
                              style: TextStyle(
                                  // fontSize: 16,
                                  ),
                            ),
                          ),
                        ),
                      ),

                      _buildColumnTwo('市区町村'),

                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey[500], width: 1),
                        ),
                        child: ListTile(
                          title: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: Text(
                              "船橋市",
                              style: TextStyle(
                                  // fontSize: 16,
                                  ),
                            ),
                          ),
                        ),
                      ),

                      _buildColumnTwo('勤務地'),

                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey[500], width: 1),
                        ),
                        child: ListTile(
                          title: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: Text(
                              "滝台２丁目１−１",
                              style: TextStyle(
                                  // fontSize: 16,
                                  ),
                            ),
                          ),
                        ),
                      ),

                      _buildColumnOne('最寄り駅'),

                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey[500], width: 1),
                        ),
                        child: ListTile(
                          title: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: Text(
                              "新京成線「薬園台駅」",
                              style: TextStyle(
                                  // fontSize: 16,
                                  ),
                            ),
                          ),
                        ),
                      ),

                      _buildColumnOne('給料'),


                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey[500], width: 1),
                        ),
                        child: ListTile(
                          title: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: Text(
                              "月給24万3500円～28万7500円 ( 夜勤手当5回分と諸手当含む 別途、夏季・冬季賞与　(約2ヶ月分) ) ",
                              style: TextStyle(
                                  // fontSize: 16,
                                  ),
                            ),
                          ),
                        ),
                      ),

                      _buildColumnOne('特別な条件'),

                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey[500], width: 1),
                        ),
                        child: ListTile(
                          title: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: Text(
                              "夜勤手当、業績手当10,000円~25,000円、年末年始手当、時間外勤務手当、資格手当 交通費支給費：月2万1000円まで",
                              style: TextStyle(
                                  // fontSize: 16,
                                  ),
                            ),
                          ),
                        ),
                      ),
                      
                      _buildColumnOne('各種保険'),

                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey[500], width: 1),
                        ),
                        child: ListTile(
                          title: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: Text(
                              "健康保険、厚生年金保険、労災保険、雇用保険",
                              style: TextStyle(
                                  // fontSize: 16,
                                  ),
                            ),
                          ),
                        ),
                      ),


                      _buildColumnOne('就業時間'),

                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey[500], width: 1),
                        ),
                        child: ListTile(
                          title: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: Text(
                              "日勤／7:00～16:00（休憩1時間）　9:00～18:00（休憩1時間）　10:00～19:00（休憩1時間）　夜勤／16:00～翌10:00（休憩2時間）",
                              style: TextStyle(
                                  // fontSize: 16,
                                  ),
                            ),
                          ),
                        ),
                      ),


                      _buildColumnOne('休日休暇'),


                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey[500], width: 1),
                        ),
                        child: ListTile(
                          title: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: Text(
                              "月公休9日（2月16日～3月15日のシフトのみ8日とする）\n 年間休日111日 \n 夏期休暇 \n冬期休暇",
                              style: TextStyle(
                                  // fontSize: 16,
                                  ),
                            ),
                          ),
                        ),
                      ),

                      _buildColumnOne('施設名'),

                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey[500], width: 1),
                        ),
                        child: ListTile(
                          title: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: Row(
                              children: [
                                Text(
                                  "ベストライフ船橋薬園台",
                                  style: TextStyle(
                                      // fontSize: 16,
                                      ),
                                ),
                                SizedBox(
                                  width: 20.0,
                                ),

                                Card(
                                        margin: EdgeInsets.symmetric(horizontal: 0, vertical: 10.0),
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        side: BorderSide(color: Colors.grey)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(6.0),
                                          child: Text(
                                            "施設詳細",
                                            style: TextStyle(color: Colors.blue),
                                          ),
                                        ),
                                ),
                              ],
                            )
                          ),
                        ),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin:
                                EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
                            child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>JobScreen()));
                                },
                                color: Colors.grey,
                                textColor: Colors.white,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 20),
                                      child: Text('この案件に応募する',
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
        ],
      ),
    ),
    );
  }

  Widget _buildColumnOne(String name){
    return Container(
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey[500], width: 1),
      color: Colors.grey[200],
    ),
    child: ListTile(
      leading: CircleAvatar(
        foregroundColor: Colors.black,
        radius: 18.0,
        backgroundColor: Colors.grey[200],
        // child: Icon(
        //   Icons.insert_drive_file,
        //   color: Colors.blue,
        // ),
      ),
      title: Text(name, style: TextStyle(
        fontWeight: FontWeight.bold,
      ),),
    ),
    );
  }

  Widget _buildColumnTwo(String name){
    return Container(
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey[500], width: 1),
      color: Colors.grey[200],
    ),
    child: ListTile(
      leading: CircleAvatar(
        foregroundColor: Colors.black,
        radius: 18.0,
        backgroundColor: Colors.grey[200],
        child: Icon(
          Icons.location_on,
          color: Colors.red,
        ),
      ),
      title: Text(name, style: TextStyle(
      fontWeight: FontWeight.bold,
    )),
    ),
    );
  }
}
