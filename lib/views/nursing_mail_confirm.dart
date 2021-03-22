import 'package:flutter/material.dart';
import 'package:tis/bloc/get_nursing_detail_bloc.dart';
import 'package:tis/model/nursingMailComment.dart';
import 'package:tis/views/nursing_mail_complete.dart';
import 'package:tis/views/nusing_favourite_mail.dart';
import 'package:tis/views/send_completely.dart';

class NursingMailConfirm extends StatefulWidget {
  final String nursingId;
  
  final NursingMailCommentModel mailcomment;

  const NursingMailConfirm({Key key,@required this.nursingId,@required this.mailcomment}) : super(key: key);

  @override
  _NursingMailConfirmState createState() => _NursingMailConfirmState();
}

class _NursingMailConfirmState extends State<NursingMailConfirm> {

  var stream;

  @override
  void initState() {
    super.initState();
    stream = getNursingDetailBloc..getNursingDetailData(widget.nursingId);
  }

  @override
  void dispose() { 
    getNursingDetailBloc.drainStream();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("介護施設資料請求"),
        backgroundColor:Color(0xff63b7ff),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("介護施設資料請求",
                  style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  ),
                ),
                SizedBox(height: 10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.blue[300], 
                      ),
                      child: Text("1.入力",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.blue[300], 
                      ),
                      child: Text("2.確認",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue[300]),
                      ),
                      child: Text("3.完了",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 12
                        ),
                      ),
                    )
                  ],
                ),

                SizedBox(height: 10),
                Text("資料請求される方について",
                  style: TextStyle(
                  fontSize: 18.0,
                  ),
                ),
                SizedBox(
                  height: 15.0,
                  width: 80.0,
                  child: Divider(color: Colors.blue[400],thickness: 5.0,)
                ),
                SizedBox(height: 10), 
                Table(
                  border: TableBorder.all(color: Colors.grey[400]),
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  children: [
                    TableRow( children: [ _columnHeader("お名前"), ] ),
                    TableRow(
                      children: [
                        _column(widget.mailcomment.name),
                      ]
                    ),
                    TableRow( children: [ _columnHeader("フリガナ"), ] ),
                    TableRow(
                      children: [
                        _column(widget.mailcomment.furigana),
                      ]
                    ),
                    TableRow( children: [ _columnHeader("生年月日"), ] ),
                    TableRow(
                      children: [
                        _column(widget.mailcomment.bdate),
                      ]
                    ),
                    TableRow( children: [ _columnHeader("性別"), ] ),
                    TableRow(
                      children: [
                        _column(widget.mailcomment.sex1),
                      ]
                    ),
                    TableRow( children: [ _columnHeader("ご住所"), ] ),
                    TableRow(
                      children: [
                        Container(
                          padding: EdgeInsets.all(12),
                          color: Color(0xffffffff),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("郵便番号" , 
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16
                              ),),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 2 , vertical: 4),
                                child: Text(widget.mailcomment.postal != null ? widget.mailcomment.postal : "",
                                  style: TextStyle(
                                    fontSize: 16
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 4 , vertical: 4),
                                child: Text("都道府県" , 
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16
                                ),),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8 , vertical: 4),
                                child: Text(widget.mailcomment.division != null ? widget.mailcomment.division : "" ),
                              ),
                              
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 12 , vertical: 4),
                                child: Text("市区町村" , 
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16
                                ),),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 12 , vertical: 4),
                                child: Text(widget.mailcomment.township != null ? widget.mailcomment.township : "" ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16 , vertical: 4),
                                child: Text("番地（建物名)" , 
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16
                                ),),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16 , vertical: 4),
                                child: Text(widget.mailcomment.city != null ? widget.mailcomment.city : "",
                                  style: TextStyle(
                                    fontSize: 16
                                  ),
                                ),
                              ),
                            ]
                          )
                        )
                      ]
                    ),
                    TableRow( children: [ _columnHeader("電話番号"), ] ),
                    TableRow(
                      children: [
                        _column(widget.mailcomment.phone),
                      ]
                    ),
                    TableRow( children: [ _columnHeader("メールアドレス"), ] ),
                    TableRow(
                      children: [
                        _column(widget.mailcomment.mail),
                      ]
                    ),
                  ]
                ),

                SizedBox(height: 10),
                _blueLineHeader("入居対象者様について"),
                SizedBox(height: 10),

                Table(
                  border: TableBorder.all(color: Colors.grey[400]),
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  children: [
                    TableRow( children: [ _columnHeader("入居対象者様とのご関係"), ] ),
                    TableRow(
                      children: [
                        _column(widget.mailcomment.relation),
                      ]
                    ),
                    TableRow( children: [ _columnHeader("お名前"), ] ),
                    TableRow(
                      children: [
                        _column(widget.mailcomment.ttname),
                      ]
                    ),
                    TableRow( children: [ _columnHeader("性別"), ] ),
                    TableRow(
                      children: [
                        _column(widget.mailcomment.sex),
                      ]
                    ),
                    TableRow( children: [ _columnHeader("年齢"), ] ),
                    TableRow(
                      children: [
                        _column(widget.mailcomment.years),
                      ]
                    ),
                    TableRow( children: [ _columnHeader("介護度"), ] ),
                    TableRow(
                      children: [
                        _column(widget.mailcomment.nursing),
                      ]
                    ),
                    TableRow( children: [ _columnHeader("認知症"), ] ),
                    TableRow(
                      children: [
                        _column(widget.mailcomment.fect),
                      ]
                    ),
                    TableRow( children: [ _columnHeader("ご要望や、お困りごと、その他お問い合わせ"), ] ),
                    TableRow(
                      children: [
                        _column(widget.mailcomment.hope),
                      ]
                    ),
                  ]
                ),

                SizedBox(height: 20.0),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RaisedButton(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      color: Colors.red,
                      textColor: Colors.white,
                      child: Text('入力画面に戻る', style: TextStyle(fontSize: 16,)),
                    ),
                    SizedBox(width: 20),
                    RaisedButton(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> const NursingMailComplete()));
                      },
                      color: Colors.green,
                      textColor: Colors.white,
                      child: Text('上記内容を送信する', style: TextStyle(fontSize: 16,)),
                    ),
                  ]
                ),

              ]
            ),
          ),
      )
    );
  }

  Widget _columnHeader(String name){
    return Container(
      padding: EdgeInsets.all(12),
      color: Colors.grey[200],
      child: Text(name != null ? name : '', 
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16
        ),),
    );
  }

  Widget _column(String name){
    return Container(
      padding: EdgeInsets.all(12),
      color: Color(0xffffffff),
      child: Text(name != null ? name : '', 
        style: TextStyle(
          fontSize: 16
        ),),
    );
  }

   

  Widget _blueLineHeader(String header){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(header,
          style: TextStyle(
          fontSize: 18.0,
          ),
        ),
          SizedBox(
          height: 15.0,
          width: 80.0,
          child: Divider(color: Colors.blue[400],thickness: 5.0,)
        ),
      ]
    );
  }

  Widget _error(String name){
    return Text(name,
      style: TextStyle(
        fontSize: 12,
        color: Colors.red,
      ),
    );
  }

  Widget _itemHeaderButton(String name, bool isRequire){
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[400]),
        color: Colors.grey[200]
      ), 
      child: Row(
        children: [
          Text(name),
          isRequire ? SizedBox(width: 20) : Container(),
          isRequire ? _orangeCard() : Container(),
        ],
      )
    );
  }

  Widget _itemHeader(String header){
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        color: Colors.grey[200]
      ), 
      child: Row(
        children: [
          Text(header),
        ],
      )
    );
  }

  Widget _orangeCard(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.redAccent,
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      child: Text("必須",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 12
        ),
      ),
    );
  }


  // Widget _header(String name , bool isRequire){
  //   return Container(
  //     padding: EdgeInsets.all(10),
  //     color: Colors.grey[200],
  //     child: Row(
  //       children: [
  //         Text(name),
  //         SizedBox(width: 20),
  //         isRequire ? _orangeCard() : null,
  //       ],
  //     )
  //   );
  // }

  
}