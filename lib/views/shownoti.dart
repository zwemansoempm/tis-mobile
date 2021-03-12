import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:tis/bloc/get_link_bloc.dart';
import 'package:tis/model/link.dart';
import 'package:tis/model/link_response.dart';
import 'package:url_launcher/url_launcher.dart';

class ShowNoti {
      const ShowNoti();
      showNotification(){
        return  Container(
            height:350,
            width:300,
              // margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 2.0),                                 
              child: StreamBuilder<LinkResponse>(
                stream: getLinkNewsBloc.subject.stream,
                builder: (context, AsyncSnapshot<LinkResponse> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                          return Container(
                              height:MediaQuery.of(context).size.height/1.5,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [SizedBox(
                                  height: 35,
                                  width: 35,
                                  child: CircularProgressIndicator()),
                                ]),
                          );//
                    }
                    else if (snapshot.hasError) {
                                return Container();
                    } 
                    else if (snapshot.hasData) {
                        if (snapshot.data.error != null &&
                              snapshot.data.error.length > 0) {
                                return Container();
                        }    
                                return  _getLinkNews(snapshot.data);                                 
                      } 
                    else {                                      
                              return Container(
                                height:MediaQuery.of(context).size.height/1.5,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [SizedBox(
                                    height: 35,
                                    width: 35,
                                    child: CircularProgressIndicator()),
                                  ]),
                              );//return buildLoadingWidget();
                    }
                }                                      
              )
          ); 
     }
 }

 Widget _getLinkNews(LinkResponse data){
    List<LinkModel> allPosts = data.link;
    List<dynamic> result = [];
    for (var j = 0; j < allPosts.length; j++) {
      result.add(allPosts[j]);
    }

    return  Container(
          height: 350.0, // Change as per your requirement
          width: 300.0, 
          child: ListView.builder(
          // physics: NeverScrollableScrollPhysics(),
          itemCount:allPosts.length,        
          itemBuilder: (context, index) {
            return Column(
              children: [
                index==0?DottedLine(dashColor: Colors.blue,): Container(),
                SizedBox(height: 20,),
                Row(
                  children: [
                    Text(
                      result[index].postDate,
                     style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontSize: 12.0
                    )),
                    SizedBox(width: 20,),
                    Container(
                      decoration: BoxDecoration(
                        color: result[index].status==3?Color(0xff52a2da):(result[index].status==2?Color(0xffdcb01c):(result[index].status==1?Color(0xffd7787d):Colors.white)), 
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),                                      
                      ),                     
                      // height: 20.0,
                      width: 130.0,
                      child: result[index].status==3?Text("お知らせ",textAlign: TextAlign.center,):(result[index].status==2?Text("メディア掲載",textAlign: TextAlign.center,):(result[index].status==1?Text("ニュースリリース",textAlign: TextAlign.center,):Text(''))),
                    ),
                    // RaisedButton(                      
                    //   onPressed: () => {},
                    //   color:result[index].status==3?Color(0xff52a2da):Colors.white,                   
                    //   child: result[index].status==3?Text("お知らせ"):Text(''),
                    // )
                  ],
                ),              
                Html(
                    data: result[index].description,
                    onLinkTap: (url) async {
                        if (await canLaunch(url)) {
                          await launch(
                            url,
                          );
                        } else {
                          throw 'Could not launch $url';
                        }
                      },
                ),                
                // SizedBox(height: 20,),
                Container(
                            margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),      
                                child: Divider(
                                  height:10,
                                  color:Color(0xffaaaaaa),//Color(0xffaaa),
                                  thickness: 1.5,
                                ),
                )
              ],
            );
          }
        )
    ); 

  }  
 