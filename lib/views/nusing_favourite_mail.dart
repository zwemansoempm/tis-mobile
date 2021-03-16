import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_focus_watcher/flutter_focus_watcher.dart';
import 'package:form_validator/form_validator.dart';
import 'package:tis/bloc/get_city_bloc.dart';
import 'package:tis/bloc/get_nursing_detail_bloc.dart';
import 'package:tis/bloc/get_postalList_block.dart';
import 'package:tis/bloc/get_tsp_bloc.dart';
import 'package:tis/elements/loader.dart';
import 'package:tis/model/city.dart';
import 'package:tis/model/city_response.dart';
import 'package:tis/model/postal_list.dart';
import 'package:tis/model/postal_list_response.dart';
import 'package:tis/model/township.dart';
import 'package:tis/model/township_response.dart';
import 'package:tis/views/send_completely.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class NusingMail extends StatefulWidget {
  final String nursingId;

  const NusingMail({Key key,@required this.nursingId}) : super(key: key);

  @override
  _NusingMailState createState() => _NusingMailState();
}

enum Gender { male, female , couple }
enum Fect { Yes, No , Nan}

class _NusingMailState extends State<NusingMail> {
  TextEditingController nameController = TextEditingController();
  TextEditingController furiganaController = TextEditingController();
  TextEditingController birthdayController = TextEditingController();
  //TextEditingController genderController = TextEditingController();
  TextEditingController zipCodeController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController townshipId= TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneNoController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController hopeController = TextEditingController();
  TextEditingController tnameController = TextEditingController();

  DateTime _selectedDate;
  final format = DateFormat("yyyy-MM-dd");
  Gender _gender;

  String pref;
  String _township;
  String _city;

  String city;
  String _street;
  int city_id;
  String township_id;

  var stream1;
  var checkstream = 0;
  int checkSearch = 0;

  var stream;
  List<PostalList> postalList;
  List<TownshipModel> tspIdList;
  GlobalKey<FormState> _form = GlobalKey<FormState>();
  ScrollController _scrollController = new ScrollController();
  Gender _relationGender;
  String _fect;
  String relation;
  String nursing;

  List<String> relationList = ["本人", "家族", "親族", "友人", "ケアマネージャー", "ソーシャルワーカー", "その他"];
  List<String> nursingList = ["自立", "要支援", "要介護1", "要介護2", "要介護4", "要介護5", "不明"];

  _validate() {
    return _form.currentState.validate();
  }
  //int selectedRadio;

  @override
  void initState() {
    super.initState();
    stream = getNursingDetailBloc..getNursingDetailData(widget.nursingId);
    //selectedRadio = 0 ;
  }

  @override
  void dispose() { 
    getNursingDetailBloc.drainStream();
    super.dispose();
  }

  setSelectedRadioGender(Gender val){
    setState(() {
      _gender = val;
    });
  }

  setSelectedRadioRelGender(Gender val){
    setState(() {
      _relationGender = val;
    });
  }

  setSelectedRadioFect(String val){
    setState(() {
      _fect = val;
    });
  }

  // fetchDat() async {
  //   return await 
  //   return await fetchCategories().then((catList) {
  //     categories = catList;
  //     tabController = TabController(length: categories.length, vsync: this);
  //   }).catchError((onError) {
  //     print("Can't Fetch Error");
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return FocusWatcher(
      child: Scaffold(
        appBar: AppBar(
          title: Text("介護施設資料請求"),
          backgroundColor:Color(0xff63b7ff),
        ),
        body: Form(
          child: SingleChildScrollView(
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
                            border: Border.all(color: Colors.blue[300]),
                          ),
                          child: Text("2.確認",
                            style: TextStyle(
                              color: Colors.blue,
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _orangeCard(),
                        Text("のついた項目は全て入力してくださいますようお願いいたします。",
                          style: TextStyle(
                            fontSize: 11,
                          ),
                        )
                      ]
                    ),
                    SizedBox(height: 10),
                    
                    _itemHeaderButton("お名前", true),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[400])
                      ), 
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Theme(
                            child: TextFormField(
                              validator:ValidationBuilder().regExp(RegExp("(\\[w]+|[一-龠]+|[ぁ-ゔ]+|[ァ-ヴー]+|[a-zA-Z0-9]+|[ａ-ｚＡ-Ｚ０-９]+|[々〆〤]+)\\s+(\\[w]+|[一-龠]+|[ぁ-ゔ]+|[ァ-ヴー]+|[a-zA-Z0-9]+|[ａ-ｚＡ-Ｚ０-９]+|[々〆〤]+)", unicode: false),"First Name,Last Nameを入力してください。").minLength(1).maxLength(50).build(),
                              controller: nameController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                fillColor: Colors.grey,
                                contentPadding: EdgeInsets.all(8),
                                labelText: 'お名前を入力してください。',
                              ),
                            ),
                            data: Theme.of(context).copyWith(
                              primaryColor: Colors.blue,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text("例）探し太郎"),
                          //_error("※入力は必須です。"),
                        ],
                      )
                    ),
                    _itemHeaderButton("フリガナ" , true),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[400])
                      ), 
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Theme(
                            child: TextFormField(                                                
                              validator:new ValidationBuilder().regExp(RegExp("/[ぁ-ゔ]+|[ァ-ヴー]+|[a-zA-Z0-9]+/u",unicode: false),"フリガナを入力してください。")
                              .minLength(1).maxLength(50).build(),                          
                              controller: furiganaController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.all(8),
                                fillColor: Colors.grey,
                                labelText: 'フリガナを入力してください。',
                              ),
                            ),
                            data: Theme.of(context).copyWith(
                              primaryColor: Colors.blue,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text("例）サガシタロウ"),
                        ],
                      )
                    ),
                    _itemHeaderButton("生年月日", false),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[400])
                      ), 
                      child: Theme(
                        data: Theme.of(context).copyWith(
                          primaryColor: Colors.blue,
                        ),
                        child: TextFormField(
                          validator:new ValidationBuilder().regExp(RegExp("^([0-9]{4}|[0-9]{2})[-]([0]?[1-9]|[1][0-2])[-]([0]?[1-9]|[1|2][0-9]|[3][0|1])",unicode: false),"生年月日を入力してください。")
                          .minLength(10).maxLength(10).build(), 
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            fillColor: Colors.grey,
                            contentPadding: EdgeInsets.fromLTRB(30.0, 10.0, 100.0, 10.0),
                            labelText: '年 - 月 - 日',
                            hintStyle: TextStyle(fontSize: 15),
                          ),
                          controller: birthdayController,
                          onTap: () {
                            _selectDate(context);
                          },
                        ),
                      )
                    ),
                    _itemHeaderButton("性別", false),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[400])
                      ),
                      child: Column(
                        children: <Widget>[
                          RadioListTile(
                            //contentPadding: EdgeInsets.zero,
                            title: const Text('男性'),
                            value: Gender.male,
                            dense: true,
                            groupValue: _gender,
                            onChanged: (val) {
                              setSelectedRadioGender(val);
                            },
                          ),
                          RadioListTile(
                            //contentPadding: EdgeInsets.zero,
                            title: const Text('女性'),
                            value: Gender.female,
                            dense: true,
                            groupValue: _gender,
                            onChanged: (val) { setSelectedRadioGender(val); },
                          ),
                          RadioListTile(
                            //contentPadding: EdgeInsets.zero,
                            title: const Text('夫婦'),
                            value: Gender.couple,
                            dense: true,
                            groupValue: _gender,
                            onChanged: (val) { setSelectedRadioGender(val); },
                          ),
                        ],
                      )
                    ),

                    _itemHeaderButton("ご住所" , false),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[400])
                      ), 
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("郵便番号"),
                          SizedBox(height: 10.0),
                          Theme(
                            child: TextFormField(                     
                              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                              validator:new ValidationBuilder()
                              .minLength(1).maxLength(10).build(),    
                              controller: zipCodeController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.all(8),
                                fillColor: Colors.grey,
                                labelText: '郵便番号を入力してください。',
                                //hintText: '郵便番号を入力してください。',
                                hintStyle: TextStyle(fontSize: 15),
                              ),
                            ),
                            data: Theme.of(context).copyWith(
                              primaryColor: Colors.blue,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Column(
                            crossAxisAlignment :CrossAxisAlignment .start,
                            children: <Widget>[
                              RaisedButton(                            
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                onPressed: () {
                                  if (zipCodeController.text != "") {
                                    stream = getPostalBloc
                                      ..getPostalList(zipCodeController.text);
                                  }
                                  setState(() {
                                    _city = null;
                                    _township = null;
                                    township_id = null;
                                    if (zipCodeController.text != "") {
                                      checkSearch = 1;
                                    } else {
                                      checkSearch = 0;
                                    }
                                    FocusScope.of(context).unfocus();
                                  });
                                },
                                color: Colors.green,
                                textColor: Colors.white,
                                child: Text('検索', style: TextStyle()),
                              ),
                              Row(children: [
                                Text("例）1006740（"),
                                GestureDetector(
                                  child: Text("郵便番号検索",
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Colors.blue)),
                                  onTap: () {
                                    _launchURL();
                                  }),
                                Text(")"),
                              ]),
                            ],
                          ),
                          SizedBox(height: 12.0),
                          Row(
                            children: [
                              Text("都道府県"),
                              SizedBox(width: 20),
                              _orangeCard()
                            ],
                          ),
                          SizedBox(height: 10.0),
                          checkSearch == 0
                          ? columnData()
                          : Container(
                              child: StreamBuilder<PostalListResponse>(
                                  stream: getPostalBloc.subject.stream,
                                  builder: (context,
                                      AsyncSnapshot<PostalListResponse>
                                          snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return Stack(
                                        children: <Widget>[
                                          Center(
                                            child: Opacity(
                                              opacity: 1.0,
                                              child:
                                                  buildLoadingWidget(), //CircularProgressIndicator(),
                                            ),
                                          ),
                                        ],
                                      );
                                    } else if (snapshot.hasError) {
                                      return Container();
                                    } else if (snapshot.hasData) {
                                      if (snapshot.data.error != null &&
                                          snapshot.data.error.length > 0) {
                                        return Container();
                                      }

                                      postalList = snapshot.data.postalList;
                                      tspIdList = snapshot.data.tspList;
                                      city_id = postalList[0].city_id;
                                      _city = city_id.toString();
                                      // _cityId =checkSearch==1?city_id.toString():'';
                                      getTspBloc.drainStream();
                                      stream1 = getTspBloc..getTownship(_city);

                                      township_id = checkSearch == 1
                                          ? tspIdList[0].id.toString()
                                          : '';
                                      _street = postalList[0].street;
                                      addressController.text = _street;                                    
                                      return columnData();
                                    } else {
                                      return Center(
                                        child: Opacity(
                                          opacity: 1.0,
                                          child:
                                              buildLoadingWidget(), //CircularProgressIndicator(),
                                        ),
                                      );
                                    }
                                  })),
                          
                          Text("例）区丸の内1-9-1 グラントウキョウノースタワー40階")
                        ],
                      ),
                    ),

                    _itemHeaderButton("電話番号", false),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[400])
                      ), 
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("※ 電話番号またはメールアドレス必須"),
                          SizedBox(height: 10.0),
                          _orangeCard(),
                          SizedBox(height: 10.0),
                          Theme(
                            child: TextFormField(
                              validator:ValidationBuilder().phone('電話番号を入力してください。').minLength(1).maxLength(50).build(),
                              controller: phoneNoController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.all(8),
                                fillColor: Colors.grey,
                                labelText: '電話番号を入力してください。',
                              ),
                            ),
                            data: Theme.of(context).copyWith(
                              primaryColor: Colors.blue,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Text("例）0312345678（半角）")
                        ],
                      )
                    ),

                    _itemHeaderButton("メールアドレス",false),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[400])
                      ), 
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Theme(
                            child: TextFormField(
                              validator:ValidationBuilder().email('メールアドレスを入力してください。').minLength(1).maxLength(50).build(),
                              controller: mailController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                fillColor: Colors.grey,
                                contentPadding: EdgeInsets.all(8),
                                labelText: 'メールアドレスを入力してください。',
                              ),
                            ),
                            data: Theme.of(context).copyWith(
                              primaryColor: Colors.blue,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Text("例）abc@example.jp （半角）")
                        ],
                      )
                    ),
                    SizedBox(height: 20.0),

                    Center(
                      child: Text("※未入力の必須項目がございます。",
                        style: TextStyle(
                          color: Colors.red
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RaisedButton(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                          onPressed: () {
                            //Navigator.push(context, MaterialPageRoute(builder: (context)=> NusingMail()));
                          },
                          color: Colors.green,
                          textColor: Colors.white,
                          child: Text('確認ページに進む', style: TextStyle(fontSize: 16,)),
                        ),
                      ]
                    ),
                    
                    SizedBox(height: 10),
                    _blueLineHeader("入居対象者様について"),
                    SizedBox(height: 10),

                    _itemHeaderButton("入居対象者様とのご関係", false),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[400])
                      ),
                      child: Container(
                        padding: EdgeInsets.only(left: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: Colors.white,
                          border: Border.all(color: Colors.grey[400])),
                          child: DropdownButtonHideUnderline(
                            child: ButtonTheme(
                              alignedDropdown: true,
                              child: new DropdownButton<String>(
                                isExpanded: true,
                                hint: Text("選択してください。"),
                                value: relation,
                                onChanged: (String newValue) {
                                  setState(() => relation = newValue);
                                },
                                items: relationList.map((String rel) => 
                                  DropdownMenuItem(
                                    child: Text("  "+rel),
                                    value: rel,
                                  ),
                                ).toList(),
                              ),
                            ),
                          )
                        ),
                    ),

                    _itemHeaderButton("お名前",false),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey)
                      ), 
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Theme(
                            child: TextFormField(
                              validator:ValidationBuilder().regExp(RegExp("(\\[w]+|[一-龠]+|[ぁ-ゔ]+|[ァ-ヴー]+|[a-zA-Z0-9]+|[ａ-ｚＡ-Ｚ０-９]+|[々〆〤]+)\\s+(\\[w]+|[一-龠]+|[ぁ-ゔ]+|[ァ-ヴー]+|[a-zA-Z0-9]+|[ａ-ｚＡ-Ｚ０-９]+|[々〆〤]+)", unicode: false),"First Name,Last Nameを入力してください。").minLength(1).maxLength(50).build(),
                              controller: tnameController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                fillColor: Colors.grey,
                                contentPadding: EdgeInsets.all(8),
                                labelText: 'お名前を入力してください。',
                              ),
                            ),
                            data: Theme.of(context).copyWith(
                              primaryColor: Colors.blue,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text("例）探し太郎"),
                        ],
                      )
                    ),
                    _itemHeaderButton("性別", false),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[400])
                      ),
                      child: Column(
                        children: <Widget>[
                          RadioListTile(
                            title: const Text('男性'),
                            value: Gender.male,
                            dense: true,
                            groupValue: _relationGender,
                            onChanged: (val) {
                              setSelectedRadioRelGender(val);
                            },
                          ),
                          RadioListTile(
                            title: const Text('女性'),
                            value: Gender.female,
                            dense: true,
                            groupValue: _relationGender,
                            onChanged: (val) { 
                              setSelectedRadioRelGender(val);
                            },
                          ),
                          RadioListTile(
                            title: const Text('夫婦'),
                            value: Gender.couple,
                            dense: true,
                            groupValue: _relationGender,
                            onChanged: (val) {
                              setSelectedRadioRelGender(val);
                            },
                          ),
                        ],
                      )
                    ),
                    _itemHeader("年齢"),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[400])
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: Colors.white,
                          border: Border.all(color: Colors.grey)),
                        child: DropdownButtonHideUnderline(
                          child: ButtonTheme(
                              alignedDropdown: true,
                              child: DropdownButton(
                              isExpanded: true,
                            hint: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("選択してください"),
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
                            ],
                            onChanged: (value) {
                            }),
                          ),
                        ),
                      ),
                    ),

                    _itemHeaderButton("介護度", false),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[400])
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: Colors.white,
                          border: Border.all(color: Colors.grey)),
                        child: DropdownButtonHideUnderline(
                          child: ButtonTheme(
                            alignedDropdown: true,
                            child: DropdownButton(
                              isExpanded: true,
                              hint: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("選択してください"),
                              ),
                              value: nursing,
                              items: nursingList.map((String nurse) => 
                                DropdownMenuItem(
                                  child: Text("  "+nurse),
                                  value: nurse,
                                ),
                              ).toList(),
                              onChanged: (value) {

                              }
                            ),
                          ),
                        ),
                      ),
                    ),
                    _itemHeaderButton("認知症" , false),
                    
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[400])
                      ), 
                      child: Column(
                        children: <Widget>[
                          RadioListTile(
                            title: const Text('あり'),
                            value: "あり",
                            dense: true,
                            groupValue: _fect,
                            onChanged: (val) {
                              setSelectedRadioFect(val);
                            },
                          ),
                          RadioListTile(
                            title: const Text('なし'),
                            value: "なし",
                            dense: true,
                            groupValue: _fect,
                            onChanged: (val) {
                              setSelectedRadioFect(val);
                            },
                          ),
                          RadioListTile(
                            title: const Text('わからない'),
                            value: "わからない",
                            dense: true,
                            groupValue: _fect,
                            onChanged: (val) {
                              setSelectedRadioFect(val);
                            },
                          ),
                        ],
                      ),
                    ),
                    _itemHeaderButton("ご要望や、お困りごと、その他お問い合わせ" , false),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[400])
                      ),
                      child: Theme(
                        child: TextFormField(   
                          validator: ValidationBuilder().minLength(1).build(),
                          controller: hopeController ,
                          maxLines: 3,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.all(8),
                            fillColor: Colors.grey,
                            //labelText: 'ご希望等',
                          ),
                        ),
                        data: Theme.of(context).copyWith(
                          primaryColor: Colors.blue,
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),

                    Center(
                      child: Text("※未入力の必須項目がございます。",
                        style: TextStyle(
                          color: Colors.red
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RaisedButton(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> const SendCompletely()));
                          },
                          color: Colors.green,
                          textColor: Colors.white,
                          child: Text('確認ページに進む', style: TextStyle(fontSize: 16,)),
                        ),
                      ]
                    ),

                  ]
                ),
              ),
          ),
        )
      ),
    );
  }

    Widget columnData() {
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: Colors.white,
            border: Border.all(color: Colors.grey[400])),
          child: StreamBuilder<CityResponse>(
              stream: getCityBloc.subject.stream,
              builder: (context, AsyncSnapshot<CityResponse> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Stack(
                    children: <Widget>[
                      _dropDown("選択してください。"),
                      Center(
                        child: Opacity(
                          opacity: 1.0,
                          child:
                              buildLoadingWidget(), //CircularProgressIndicator(),
                        ),
                      ),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Container();
                } else if (snapshot.hasData) {
                  if (snapshot.data.error != null &&
                      snapshot.data.error.length > 0) {
                    return Container();
                  }
                  List<CityModel> cityList = List();
                  cityList.add(new CityModel(-1, ""));
                  snapshot.data.city.forEach((e) {
                    cityList.add(e);
                  });

                  return Container(
                    child: DropdownButtonHideUnderline(
                    child: ButtonTheme(
                      alignedDropdown: true,
                      child: new DropdownButton<String>(
                        isExpanded: true,
                        hint: Text("選択してください。"),
                        value: _city,
                        onChanged: (String newValue) {
                          //_city = '';
                          setState(() {
                            stateController.text= cityList[int.parse(newValue)].city_name.toString();

                            if (checkSearch == 1) {
                              checkSearch = 0;
                            }
                            //checkstream=1;
                            _township = null;
                            getTspBloc.drainStream();
                            stream1 = getTspBloc..getTownship(newValue);
                            _city = newValue;
                            if (township_id != '') {
                              township_id = '';
                            }
                          });
                        },

                        items: cityList
                            .map((CityModel cityModel) => DropdownMenuItem(                                
                              value: cityModel.id.toString(),
                              child: cityModel.id != -1
                                ? Text(cityModel.city_name)
                                : Row(
                                    children: [
                                      Icon(
                                        Icons.arrow_drop_down_outlined,
                                        size: 35.0,
                                      ),
                                      Text("選択してください。"),
                                    ],
                                  ),
                            ))
                        .toList(),
                      ),
                    ),
                  ));
                } else {
                  return Stack(
                    children: <Widget>[
                      _dropDown("選択してください。"),
                      Center(
                        child: Opacity(
                          opacity: 1.0,
                          child: buildLoadingWidget(),
                        ),
                      ),
                    ],
                  );
                  
                }
              }),
        ),
        SizedBox(height: 10), 
        Row(
          children: [
            Text("市区町村"),
            SizedBox(width: 20),
            _orangeCard()
          ],
        ),
        SizedBox(height: 10),
        Container(
          padding: EdgeInsets.only(left: 5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: Colors.white,
              border: Border.all(color: Colors.grey[400])),
          child: StreamBuilder<TownshipResponse>(
              stream: getTspBloc.subject.stream,
              builder: (context, AsyncSnapshot<TownshipResponse> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting &&
                    checkstream == 1) {
                  //
                  return Stack(
                    children: <Widget>[
                      _dropDown("選択してください。"),
                      Center(
                        child: Opacity(
                          opacity: 1.0,
                          child:
                              buildLoadingWidget(), //CircularProgressIndicator(),
                        ),
                      ),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Container();
                } else if (snapshot.hasData && checkstream==1) {
                  if (snapshot.data.error != null &&
                      snapshot.data.error.length > 0) {
                    return Container();
                  }               
        
                  List<TownshipModel> townships = List();
                  townships.add(new TownshipModel(-1, "", ""));
                  snapshot.data.township.forEach((e) {                
                    townships.add(e);
                  });
                  return Container(
                      child: DropdownButtonHideUnderline(
                    child: ButtonTheme(
                      alignedDropdown: true,
                      child: new DropdownButton<String>(
                        //isDense: true,
                        isExpanded: true,
                        hint: Row(
                          children: [
                            Icon(
                              Icons.arrow_drop_down_outlined,
                              size: 35.0,
                            ),
                            Text("選択してください。"),
                          ],
                        ),
                        value: township_id == '' ? _township : township_id,
                        onChanged: (String newValue) {                       
                          setState(() {
                            townships.map((TownshipModel tspModel){  
                                if(tspModel.id.toString()==newValue){
                                   cityController.text= tspModel.township_name.toString();
                                   townshipId.text=tspModel.id.toString();                                 
                                }
                            }).toList();
                            if (checkSearch == 1) {
                              checkSearch = 0;
                            }
                            township_id = '';
                            _township = newValue;
                          });
                        },
                        items: townships
                            .map((TownshipModel tspModel) => DropdownMenuItem(
                                  value: tspModel.id.toString(),
                                  //child: Text(tspModel.township_name)
                                  child: tspModel.id != -1
                                      ? Text(tspModel.township_name)
                                      : Row(
                                          children: [
                                            Icon(
                                              Icons.arrow_drop_down_outlined,
                                              size: 35.0,
                                            ),
                                            Text("選択してください。"),
                                          ],
                                        ),
                                ))
                            .toList(),
                      ),
                    ),
                  ));
                } else {
                  return Stack(
                    children: <Widget>[
                      _dropDown("選択してください。"),
                      Center(
                        child: Opacity(
                          opacity: 1.0,
                          child: checkstream == 1
                              ? buildLoadingWidget()
                              : Container(), //CircularProgressIndicator(),
                        ),
                      ),
                    ],
                  );
                }
              }),
        ),
        
        SizedBox(height: 10), 
        Row(
          children: [
            Text("番地（建物名）"),
            SizedBox(width: 20),
            _orangeCard()
          ],
        ),
        SizedBox(height: 10),
        Theme(
          child: TextFormField(
            validator:ValidationBuilder().minLength(1).maxLength(200).build(),
            controller: addressController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.all(8),
              fillColor: Colors.grey,
              labelText: '番地を入力してください。',
            ),
          ),
          data: Theme.of(context).copyWith(
            primaryColor: Colors.blue,
          ),
        ),
        SizedBox(height: 10),
        //Text("例）区丸の内1-9-1 グラントウキョウサウスタワー40階"),
        //SizedBox(height: 10),
      ],
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

  _selectDate(BuildContext context) async {
    DateTime newSelectedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate != null ? _selectedDate : DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: ColorScheme.dark(
              primary: Colors.white,
              onPrimary: Colors.blueGrey,
              surface: Colors.blueAccent,
              onSurface: Colors.white,
            ),
            dialogBackgroundColor: Colors.brown,
          ),
          child: child,
        );
      }
    );

    if (newSelectedDate != null) {
      _selectedDate = newSelectedDate;
      birthdayController
        ..text = DateFormat("yyyy-MM-dd").format(_selectedDate)
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: birthdayController.text.length,
            affinity: TextAffinity.upstream));
    }
  }

  _launchURL() async {
    const url = 'https://www.post.japanpost.jp/zipcode/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget _dropDown(String hintText) {
    return DropdownButtonHideUnderline(
      child: ButtonTheme(
        alignedDropdown: true,
        child: new DropdownButton<String>(
          isExpanded: true,
          hint: Text(hintText),
          onChanged: (String newValue) {},
          items: [],
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