import 'package:flutter/material.dart';

class Privacy extends StatelessWidget {
  const Privacy();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffffffff),
        leading: BackButton(color: Colors.black),
        title: Text('プライバシーポリシー', style: TextStyle(color: Colors.black)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            Container(
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  child: Text("プライバシーポリシー"),
                ),
              ),
            ),
            Container(
              child: Align(
                alignment: Alignment.topLeft,
                child: Container(
                  child: Text("個人情報保護方針"),
                ),
              ),
              decoration: BoxDecoration(
                  border: Border(
                      left: BorderSide(
                color: Color.fromARGB(255, 41, 128, 185),
                width: 3.0,
              ))),
            ),
            Container(
              child: Align(
                alignment: Alignment.topLeft,
                child: Container(
                  child: Text.rich(
                    TextSpan(
                      text: '1.法令・規範の順守\n',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Text(
                  '当社は個人情報保護に関して適用される法令、国が定める指針その他の規範を順守し、当社が保有する個人情報の保護に努めます。\n',
                ),
              ),
            ),
            Container(
              child: Align(
                alignment: Alignment.topLeft,
                child: Container(
                  child: Text.rich(
                    TextSpan(
                      text: '2.個人情報の取得、利用、提供\n',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Text(
                  '当社は、介護施設斡旋事業、広告事業、情報サイト運営事業などを行う事業者として、個人情報の利用目的を明確に定め、その目的' +
                      '達成のために必要な範囲で、公正かつ適正な手段により適切な個人情報の取得、利用を行います。\n',
                ),
              ),
            ),
            Container(
              child: Align(
                alignment: Alignment.topLeft,
                child: Container(
                  child: Text.rich(
                    TextSpan(
                      text: '3.個人情報の管理\n',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Text(
                  '当社が保有する個人情報の漏えい、滅失 又は き損等の防止に努め、厳正管理のもとで安全に蓄積、保管します。また、万一の発生時には速やかな是正措置を講じます。\n',
                ),
              ),
            ),
            Container(
              child: Align(
                alignment: Alignment.topLeft,
                child: Container(
                  child: Text.rich(
                    TextSpan(
                      text: '4.個人情報の外部委託\n',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Text(
                    '個人情報の処理を外部に委託する場合には、漏えいや目的外利用を行わないように契約を義務付け、厳重な管理、指導を行います。\n,'),
              ),
            ),
            Container(
              child: Align(
                alignment: Alignment.topLeft,
                child: Container(
                  child: Text.rich(
                    TextSpan(
                      text: '5.個人情報の開示・訂正・利用停止\n',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Text(
                  '当社の保有する個人情報について、本人から開示・訂正・利用停止などの要求 および 問い合わせ 又は 苦情 および 相談があった場合には、適正に対応します。\n',
                ),
              ),
            ),
            Container(
              child: Align(
                alignment: Alignment.topLeft,
                child: Container(
                  child: Text.rich(
                    TextSpan(
                      text: '6.個人情報に対する社内体制\n',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Text('個人情報保護のために社内体制を整備し継続的な改善を行います。\n'),
              ),
            ),
            Container(
              child: Align(
                alignment: Alignment.topLeft,
                child: Container(
                  child: Text("個人情報の取扱いについて"),
                ),
              ),
              decoration: BoxDecoration(
                  border: Border(
                      left: BorderSide(
                color: Color.fromARGB(255, 41, 128, 185),
                width: 3.0,
              ))),
            ),
            Container(
              child: Align(
                alignment: Alignment.topLeft,
                child: Container(
                  child: Text.rich(
                    TextSpan(
                      text: '1.個人情報の利用目的\n',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Text(
                  '株式会社TRUST-ESTATE（以下「当社」と言います）は、お客様個人を識別する基本情報として、お客様のお名前・ご住所・お電' +
                      '話番号・ 生年月日・メールアドレスなどの個人情報 および 当社とのお取引状況などの情報を以下の目的で利用いたします。\n',
                ),
              ),
            ),
            //1
            Row(children: [
              Flexible(
                flex: 3,
                child: Container(
                    height: 60,
                    //width: 55,
                    padding: const EdgeInsets.only(left: 20.0),
                    decoration: const BoxDecoration(
                        //color: Color(0xFFFFEE58),
                        border: Border()),
                    child: Text('1.')),
              ),
              Flexible(
                flex: 13,
                child: Container(
                    height: 60,
                    decoration: const BoxDecoration(),
                    child: Text(
                      '当社および当社関係会社の商品の発送、カタログやＤＭの送付、関連するアフターサービス、 新商品、サービスなどの各種情報を提供させていただくため。',
                    )),
              ),
            ]),
            //2
            Row(children: [
              Flexible(
                flex: 3,
                child: Container(
                    height: 60,
                    //width: 55,
                    padding: const EdgeInsets.only(left: 20.0),
                    decoration: const BoxDecoration(
                        //color: Color(0xFFFFEE58),
                        border: Border()),
                    child: Text('2.')),
              ),
              Flexible(
                flex: 13,
                child: Container(
                    height: 60,
                    decoration: const BoxDecoration(),
                    child: Text(
                      '当社および当社関係会社の行う事業に関するアンケート調査、その他の関連するお得な情報 を提供させていただくため。',
                    )),
              ),
            ]),
            //3
            Row(children: [
              Flexible(
                flex: 3,
                child: Container(
                    height: 40,
                    //width: 55,
                    padding: const EdgeInsets.only(left: 20.0),
                    decoration: const BoxDecoration(
                        //color: Color(0xFFFFEE58),
                        border: Border()),
                    child: Text('3.')),
              ),
              Flexible(
                flex: 13,
                child: Container(
                    height: 40,
                    decoration: const BoxDecoration(),
                    child: Text(
                      '当社が適正と定めた企業のカタログやＤＭ、試供品などの送付のため。',
                    )),
              ),
            ]),
            //4
            Row(children: [
              Flexible(
                flex: 3,
                child: Container(
                    height: 20,
                    //width: 55,
                    padding: const EdgeInsets.only(left: 20.0),
                    decoration: const BoxDecoration(
                        //color: Color(0xFFFFEE58),
                        border: Border()),
                    child: Text('4.')),
              ),
              Flexible(
                flex: 13,
                child: Container(
                    height: 20,
                    decoration: const BoxDecoration(),
                    child: Text(
                      '当社 および 当社関係会社とのお取引に関する与信管理、回収管理、債権管理のため。',
                    )),
              ),
            ]),
            //5
            Row(children: [
              Flexible(
                flex: 3,
                child: Container(
                    height: 50,
                    //width: 55,
                    padding: const EdgeInsets.only(left: 20.0),
                    decoration: const BoxDecoration(
                        //color: Color(0xFFFFEE58),
                        border: Border()),
                    child: Text('5.')),
              ),
              Flexible(
                flex: 13,
                child: Container(
                    height: 50,
                    decoration: const BoxDecoration(),
                    child: Text(
                      '当社に委託された受注・出荷サービスなどを行うため。',
                    )),
              ),
            ]),
            //6
            Row(children: [
              Flexible(
                flex: 3,
                child: Container(
                    height: 50,
                    //width: 55,
                    padding: const EdgeInsets.only(left: 20.0),
                    decoration: const BoxDecoration(
                        //color: Color(0xFFFFEE58),
                        border: Border()),
                    child: Text('6.')),
              ),
              Flexible(
                flex: 13,
                child: Container(
                    height: 50,
                    decoration: const BoxDecoration(),
                    child: Text(
                      'お客様からのお問い合わせに対して回答を行うため。',
                    )),
              ),
            ]),

            //7
            Row(children: [
              Flexible(
                flex: 3,
                child: Container(
                    height: 50,
                    //width: 55,
                    padding: const EdgeInsets.only(left: 20.0),
                    decoration: const BoxDecoration(
                        //color: Color(0xFFFFEE58),
                        border: Border()),
                    child: Text('7.')),
              ),
              Flexible(
                flex: 13,
                child: Container(
                    height: 50,
                    decoration: const BoxDecoration(),
                    child: Text(
                      '上記1〜6以外の利用目的で使用する場合は個別に利用目的をお知らせします。',
                    )),
              ),
            ]),

            Container(
              child: Align(
                alignment: Alignment.topLeft,
                child: Container(
                  child: Text.rich(
                    TextSpan(
                      text: '2.個人情報の提供\n',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Text(
                  '当社および当社関係会社がお客様から取得させていただいた個人情報は、下記のいずれかに該当する場合を除き、第三者に提供、開示などをすることはありません。',
                ),
              ),
            ),
            Row(children: [
              Flexible(
                flex: 3,
                child: Container(
                    height: 20,
                    //width: 55,
                    padding: const EdgeInsets.only(left: 30.0),
                    decoration: const BoxDecoration(
                        //color: Color(0xFFFFEE58),
                        border: Border()),
                    child: Text('1.')),
              ),
              Flexible(
                flex: 13,
                child: Container(
                    height: 20,
                    decoration: const BoxDecoration(),
                    child: Text(
                      '法令などに基づく場合。',
                    )),
              ),
            ]),
            Row(children: [
              Flexible(
                flex: 3,
                child: Container(
                    height: 20,
                    //width: 55,
                    padding: const EdgeInsets.only(left: 30.0),
                    decoration: const BoxDecoration(
                        //color: Color(0xFFFFEE58),
                        border: Border()),
                    child: Text('2.')),
              ),
              Flexible(
                flex: 13,
                child: Container(
                    height: 20,
                    decoration: const BoxDecoration(),
                    child: Text(
                      'お客様の事前の承認、同意を得た場合。',
                    )),
              ),
            ]),
            Row(children: [
              Flexible(
                flex: 3,
                child: Container(
                    height: 60,
                    //width: 55,
                    padding: const EdgeInsets.only(left: 30.0),
                    decoration: const BoxDecoration(
                        //color: Color(0xFFFFEE58),
                        border: Border()),
                    child: Text('3.')),
              ),
              Flexible(
                flex: 13,
                child: Container(
                    height: 60,
                    decoration: const BoxDecoration(),
                    child: Text(
                      'お客様および第三者の生命、身体、財産など公共の利益またはお客様の利益のため必要であると判断した場合。',
                    )),
              ),
            ]),
            Row(children: [
              Flexible(
                flex: 3,
                child: Container(
                    height: 60,
                    //width: 55,
                    padding: const EdgeInsets.only(left: 30.0),
                    decoration: const BoxDecoration(
                        //color: Color(0xFFFFEE58),
                        border: Border()),
                    child: Text('4.')),
              ),
              Flexible(
                flex: 13,
                child: Container(
                    height: 60,
                    decoration: const BoxDecoration(),
                    child: Text(
                      '当社および当社関係会社が合併、分社化、営業譲渡により事業が継承され個人情報を引き継ぐ場合。',
                    )),
              ),
            ]),

            Container(
              child: Align(
                alignment: Alignment.topLeft,
                child: Container(
                  child: Text.rich(
                    TextSpan(
                      text: '3.個人情報の共同利用\n',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),

            Container(
              child: Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Text(
                  '当社は、インターネット・電話・ハガキ・ＦＡＸなどでの各種申込みおよびウェブサイト・メールなどで取得した個人情報を当社関係会社と共同で利用させていただきます。',
                ),
              ),
            ),

            Row(children: [
              Flexible(
                flex: 3,
                child: Container(
                    height: 70,
                    //width: 55,
                    padding: const EdgeInsets.only(left: 30.0),
                    decoration: const BoxDecoration(
                        //color: Color(0xFFFFEE58),
                        border: Border()),
                    child: Text('1.')),
              ),
              Flexible(
                flex: 13,
                child: Container(
                    height: 70,
                    decoration: const BoxDecoration(),
                    child: Text(
                      '共同利用するお客様の個人情報の項目および利用目的は「1.個人情報の利用目的」に準じます。',
                    )),
              ),
            ]),
            Row(children: [
              Flexible(
                flex: 3,
                child: Container(
                    height: 30,
                    //width: 55,
                    padding: const EdgeInsets.only(left: 30.0),
                    decoration: const BoxDecoration(
                        //color: Color(0xFFFFEE58),
                        border: Border()),
                    child: Text('2.')),
              ),
              Flexible(
                flex: 13,
                child: Container(
                    height: 30,
                    decoration: const BoxDecoration(),
                    child: Text(
                      '共同利用の範囲は当社関係会社です。',
                    )),
              ),
            ]),
            Row(children: [
              Flexible(
                flex: 3,
                child: Container(
                    height: 30,
                    //width: 55,
                    padding: const EdgeInsets.only(left: 30.0),
                    decoration: const BoxDecoration(
                        //color: Color(0xFFFFEE58),
                        border: Border()),
                    child: Text('3.')),
              ),
              Flexible(
                flex: 13,
                child: Container(
                    height: 30,
                    decoration: const BoxDecoration(),
                    child: Text(
                      '共同利用の責任者は当社です。',
                    )),
              ),
            ]),

            Container(
              child: Align(
                alignment: Alignment.topLeft,
                child: Container(
                  child: Text.rich(
                    TextSpan(
                      text: '4.個人情報の共同利用\n',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),

            Container(
              child: Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Text(
                  '当社および当社関係会社がお客様から取得させていただいた個人情報は、個人情報の保護に関する契約を締結している業務委託会社' +
                      'に委託することがあります。 お客様に明示した利用目的の達成に必要な範囲で個人情報の取り扱いを委託する場合を除き委託をす' +
                      'ることはありません。',
                ),
              ),
            ),
            Container(
              child: Align(
                alignment: Alignment.topLeft,
                child: Container(
                  child: Text.rich(
                    TextSpan(
                      text: '5.個人情報の開示・訂正・利用停止\n',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),

            Row(children: [
              Flexible(
                flex: 3,
                child: Container(
                    height: 100,
                    //width: 55,
                    padding: const EdgeInsets.only(left: 30.0),
                    decoration: const BoxDecoration(
                        //color: Color(0xFFFFEE58),
                        border: Border()),
                    child: Text('1.')),
              ),
              Flexible(
                flex: 13,
                child: Container(
                    height: 100,
                    decoration: const BoxDecoration(),
                    child: Text(
                      'お客様ご本人、またはご本人が認めた代理人のお申し出により、保有しているお客様の個人情報を開示いたします。ただし、' +
                          '人情報を開示いたします。ただし、下記のいずれかに該当する場合は開示できません。',
                    )),
              ),
            ]),
            Row(children: [
              Flexible(
                flex: 3,
                child: Container(
                    height: 50,
                    //width: 55,
                    padding: const EdgeInsets.only(left: 40.0),
                    decoration: const BoxDecoration(
                        //color: Color(0xFFFFEE58),
                        border: Border()),
                    child: Text('(1)')),
              ),
              Flexible(
                flex: 13,
                child: Container(
                    height: 50,
                    decoration: const BoxDecoration(),
                    child: Text(
                      'お客様および第三者の権利利益を害するおそれがある時。',
                    )),
              ),
            ]),
            Row(children: [
              Flexible(
                flex: 3,
                child: Container(
                    height: 50,
                    //width: 55,
                    padding: const EdgeInsets.only(left: 40.0),
                    decoration: const BoxDecoration(
                        //color: Color(0xFFFFEE58),
                        border: Border()),
                    child: Text('(2)')),
              ),
              Flexible(
                flex: 13,
                child: Container(
                    height: 50,
                    decoration: const BoxDecoration(),
                    child: Text(
                      '当社および当社関係会社の業務運営に著しい支障をきたすおそれのある時。',
                    )),
              ),
            ]),
            Row(children: [
              Flexible(
                flex: 3,
                child: Container(
                    height: 30,
                    //width: 55,
                    padding: const EdgeInsets.only(left: 40.0),
                    decoration: const BoxDecoration(
                        //color: Color(0xFFFFEE58),
                        border: Border()),
                    child: Text('(3)')),
              ),
              Flexible(
                flex: 13,
                child: Container(
                    height: 30,
                    decoration: const BoxDecoration(),
                    child: Text(
                      '他の法令に違反するおそれがある時、など。',
                    )),
              ),
            ]),
            Row(children: [
              Flexible(
                flex: 3,
                child: Container(
                    height: 50,
                    //width: 55,
                    padding: const EdgeInsets.only(left: 30.0),
                    decoration: const BoxDecoration(
                        //color: Color(0xFFFFEE58),
                        border: Border()),
                    child: Text('2.')),
              ),
              Flexible(
                flex: 13,
                child: Container(
                    height: 50,
                    decoration: const BoxDecoration(),
                    child: Text(
                      'お客様に開示した個人情報に誤りがあった場合は、速やかに訂正を行ないます。',
                    )),
              ),
            ]),
            //3
            Row(children: [
              Flexible(
                flex: 3,
                child: Container(
                    height: 90,
                    //width: 55,
                    padding: const EdgeInsets.only(left: 30.0),
                    decoration: const BoxDecoration(
                        //color: Color(0xFFFFEE58),
                        border: Border()),
                    child: Text('3.')),
              ),
              Flexible(
                flex: 13,
                child: Container(
                    height: 90,
                    decoration: const BoxDecoration(),
                    child: Text(
                      'お客様ご本人、またはご本人が認めた代理人より、個人情報の利用停止のお申し出があっ' +
                          'た場合は、当社および当社関係会社での利用を速やかに中止いたします。',
                    )),
              ),
            ]),
            //4
            Row(children: [
              Flexible(
                flex: 3,
                child: Container(
                    height: 100,
                    //width: 55,
                    padding: const EdgeInsets.only(left: 30.0),
                    decoration: const BoxDecoration(
                        //color: Color(0xFFFFEE58),
                        border: Border()),
                    child: Text('4.')),
              ),
              Flexible(
                flex: 13,
                child: Container(
                    height: 100,
                    decoration: const BoxDecoration(),
                    child: Text(
                      'お客様からの開示請求にあたり、手数料として別途実費を請求させていただく場合があります。',
                    )),
              ),
            ]),
            //5
            Row(children: [
              Flexible(
                flex: 3,
                child: Container(
                    height: 170,
                    //width: 55,
                    padding: const EdgeInsets.only(left: 30.0),
                    decoration: const BoxDecoration(
                        //color: Color(0xFFFFEE58),
                        border: Border()),
                    child: Text('5.')),
              ),
              Flexible(
                flex: 13,
                child: Container(
                    height: 170,
                    decoration: const BoxDecoration(),
                    child: Text(
                      'お客様からの開示請求にあたり、ご本人を証明する公的な身分証明書（運転免許証、保険証、パスポート、住民票など）の写しが必要です。\n' +
                          '※個人情報に関するご相談・開示などの手続きについては、「７．お問い合わせ」までお問い合わせください。',
                    )),
              ),
            ]),

            Container(
              child: Align(
                alignment: Alignment.topLeft,
                child: Container(
                  child: Text.rich(
                    TextSpan(
                      text: '6.その他\n',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),

            Row(children: [
              Flexible(
                flex: 3,
                child: Container(
                  height: 20,
                  //width: 55,
                  padding: const EdgeInsets.only(left: 30.0),
                  decoration: const BoxDecoration(
                      //color: Color(0xFFFFEE58),
                      border: Border()),
                  child: Text.rich(
                    TextSpan(
                      text: '1.Cookieについて\n',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ]),

            Row(children: [
              Flexible(
                flex: 3,
                child: Container(
                    height: 300,
                    //width: 55,
                    padding: const EdgeInsets.only(left: 40.0),
                    decoration: const BoxDecoration(
                        //color: Color(0xFFFFEE58),
                        border: Border()),
                    child: Text(
                      'お客様が本サイトをご利用する過程で、サイト運営のためにお客様の「Cookie情報」を取得する場合があります。\n' +
                          '「Cookie情報」とは、お客様が当社のウェブサイトを再度訪問されたときなどに、より便' +
                          '利にご利用いただくため （お気に入りリストの情報を保管する機能などを提供）、お客様' +
                          'がご使用のコンピュータを識別するデータのことです。\n' +
                          'お客様がご使用になるインターネット閲覧ソフト（ブラウザ）の設定を変更することによ' +
                          'り、Cookie拒否するように設定することもできますが、 その場合当社ウェブサイト、また' +
                          'はウェブサイトにおけるサービスを正常にご利用頂けない場合がございますので、予めご' +
                          '了承ください。',
                    )),
              ),
            ]),

            Row(children: [
              Flexible(
                flex: 3,
                child: Container(
                  height: 20,
                  //width: 55,
                  padding: const EdgeInsets.only(left: 30.0),
                  decoration: const BoxDecoration(
                      //color: Color(0xFFFFEE58),
                      border: Border()),
                  child: Text.rich(
                    TextSpan(
                      text: '2.Webビーコンについて\n',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ]),

            Row(children: [
              Flexible(
                flex: 3,
                child: Container(
                    height: 250,
                    //width: 55,
                    padding: const EdgeInsets.only(left: 40.0),
                    decoration: const BoxDecoration(
                        //color: Color(0xFFFFEE58),
                        border: Border()),
                    child: Text(
                      '当社のウェブサイトには、Webビーコン（「クリアGIF」と呼ばれることもあります。）を使用しているページがあります。\n' +
                          'Webビーコンとは、特定のページに何回のアクセスが行われたかを知るための技術のことです。\n' +
                          '当社はウェブサイトの利用状況に関する統計をとり、ウェブページをはじめ、製品やサー' +
                          'ビスをより良いものに改善することを目的としてWebビーコンを使用しています。\n' +
                          'Webビーコンを用いて取得された情報には、個人を特定するような情報は一切含まれておりません。',
                    )),
              ),
            ]),

            Row(children: [
              Flexible(
                flex: 3,
                child: Container(
                  height: 20,
                  //width: 55,
                  padding: const EdgeInsets.only(left: 30.0),
                  decoration: const BoxDecoration(
                      //color: Color(0xFFFFEE58),
                      border: Border()),
                  child: Text.rich(
                    TextSpan(
                      text: '3.SSLについて\n',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ]),

            Row(children: [
              Flexible(
                flex: 3,
                child: Container(
                    height: 150,
                    //width: 55,
                    padding: const EdgeInsets.only(left: 40.0),
                    decoration: const BoxDecoration(
                        //color: Color(0xFFFFEE58),
                        border: Border()),
                    child: Text(
                      'SSLとは、情報を暗号化することで、データの盗聴や改ざんを防止して送受信する機能のことです。\n' +
                          '当社ウェブサイトでは、会員登録やアンケート回答の際など個人情報が送受信されるペー' +
                          'ジにおいて、SSLによる暗号化通信を使用し、お客様の個人情報が外部の第三者に通信傍' +
                          '受できないよう対策を行っています。',
                    )),
              ),
            ]),

            Row(children: [
              Flexible(
                flex: 3,
                child: Container(
                    height: 200,
                    //width: 55,
                    padding: const EdgeInsets.only(left: 50.0),
                    decoration: const BoxDecoration(
                        //color: Color(0xFFFFEE58),
                        border: Border()),
                    child: Text(
                      '■お客様の個人情報はお客様ご自身の意志で提供いただくようお願いいたします。ただし、ご提供いただけない情報がある場合、商品の発送、カタログやDMの送付などのサービスがご利用いただけない場合があります。\n' +
                          '■ご注文、お問い合わせの電話対応品質向上、正確な内容把握のため、お客様との通話を録音させていただく場合があります。',
                    )),
              ),
            ]),

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
