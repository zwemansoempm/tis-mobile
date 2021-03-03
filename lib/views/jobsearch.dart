import 'package:flutter/material.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:tis/views/jobdetail.dart';
// import 'package:tis/views/multiselect.dart';

class MultiSelectDialogItem<V> {
  const MultiSelectDialogItem(this.value, this.label);

  final V value;
  final String label;
}

class MultiSelectDialog<V> extends StatefulWidget {
  MultiSelectDialog({Key key, this.items, this.initialSelectedValues}) : super(key: key);

  final List<MultiSelectDialogItem<V>> items;
  final Set<V> initialSelectedValues;

  @override
  State<StatefulWidget> createState() => _MultiSelectDialogState<V>();
}

class _MultiSelectDialogState<V> extends State<MultiSelectDialog<V>> {
  final _selectedValues = Set<V>();

  void initState() {
    super.initState();
    if (widget.initialSelectedValues != null) {
      _selectedValues.addAll(widget.initialSelectedValues);
    }
  }

  void _onItemCheckedChange(V itemValue, bool checked) {
    setState(() {
      if (checked) {
        _selectedValues.add(itemValue);
      } else {
        _selectedValues.remove(itemValue);
      }
    });
  }

  void _onCancelTap() {
    Navigator.pop(context);
  }

  void _onSubmitTap() {
    Navigator.pop(context, _selectedValues);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Select Item'),
      contentPadding: EdgeInsets.only(top: 12.0),
      content: SingleChildScrollView(
        child: ListTileTheme(
          contentPadding: EdgeInsets.fromLTRB(14.0, 0.0, 24.0, 0.0),
          child: ListBody(
            children: widget.items.map(_buildItem).toList(),
          ),
        ),
        
      ),
      actions: <Widget>[
        FlatButton(
          child: Text('CANCEL'),
          onPressed: _onCancelTap,
        ),
        FlatButton(
          child: Text('OK'),
          onPressed: _onSubmitTap,
        )
      ],
    );
  }

  Widget _buildItem(MultiSelectDialogItem<V> item) {
    final checked = _selectedValues.contains(item.value);
    return CheckboxListTile(
      value: checked,
      title: Text(item.label),
      controlAffinity: ListTileControlAffinity.leading,
      onChanged: (checked) => _onItemCheckedChange(item.value, checked),
    );
  }
}


class Checkbox extends StatefulWidget {
  @override
  _CheckboxState createState() => _CheckboxState();
}

class _CheckboxState extends State<Checkbox> {

  String value = "";

  List <MultiSelectDialogItem<int>> multiItem = List();

  final valuestopopulate = {
    1 : "One",
    2 : "Two",
    3 : "Three",
    4 : "Four",
  };

  var selectedValues;

  void populateMultiselect(){
    for(int v in valuestopopulate.keys){
      multiItem.add(MultiSelectDialogItem(v, valuestopopulate[v]));
    }
  }

    void _showMultiSelect(BuildContext context) async {
      multiItem = [];
      populateMultiselect();
      final items = multiItem;

    final selectedValues = await showDialog<Set<int>>(
      context: context,
      builder: (BuildContext context) {
        return MultiSelectDialog(
          items: items,
        );
      },
    );

    print(selectedValues);
    getvaluefromkey(selectedValues);
  }

  void getvaluefromkey(Set selection){
    if(selection != null){
      for(int x in selection.toList()){
        print(valuestopopulate[x]);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:8.0, horizontal: 20),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
            
        children: <Widget>[

              
          RaisedButton(
            color: Colors.grey[200],
                
            // icon: Icon(Icons.arrow_drop_down_rounded),
            child: Column(
                  
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:8.0, vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(child: Text("医療技術職", style: TextStyle(fontSize: 18),)),
                      Icon(Icons.arrow_drop_down, size: 30),
                    ],
                  ),
                ),

              ],
            ),
            onPressed: () => _showMultiSelect(context),
          ),

        ],
      ),
    );
  }
}

class JobSearch extends StatefulWidget {
  JobSearch({Key key}) : super(key: key);
  @override
  _JobSearchState createState() => _JobSearchState();
}

class _JobSearchState extends State<JobSearch> {

  String dropdownValue = '市区町村';

  // To show Selected Item in Text.
  String holder = '' ;

  List <String> items = [
    '市区町村', 
    '北海道', 
    '青森県', 
    '岩手県', 
    '宮城県'
    ] ;

  String dropdownValue1 = '市区町村';

  // To show Selected Item in Text.
  String holder1 = '' ;

  List <String> items1 = [
    '市区町村', 
    '北海道', 
    '青森県', 
    '岩手県', 
    '宮城県'
    ] ;

  void getDropDownItem(){

    setState(() {
      holder = dropdownValue ;
    });
  }

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
                  color: Colors.blue,
                ),
                width: 6.0,
                height: 40.0,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 25.0,
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
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
                          horizontal: 15.0, vertical: 10.0),
                      child: _buildSelectDropdown(),
                    ),
                  ],
                ),

                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 10.0),
                      child: _buildSelectbox(),
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
                  // color: Colors.grey[300],
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 10.0, top: 10.0, bottom: 10.0),
                        child: Text(
                          '職種',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  child: Divider(
                    color: Colors.grey[300],
                    thickness: 0.9,
                  ),
                ),

                // For Checkbox, selected values are displayed on Debug Console

                Checkbox(),

                Checkbox(),

                Checkbox(),

                Checkbox(),

                SizedBox(
                  child: Divider(
                    color: Colors.grey[300],
                    thickness: 0.9,
                  ),
                ),
                
                Padding(
                  padding: const EdgeInsets.only(bottom:8.0),
                  child: Checkbox(),
                ),
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
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical:10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.search,
                        size: 22.0,
                      ),
                      SizedBox(width: 5,),
                      Text('検索',
                          style: TextStyle(
                            fontSize: 16,
                          )),
                    ],
                  ),
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
                    '介護職【正社員】アスモ介護サービス薬園台(船橋薬園台)★未経験の方も安心!',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      // decoration: TextDecoration.underline,
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
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Colors.black),
                      borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                    child: Text(
                      "正職員",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),

                Divider(thickness: 2),

                _buildColumnOne(),

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

                _buildColumnTwo(),

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

                _buildColumnThree(),

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

                _buildColumnFour(),

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
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => JobDetail()),
                        );
                      },
                      color: Colors.blue,
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
                                color: Colors.white,
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
                    '介護職【正社員】アスモ介護サービス薬園台(船橋薬園台)★未経験の方も安心!',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
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

                _buildColumnOne(),

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

                _buildColumnTwo(),

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

                _buildColumnThree(),

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

                _buildColumnFour(),

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
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => JobDetail()),
                        );
                      },
                      color: Colors.blue,
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
                    '介護職【正社員】アスモ介護サービス薬園台(船橋薬園台)★未経験の方も安心!',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
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

                _buildColumnOne(),

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

                _buildColumnTwo(),

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

                _buildColumnThree(),

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

                _buildColumnFour(),

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
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => JobDetail()),
                        );
                      },
                      color: Colors.blue,
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
        ],
      ),
    );
  }

  // Widget buildJobCheckbox(JobType jobtype) => buildCheckbox(
  //     jobtype: jobtype,
  //     onClicked: () {
  //       setState(() {
  //         final occupation = !jobtype.value;
  //         jobtype.value = occupation;
  //       });
  //     });

  // Widget buildCheckbox({
  //   @required JobType jobtype,
  //   @required VoidCallback onClicked,
  // }) =>
  //     ListTile(
  //       onTap: onClicked,
  //       leading: Transform.scale(
  //         scale: 0.8,
  //         child: Checkbox(
  //           checkColor: Colors.white,
  //           value: jobtype.value,
  //           onChanged: (value) => onClicked(),
  //         ),
  //       ),
  //       title: Text(
  //         jobtype.title,
  //         style: TextStyle(
  //           fontSize: 14,
  //         ),
  //       ),
  //     );

  Widget _buildColumnOne (){
    return Container(
    margin: EdgeInsets.only(top: 12.0),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey[500], width: 1.0),
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
      title: Text('最寄り駅', style: TextStyle(
        fontWeight: FontWeight.bold,
      ),),
    ));
  }

  Widget _buildColumnTwo(){
    return Container(
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey[500], width: 1.0),
      color: Colors.grey[200],
    ),
    child: ListTile(
      leading: CircleAvatar(
                        
        foregroundColor: Colors.black,
        radius: 18.0,
        backgroundColor: Colors.grey[200],
                        
        child: Text("¥",
            style: TextStyle(fontSize: 20, color: Colors.grey[600])),
      ),
      title: Text("給料", style: TextStyle(
        fontWeight: FontWeight.bold,
      )),
    ));
  }

  Widget _buildColumnThree(){
    return Container(
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey[500], width: 1.0),
      color: Colors.grey[200],
    ),
    child: ListTile(
      leading: CircleAvatar(
        foregroundColor: Colors.black,
        radius: 18.0,
        backgroundColor: Colors.grey[200],
        // child: Text("時",
        //     style: TextStyle(fontSize: 20, color: Colors.blue)),
      ),
      title: Text("就業時間/休日休暇", style: TextStyle(
      fontWeight: FontWeight.bold,
    )),
    )
    );
  }

  Widget _buildColumnFour(){
    return Container(
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey[500], width: 1.0),
      color: Colors.grey[200],
    ),
    child: ListTile(
      leading: CircleAvatar(
        foregroundColor: Colors.black,
        radius: 18.0,
        backgroundColor: Colors.grey[200],
        // child: Icon(
        //   Icons.home_repair_service,
        //   color: Colors.blue,
        // ),
      ),
      title: Text("特別な条件", style: TextStyle(
      fontWeight: FontWeight.bold,
    )),
    ));
  }

  Widget _buildSelectDropdown(){
    return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [

    Container(
      margin: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5.0),
      color: Colors.grey[200],
      border: Border.all(color: Colors.grey[300])),
            
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Icon(Icons.arrow_drop_down, size: 30,),
                  
            Expanded(
                child: ButtonTheme(
                  alignedDropdown: true,
                  child: DropdownButton<String>(
                        
                  itemHeight: 50,
                  dropdownColor: Colors.grey[100],
                  value: dropdownValue,
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: 0,
                  elevation: 16,
                  style: TextStyle(color: Colors.black, fontSize: 18),
                  underline: Container(
                    height: 0,
                  ),
                  onChanged: (String data) {
                    setState(() {
                      holder = data;
                      dropdownValue = data;
                    });
                  },
                  items: items.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
              ),
                ),
            ),

            Column(
              children: [
                Icon(Icons.arrow_drop_up, size: 20,),
                Icon(Icons.arrow_drop_down, size: 20,),

              ],
            ),



          ],
        ),
      ),
    ),
    SizedBox(height: 20,),
          
      //Printing Item on Text Widget 
      Text('Selected Item = ' + '$holder', 
      style: TextStyle
          (fontSize: 12, 
          color: Colors.black)),

    ]);
  }

  Widget _buildSelectbox(){
    return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [

    Container(
      margin: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5.0),
      color: Colors.grey[200],
      border: Border.all(color: Colors.grey[300])),
            
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Icon(Icons.arrow_drop_down, size: 30,),
                  
            Expanded(
                child: ButtonTheme(
                alignedDropdown: true,
                child: DropdownButton<String>(
                    
                itemHeight: 50,
                dropdownColor: Colors.grey[100],
                value: dropdownValue1,
                icon: Icon(Icons.arrow_drop_down),
                iconSize: 0,
                elevation: 16,
                style: TextStyle(color: Colors.black, fontSize: 18),
                underline: Container(
                  height: 0,
                ),
                onChanged: (String data) {
                  setState(() {
                    holder1 = data;
                    dropdownValue1 = data;
                  });
                },
                items: items1.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
                                ),
            ),

            Column(
              children: [
                Icon(Icons.arrow_drop_down, size: 20,),

              ],
            ),



          ],
        ),
      ),
    ),
    SizedBox(height: 20,),
          
      //Printing Item on Text Widget 
      Text('Selected Item = ' + '$holder1', 
      style: TextStyle
          (fontSize: 12, 
          color: Colors.black)),

    ]);
  }




}
