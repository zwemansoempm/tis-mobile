import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:tis/views/nusing_comment.dart';
import 'package:tis/views/nusing_favourite_mail.dart';


class NusingDetail extends StatefulWidget {
  NusingDetail({Key key}) : super(key: key);

  @override
  _NusingDetailState createState() => _NusingDetailState();
}

class _NusingDetailState extends State<NusingDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nusing Detail"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
           children: [
              Container(
                padding: EdgeInsets.all(5.0),
                margin: EdgeInsets.only(bottom: 10.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Text("施設番号:500009-0001"),
              ),
              Text(
                "ベストライフ都賀" , 
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              DottedLine(dashColor: Colors.blue,),
              SizedBox(height: 10.0),
              
              _header("現在の検索条件"),
              SizedBox(height: 10.0),
             
              _mailButton(),
              SizedBox(height: 10.0),

              Padding(
                padding: const EdgeInsets.all(8.0),
                // child: Image.asset("assets/logos/bbc-news.png"),
              ),
              SizedBox(height: 10.0),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1.0),
                ),
                child: ListTile(
                  tileColor: Colors.grey[200],
                  title: Text("入居時費用", style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),),
                )
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1.0),
                ), 
                child: ListTile(
                  title: Text("0円 ~ 380万円", 
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1.0),
                ), 
                child: ListTile(
                  tileColor: Colors.grey[200],
                  title: Text("月額費用" ,style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),),
                )
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1.0),
                ),
                child: ListTile(
                  title: Text("0円 ~ 380万円", 
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1.0),
                ), 
                child: ListTile(
                  tileColor: Colors.grey[200],
                  title: Text("住所" ,style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),),
                )
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1.0),
                ),
                child: ListTile(
                  title: Text("千葉県千葉市若葉区桜木5-10-12", 
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1.0),
                ), 
                child: ListTile(
                  tileColor: Colors.grey[200],
                  title: Text("電話番号" ,style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),),
                )
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1.0),
                ),
                child: ListTile(
                  title: Text("", 
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1.0),
                ), 
                child: ListTile(
                  tileColor: Colors.grey[200],
                  title: Text("アクセス" ,style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),),
                )
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1.0),
                ),
                child: ListTile(
                  title: Text("千葉都市モノレールタウンライナー「桜木」駅より徒歩13分（1,040m）、「桜木」駅より京成バス乗車 「兼坂」バス停から「桜木町」バス停下車徒歩約1分（約50m） 、JR総武本線「千葉」駅東口より京成バス乗車「桜木町」バス停下車徒歩約1分（約50m）", 
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1.0),
                ), 
                child: ListTile(
                  tileColor: Colors.grey[200],
                  title: Text("運営事業者" ,style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),),
                )
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1.0),
                ),
                child: ListTile(
                  title: Text("-", 
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Text("こだわりの特長",
                style: TextStyle(color: Colors.blue),
              ),
              DottedLine(dashColor: Colors.blue),
              SizedBox(height: 10.0),
              Text("データがありません。",
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: 10.0),
              
              _header("特長"),
              SizedBox(height: 10.0),
              _mailButton(),
              SizedBox(height: 10.0),
              Text("都市の利便性と、自然の優しさが共存する豊かな住まい「ベストライフ都賀」緑豊かな環境に恵まれながら、都心へのアクセスが高い若葉区。加曾利塚をはじめとする史跡が数多く点在し、歴史と文化が感じられるこの街に「ベストライフ都賀」は位置します。毎日を豊かに彩るイベントやレクリエーションもご用意しました。この優れた環境とサービスを誇る「ベストライフ都賀」で潤いに満ちた日々をお過ごしください。"),
              SizedBox(height: 10.0),
              _header("費用"),
              SizedBox(height: 10.0),
              _mailButton(),
              SizedBox(height: 10.0),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1.0),
                  color: Colors.grey[200],
                ),
                padding: EdgeInsets.all(8.0),
                margin: EdgeInsets.symmetric(horizontal: 8),
                child: Text("前払いプラン Aタイプ"),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1.0),
                ), 
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10, vertical:4 ),
                          margin: EdgeInsets.only(left: 10.0,bottom: 10.0,top: 10.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 1.0),
                            color: Colors.blue[200],
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Text('初期', style: TextStyle(fontSize: 16,))
                        ),
                        SizedBox(width: 10.0),
                        Text("0円 ~ 380万円", 
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                        ),
                      ]
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10, vertical:4 ),
                          margin: EdgeInsets.only(left: 10.0,bottom: 10.0,top:10.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 1.0),
                            color: Colors.blue[200],
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Text('月額', style: TextStyle(fontSize: 16,))
                        ),
                        SizedBox(width: 10.0),
                        Text("0円 ~ 380万円", 
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                        ),
                      ]
                    )
                  ]
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1.0),
                  color: Colors.blue[200],
                ),
                padding: EdgeInsets.all(8.0),
                margin: EdgeInsets.symmetric(horizontal: 8),
                child: Center(child: Text("詳細はこちら", style: TextStyle(fontSize: 12.0,fontWeight: FontWeight.bold),)),
              ),

              SizedBox(height: 20.0),
              _header("施設の概要"),
              SizedBox(height: 10.0),
              _mailButton(),

              _itemHeader('事業主体'),
              _itemData("株式会社アスモ介護サービス"),

              _itemHeader('開設年月日'),
              _itemData("2014-10-01"),

              _itemHeader('土地の権利形態'),
              _itemData("非所有"),

              _itemHeader('建物の権利形態'),
              _itemData("-"),

              _itemHeader('敷地面積'),
              _itemData("2,415.95㎡"),

              _itemHeader('延床面積'),
              _itemData("3,180.90㎡"),

              _itemHeader('構造'),
              _itemData("-"),

              _itemHeader('定員'),
              _itemData('78名'),

              _itemHeader('総居室・戸数'),
              _itemData('78室(完全個室)'),

              _itemHeader('居住の権利形態'),
              _itemData('利用権方式'),

              _itemHeader('類型'),
              _itemData('-'),

              _itemHeader('入居条件'),
              _itemData('60歳以上入居時自立・要支援・要介護'),

              _itemHeader('居室区分・間取り等'),
              _itemData('全室個室'),

              _itemHeader('居室設備'),
              _itemData('スプリンクラー、防災カーテン、緊急コール、介護専用電動ベッド、温水洗浄トイレ、車いす対応洗面台、エアコン、収納'),

              _itemHeader('共用施設・設備'),
              _itemData('食堂、談話コーナー、健康管理室、浴室（一般浴室・機械浴室・個浴室）、ファミリーダイニング、理容室、洗濯室'),

              SizedBox(height: 20.0),

              _subHeader("フォトアルバム"),
              _noData(),
              SizedBox(height: 10.0),

              _subHeader("協力医療機関"),
              _noData(),
              SizedBox(height: 10.0),

              //MedicalAcceptance
              _subHeader("医療面の受入れ"),
              _medicalAcceptData('気管切開'),
              _medicalAcceptData('インシュリン投与'),
              _medicalAcceptData('筋萎縮性側索硬化症(ALS)'),
              
              Row(
                children: [
                  Icon(Icons.check,color: Colors.green),
                  Text("受入れ可"),
                  SizedBox(width: 12.0),
                  Icon(Icons.clear,color: Colors.red),
                  Text("受入れ不可"),
                  SizedBox(width: 12.0),
                  Icon(Icons.circle, color: Colors.blue,),
                  Text("応相談"),
                ],
              ),
              SizedBox(height: 12.0),
              //職員体制
              _subHeader("職員体制"),
              _staffItem("介護に関わる職員体制（入居者：職員）",Colors.grey[200]),
              _staffItem("",Colors.white),
              _staffItem(" 介護職員",Colors.grey[200]),
              _staffItem("",Colors.white),
              _staffItem(" 夜間の最少職員数",Colors.grey[200]),
              _staffItem("",Colors.white),
              _staffItem("看護職員数",Colors.grey[200]),
              _staffItem("",Colors.white),

              SizedBox(height: 20.0),
              _itemHeader("公式サイト"),
              _itemData("https://www.asmokaigo.co.jp/facilities/sakuragi/index.html"),
              _itemHeader("メールアドレス"),
              _itemData("info@asmokaigo.co.jp"),
              _itemHeader("アクセス"),
              _itemData("千葉都市モノレールタウンライナー「桜木」駅より徒歩13分（1,040m）、「桜木」駅より京成バス乗車 「兼坂」バス停から「桜木町」バス停下車徒歩約1分（約50m） 、JR総武本線「千葉」駅東口より京成バス乗車「桜木町」バス停下車徒歩約1分（約50m）"),

              SizedBox(height: 20.0),
              _header("口コミ"),
              SizedBox(height: 10.0),
              Text("口コミはありません。",
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  RaisedButton(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> NusingComment()));
                    },
                    color: Colors.green,
                    textColor: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.chat_bubble_outline),
                        SizedBox(width: 4.0),
                        Text('口コミを投稿する', style: TextStyle(fontSize: 16,)),
                    ],)
                  ),
                ],
              )

           ]
        )
      ),
    );
  }

  Widget _medicalAcceptData(String data){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0,vertical: 6),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.all(Radius.circular(5))
      ),
      child: Text(data)
    );
  }

  Widget _noData(){
    return Text("データがありません。",
      style: TextStyle(color: Colors.grey),
    );
  }

  Widget _header(String name){
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.blue
          ), 
          height: 42.0,
          width: 10.0,
        ),
        Container(
          width: MediaQuery.of(context).size.width - 30.0,
          decoration: BoxDecoration(
            color: Colors.grey[200]
          ),
          padding: EdgeInsets.all(8.0),
          child: Text(name ,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
        ),
      ],
    );
  }

  Widget  _subHeader(String name){
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name),
          SizedBox(
            height: 20.0,
            width: 30.0,
            child: Divider(color: Colors.blue[400],thickness: 3.0,)
          ),
        ],
      )
    );
  }

  Widget _staffItem(String header, Color color){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        color: color,
      ),
      child: Text(header,style: TextStyle(fontSize: 14),)
    );
  }

  Widget _itemHeader(String header){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
      ), 
      child: ListTile(
        tileColor: Colors.grey[200],
        title: Text(header ,style: TextStyle(
          fontWeight: FontWeight.bold,
        ),),
      )
    );
  }

  Widget _itemData(String data){
    return  Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 1.0),
      ),
      child: ListTile(
        title: Text(data, 
          style: TextStyle(
            fontSize: 14.0,
          ),
        ),
      ),
    );
  }

  Widget _mailButton(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        RaisedButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=> NusingMail()));
          },
          color: Colors.green,
          textColor: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.mail_outline),
              SizedBox(width: 4.0),
              Text('資料請求', style: TextStyle(fontSize: 16,)),
          ],)
        ),
      ],
    );
  }


}