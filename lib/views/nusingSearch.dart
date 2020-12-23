import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:tis/views/nusing_detail.dart';

class NusingSearch extends StatefulWidget {
  NusingSearch({Key key}) : super(key: key);

  @override
  _NusingSearchState createState() => _NusingSearchState();
}

class _NusingSearchState extends State<NusingSearch> {

  @override
  Widget build(BuildContext context) {
    return Container(
       child: Padding(
         padding: const EdgeInsets.all(10.0),
         child: ListView(
           children: [

            Row(
              children: [
                SizedBox(width: 5.0),
                Icon(Icons.map),
                SizedBox(width: 5.0),
                Text("地図検索"),
                Text("「全国の介護施設 6件」"),
              ]
            ),
            DottedLine(),
            
            Card(
              color: Colors.blue,
              margin: EdgeInsets.only(top: 10.0),
              elevation: 0.0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical : 2.0 , horizontal : 8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        autofocus: false,
                        decoration: InputDecoration.collapsed(
                            hintText: "",
                            filled: true,
                            fillColor: Colors.white),
                        onChanged: (value) {
                          
                        },
                      ),
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    GestureDetector(
                      onTap: () {
                      
                      },
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                    ),
                    Text("検索" , style: TextStyle(color: Colors.white),),
                    SizedBox(
                      width: 8.0,
                    ),
                    
                  ],
                ),
              ),
            ),

            

      //     ExpansionTile(
      //   title: Text("User management"),
          
      //   children: <Widget>[
      //     ListTile(
      //             title: Text(
      //               'data'
      //             ),
      //           ),
      //     Text("Users"), 
      //   Text("Add user"),
      //   Text("Migrate users")
      //   ],
      // ),

            // Column(
            // children: <Widget>[
            //   SizedBox(height:20.0),
            //   ExpansionTile(
            //     title: Text(
            //       "Title",
            //       style: TextStyle(
            //         fontSize: 18.0,
            //         fontWeight: FontWeight.bold
            //       ),
            //     ),
            //     children: <Widget>[
            //       ExpansionTile(
            //         title: Text(
            //           'Sub title',
            //         ),
            //         children: <Widget>[
            //           ListTile(
            //             title: Text('data'),
            //           )
            //         ],
            //       ),
            //       ListTile(
            //         title: Text(
            //           'data'
            //         ),
            //       )
            //     ],
            //   ),
            // ]),


            // Card(
            //   child: new Column(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     crossAxisAlignment: CrossAxisAlignment.center,
            //     children: <Widget>[
            //       new GestureDetector(
            //         onTap: ()=>setState((){
            //           _animatedHeight!=0.0?_animatedHeight=0.0:_animatedHeight=100.0;}),
            //         child:  new Container(
            //         child: new Text("CLICK ME"),
            //         color: Colors.blueAccent,
            //         height: 25.0,
            //           width: 100.0,
            //       ),),
            //       new AnimatedContainer(duration: const Duration(milliseconds: 120),
            //         child: new Text("Toggle Me"),
            //         height: _animatedHeight,
            //         color: Colors.tealAccent,
            //         width: 100.0,
            //       )
            //     ],
            //   ) ,
            // ),

            SizedBox(height: 20.0),

            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blue
                  ), 
                  height: 36.0,
                  width: 10.0,
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 30.0,
                  decoration: BoxDecoration(
                    color: Colors.grey[100]
                  ),
                  padding: EdgeInsets.all(8.0),
                  child: Text("現在の検索条件" ,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.0),

            Text("地域で絞り込む"),
            
            Card(
              color: Colors.grey[300],
              child: Column(
                
                children:[
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0 , left : 10.0 , right: 10.0),
                    child: _dropDownBox("市区町村")
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: _dropDownBox("市区町村")
                  ),
                ]
              )
            ),
            
            SizedBox(height: 10.0),
            Text("料金で絞り込む"),
            Card(
              color: Colors.grey[300],
              //margin: EdgeInsets.all(10.0),
              child: Column(
                
                children:[
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0 , left : 10.0 , right: 10.0),
                    child: _dropDownBox("入居一時金")
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: _dropDownBox("月額利用料")
                  ),
                ]
              )
            ),
            SizedBox(height: 15.0),

            Container(
              alignment: Alignment.center,
              height: 200,
              width: 300,
              child: Text("Map"),
              color: Colors.blueGrey,
            ),

            Container(
              //padding: EdgeInsets.all(10.0),
              margin: EdgeInsets.only(top: 20.0,left: 20.0, right: 20.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blueAccent)
              ),
              width: 250,
              
              child: Column(
                
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Card(
                        margin: EdgeInsets.all(10.0),
                        color: Colors.blue,
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text("64室(全室個室)", style: TextStyle(color: Colors.white),),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 10.0),
                        child:Text("2017-04-01"),
                      )
                    ],
                  ),
                  
                  Container(
                    padding: EdgeInsets.all(5.0),
                    margin: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Text("施設番号:500009-0001"),
                  ),
                  
                  Row(
                    children: [
                      Icon(Icons.location_on,color: Colors.red,),
                      InkWell(
                        child: Text(
                          "ベストライフ船橋薬園台",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 18.0,
                            decoration: TextDecoration.underline)
                        ),
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> NusingDetail()));
                        },
                      ),
                      
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Text("千葉県"),
                        Icon(Icons.double_arrow ),
                        Text("船橋市")
                      ]
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10.0,bottom: 10.0),
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      onPressed: () {},
                      color: Colors.green,
                      textColor: Colors.white,
                      child: const Text('介護', style: TextStyle(fontSize: 16,)),
                    ),
                  ),
                  
                  ListTile(
                    leading: Image.asset(
                      "assets/logos/bbc-news.png", 
                      //fit: BoxFit.fitHeight,
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("運営事業者名",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 11.0
                          ),
                        ),
                        Text("株式会社アスモ介護サービス",
                        style: TextStyle(
                            fontSize: 11.0
                          ),
                        ),
                        Text("電話",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 11.0
                          ),
                        )
                      ]
                    )
                  ),
                  SizedBox(height: 10.0),

                  Container(
                    margin: EdgeInsets.all(10.0),
                    child: Table(
                      border: TableBorder.all(),
                      children: [
                        TableRow(
                          decoration: BoxDecoration(color: Colors.blue[100]),
                          children: [
                            TableCell(child: Center(child: Text("入居時費用"),heightFactor:2.0,)),
                            TableCell(child: Center(child: Text("月額費用"),heightFactor:2.0,)),
                          ]
                        ),
                      ]
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10.0 , right: 10.0,bottom: 10.0),
                    child: Table(
                      border: TableBorder.all(),
                      children: [
                        TableRow(
                          children: [
                            TableCell(child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                Text("300",style: TextStyle(color: Colors.red,),),
                                SizedBox(width:5.0),
                                Text("万円")
                              ],),heightFactor:2.0,)),
                            TableCell(child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                Text("20.25",style: TextStyle(color: Colors.red,),),
                                SizedBox(width:5.0),
                                Text("万円")
                              ],),heightFactor:2.0,)),
                          ]
                        ),
                      ]
                    ),
                  ),
                ],       
              ),         
            ),
            SizedBox(height: 20.0),
            Text("もっと探す条件"),
            Row(children: [ 
              SizedBox(
                height: 20.0,
                width: 40.0,
                child: Divider(color: Colors.blue[400],thickness: 3.0,)
              ),]
            ),

            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1.0),
              ), 
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: _dropDownCheckBox("aaa"),
              )
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1.0),
              ), 
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: _dropDownCheckBox("aaa"),
              )
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1.0),
              ), 
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: _dropDownCheckBox("aaa"),
              )
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1.0),
              ), 
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: _dropDownCheckBox("aaa"),
              )
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1.0),
              ), 
              padding: EdgeInsets.symmetric(vertical: 4,horizontal: 8),
              child: RaisedButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                onPressed: () {},
                color: Colors.green,
                textColor: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.search),
                    Text('検索', style: TextStyle(fontSize: 16,)),
                ],)

              ),
            ),

            Container(
              padding: EdgeInsets.all(10.0),
              margin: EdgeInsets.only(top: 20.0 , bottom: 20.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blueAccent)
              ),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Container(
                     padding: EdgeInsets.all(5.0),
                    margin: EdgeInsets.only(bottom: 8.0),
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
                      "ベストライフ三鷹",
                      style: TextStyle(
                        color: Colors.blue,
                        //fontSize: 18.0,
                        decoration: TextDecoration.underline)
                    ),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> NusingDetail()));
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0 , bottom: 0.0),
                    child: Row(
                      children: [
                        Text("開設年月日 :",style: TextStyle(color: Colors.green)),
                        Text("2017-04-01")
                      ]
                    ),
                  ),
                  Divider( thickness: 2),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0 , bottom: 8.0, left: 8.0),
                    child: Row(
                      children: [
                        Text("東京都"),
                        SizedBox(width: 4.0),
                        Icon(Icons.double_arrow ),
                        SizedBox(width: 4.0),
                        Text("三鷹市")
                      ]
                    ),
                  ),
                  Card(
                    margin: EdgeInsets.all(10.0),
                    color: Colors.blue,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text("64室(全室個室)", style: TextStyle(color: Colors.white),),
                    ),
                  ),
                  Center(
                    child: Image.asset("assets/logos/bbc-news.png", width: 200, height: 150,),
                  ),
                  
                  Container(
                    margin: EdgeInsets.only(top: 12.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1.0),
                    ), 
                    child: ListTile(
                      leading: CircleAvatar(
                        foregroundColor: Colors.black,
                        radius: 18.0,
                        backgroundColor: Colors.grey[200],
                        child: Text("¥" ,style: TextStyle(fontSize: 20,color: Colors.blue)),
                      ),
                      title: Text("入居時費用"),
                    )
                  ),
                  
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1.0),
                    ), 
                    child: ListTile(title: Text("0円 ~ 380万円", style: TextStyle(color: Colors.red),),),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1.0),
                    ), 
                    child: ListTile(
                      leading: CircleAvatar(
                        foregroundColor: Colors.black,
                        radius: 18.0,
                        backgroundColor: Colors.grey[200],
                        child: Text("¥" ,style: TextStyle(fontSize: 20,color: Colors.blue)),
                      ),
                      title: Text("月額費用"),
                    )
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1.0),
                    ), 
                    child: ListTile(title: Text("0円 ~ 380万円", style: TextStyle(color: Colors.red),),),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1.0),
                    ), 
                    child: ListTile(
                      leading: CircleAvatar(
                        foregroundColor: Colors.black,
                        radius: 18.0,
                        backgroundColor: Colors.grey[200],
                        child: Icon(Icons.location_on,color: Colors.blue,)
                      ),
                      //leading: Icon(Icons.location_on,color: Colors.blue,),
                      title: Text("住所"),
                    )
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1.0),
                    ), 
                    child: ListTile(title: Text("東京都三鷹市中原3-4-7"),),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1.0),
                    ), 
                    child: ListTile(
                      leading: CircleAvatar(
                        foregroundColor: Colors.black,
                        radius: 18.0,
                        backgroundColor: Colors.grey[200],
                        child: Icon(Icons.location_on,color: Colors.blue,)
                      ),
                      //leading: Icon(Icons.location_on,color: Colors.blue,),
                      title: Text("アクセス"),
                    )
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1.0),
                    ), 
                    child: ListTile(title: Text("京王線「仙川」駅から徒歩3分「仙川」バス停より小田急バス乗車「中原小学校」バス停下車徒歩約4分京王線「つつじヶ丘」駅よりみたかシティバス 「杏林大学病院」行「中原高架下児童公園」バス停から徒歩2分"),),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1.0),
                    ), 
                    child: ListTile(
                      leading: CircleAvatar(
                        foregroundColor: Colors.black,
                        radius: 18.0,
                        backgroundColor: Colors.grey[200],
                        child: Icon(Icons.apartment ,color: Colors.blue,)
                      ),
                      title: Text("運営事業者名"),
                    )
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1.0),
                    ), 
                    child: ListTile(title: Text("株式会社アスモ介護サービス"),),
                  ),
                  SizedBox(height: 10.0),
                  Text("こだわりの特長"),
                  DottedLine(dashColor: Colors.blue,),
                  
                  SizedBox(height: 10.0),
                  RaisedButton(
                    onPressed: () {
                       Navigator.push(context, MaterialPageRoute(builder: (context)=> NusingDetail()));
                    },
                    color: Colors.blue,
                    textColor: Colors.white,
                    child: Center(child: Text("詳細を見る"),),
                  ),
                 ],
               ),
               
            ),

            //News
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blue
                  ), 
                  height: 36.0,
                  width: 10.0,
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 30.0,
                  decoration: BoxDecoration(
                    color: Colors.blue[100]
                  ),
                  padding: EdgeInsets.all(8.0),
                  child: Text("News" ,
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.0
            ),

            Row(
              children: [
                RaisedButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
                  onPressed: () {},
                  color: Colors.grey,
                  child: Center(child: Text("2020年"),),
                ),
              ],
            ),
            SizedBox(
              height: 10.0
            ),
            
            _news()

           ],
      ),
       ),
    );
  }

  Widget _news(){
    return Column(
      children: [
        Row(
              children: [
                Text("2020-11-06"),
                SizedBox(width: 20.0),
                Card(
                  color: Colors.blue,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
                    child: Text("お知らせ" , style: TextStyle(color: Colors.white),)
                  ),
                ),
              ]
            ),
            SizedBox(
              height: 5.0
            ),
            Text("介護施設検索サービスを開設しました。登録・サイト利用等サービスをご利用出来ますので、皆様奮ってご利用下さい。"),
            Divider(thickness: 2,),
      ]
        
    );
  }

  Widget _dropDownCheckBox(String hintText){
    return Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: Colors.grey[200],
              border: Border.all()),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                isExpanded: true,
                //value: _value,
                hint: Text(hintText),
                items: [
                  DropdownMenuItem(
                    child: Row(
                      children: <Widget>[
                        Checkbox(
                          onChanged: (bool value) {

                          }, value: false,
                        ),
                        Text('First'),
                      ],
                    ),
                  ),
                  DropdownMenuItem(
                    child: Row(
                      children: <Widget>[
                        Checkbox(
                          onChanged: (bool value) {

                          }, value: false,
                        ),
                        Text('Second'),
                      ],
                    ),
                  ),
                 
                  // DropdownMenuItem(
                  //   child: Text("Second Item"),
                  //   value: 2,
                  // ),
                  // DropdownMenuItem(
                  //   child: Text("Third Item"),
                  //   value: 3
                  // ),
                  // DropdownMenuItem(
                  //     child: Text("Fourth Item"),
                  //     value: 4
                  // )
                ],
                onChanged: (value) {
                  setState(() {
                    //_value = value;
                  });
                }),
              ),
            );
  }


  Widget _dropDownBox(String hintText){
    return Container(
            //padding: EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: Colors.white,
              border: Border.all()),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  isExpanded: true,
                //value: _value,
                hint: Row(
                  children: [
                    Icon(Icons.arrow_drop_down_outlined, size: 35.0,),
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

