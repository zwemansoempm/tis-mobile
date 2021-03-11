import 'dart:ui';
import 'package:flutter/material.dart';

class Term extends StatelessWidget {
  const Term();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffffffff),
        leading: BackButton(color: Colors.black),
        title: Text('利用規約', style: TextStyle(color: Colors.black)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(
                bottom: 5, // Space between underline and text
              ),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                color: Color.fromARGB(255, 41, 128, 185),
                width: 3.0, // Underline thickness
              ))),
              child: Text(
                "利用規約",
                //style: TextStyle(height: 2.0),
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 15.0),
              child: Text(
                "このウェブサイトは株式会社 TRUST-ESTATEが運営しております。このウェブサイト(以下「本サイト」といいます。)を利用される際には、以下の各事項をご了承くださいますようお願い申し上げます。" +
                    "また、当社は、本サイトのご利用条件を変更することがあります。その際にはこの文章の改訂版を掲載することと致しますので、最新の内容をご確認いただきますよう、お願い申し上げます。",
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 15.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  decoration: BoxDecoration(
                      border: Border(
                          left: BorderSide(
                    color: Color.fromARGB(255, 41, 128, 185),
                    width: 3.0,
                  ))),
                  child: Text("第1条　当社のサービスのご利用"),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 15.0),
              child: Text("本利用規約にご同意いただくことによって、当社のサービスをご利用いただくことができます。" +
                  "なお、無料で提供しているサービスにつきましては、本利用規約にご同意いただく手続に代えて、" +
                  "実際にご利用いただくことで本利用規約にご同意いただいたものとみなします。"),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 15.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  decoration: BoxDecoration(
                      border: Border(
                          left: BorderSide(
                    color: Color.fromARGB(255, 41, 128, 185),
                    width: 3.0,
                  ))),
                  child: Text("第2条　サービス内容の保証および変更"),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 15.0),
              child: Text("当社は提供するサービスの内容について、瑕疵（かし）やバグがないことは保証しておりません。" +
                  "また当社は、ご利用者様にあらかじめ通知することなくサービスの内容や仕様を変更したり、" +
                  "提供を停止したり中止したりすることができるものとします。"),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 15.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  decoration: BoxDecoration(
                      border: Border(
                          left: BorderSide(
                    color: Color.fromARGB(255, 41, 128, 185),
                    width: 3.0,
                  ))),
                  child: Text("第3条　サービス利用にあたっての順守事項"),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 15.0),
              child: Text(
                "当社のサービスのご利用に際しては以下に定める行為（それらを誘発する行為や準備行為も含みます）を禁止いたします。" +
                    " \n 1.本サイトの利用目的に関係のない不適切な情報を入力する行為  \n 2.登録情報に虚偽の内容を登録する行為 \n " +
                    "3.すべての利用者を誹謗中傷する行為又はそのように判断できる行為 \n 4.すべての利用者又は第三者の著作権、商標権・知的財産権を含む一切の権利及び名誉・プライバシーを侵害する行為\n" +
                    "5.他の利用者のID等を利用する行為 \n 6.重複して登録を行う行為 \n" +
                    "7.本サイトのネットワーク若しくはシステム等に過度な負荷をかける行為 \n 8.当社のネットワーク又はシステム等に不正にアクセスする行為 \n" +
                    "9.本サイトの運営を妨げる行為、当社の信用・名誉を毀損する行為又はそのように判断できる行為 \n " +
                    "10.本サイト上で、営利を目的とした宣伝、広告、勧誘、他サイトへの誘導等の行為及びそのように判断できる行為 \n" +
                    "11.その他、当社が不適切と判断する行為 当社は、本サイトにおけるご利用者様の行為が前項のいずれかに該当し、" +
                    "又は該当していると判断した場合には、事前に通知することなくご利用者様が登録・入力した情報又は文章の全部又は一部の削除、" +
                    "本サイトの利用を停止することができるものとする。また本項に基づき当社が行った措置によりご利用者様に損害が生じた場合についても一切の責任は負わないものとする。",
              ),
            ),

            Container(
              padding: EdgeInsets.only(bottom: 15.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  decoration: BoxDecoration(
                      border: Border(
                          left: BorderSide(
                    color: Color.fromARGB(255, 41, 128, 185),
                    width: 3.0,
                  ))),
                  child: Text("第4条　当社のサービスなどの再利用の禁止"),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 15.0),
              child: Text("ご利用者様が、当社のサービスやそれらを構成するデータを、当該サービスの提供目的を超えて利用した場合、" +
                  "当社は、それらの行為を差し止める権利ならびにそれらの行為によってお客様が得た利益相当額を請求する権利を有します。"),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 15.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  decoration: BoxDecoration(
                      border: Border(
                          left: BorderSide(
                    color: Color.fromARGB(255, 41, 128, 185),
                    width: 3.0,
                  ))),
                  child: Text("第5条　当社に対する補償"),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 15.0),
              child: Text(
                  "ご利用者様の行為が原因で生じたクレームなどに関連して当社に費用が発生した場合または当社が賠償金などの支払を行った場合、" +
                      "ご利用者様は当社が支払った費用や賠償金など（当社が支払った弁護士費用を含みます）を負担するものとします。"),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 15.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  decoration: BoxDecoration(
                      border: Border(
                          left: BorderSide(
                    color: Color.fromARGB(255, 41, 128, 185),
                    width: 3.0,
                  ))),
                  child: Text("第6条　利用規約の変更について"),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 15.0),
              child: Text(
                  "当社が必要と判断した場合には、ご利用者様にあらかじめ通知することなくいつでも本利用規約を変更することができるものとします。"),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 15.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  decoration: BoxDecoration(
                      border: Border(
                          left: BorderSide(
                    color: Color.fromARGB(255, 41, 128, 185),
                    width: 3.0,
                  ))),
                  child: Text("第7条　著作権について"),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 15.0),
              child: Text(
                  "本サイト上の一切のコンテンツ、著作物（文書、資料など）に係る著作権その他の権利は当社及び情報提供者に帰属します。" +
                      "これらのコンテンツ、著作物は、日本の著作権法、条約及び他国の著作権法にいう著作権により保護されており、" +
                      "私的利用の範囲を超えて利用することはできません。" +
                      "また、権利者の許可なく改変、複製、賃貸、貸与、販売、出版、送信、放送等、方法の如何を問わず第三者の利用に供することを固く禁じます。" +
                      "但し、個々の著作物に個別の利用条件が付されている場合は、当該条件が優先されます。"),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 15.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  decoration: BoxDecoration(
                      border: Border(
                          left: BorderSide(
                    color: Color.fromARGB(255, 41, 128, 185),
                    width: 3.0,
                  ))),
                  child: Text("第8条　商標について"),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 15.0),
              child: Text("本サイトに掲載している会社名、サービス名、製品名などはいずれも当社あるいは各企業、" +
                  "団体の商標または登録商標です。本サイトでは説明の便宜上、その商品名、団体名などを記載する場合がありますが、" +
                  "それらの商標権の侵害を行なう意志や目的はありません。"),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 15.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  decoration: BoxDecoration(
                      border: Border(
                          left: BorderSide(
                    color: Color.fromARGB(255, 41, 128, 185),
                    width: 3.0,
                  ))),
                  child: Text("第9条　免責事項"),
                ),
              ),
            ),
            Container(
              //padding: EdgeInsets.only(bottom: 15.0),
              child: Text.rich(
                TextSpan(
                  text: '1.当社は、本サイト情報を掲載するにあたり、十分に検討・確認作業を行なっておりますが、' +
                      "その内容に関し、その正確性、有用性、確実性、安全性、特定目的に対する合目的性その他いかなる保障もするものではありません。" +
                      "コンテンツ等のご利用により、万一何らかの損害が発生したとしても、当社は一切責任を負いません。 \n" +
                      "2.当社は、ウェブサイトの構成、利用条件、URLおよびコンテンツ等を、予告なしに変更または中止し、" +
                      "あるいはウェブサイトの運営を予告なしに中断または中止することがあります。" +
                      "なお、当社は理由の如何に関わらず、これらの変更及び本サイトの運用の中断または中止によって" +
                      "生じるいかなる損害についても責任を負うものではありません。\n" +
                      "3.本サイトから、もしくは本サイトにリンクを張っている当社以外の第三者のウェブサイト（以下「リンクサイト」と称します）の内容は、" +
                      "それぞれ各社の責任で管理されるものであり、当社の管理下にあるものではありません。" +
                      "また、当社とリンクサイトとの間に提携などの特別な関係があるということを意味するものではありません。" +
                      "当社は、リンクサイトの内容について、また、それらのご利用により生じたいかなる損害についても責任を負いません。\n4.", // default text style
                  children: <TextSpan>[
                    TextSpan(
                        text: '介護施設サービスについて\n',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(
                      text: '登録されている施設情報は施設運営会社が独自に入力したものであり、' +
                          "当サイトはその内容や提供サービスを保証するものではございません。資料請求などを行う際に入力される個人情報については、" +
                          "資料請求される施設運営会社のＨＰなどに記載されている個人情報の取り扱い方法などをご確認頂き、お客様の責任の元入力・送信下さい。" +
                          "入力・送信された個人情報などが万が一施設運営会社から漏洩・滅失・又はき損等が起きてご利用者様に不利益が生じても当サイト運営会社はその損害等において一切の責任を負いません。\n5.",
                    ),
                    TextSpan(
                        text: '病院検索サービスについて\n',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(
                        text: '登録されている病院情報等は病院運営法人が独自に入力したものであり、' +
                            '当サイトはその診療科目や提供サービス又病院の存在等を保証するものではございません。' +
                            '医療サービス等を受ける際はその内容等を利用者様ご本人が病院や担当医その他病院関係者から説明を受け、' +
                            'ご自身の責任の元受診・治療等のサービスを受けるものとします。万が一提供された受診・治療等のサービスにおいて' +
                            'ご利用者様に不利益が生じても当サイト運営会社はその損害等において一切の責任を負いません。'),
                  ],
                ),
              ),
            ),
            //Text(""),
            // Text(""),
            // Text("")
            Container(
              padding: EdgeInsets.only(top: 15.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  child: Text("ティーズ運営事務局"),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 15.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  child: Text(
                      "Copyright©TRUST-ESTATE Co,Ltd.All Rights Reserved."),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
