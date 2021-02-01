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
          return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
              children: <Widget>[           
                //Build the results based on the searchResults stream in the searchBloc
                StreamBuilder<PostsResponse>(
                  stream: getLatestPostAllCatBloc.subject.stream,
                  builder:(context, AsyncSnapshot<PostsResponse> snapshot) {
                    if (!snapshot.hasData) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Center(child: CircularProgressIndicator()),
                        ],
                      );
                    } else if (snapshot.hasError) {
                      return Column(
                        children: <Widget>[
                          Text(
                            "No Results Found.",
                          ),
                        ],
                      );
                    } else {
                      var results = snapshot.data;
                      
                      List<PostsModel> allPosts = results.posts;
                      List<dynamic> result = [];
                      for (var j = 0; j < allPosts.length; j++) {
                        result.add(allPosts[j]);
                      }                      
                      print(result.length);
                      return 
                      Container(
                        width:MediaQuery.of(context).size.width,
                          height: 35.0* result.length,
                          child:ListView.builder(
                          itemCount: result.length,
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
                                                  builder: (context) => TopDetailScreen(top:result[index].id.toString()),
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
                                            child: (result[index].photo!=null && result[index].photo!='') ? 
                                              Padding(
                                                padding: const EdgeInsets.all(8),
                                                child: Stack(
                                                  children: [
                                                    Center(
                                                      child: 
                                                      result[index].id!=410?FadeInImage(
                                                        // fadeInDuration: const Duration(seconds: 2),
                                                        placeholder: AssetImage('assets/img/placeholder.jpg'),
                                                        image: NetworkImage(
                                                          "https://test.t-i-s.jp/upload/news/"+result[index].photo,
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
                                                  result[index].mainPoint.toString().length>=60?result[index].mainPoint.toString().substring(0,50)+"...":result[index].mainPoint,  
                                                  // medical[index].mainPoint,
                                                  maxLines: 3,
                                                  //overflow: TextOverflow.ellipsis,
                                                ),
                                                Expanded(
                                                  child: Align(
                                                  alignment: Alignment.bottomRight,
                                                  child: Text(
                                                    result[index].createdAt,
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
                  },
                ),
              ],
         ),
          );
    }

  @override
  Widget buildSuggestions(BuildContext context) {
      //TODO: implement buildSuggestions
      return Column();
    // TODO: implement buildSuggestions
    // throw UnimplementedError();
  }
    // final List<String> listExample;
    // SearchScreen(this.listExample);
  // InheritedBlocs.of(context).searchBloc;

  //  getLatestPostAllCatBloc.subject.stream;  


  //   List<String> recentList=[];//"Text 4","Text 3"
  //   @override
  //   Widget buildSuggestions(BuildContext context) {
  //      List<String> suggestionList=[];
  //      query.isEmpty
  //      ?suggestionList=recentList
  //      :suggestionList.addAll(listExample.where((element) => element.contains(query),
  //      ));

  //   return ListView.builder(
  //     // itemCount: suggestionList.length,
  //     itemBuilder: (context,index){
  //       return ListTile(
  //         title: Text(
  //           'abcd'
  //           // suggestionList[index],
  //         ),
  //         onTap:(){
  //           // selectedResult=suggestionList[index];
  //           showResults(context);
  //         } ,
  //       );
  //     }
  //   );   
  // }  

}