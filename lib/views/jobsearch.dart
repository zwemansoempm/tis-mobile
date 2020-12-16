import 'package:flutter/material.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';

// class JobType {
//   String title;
//   bool value;

//   JobType({
//     @required this.title,
//     this.value = false
//   });
// }

class JobSearch extends StatefulWidget {
  JobSearch({Key key}) : super(key: key);
  @override
  _JobSearchState createState() => _JobSearchState();
}

class _JobSearchState extends State<JobSearch> {
  // final occupation = [
  //   JobType(title: 'Type One'),
  //   JobType(title: 'Type Two'),
  //   JobType(title: 'Type Three'),
  // ];
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
              Text('地図検索', style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),),
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
                width: 5.0,
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
                    
                    // ListView(
                    //   children: [
                    //     //  ...occupation.map(buildJobCheckbox).toList(),
                    //   ],
                    // )
                  ],
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.search, size: 22.0,),
                    Text('検索',
                        style: TextStyle(
                          fontSize: 16,
                        )),
                  ],
                )),
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

          Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              children: [

                RaisedButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                  onPressed: () {},
                  color: Colors.grey,
                  child: Center(child: Text("2020 年", style: TextStyle(fontSize: 14),),),
                ),
                
              ],
            ),
          ),

          Container(
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              children: [
                Text("2020-06-18", style: TextStyle(
                  fontSize: 14,
                  // fontWeight: FontWeight.bold,
                ),),
                SizedBox(width: 20.0),
                Card(
                  color: Colors.blue,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
                    child: Text("お知らせ" , style: TextStyle(color: Colors.white, fontSize: 14,),)
                  ),
                ),
              ]
            ),

          ),

          SizedBox(
            height: 5.0
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text("aaaaaaaaaaaaaaaaaaaaaaaavvvvvvvvvvvvvvvvvvvvvvvvvvvvmmmmmmmmmmmmmmmm", style: TextStyle(
            fontWeight: FontWeight.bold,
          ),),
          ),

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
            child: Row(
              children: [
                Text("2020-06-18", style: TextStyle(
                  fontSize: 14,
                  // fontWeight: FontWeight.bold,
                ),),
                SizedBox(width: 20.0),
                Card(
                  color: Colors.blue,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
                    child: Text("お知らせ" , style: TextStyle(color: Colors.white, fontSize: 14,),)
                  ),
                ),
              ]
            ),

          ),

          SizedBox(
            height: 5.0
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text("jb search", style: TextStyle(
              fontWeight: FontWeight.bold,
            ),),
          ),

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
        ],
      ),
    );
  }

  // Widget buildJobCheckbox( JobType jobtype) => 
  // buildCheckbox(
  //   jobtype: jobtype,
  //   onClicked: (){
  //     setState(() {
  //       final occupation = !jobtype.value;
  //       jobtype.value = occupation;
  //     });
  //   }
  // );

  // Widget buildCheckbox(
  //   {
  //     @required JobType jobtype,
  //     @required VoidCallback onClicked,
  //   }) => 
  // ListTile(
  //     onTap: onClicked,
  //     leading: Checkbox(
  //     value: jobtype.value,
  //     onChanged: (value) => onClicked(),
  //   ),
  //   title: Text(
  //     jobtype.title,
  //     style: TextStyle(
  //       fontSize: 20,
  //     ),
  //   ),
  // );

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
