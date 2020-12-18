import 'package:flutter/material.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:tis/views/jobdetail.dart';
import 'package:tis/views/test1.dart';

class JobType {
  String title;
  bool value;

  JobType({
    @required this.title,
    this.value = false,
  });
}

class JobSearch extends StatefulWidget {
  JobSearch({Key key}) : super(key: key);
  @override
  _JobSearchState createState() => _JobSearchState();
}

class _JobSearchState extends State<JobSearch> {
  final occupation = [
    JobType(title: '正社員(正職員) '),
    JobType(title: '契約社員(職員) '),
    JobType(title: '非常勤/パート '),
    JobType(title: 'その他 ')
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          Row(
            children: [
              SizedBox(
                width: 15.0,
              ),
              Icon(Icons.map),
              SizedBox(
                width: 5.0,
              ),
              Text(
                '地図検索 「千葉県の求人 14 件」',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 5.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: DottedLine(),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              SizedBox(
                width: 10.0,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey,
                ),
                width: 6.0,
                height: 40.0,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 25.0,
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                ),
                child: Text(
                  '現在の検索条件',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            children: [
              SizedBox(
                width: 10.0,
              ),

              // Text("地域で絞り込む"),

              // Container(

              //   height: 300.0,
              //   decoration: BoxDecoration(
              //     border: Border.all(width: 1.0, color: Colors.grey[500]),
              //   ),

              //   child: Padding(
              //     padding: const EdgeInsets.all(8.0),

              //     child: Text('地域', style: TextStyle(
              //       fontSize: 14.0,
              //       fontWeight: FontWeight.bold,
              //     ),),
              //   ),

              // ),
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8.0),
            decoration: BoxDecoration(
                // color: Colors.amber,
                border: Border.all(width: 1.0, color: Colors.grey[300])),
            // color: Colors.amber[300],
            child: Column(
              children: [
                Container(
                  color: Colors.grey[300],
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 10.0, top: 10.0, bottom: 10),
                        child: Text(
                          '地域',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                // SizedBox(
                //   child: Divider(
                //     color: Colors.grey[300],
                //     thickness: 0.9,
                //   ),
                // ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 20.0),
                      child: _dropDownBox("Testing"),
                    ),
                  ],
                ),

                

                // SizedBox(
                //   child: Divider(
                //     color: Colors.grey[300],
                //     thickness: 0.9,
                //   ),
                // ),
                Container(
                  color: Colors.grey[300],
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 10.0, top: 10.0, bottom: 10.0),
                        child: Text(
                          '職種',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),

                  
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 20.0),
                      child: _dropDownCheckBox("Select"),
                    ),
                  ],
                ),
                // SizedBox(
                //   child: Divider(
                //     color: Colors.grey[300],
                //     thickness: 0.9,
                //   ),
                // ),
                SizedBox(
                  child: Divider(
                    color: Colors.grey[300],
                    thickness: 0.9,
                  ),
                ),
                Container(
                  color: Colors.grey[300],
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 10.0, top: 10.0, bottom: 10.0),
                        child: Text(
                          '雇用形態',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                // SizedBox(
                //   child: Divider(
                //     color: Colors.grey[300],
                //     thickness: 0.9,
                //   ),
                // ),

                Column(
                  children: [
                    ...occupation.map(buildJobCheckbox).toList(),
                    // Center(
                    //   child: ListView(
                    //       children: [
                    //         // ...occupation.map(buildJobCheckbox).toList(),
                    //       ],
                    //     ),
                    // )
                  ],
                )
              ],
            ),
          ),
          SizedBox(width: 10.0),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
            child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                onPressed: () {},
                color: Colors.green,
                textColor: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.search,
                      size: 22.0,
                    ),
                    Text('検索',
                        style: TextStyle(
                          fontSize: 16,
                        )),
                  ],
                )),
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(5.0),
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 0.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Text("施設番号:500009-0001"),
                ),

                InkWell(
                  child: Text(
                    '介護職【正社員】アスモ介護サービス薬園台',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  onTap: () {
                    
                  },
                ),

                // Text('介護職【正社員】アスモ介護サービス薬園台',
                //   style: TextStyle(
                //     fontSize: 14,
                //     fontWeight: FontWeight.bold,
                //     color: Colors.grey,
                //     decoration: TextDecoration.underline,
                //   ),
                // ),

                Card(
                  margin: EdgeInsets.symmetric(horizontal: 0, vertical: 10.0),
                  color: Colors.blue,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      "正職員",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),

                Divider(thickness: 1),

                Container(
                    margin: EdgeInsets.only(top: 12.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[500], width: 1.0),
                      color: Colors.grey[300],
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        foregroundColor: Colors.black,
                        radius: 18.0,
                        backgroundColor: Colors.grey[200],
                        child: Icon(
                          Icons.location_on,
                          color: Colors.blue,
                        ),
                      ),
                      title: Text("最寄り駅"),
                    )),

                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[500], width: 1.0),
                  ),
                  child: ListTile(
                    title: Text(
                      "新京成線「薬園台駅」",
                      style: TextStyle(
                          // fontSize: 16,
                          ),
                    ),
                  ),
                ),

                Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[500], width: 1.0),
                      color: Colors.grey[300],
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        foregroundColor: Colors.black,
                        radius: 18.0,
                        backgroundColor: Colors.grey[200],
                        child: Text("¥",
                            style: TextStyle(fontSize: 20, color: Colors.blue)),
                      ),
                      title: Text("給料"),
                    )),

                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[500], width: 1.0),
                  ),
                  child: ListTile(
                    title: Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Text(
                        "月給24万3500円～28万7500円 ( 夜勤手当5回分と諸手当含む 別途、夏季・冬季賞与　(約2ヶ月分) ) ",
                        style: TextStyle(
                            // fontSize: 14,
                            ),
                      ),
                    ),
                  ),
                ),

                Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[500], width: 1.0),
                      color: Colors.grey[300],
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        foregroundColor: Colors.black,
                        radius: 18.0,
                        backgroundColor: Colors.grey[200],
                        child: Text("時",
                            style: TextStyle(fontSize: 20, color: Colors.blue)),
                      ),
                      title: Text("就業時間/休日休暇"),
                    )),

                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[500], width: 1.0),
                  ),
                  child: ListTile(
                    title: Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Text(
                        "日勤／7:00～16:00（休憩1時間）　9:00～18:00（休憩1時間）　10:00～19:00（休憩1時間）　夜勤／16:00～翌10:00（休憩2時間） / 月公休9日（2月16日～3月15日のシフトのみ8日とする） 年間休日111日 夏期休暇 冬期休暇 ",
                        style: TextStyle(
                            // fontSize: 14,
                            ),
                      ),
                    ),
                  ),
                ),

                Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[500], width: 1.0),
                      color: Colors.grey[300],
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        foregroundColor: Colors.black,
                        radius: 18.0,
                        backgroundColor: Colors.grey[200],
                        child: Icon(
                          Icons.home_repair_service,
                          color: Colors.blue,
                        ),
                      ),
                      title: Text("特別な条件"),
                    )),

                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[500], width: 1.0),
                  ),
                  child: ListTile(
                    title: Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Text(
                        "夜勤手当、業績手当10,000円~25,000円、年末年始手当、時間外勤務手当、資格手当 交通費支給費：月2万1000円まで ",
                        style: TextStyle(
                            // fontSize: 14,
                            ),
                      ),
                    ),
                  ),
                ),

                Container(
                  margin:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
                  child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => JobDetail()),
                        );
                      },
                      color: Colors.grey,
                      textColor: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // InkWell(
                          //   child:  Text('詳細を見る',
                          //      style: TextStyle(
                          //       fontSize: 16,
                          //      )),
                          //   onTap: (){
                          //     // Navigator.push(context, MaterialPageRoute(builder: (context)=> JobDetail()));
                          //       //  Navigator.push(context, MaterialPageRoute(builder: (context)=> TestCB()));
                          //   },
                          // ),

                          Text('詳細を見る',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.amber,
                              )),

                          

                        ],
                      )),
                ),
              ],
            ),
          ),

          Container(
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(5.0),
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 0.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Text("求人番号:500009-0002-0002"),
                ),

                InkWell(
                  child: Text(
                    '介護職【正社員】アスモ介護サービス三鷹(三',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  onTap: () {},
                ),

                // Text('介護職【正社員】アスモ介護サービス薬園台',
                //   style: TextStyle(
                //     fontSize: 14,
                //     fontWeight: FontWeight.bold,
                //     color: Colors.grey,
                //     decoration: TextDecoration.underline,
                //   ),
                // ),

                Card(
                  margin: EdgeInsets.symmetric(horizontal: 0, vertical: 10.0),
                  color: Colors.blue,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      "正職員",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),

                Divider(thickness: 1),

                Container(
                    margin: EdgeInsets.only(top: 12.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[500], width: 1.0),
                      color: Colors.grey[300],
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        foregroundColor: Colors.black,
                        radius: 18.0,
                        backgroundColor: Colors.grey[200],
                        child: Icon(
                          Icons.location_on,
                          color: Colors.blue,
                        ),
                      ),
                      title: Text("最寄り駅"),
                    )),

                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[500], width: 1.0),
                  ),
                  child: ListTile(
                    title: Text(
                      "京王線 仙川駅(中原小学校前バス停　下車　徒歩4分)",
                      style: TextStyle(
                          // fontSize: 16,
                          ),
                    ),
                  ),
                ),

                Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[500], width: 1.0),
                      color: Colors.grey[300],
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        foregroundColor: Colors.black,
                        radius: 18.0,
                        backgroundColor: Colors.grey[200],
                        child: Text("¥",
                            style: TextStyle(fontSize: 20, color: Colors.blue)),
                      ),
                      title: Text("給料"),
                    )),

                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[500], width: 1.0),
                  ),
                  child: ListTile(
                    title: Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Text(
                        "月給24万3500円～28万7500円 ( 夜勤手当5回分と諸手当含む 別途、夏季・冬季賞与　(約2ヶ月分) ) ",
                        style: TextStyle(
                            // fontSize: 14,
                            ),
                      ),
                    ),
                  ),
                ),

                Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[500], width: 1.0),
                      color: Colors.grey[300],
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        foregroundColor: Colors.black,
                        radius: 18.0,
                        backgroundColor: Colors.grey[200],
                        child: Text("時",
                            style: TextStyle(fontSize: 20, color: Colors.blue)),
                      ),
                      title: Text("就業時間/休日休暇"),
                    )),

                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[500], width: 1.0),
                  ),
                  child: ListTile(
                    title: Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Text(
                        "日勤／7:00～16:00（休憩1時間）　9:00～18:00（休憩1時間）　10:00～19:00（休憩1時間）　夜勤／16:00～翌10:00（休憩2時間） / 月公休9日（2月16日～3月15日のシフトのみ8日とする） 年間休日111日 夏期休暇 冬期休暇 ",
                        style: TextStyle(
                            // fontSize: 14,
                            ),
                      ),
                    ),
                  ),
                ),

                Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[500], width: 1.0),
                      color: Colors.grey[300],
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        foregroundColor: Colors.black,
                        radius: 18.0,
                        backgroundColor: Colors.grey[200],
                        child: Icon(
                          Icons.home_repair_service,
                          color: Colors.blue,
                        ),
                      ),
                      title: Text("特別な条件"),
                    )),

                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[500], width: 1.0),
                  ),
                  child: ListTile(
                    title: Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Text(
                        "夜勤手当、業績手当10,000円~25,000円、年末年始手当、時間外勤務手当、資格手当 交通費支給費：月2万1000円まで ",
                        style: TextStyle(
                            // fontSize: 14,
                            ),
                      ),
                    ),
                  ),
                ),

                Container(
                  margin:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
                  child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      onPressed: () {},
                      color: Colors.grey,
                      textColor: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('詳細を見る',
                              style: TextStyle(
                                fontSize: 16,
                              )),
                        ],
                      )),
                ),
              ],
            ),
          ),

          Container(
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(5.0),
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 0.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Text("求人番号:500009-0001-0005"),
                ),

                InkWell(
                  child: Text(
                    '介護タクシードライバー【正社員】アスモ介護',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  onTap: () {},
                ),

                // Text('介護職【正社員】アスモ介護サービス薬園台',
                //   style: TextStyle(
                //     fontSize: 14,
                //     fontWeight: FontWeight.bold,
                //     color: Colors.grey,
                //     decoration: TextDecoration.underline,
                //   ),
                // ),

                Card(
                  margin: EdgeInsets.symmetric(horizontal: 0, vertical: 10.0),
                  color: Colors.blue,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      "正職員",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),

                Divider(thickness: 1),

                Container(
                    margin: EdgeInsets.only(top: 12.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[500], width: 1.0),
                      color: Colors.grey[300],
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        foregroundColor: Colors.black,
                        radius: 18.0,
                        backgroundColor: Colors.grey[200],
                        child: Icon(
                          Icons.location_on,
                          color: Colors.blue,
                        ),
                      ),
                      title: Text("最寄り駅"),
                    )),

                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[500], width: 1.0),
                  ),
                  child: ListTile(
                    title: Text(
                      "新京成線「薬園台駅」",
                      style: TextStyle(
                          // fontSize: 16,
                          ),
                    ),
                  ),
                ),

                Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[500], width: 1.0),
                      color: Colors.grey[300],
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        foregroundColor: Colors.black,
                        radius: 18.0,
                        backgroundColor: Colors.grey[200],
                        child: Text("¥",
                            style: TextStyle(fontSize: 20, color: Colors.blue)),
                      ),
                      title: Text("給料"),
                    )),

                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[500], width: 1.0),
                  ),
                  child: ListTile(
                    title: Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Text(
                        "月給23万1000円～25万円 ( 運行手当含む 別途、夏季・冬季賞与　(約2ヶ月分) ) ",
                        style: TextStyle(
                            // fontSize: 14,
                            ),
                      ),
                    ),
                  ),
                ),

                Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[500], width: 1.0),
                      color: Colors.grey[300],
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        foregroundColor: Colors.black,
                        radius: 18.0,
                        backgroundColor: Colors.grey[200],
                        child: Text("時",
                            style: TextStyle(fontSize: 20, color: Colors.blue)),
                      ),
                      title: Text("就業時間/休日休暇"),
                    )),

                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[500], width: 1.0),
                  ),
                  child: ListTile(
                    title: Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Text(
                        "（早番）7：00～16：00 (休憩1時間)　 （日勤）9：00～18：00 (休憩1時間) （遅番）10：00～19：00 (休憩1時間) ※時間外勤務有り 月平均10時間 / 月公休9日（2月16日～3月15日のシフトのみ8日とする） 年間休日111日 夏期休暇 冬期休暇 ",
                        style: TextStyle(
                            // fontSize: 14,
                            ),
                      ),
                    ),
                  ),
                ),

                Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[500], width: 1.0),
                      color: Colors.grey[300],
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        foregroundColor: Colors.black,
                        radius: 18.0,
                        backgroundColor: Colors.grey[200],
                        child: Icon(
                          Icons.home_repair_service,
                          color: Colors.blue,
                        ),
                      ),
                      title: Text("特別な条件"),
                    )),

                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[500], width: 1.0),
                  ),
                  child: ListTile(
                    title: Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Text(
                        "業績手当10,000円~25,000円、年末年始手当、時間外勤務手当、資格手当 交通費支給費：月2万1000円まで ",
                        style: TextStyle(
                            // fontSize: 14,
                            ),
                      ),
                    ),
                  ),
                ),

                Container(
                  margin:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
                  child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      onPressed: () {},
                      color: Colors.grey,
                      textColor: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('詳細を見る',
                              style: TextStyle(
                                fontSize: 16,
                              )),
                        ],
                      )),
                ),
              ],
            ),
          ),

          Container(
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(5.0),
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 0.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Text("求人番号:500009-0002-0007"),
                ),

                InkWell(
                  child: Text(
                    '介護タクシードライバー【正社員】アスモ介護',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  onTap: () {},
                ),

                // Text('介護職【正社員】アスモ介護サービス薬園台',
                //   style: TextStyle(
                //     fontSize: 14,
                //     fontWeight: FontWeight.bold,
                //     color: Colors.grey,
                //     decoration: TextDecoration.underline,
                //   ),
                // ),

                Card(
                  margin: EdgeInsets.symmetric(horizontal: 0, vertical: 10.0),
                  color: Colors.blue,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      "正職員",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),

                Divider(thickness: 1),

                Container(
                    margin: EdgeInsets.only(top: 12.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[500], width: 1.0),
                      color: Colors.grey[300],
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        foregroundColor: Colors.black,
                        radius: 18.0,
                        backgroundColor: Colors.grey[200],
                        child: Icon(
                          Icons.location_on,
                          color: Colors.blue,
                        ),
                      ),
                      title: Text("最寄り駅"),
                    )),

                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[500], width: 1.0),
                  ),
                  child: ListTile(
                    title: Text(
                      "京王線 仙川駅(中原小学校前バス停　下車　徒歩4分)",
                      style: TextStyle(
                          // fontSize: 16,
                          ),
                    ),
                  ),
                ),

                Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[500], width: 1.0),
                      color: Colors.grey[300],
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        foregroundColor: Colors.black,
                        radius: 18.0,
                        backgroundColor: Colors.grey[200],
                        child: Text("¥",
                            style: TextStyle(fontSize: 20, color: Colors.blue)),
                      ),
                      title: Text("給料"),
                    )),

                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[500], width: 1.0),
                  ),
                  child: ListTile(
                    title: Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Text(
                        "月給231,000円～250,000円 ( 運行手当含む 別途、夏季・冬季賞与　(約2ヶ月分) ) ",
                        style: TextStyle(
                            // fontSize: 14,
                            ),
                      ),
                    ),
                  ),
                ),

                Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[500], width: 1.0),
                      color: Colors.grey[300],
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        foregroundColor: Colors.black,
                        radius: 18.0,
                        backgroundColor: Colors.grey[200],
                        child: Text("時",
                            style: TextStyle(fontSize: 20, color: Colors.blue)),
                      ),
                      title: Text("就業時間/休日休暇"),
                    )),

                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[500], width: 1.0),
                  ),
                  child: ListTile(
                    title: Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Text(
                        "（早番）7：00～16：00 (休憩1時間)（日勤）9：00～18：00 (休憩1時間) （遅番）10：00～19：00 (休憩1時間) ※時間外勤務有り 月平均10時間 / 月公休9日（2月16日～3月15日のシフトのみ8日とする） 年間休日111日 夏期休暇 冬期休暇 ",
                        style: TextStyle(
                            // fontSize: 14,
                            ),
                      ),
                    ),
                  ),
                ),

                Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[500], width: 1.0),
                      color: Colors.grey[300],
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        foregroundColor: Colors.black,
                        radius: 18.0,
                        backgroundColor: Colors.grey[200],
                        child: Icon(
                          Icons.home_repair_service,
                          color: Colors.blue,
                        ),
                      ),
                      title: Text("特別な条件"),
                    )),

                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[500], width: 1.0),
                  ),
                  child: ListTile(
                    title: Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Text(
                        "業績手当10,000円~25,000円、年末年始手当、時間外勤務手当、資格手当 ",
                        style: TextStyle(
                            // fontSize: 14,
                            ),
                      ),
                    ),
                  ),
                ),

                Container(
                  margin:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
                  child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      onPressed: () {},
                      color: Colors.grey,
                      textColor: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('詳細を見る',
                              style: TextStyle(
                                fontSize: 16,
                              )),
                        ],
                      )),
                ),
              ],
            ),
          ),


          Container(
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(5.0),
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 0.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Text("求人番号:500009-0004-0008"),
                ),

                InkWell(
                  child: Text(
                    '介護職【正社員】アスモ介護サービス釜利谷(金沢文庫Ⅱ)★未経験の方も安心!',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  onTap: () {},
                ),

                // Text('介護職【正社員】アスモ介護サービス薬園台',
                //   style: TextStyle(
                //     fontSize: 14,
                //     fontWeight: FontWeight.bold,
                //     color: Colors.grey,
                //     decoration: TextDecoration.underline,
                //   ),
                // ),

                Card(
                  margin: EdgeInsets.symmetric(horizontal: 0, vertical: 10.0),
                  color: Colors.blue,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      "正職員",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),

                Divider(thickness: 1),

                Container(
                    margin: EdgeInsets.only(top: 12.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[500], width: 1.0),
                      color: Colors.grey[300],
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        foregroundColor: Colors.black,
                        radius: 18.0,
                        backgroundColor: Colors.grey[200],
                        child: Icon(
                          Icons.location_on,
                          color: Colors.blue,
                        ),
                      ),
                      title: Text("最寄り駅"),
                    )),

                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[500], width: 1.0),
                  ),
                  child: ListTile(
                    title: Text(
                      "京急本線「金沢文庫駅」徒歩4分",
                      style: TextStyle(
                          // fontSize: 16,
                          ),
                    ),
                  ),
                ),

                Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[500], width: 1.0),
                      color: Colors.grey[300],
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        foregroundColor: Colors.black,
                        radius: 18.0,
                        backgroundColor: Colors.grey[200],
                        child: Text("¥",
                            style: TextStyle(fontSize: 20, color: Colors.blue)),
                      ),
                      title: Text("給料"),
                    )),

                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[500], width: 1.0),
                  ),
                  child: ListTile(
                    title: Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Text(
                        "月給24万3500円～28万7500円 ( 夜勤手当5回分と諸手当含む 別途、夏季・冬季賞与　(約2ヶ月分) ) ",
                        style: TextStyle(
                            // fontSize: 14,
                            ),
                      ),
                    ),
                  ),
                ),

                Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[500], width: 1.0),
                      color: Colors.grey[300],
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        foregroundColor: Colors.black,
                        radius: 18.0,
                        backgroundColor: Colors.grey[200],
                        child: Text("時",
                            style: TextStyle(fontSize: 20, color: Colors.blue)),
                      ),
                      title: Text("就業時間/休日休暇"),
                    )),

                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[500], width: 1.0),
                  ),
                  child: ListTile(
                    title: Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Text(
                        "日勤／7:00～16:00（休憩1時間）　9:00～18:00（休憩1時間）　10:00～19:00（休憩1時間）　夜勤／16:00～翌10:00（休憩2時間） / 月公休9日（2月16日～3月15日のシフトのみ8日とする） 年間休日111日 夏期休暇 冬期休暇",
                        style: TextStyle(
                            // fontSize: 14,
                            ),
                      ),
                    ),
                  ),
                ),

                Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[500], width: 1.0),
                      color: Colors.grey[300],
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        foregroundColor: Colors.black,
                        radius: 18.0,
                        backgroundColor: Colors.grey[200],
                        child: Icon(
                          Icons.home_repair_service,
                          color: Colors.blue,
                        ),
                      ),
                      title: Text("特別な条件"),
                    )),

                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[500], width: 1.0),
                  ),
                  child: ListTile(
                    title: Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Text(
                        "夜勤手当、業績手当10,000円~25,000円、年末年始手当、時間外勤務手当、資格手当 交通費支給費：月2万1000円まで ",
                        style: TextStyle(
                            // fontSize: 14,
                            ),
                      ),
                    ),
                  ),
                ),

                Container(
                  margin:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
                  child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      onPressed: () {},
                      color: Colors.grey,
                      textColor: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('詳細を見る',
                              style: TextStyle(
                                fontSize: 16,
                              )),
                        ],
                      )),
                ),
              ],
            ),
          ),

          Container(
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(5.0),
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 0.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Text("求人番号:500009-0004-0009"),
                ),

                InkWell(
                  child: Text(
                    '夜勤専門介護職【パート】アスモ介護サービス釜利谷(金沢文庫Ⅱ)★未経験の',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  onTap: () {},
                ),

                // Text('介護職【正社員】アスモ介護サービス薬園台',
                //   style: TextStyle(
                //     fontSize: 14,
                //     fontWeight: FontWeight.bold,
                //     color: Colors.grey,
                //     decoration: TextDecoration.underline,
                //   ),
                // ),

                Card(
                  margin: EdgeInsets.symmetric(horizontal: 0, vertical: 10.0),
                  color: Colors.blue,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      "正職員",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),

                Divider(thickness: 1),

                Container(
                    margin: EdgeInsets.only(top: 12.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[500], width: 1.0),
                      color: Colors.grey[300],
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        foregroundColor: Colors.black,
                        radius: 18.0,
                        backgroundColor: Colors.grey[200],
                        child: Icon(
                          Icons.location_on,
                          color: Colors.blue,
                        ),
                      ),
                      title: Text("最寄り駅"),
                    )),

                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[500], width: 1.0),
                  ),
                  child: ListTile(
                    title: Text(
                      "京急本線「金沢文庫駅」徒歩4分",
                      style: TextStyle(
                          // fontSize: 16,
                          ),
                    ),
                  ),
                ),

                Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[500], width: 1.0),
                      color: Colors.grey[300],
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        foregroundColor: Colors.black,
                        radius: 18.0,
                        backgroundColor: Colors.grey[200],
                        child: Text("¥",
                            style: TextStyle(fontSize: 20, color: Colors.blue)),
                      ),
                      title: Text("給料"),
                    )),

                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[500], width: 1.0),
                  ),
                  child: ListTile(
                    title: Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Text(
                        "時給1,130～1,270円＋6500円（夜勤手当）/1勤務 ",
                        style: TextStyle(
                            // fontSize: 14,
                            ),
                      ),
                    ),
                  ),
                ),

                Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[500], width: 1.0),
                      color: Colors.grey[300],
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        foregroundColor: Colors.black,
                        radius: 18.0,
                        backgroundColor: Colors.grey[200],
                        child: Text("時",
                            style: TextStyle(fontSize: 20, color: Colors.blue)),
                      ),
                      title: Text("就業時間/休日休暇"),
                    )),

                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[500], width: 1.0),
                  ),
                  child: ListTile(
                    title: Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Text(
                        "16:00～翌10:00（休憩2時間） ※月に5～10回ほど入って頂ける方 　日数・曜日ご相談下さい。 / 週１日～OK! ",
                        style: TextStyle(
                            // fontSize: 14,
                            ),
                      ),
                    ),
                  ),
                ),

                Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[500], width: 1.0),
                      color: Colors.grey[300],
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        foregroundColor: Colors.black,
                        radius: 18.0,
                        backgroundColor: Colors.grey[200],
                        child: Icon(
                          Icons.home_repair_service,
                          color: Colors.blue,
                        ),
                      ),
                      title: Text("特別な条件"),
                    )),

                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[500], width: 1.0),
                  ),
                  child: ListTile(
                    title: Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Text(
                        "夜勤手当、年末年始手当、資格手当 交通費支給費：月2万1000円まで",
                        style: TextStyle(
                            // fontSize: 14,
                            ),
                      ),
                    ),
                  ),
                ),

                Container(
                  margin:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
                  child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      onPressed: () {},
                      color: Colors.grey,
                      textColor: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('詳細を見る',
                              style: TextStyle(
                                fontSize: 16,
                              )),
                        ],
                      )),
                ),
              ],
            ),
          ),

          Container(
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(5.0),
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 0.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Text("求人番号:500009-0006-0010"),
                ),

                InkWell(
                  child: Text(
                    '介護職【正社員】アスモ介護サービス桜木(都賀)★未経験の方も安心!',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  onTap: () {},
                ),

                // Text('介護職【正社員】アスモ介護サービス薬園台',
                //   style: TextStyle(
                //     fontSize: 14,
                //     fontWeight: FontWeight.bold,
                //     color: Colors.grey,
                //     decoration: TextDecoration.underline,
                //   ),
                // ),

                Card(
                  margin: EdgeInsets.symmetric(horizontal: 0, vertical: 10.0),
                  color: Colors.blue,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      "正職員",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),

                Divider(thickness: 1),

                Container(
                    margin: EdgeInsets.only(top: 12.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[500], width: 1.0),
                      color: Colors.grey[300],
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        foregroundColor: Colors.black,
                        radius: 18.0,
                        backgroundColor: Colors.grey[200],
                        child: Icon(
                          Icons.location_on,
                          color: Colors.blue,
                        ),
                      ),
                      title: Text("最寄り駅"),
                    )),

                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[500], width: 1.0),
                  ),
                  child: ListTile(
                    title: Text(
                      "千葉都市モノレール「桜木駅」徒歩13分",
                      style: TextStyle(
                          // fontSize: 16,
                          ),
                    ),
                  ),
                ),

                Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[500], width: 1.0),
                      color: Colors.grey[300],
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        foregroundColor: Colors.black,
                        radius: 18.0,
                        backgroundColor: Colors.grey[200],
                        child: Text("¥",
                            style: TextStyle(fontSize: 20, color: Colors.blue)),
                      ),
                      title: Text("給料"),
                    )),

                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[500], width: 1.0),
                  ),
                  child: ListTile(
                    title: Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Text(
                        "月給24万3500円～28万7500円 ( 夜勤手当5回分と諸手当含む 別途、夏季・冬季賞与　(約2ヶ月分) ) ",
                        style: TextStyle(
                            // fontSize: 14,
                            ),
                      ),
                    ),
                  ),
                ),

                Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[500], width: 1.0),
                      color: Colors.grey[300],
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        foregroundColor: Colors.black,
                        radius: 18.0,
                        backgroundColor: Colors.grey[200],
                        child: Text("時",
                            style: TextStyle(fontSize: 20, color: Colors.blue)),
                      ),
                      title: Text("就業時間/休日休暇"),
                    )),

                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[500], width: 1.0),
                  ),
                  child: ListTile(
                    title: Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Text(
                        "日勤／7:00～16:00（休憩1時間）　9:00～18:00（休憩1時間）　10:00～19:00（休憩1時間）　夜勤／16:00～翌10:00（休憩2時間） / 月公休9日（2月16日～3月15日のシフトのみ8日とする） 年間休日111日 夏期休暇 冬期休暇",
                        style: TextStyle(
                            // fontSize: 14,
                            ),
                      ),
                    ),
                  ),
                ),

                Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[500], width: 1.0),
                      color: Colors.grey[300],
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        foregroundColor: Colors.black,
                        radius: 18.0,
                        backgroundColor: Colors.grey[200],
                        child: Icon(
                          Icons.home_repair_service,
                          color: Colors.blue,
                        ),
                      ),
                      title: Text("特別な条件"),
                    )),

                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[500], width: 1.0),
                  ),
                  child: ListTile(
                    title: Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Text(
                        "夜勤手当、業績手当10,000円~25,000円、年末年始手当、時間外勤務手当、資格手当 交通費支給費：月2万1000円まで ",
                        style: TextStyle(
                            // fontSize: 14,
                            ),
                      ),
                    ),
                  ),
                ),

                Container(
                  margin:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
                  child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      onPressed: () {},
                      color: Colors.grey,
                      textColor: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('詳細を見る',
                              style: TextStyle(
                                fontSize: 16,
                              )),
                        ],
                      )),
                ),
              ],
            ),
          ),

          Container(
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(5.0),
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 0.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Text("求人番号:500009-0006-0011"),
                ),

                InkWell(
                  child: Text(
                    '日勤介護職【正社員】アスモ介護サービス桜木(都賀)　★夜勤なし!',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  onTap: () {},
                ),

                // Text('介護職【正社員】アスモ介護サービス薬園台',
                //   style: TextStyle(
                //     fontSize: 14,
                //     fontWeight: FontWeight.bold,
                //     color: Colors.grey,
                //     decoration: TextDecoration.underline,
                //   ),
                // ),

                Card(
                  margin: EdgeInsets.symmetric(horizontal: 0, vertical: 10.0),
                  color: Colors.blue,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      "正職員",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),

                Divider(thickness: 1),

                Container(
                    margin: EdgeInsets.only(top: 12.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[500], width: 1.0),
                      color: Colors.grey[300],
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        foregroundColor: Colors.black,
                        radius: 18.0,
                        backgroundColor: Colors.grey[200],
                        child: Icon(
                          Icons.location_on,
                          color: Colors.blue,
                        ),
                      ),
                      title: Text("最寄り駅"),
                    )),

                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[500], width: 1.0),
                  ),
                  child: ListTile(
                    title: Text(
                      "千葉都市モノレール「桜木駅」徒歩13分",
                      style: TextStyle(
                          // fontSize: 16,
                          ),
                    ),
                  ),
                ),

                Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[500], width: 1.0),
                      color: Colors.grey[300],
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        foregroundColor: Colors.black,
                        radius: 18.0,
                        backgroundColor: Colors.grey[200],
                        child: Text("¥",
                            style: TextStyle(fontSize: 20, color: Colors.blue)),
                      ),
                      title: Text("給料"),
                    )),

                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[500], width: 1.0),
                  ),
                  child: ListTile(
                    title: Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Text(
                        "月給20万2000円～23万1000円 ( 諸手当含む 別途、夏季・冬季賞与　(約2ヶ月分) ) ",
                        style: TextStyle(
                            // fontSize: 14,
                            ),
                      ),
                    ),
                  ),
                ),

                Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[500], width: 1.0),
                      color: Colors.grey[300],
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        foregroundColor: Colors.black,
                        radius: 18.0,
                        backgroundColor: Colors.grey[200],
                        child: Text("時",
                            style: TextStyle(fontSize: 20, color: Colors.blue)),
                      ),
                      title: Text("就業時間/休日休暇"),
                    )),

                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[500], width: 1.0),
                  ),
                  child: ListTile(
                    title: Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Text(
                        "日勤／7:00～16:00（休憩1時間）　9:00～18:00（休憩1時間）　10:00～19:00（休憩1時間） / 月公休9日（2月16日～3月15日のシフトのみ8日とする） 年間休日111日 夏期休暇 冬期休暇 ",
                        style: TextStyle(
                            // fontSize: 14,
                            ),
                      ),
                    ),
                  ),
                ),

                Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[500], width: 1.0),
                      color: Colors.grey[300],
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        foregroundColor: Colors.black,
                        radius: 18.0,
                        backgroundColor: Colors.grey[200],
                        child: Icon(
                          Icons.home_repair_service,
                          color: Colors.blue,
                        ),
                      ),
                      title: Text("特別な条件"),
                    )),

                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[500], width: 1.0),
                  ),
                  child: ListTile(
                    title: Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Text(
                        "業績手当10,000円~25,000円、年末年始手当、時間外勤務手当、資格手当 交通費支給費：月2万1000円まで ",
                        style: TextStyle(
                            // fontSize: 14,
                            ),
                      ),
                    ),
                  ),
                ),

                Container(
                  margin:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
                  child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      onPressed: () {},
                      color: Colors.grey,
                      textColor: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('詳細を見る',
                              style: TextStyle(
                                fontSize: 16,
                              )),
                        ],
                      )),
                ),
              ],
            ),
          ),

          Container(
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(5.0),
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 0.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Text("求人番号:500009-0006-0012"),
                ),

                InkWell(
                  child: Text(
                    '介護スタッフ【パート】アスモ介護サービス桜木(都賀)★未経験の方も安心!',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  onTap: () {},
                ),

                // Text('介護職【正社員】アスモ介護サービス薬園台',
                //   style: TextStyle(
                //     fontSize: 14,
                //     fontWeight: FontWeight.bold,
                //     color: Colors.grey,
                //     decoration: TextDecoration.underline,
                //   ),
                // ),

                Card(
                  margin: EdgeInsets.symmetric(horizontal: 0, vertical: 10.0),
                  color: Colors.blue,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      "非常勤",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),

                Divider(thickness: 1),

                Container(
                    margin: EdgeInsets.only(top: 12.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[500], width: 1.0),
                      color: Colors.grey[300],
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        foregroundColor: Colors.black,
                        radius: 18.0,
                        backgroundColor: Colors.grey[200],
                        child: Icon(
                          Icons.location_on,
                          color: Colors.blue,
                        ),
                      ),
                      title: Text("最寄り駅"),
                    )),

                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[500], width: 1.0),
                  ),
                  child: ListTile(
                    title: Text(
                      "千葉都市モノレール「桜木駅」徒歩13分",
                      style: TextStyle(
                          // fontSize: 16,
                          ),
                    ),
                  ),
                ),

                Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[500], width: 1.0),
                      color: Colors.grey[300],
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        foregroundColor: Colors.black,
                        radius: 18.0,
                        backgroundColor: Colors.grey[200],
                        child: Text("¥",
                            style: TextStyle(fontSize: 20, color: Colors.blue)),
                      ),
                      title: Text("給料"),
                    )),

                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[500], width: 1.0),
                  ),
                  child: ListTile(
                    title: Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Text(
                        "時給1,130～1,270円",
                        style: TextStyle(
                            // fontSize: 14,
                            ),
                      ),
                    ),
                  ),
                ),

                Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[500], width: 1.0),
                      color: Colors.grey[300],
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        foregroundColor: Colors.black,
                        radius: 18.0,
                        backgroundColor: Colors.grey[200],
                        child: Text("時",
                            style: TextStyle(fontSize: 20, color: Colors.blue)),
                      ),
                      title: Text("就業時間/休日休暇"),
                    )),

                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[500], width: 1.0),
                  ),
                  child: ListTile(
                    title: Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Text(
                        "早番／ 7:00～16:00 (休憩1時間) 中番／ 9:00～18:00 (休憩1時間) 遅番／10:00～19:00 (休憩1時間) ☆上記以外の時間帯もＯＫ！ 　１日４時間～ご相談に応じます。 ☆週１日～勤務日数・曜日ご相談に応じます / 週１日～OK! ",
                        style: TextStyle(
                            // fontSize: 14,
                            ),
                      ),
                    ),
                  ),
                ),

                Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[500], width: 1.0),
                      color: Colors.grey[300],
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        foregroundColor: Colors.black,
                        radius: 18.0,
                        backgroundColor: Colors.grey[200],
                        child: Icon(
                          Icons.home_repair_service,
                          color: Colors.blue,
                        ),
                      ),
                      title: Text("特別な条件"),
                    )),

                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[500], width: 1.0),
                  ),
                  child: ListTile(
                    title: Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Text(
                        "夜勤手当、年末年始手当、資格手当 交通費支給費：月2万1000円まで ",
                        style: TextStyle(
                            // fontSize: 14,
                            ),
                      ),
                    ),
                  ),
                ),

                Container(
                  margin:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
                  child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      onPressed: () {},
                      color: Colors.grey,
                      textColor: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('詳細を見る',
                              style: TextStyle(
                                fontSize: 16,
                              )),
                        ],
                      )),
                ),
              ],
            ),
          ),

          Container(
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(5.0),
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 0.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Text("求人番号:500009-0005-0013"),
                ),

                InkWell(
                  child: Text(
                    '介護スタッフ【パート】アスモ介護サービス鳩ヶ谷(鳩ヶ谷)★未経験の方も安心！',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  onTap: () {},
                ),

                // Text('介護職【正社員】アスモ介護サービス薬園台',
                //   style: TextStyle(
                //     fontSize: 14,
                //     fontWeight: FontWeight.bold,
                //     color: Colors.grey,
                //     decoration: TextDecoration.underline,
                //   ),
                // ),

                Card(
                  margin: EdgeInsets.symmetric(horizontal: 0, vertical: 10.0),
                  color: Colors.blue,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      "非常勤",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),

                Divider(thickness: 1),

                Container(
                    margin: EdgeInsets.only(top: 12.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[500], width: 1.0),
                      color: Colors.grey[300],
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        foregroundColor: Colors.black,
                        radius: 18.0,
                        backgroundColor: Colors.grey[200],
                        child: Icon(
                          Icons.location_on,
                          color: Colors.blue,
                        ),
                      ),
                      title: Text("最寄り駅"),
                    )),

                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[500], width: 1.0),
                  ),
                  child: ListTile(
                    title: Text(
                      "埼玉高速鉄道「鳩ヶ谷駅」徒歩10分",
                      style: TextStyle(
                          // fontSize: 16,
                          ),
                    ),
                  ),
                ),

                Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[500], width: 1.0),
                      color: Colors.grey[300],
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        foregroundColor: Colors.black,
                        radius: 18.0,
                        backgroundColor: Colors.grey[200],
                        child: Text("¥",
                            style: TextStyle(fontSize: 20, color: Colors.blue)),
                      ),
                      title: Text("給料"),
                    )),

                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[500], width: 1.0),
                  ),
                  child: ListTile(
                    title: Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Text(
                        "時給1,130～1,270円 ",
                        style: TextStyle(
                            // fontSize: 14,
                            ),
                      ),
                    ),
                  ),
                ),

                Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[500], width: 1.0),
                      color: Colors.grey[300],
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        foregroundColor: Colors.black,
                        radius: 18.0,
                        backgroundColor: Colors.grey[200],
                        child: Text("時",
                            style: TextStyle(fontSize: 20, color: Colors.blue)),
                      ),
                      title: Text("就業時間/休日休暇"),
                    )),

                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[500], width: 1.0),
                  ),
                  child: ListTile(
                    title: Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Text(
                        "早番／ 7:00～16:00 (休憩1時間) 中番／ 9:00～18:00 (休憩1時間) 遅番／10:00～19:00 (休憩1時間) ☆上記以外の時間帯もＯＫ！ 　１日４時間～ご相談に応じます。 ☆週１日～勤務日数・曜日ご相談に応じます / 週１日～OK!",
                        style: TextStyle(
                            // fontSize: 14,
                            ),
                      ),
                    ),
                  ),
                ),

                Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[500], width: 1.0),
                      color: Colors.grey[300],
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        foregroundColor: Colors.black,
                        radius: 18.0,
                        backgroundColor: Colors.grey[200],
                        child: Icon(
                          Icons.home_repair_service,
                          color: Colors.blue,
                        ),
                      ),
                      title: Text("特別な条件"),
                    )),

                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[500], width: 1.0),
                  ),
                  child: ListTile(
                    title: Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Text(
                        "夜勤手当、年末年始手当、資格手当 交通費支給費：月2万1000円まで ",
                        style: TextStyle(
                            // fontSize: 14,
                            ),
                      ),
                    ),
                  ),
                ),

                Container(
                  margin:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
                  child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      onPressed: () {},
                      color: Colors.grey,
                      textColor: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('詳細を見る',
                              style: TextStyle(
                                fontSize: 16,
                              )),
                        ],
                      )),
                ),
              ],
            ),
          ),

          Container(
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(5.0),
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 0.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Text("求人番号:500009-0003-0014"),
                ),

                InkWell(
                  child: Text(
                    '介護職【正社員】アスモ介護サービス豊中(豊中)★未経験の方も安心！',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  onTap: () {},
                ),

                // Text('介護職【正社員】アスモ介護サービス薬園台',
                //   style: TextStyle(
                //     fontSize: 14,
                //     fontWeight: FontWeight.bold,
                //     color: Colors.grey,
                //     decoration: TextDecoration.underline,
                //   ),
                // ),

                Card(
                  margin: EdgeInsets.symmetric(horizontal: 0, vertical: 10.0),
                  color: Colors.blue,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      "正職員",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),

                Divider(thickness: 1),

                Container(
                    margin: EdgeInsets.only(top: 12.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[500], width: 1.0),
                      color: Colors.grey[300],
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        foregroundColor: Colors.black,
                        radius: 18.0,
                        backgroundColor: Colors.grey[200],
                        child: Icon(
                          Icons.location_on,
                          color: Colors.blue,
                        ),
                      ),
                      title: Text("最寄り駅"),
                    )),

                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[500], width: 1.0),
                  ),
                  child: ListTile(
                    title: Text(
                      "大阪モノレール「小路駅」徒歩10分",
                      style: TextStyle(
                          // fontSize: 16,
                          ),
                    ),
                  ),
                ),

                Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[500], width: 1.0),
                      color: Colors.grey[300],
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        foregroundColor: Colors.black,
                        radius: 18.0,
                        backgroundColor: Colors.grey[200],
                        child: Text("¥",
                            style: TextStyle(fontSize: 20, color: Colors.blue)),
                      ),
                      title: Text("給料"),
                    )),

                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[500], width: 1.0),
                  ),
                  child: ListTile(
                    title: Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Text(
                        "月給23万3500円～27万7500円 ( 夜勤手当5回分と諸手当含む 別途、夏季・冬季賞与　(約2ヶ月分) )",
                        style: TextStyle(
                            // fontSize: 14,
                            ),
                      ),
                    ),
                  ),
                ),

                Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[500], width: 1.0),
                      color: Colors.grey[300],
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        foregroundColor: Colors.black,
                        radius: 18.0,
                        backgroundColor: Colors.grey[200],
                        child: Text("時",
                            style: TextStyle(fontSize: 20, color: Colors.blue)),
                      ),
                      title: Text("就業時間/休日休暇"),
                    )),

                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[500], width: 1.0),
                  ),
                  child: ListTile(
                    title: Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Text(
                        "日勤／7:00～16:00（休憩1時間）　9:00～18:00（休憩1時間）　10:00～19:00（休憩1時間）　夜勤／16:00～翌10:00（休憩2時間） / 月公休9日（2月16日～3月15日のシフトのみ8日とする） 年間休日111日 夏期休暇 冬期休暇 ",
                        style: TextStyle(
                            // fontSize: 14,
                            ),
                      ),
                    ),
                  ),
                ),

                Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[500], width: 1.0),
                      color: Colors.grey[300],
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        foregroundColor: Colors.black,
                        radius: 18.0,
                        backgroundColor: Colors.grey[200],
                        child: Icon(
                          Icons.home_repair_service,
                          color: Colors.blue,
                        ),
                      ),
                      title: Text("特別な条件"),
                    )),

                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[500], width: 1.0),
                  ),
                  child: ListTile(
                    title: Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Text(
                        "夜勤手当、業績手当10,000円~25,000円、年末年始手当、時間外勤務手当、資格手当 交通費支給費：月2万1000円まで ",
                        style: TextStyle(
                            // fontSize: 14,
                            ),
                      ),
                    ),
                  ),
                ),

                Container(
                  margin:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
                  child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      onPressed: () {},
                      color: Colors.grey,
                      textColor: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('詳細を見る',
                              style: TextStyle(
                                fontSize: 16,
                              )),
                        ],
                      )),
                ),
              ],
            ),
          ),

          Container(
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(5.0),
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 0.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Text("求人番号:500009-0003-0015"),
                ),

                InkWell(
                  child: Text(
                    '日勤介護職【正社員】アスモ介護サービス豊中(豊中)　★夜勤なし!',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  onTap: () {},
                ),

                // Text('介護職【正社員】アスモ介護サービス薬園台',
                //   style: TextStyle(
                //     fontSize: 14,
                //     fontWeight: FontWeight.bold,
                //     color: Colors.grey,
                //     decoration: TextDecoration.underline,
                //   ),
                // ),

                Card(
                  margin: EdgeInsets.symmetric(horizontal: 0, vertical: 10.0),
                  color: Colors.blue,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      "正職員",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),

                Divider(thickness: 1),

                Container(
                    margin: EdgeInsets.only(top: 12.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[500], width: 1.0),
                      color: Colors.grey[300],
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        foregroundColor: Colors.black,
                        radius: 18.0,
                        backgroundColor: Colors.grey[200],
                        child: Icon(
                          Icons.location_on,
                          color: Colors.blue,
                        ),
                      ),
                      title: Text("最寄り駅"),
                    )),

                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[500], width: 1.0),
                  ),
                  child: ListTile(
                    title: Text(
                      "大阪モノレール「小路駅」徒歩10分",
                      style: TextStyle(
                          // fontSize: 16,
                          ),
                    ),
                  ),
                ),

                Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[500], width: 1.0),
                      color: Colors.grey[300],
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        foregroundColor: Colors.black,
                        radius: 18.0,
                        backgroundColor: Colors.grey[200],
                        child: Text("¥",
                            style: TextStyle(fontSize: 20, color: Colors.blue)),
                      ),
                      title: Text("給料"),
                    )),

                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[500], width: 1.0),
                  ),
                  child: ListTile(
                    title: Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Text(
                        "月給19万2000円～22万1000円",
                        style: TextStyle(
                            // fontSize: 14,
                            ),
                      ),
                    ),
                  ),
                ),

                Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[500], width: 1.0),
                      color: Colors.grey[300],
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        foregroundColor: Colors.black,
                        radius: 18.0,
                        backgroundColor: Colors.grey[200],
                        child: Text("時",
                            style: TextStyle(fontSize: 20, color: Colors.blue)),
                      ),
                      title: Text("就業時間/休日休暇"),
                    )),

                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[500], width: 1.0),
                  ),
                  child: ListTile(
                    title: Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Text(
                        "日勤／7:00～16:00（休憩1時間）　9:00～18:00（休憩1時間）　10:00～19:00（休憩1時間）　夜勤／16:00～翌10:00（休憩2時間） / 月公休9日（2月16日～3月15日のシフトのみ8日とする） 年間休日111日 夏期休暇 冬期休暇 ",
                        style: TextStyle(
                            // fontSize: 14,
                            ),
                      ),
                    ),
                  ),
                ),

                Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[500], width: 1.0),
                      color: Colors.grey[300],
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        foregroundColor: Colors.black,
                        radius: 18.0,
                        backgroundColor: Colors.grey[200],
                        child: Icon(
                          Icons.home_repair_service,
                          color: Colors.blue,
                        ),
                      ),
                      title: Text("特別な条件"),
                    )),

                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[500], width: 1.0),
                  ),
                  child: ListTile(
                    title: Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Text(
                        "業績手当10,000円~25,000円、年末年始手当、時間外勤務手当、資格手当 交通費支給費：月2万1000円まで ",
                        style: TextStyle(
                            // fontSize: 14,
                            ),
                      ),
                    ),
                  ),
                ),

                Container(
                  margin:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
                  child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      onPressed: () {},
                      color: Colors.grey,
                      textColor: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('詳細を見る',
                              style: TextStyle(
                                fontSize: 16,
                              )),
                        ],
                      )),
                ),
              ],
            ),
          ),

          Container(
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(5.0),
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 0.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Text("求人番号:500009-0003-0016"),
                ),

                InkWell(
                  child: Text(
                    '介護スタッフ【パート】アスモ介護サービス豊中(豊中)★未経験の方も安心！',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  onTap: () {},
                ),

                // Text('介護職【正社員】アスモ介護サービス薬園台',
                //   style: TextStyle(
                //     fontSize: 14,
                //     fontWeight: FontWeight.bold,
                //     color: Colors.grey,
                //     decoration: TextDecoration.underline,
                //   ),
                // ),

                Card(
                  margin: EdgeInsets.symmetric(horizontal: 0, vertical: 10.0),
                  color: Colors.blue,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      "非常勤",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),

                Divider(thickness: 1),

                Container(
                    margin: EdgeInsets.only(top: 12.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[500], width: 1.0),
                      color: Colors.grey[300],
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        foregroundColor: Colors.black,
                        radius: 18.0,
                        backgroundColor: Colors.grey[200],
                        child: Icon(
                          Icons.location_on,
                          color: Colors.blue,
                        ),
                      ),
                      title: Text("最寄り駅"),
                    )),

                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[500], width: 1.0),
                  ),
                  child: ListTile(
                    title: Text(
                      "大阪モノレール「小路駅」徒歩10分",
                      style: TextStyle(
                          // fontSize: 16,
                          ),
                    ),
                  ),
                ),

                Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[500], width: 1.0),
                      color: Colors.grey[300],
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        foregroundColor: Colors.black,
                        radius: 18.0,
                        backgroundColor: Colors.grey[200],
                        child: Text("¥",
                            style: TextStyle(fontSize: 20, color: Colors.blue)),
                      ),
                      title: Text("給料"),
                    )),

                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[500], width: 1.0),
                  ),
                  child: ListTile(
                    title: Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Text(
                        "時給1,080～1,220円",
                        style: TextStyle(
                            // fontSize: 14,
                            ),
                      ),
                    ),
                  ),
                ),

                Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[500], width: 1.0),
                      color: Colors.grey[300],
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        foregroundColor: Colors.black,
                        radius: 18.0,
                        backgroundColor: Colors.grey[200],
                        child: Text("時",
                            style: TextStyle(fontSize: 20, color: Colors.blue)),
                      ),
                      title: Text("就業時間/休日休暇"),
                    )),

                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[500], width: 1.0),
                  ),
                  child: ListTile(
                    title: Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Text(
                        "早番／ 7:00～16:00 (休憩1時間) 中番／ 9:00～18:00 (休憩1時間) 遅番／10:00～19:00 (休憩1時間) ☆上記以外の時間帯もＯＫ！ 　１日４時間～ご相談に応じます。 ☆週１日～勤務日数・曜日ご相談に応じます / 週１日～OK! ",
                        style: TextStyle(
                            // fontSize: 14,
                            ),
                      ),
                    ),
                  ),
                ),

                Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[500], width: 1.0),
                      color: Colors.grey[300],
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        foregroundColor: Colors.black,
                        radius: 18.0,
                        backgroundColor: Colors.grey[200],
                        child: Icon(
                          Icons.home_repair_service,
                          color: Colors.blue,
                        ),
                      ),
                      title: Text("特別な条件"),
                    )),

                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[500], width: 1.0),
                  ),
                  child: ListTile(
                    title: Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Text(
                        "夜勤手当、年末年始手当、資格手当 交通費支給費：月2万1000円まで",
                        style: TextStyle(
                            // fontSize: 14,
                            ),
                      ),
                    ),
                  ),
                ),

                Container(
                  margin:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
                  child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      onPressed: () {},
                      color: Colors.grey,
                      textColor: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('詳細を見る',
                              style: TextStyle(
                                fontSize: 16,
                              )),
                        ],
                      )),
                ),
              ],
            ),
          ),

          Container(
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(5.0),
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 0.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Text("求人番号:500021-0001-0017"),
                ),

                InkWell(
                  child: Text(
                    '仕事',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  onTap: () {},
                ),

                // Text('介護職【正社員】アスモ介護サービス薬園台',
                //   style: TextStyle(
                //     fontSize: 14,
                //     fontWeight: FontWeight.bold,
                //     color: Colors.grey,
                //     decoration: TextDecoration.underline,
                //   ),
                // ),

                Card(
                  margin: EdgeInsets.symmetric(horizontal: 0, vertical: 10.0),
                  color: Colors.blue,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      "その他",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),

                Divider(thickness: 1),

                Container(
                    margin: EdgeInsets.only(top: 12.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[500], width: 1.0),
                      color: Colors.grey[300],
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        foregroundColor: Colors.black,
                        radius: 18.0,
                        backgroundColor: Colors.grey[200],
                        child: Icon(
                          Icons.location_on,
                          color: Colors.blue,
                        ),
                      ),
                      title: Text("最寄り駅"),
                    )),

                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[500], width: 1.0),
                  ),
                  child: ListTile(
                    title: Text(
                      "",
                      style: TextStyle(
                          // fontSize: 16,
                          ),
                    ),
                  ),
                ),

                Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[500], width: 1.0),
                      color: Colors.grey[300],
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        foregroundColor: Colors.black,
                        radius: 18.0,
                        backgroundColor: Colors.grey[200],
                        child: Text("¥",
                            style: TextStyle(fontSize: 20, color: Colors.blue)),
                      ),
                      title: Text("給料"),
                    )),

                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[500], width: 1.0),
                  ),
                  child: ListTile(
                    title: Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Text(
                        "23232",
                        style: TextStyle(
                            // fontSize: 14,
                            ),
                      ),
                    ),
                  ),
                ),

                Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[500], width: 1.0),
                      color: Colors.grey[300],
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        foregroundColor: Colors.black,
                        radius: 18.0,
                        backgroundColor: Colors.grey[200],
                        child: Text("時",
                            style: TextStyle(fontSize: 20, color: Colors.blue)),
                      ),
                      title: Text("就業時間/休日休暇"),
                    )),

                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[500], width: 1.0),
                  ),
                  child: ListTile(
                    title: Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Text(
                        "dsadsa",
                        style: TextStyle(
                            // fontSize: 14,
                            ),
                      ),
                    ),
                  ),
                ),

                Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[500], width: 1.0),
                      color: Colors.grey[300],
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        foregroundColor: Colors.black,
                        radius: 18.0,
                        backgroundColor: Colors.grey[200],
                        child: Icon(
                          Icons.home_repair_service,
                          color: Colors.blue,
                        ),
                      ),
                      title: Text("特別な条件"),
                    )),

                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[500], width: 1.0),
                  ),
                  child: ListTile(
                    title: Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Text(
                        "",
                        style: TextStyle(
                            // fontSize: 14,
                            ),
                      ),
                    ),
                  ),
                ),

                Container(
                  margin:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
                  child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      onPressed: () {},
                      color: Colors.grey,
                      textColor: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('詳細を見る',
                              style: TextStyle(
                                fontSize: 16,
                              )),
                        ],
                      )),
                ),
              ],
            ),
          ),

          Container(
            margin: EdgeInsets.only(top:10.0),

            child: Row(
              
              children: [
                
                SizedBox(
                  width: 10.0,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey,
                  ),
                  width: 6.0,
                  height: 40.0,
                ),
                Container(
                  height: 40.0,
                  width: MediaQuery.of(context).size.width - 25.0,
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                  ),
                  child: Text(
                    'NEWS',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[700],
                    ),
                  ),
                )
              ],
            ),
          ),


          Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              children: [
                RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                  onPressed: () {},
                  color: Colors.grey,
                  child: Center(
                    child: Text(
                      "2020 年",
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(children: [
              Text(
                "2020-06-18",
                style: TextStyle(
                  fontSize: 14,
                  // fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 20.0),
              Card(
                color: Colors.blue,
                child: Container(
                    margin:
                        EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
                    child: Text(
                      "お知らせ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    )),
              ),
            ]),
          ),
          SizedBox(height: 5.0),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Text(
                    "aaaaaaaaaaaaaaaaaaaaaaaavvvvvvvvvvvvvvvvvvvvvvvvvvvvmmmmmmmmmmmmmmmm",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "こちら",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              )),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: SizedBox(
              height: 30.0,
              child: Divider(
                color: Colors.black,
                thickness: 0.5,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(children: [
              Text(
                "2020-06-18",
                style: TextStyle(
                  fontSize: 14,
                  // fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 20.0),
              Card(
                color: Colors.blue,
                child: Container(
                    margin:
                        EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
                    child: Text(
                      "お知らせ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    )),
              ),
            ]),
          ),
          SizedBox(height: 5.0),
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 20),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16,),
              child: Text(
                "jb search",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildJobCheckbox(JobType jobtype) => buildCheckbox(
      jobtype: jobtype,
      onClicked: () {
        setState(() {
          final occupation = !jobtype.value;
          jobtype.value = occupation;
        });
      });

  Widget buildCheckbox({
    @required JobType jobtype,
    @required VoidCallback onClicked,
  }) =>
      ListTile(
        onTap: onClicked,
        leading: Transform.scale(
          scale: 0.8,
          child: Checkbox(
            checkColor: Colors.white,
            value: jobtype.value,
            onChanged: (value) => onClicked(),
          ),
        ),
        title: Text(
          jobtype.title,
          style: TextStyle(
            fontSize: 14,
          ),
        ),
      );

  Widget _dropDownBox(String hintText) {
    return Container(
      //padding: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.grey[200],
          border: Border.all(color: Colors.grey[300])),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
            isExpanded: true,
            //value: _value,
            hint: Row(
              children: [
                Icon(
                  Icons.arrow_drop_down_outlined,
                  size: 35.0,
                ),
                Text(hintText),
              ],
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
              DropdownMenuItem(child: Text("Third Item"), value: 3),
              DropdownMenuItem(child: Text("Fourth Item"), value: 4)
            ],
            onChanged: (value) {
              setState(() {
                //_value = value;
              });
            }),
      ),
    );
  }

  Widget _dropDownCheckBox(String hintText){
    return Container(
      //padding: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.grey[200],
          border: Border.all(color: Colors.grey[300])),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
            isExpanded: true,
            //value: _value,
            hint: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left:8.0),
                  child: Text(hintText),
                ),
              ],
            ),
            items: [
                 
              DropdownMenuItem(
                child: Text("Second Item"),
                value: 2,
              ),
              DropdownMenuItem(
                child: Text("Third Item"),
                value: 3
              ),
              DropdownMenuItem(
                  child: Text("Fourth Item"),
                  value: 4
              )
            ],
            onChanged: (value) {
              setState(() {
                //_value = value;
              });
            }),
      ),
    );
  }

}

// Card(
//     color: Colors.white,
//     child: Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.symmetric(
//               horizontal: 15.0, vertical: 5.0),
//           child: _dropDownBox("Testing"),
//         ),
//       ],
//     )),
