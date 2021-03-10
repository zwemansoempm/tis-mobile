import 'package:flutter/material.dart';
import 'package:tis/bloc/get_latest_post_all_cat_bloc.dart';
import 'package:tis/model/posts.dart';
import 'package:tis/model/posts_response.dart';
import 'package:tis/screens/top/top_detail.dart';

class SearchScreen extends  SearchDelegate {
  
  @override
  List<Widget> buildActions(BuildContext context) {
      return <Widget>[
        IconButton(
          icon: Icon(Icons.cancel),
          onPressed: (){ 
            query="";
            showSuggestions(context);
          },
        )
      ];
    } 
     @override
    String get searchFieldLabel => "Search News";

    @override
    Widget buildLeading(BuildContext context) {
      return IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: (){
          Navigator.pop(context);
        }
      );
    }
    String selectedResult;
    @override
    Widget buildResults(BuildContext context) {       
          getLatestPostAllCatBloc.subject.stream;  
          return  Center(
                      child: Text(
                        "お探しのニュースは見つかりませんでした。。",
                        // "No Results Found...",
                      ),
                );
                 
    }

  @override
  Widget buildSuggestions(BuildContext context) {
      return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
              children: <Widget>[           
                //Build the results based on the searchResults stream in the searchBloc
                StreamBuilder<PostsResponse>(
                  stream: getLatestPostAllCatBloc.subject.stream,
                  builder:(context, AsyncSnapshot<PostsResponse> snapshot) {

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Center(child: CircularProgressIndicator()),
                        ],
                      );
                    }


                    // if (!snapshot.hasData) {
                    //   return Column(
                    //     crossAxisAlignment: CrossAxisAlignment.center,
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     children: <Widget>[
                    //       Center(child: CircularProgressIndicator()),
                    //     ],
                    //   );
                    // } 
                    else if (snapshot.hasError) {
                      return Center(
                        child: Text(
                          "お探しのニュースは見つかりませんでした。。",
                          // "No Results Found...",
                        ),
                      );
                    } 
                    else if (snapshot.hasData) { 

                      if (snapshot.data.error != null &&
                          snapshot.data.error.length > 0) {
                            getLatestPostAllCatBloc.subject.stream;  
                            return Center(
                              child: Text(
                                "お探しのニュースは見つかりませんでした。。",
                                // "No Results Found...",
                              ),
                            );
                      }  

                      var results = snapshot.data;
                      
                      List<PostsModel> allPosts = results.posts;
                      List<dynamic> result = [];
                      for (var j = 0; j < allPosts.length; j++) {
                        result.add(allPosts[j]);
                      }      
                      final myList=query.isEmpty?result:result.where((p) => p.mainPoint.startsWith(query)).toList();                       
                     return  Container(
                        width:MediaQuery.of(context).size.width,
                          height: 30.0* result.length,
                          child:ListView.builder(
                          itemCount:myList.length,// result.length,
                          itemBuilder: (context, index) {
                            // var result = result[index];
                            // return ListTile(
                            //   title: Text(result[index].id.toString()),
                            // );
                              return Container(
                                  child: GestureDetector(
                                  onTap: (){
                                        Navigator.push<Widget>(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) => TopDetailScreen(top:myList[index].id.toString()),
                                                ),
                                          );
                                  },
                                  child: Card(  
                                  color:Color(0xfff7f7f7),                                
                                  child: Container(
                                  height: 90,
                                  child: Row(
                                        children: [
                                          Expanded(
                                            child: (myList[index].photo!=null && myList[index].photo!='') ? 
                                              Padding(
                                                padding: const EdgeInsets.all(8),
                                                child: Stack(
                                                  children: [
                                                    Center(
                                                      child: 
                                                      myList[index].id!=410?FadeInImage(
                                                        // fadeInDuration: const Duration(seconds: 2),
                                                        placeholder: AssetImage('assets/img/placeholder.jpg'),
                                                        image: NetworkImage(
                                                          "https://test.t-i-s.jp/upload/news/"+myList[index].photo,
                                                        ),
                                                        imageErrorBuilder: (context, error, stackTrace) { 
                                                          return Image.asset(
                                                            "assets/img/placeholder.jpg",
                                                          );
                                                        },                                                                           
                                                      ):Container(),
                                                    ),
                                                    // dateToStringFormat(DateTime.now()) == medical[0].createdAt.split(" ")[0] ? _newLogo(color) : Container(),
                                                ]),
                                              ) :Image.asset(
                                                          "assets/img/placeholder.jpg",
                                              )
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(
                                              top: 10.0, left: 4.0,  right: 10.0, bottom: 4.0),
                                            width:MediaQuery.of(context).size.width/1.5,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  myList[index].mainPoint.toString().length>=60?myList[index].mainPoint.toString().substring(0,50)+"...":myList[index].mainPoint,  
                                                  // medical[index].mainPoint,
                                                  maxLines: 3,
                                                  //overflow: TextOverflow.ellipsis,
                                                ),
                                                Expanded(
                                                  child: Align(
                                                  alignment: Alignment.bottomRight,
                                                  child: Text(
                                                    myList[index].createdAt,
                                                    style: TextStyle(
                                                      color: Colors.black38,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 12.0)),
                                                ))
                                              ],
                                            )
                                          ),
                                        ],
                                    ),
                                  ),
                                  ) ,
                              ),
                            );

                          },
                        ),
                      );
                    }
                    else{
                      return Center(
                            child: Text(
                              "お探しのニュースは見つかりませんでした。。",
                              // "No Results Found...",
                            ),
                      );
                    }
                  },
                ),
              ],
         ),
          );
  }

}