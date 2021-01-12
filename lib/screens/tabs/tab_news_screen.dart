import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:tis/app-format.dart';
import 'package:tis/bloc/get_news_category_mobile_bloc.dart';
import 'package:tis/model/newsCategory.dart';
import 'package:tis/model/posts.dart';
import 'package:tis/screens/top/top_detail.dart';

class TabNewsScreen extends StatefulWidget {
  @override
  _TabNewsScreenState createState() => _TabNewsScreenState();
}

class _TabNewsScreenState extends State<TabNewsScreen> {

  @override
  void initState() {
    super.initState();
    getNewsCategoryMobileBloc..getNewsCategoryMobile();
  }

  @override
  void dispose() {
    super.dispose();
    getNewsCategoryMobileBloc..drainStream();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<NewsCategory>(
        stream: getNewsCategoryMobileBloc.subject.stream,
        builder: (context, AsyncSnapshot<NewsCategory> snapshot) {
          if (snapshot.hasData) {
            return CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: EdgeInsets.all(10),
                   sliver: SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          snapshot.data.cat.name,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(int.parse("0xff"+snapshot.data.cat.colorCode.replaceAll("#", "")))
                          ),
                        ),
                        DottedLine(dashColor: Color(int.parse("0xff"+snapshot.data.cat.colorCode.replaceAll("#", ""))))
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    height: MediaQuery.of(context).size.height / 2.4,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data.bigNews.length,
                      itemBuilder: (context, index){
                        final bigNews = snapshot.data.bigNews[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push<Widget>(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TopDetailScreen(top:bigNews),
                              ),
                            );
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width / 2,
                            margin: EdgeInsets.only(right: 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  children: [
                                    Image.network("https://test.t-i-s.jp/upload/news/${bigNews.photo}",
                                      //fit: BoxFit.fitHeight,
                                      width: double.maxFinite,
                                      height: MediaQuery.of(context).size.height/3,
                                    ),
                                    dateToStringFormat(DateTime.now()) == bigNews.createdAt.split(" ")[0] ? Positioned(
                                      top: 8,
                                      left: 8,
                                      child: _newLogo(Color(int.parse("0xff"+snapshot.data.cat.colorCode.replaceAll("#", ""))))
                                    ) : Container()
                                  ]
                                ),
                                SizedBox(height: 8),
                                
                                Expanded(
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    padding: EdgeInsets.symmetric(horizontal: 4,vertical: 4),
                                    decoration: BoxDecoration(
                                      color: Colors.grey[300]
                                    ),
                                    child: Text(
                                      bigNews.mainPoint.toString().length>=45?bigNews.mainPoint.toString().substring(0,33)+"...":bigNews.mainPoint.toString(),                                                                             
                                      style: TextStyle(fontSize: 12.0)
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ),
                        );
                      }
                    ), 
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.only(top: 12),
                ),

                SliverList(
                  delegate: SliverChildBuilderDelegate((context, index){
                    final post = snapshot.data.newsList[0][1][index];
                    
                    return Card(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push<Widget>(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TopDetailScreen(top:post),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              dateToStringFormat(DateTime.now()) == post.createdAt.split(" ")[0] ?_newLogo(Color(int.parse("0xff"+snapshot.data.cat.colorCode.replaceAll("#", "")))) : Container(),
                              Text(
                                post.mainPoint,
                                maxLines: 2,
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Text(
                                  post.createdAt,
                                  style: TextStyle(
                                    color: Colors.black38,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.0)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                    
                  },childCount: snapshot.data.newsList[0][1].length)
                ),

                SliverList(
                  delegate: SliverChildBuilderDelegate((context, index){
                    final post = snapshot.data.newsList[0][0][index];
                    
                    return _item(post,Color(int.parse("0xff"+snapshot.data.cat.colorCode.replaceAll("#", ""))));
                    
                  },childCount: snapshot.data.newsList[0][0].length)
                ),

                // SliverList(
                //   delegate: SliverChildBuilderDelegate((context, index){
                //     final post = snapshot.data.moreNews[index];
                    
                //     return _item(post, null);
                    
                //   },childCount: snapshot.data.moreNews.length)
                // ),

                SliverPadding(
                  padding: EdgeInsets.only(bottom: 10),
                ),

              ],
            );
          }          
          else  {
            return Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [SizedBox(
                  height: 35,
                  width: 35,
                  child: CircularProgressIndicator()),
                ]),
            );
          }
        } 
      ,
    );
    
  }

  Widget _newLogo(Color color){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: color,
      ),
      child: Text(
        "New",
        style: TextStyle(color: Colors.white,fontSize: 12),
      )
    );
  }

  Widget _item(PostsModel post, Color color){
    return Card(
      child: GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => TopDetailScreen(top: post),));
        },
        child: Container(
        height: 90,
        child: Row(
            children: [
              Expanded(
                child: (post.photo!=null && post.photo!='' && post.id!=236 && post.id!=272 && post.id!=482 && post.id!=312 && post.id!=329 && post.id!=359 && post.id!=402 && post.id!=403 && post.id!=438 && post.id!=418 && post.id!=437 && post.id!=453 && post.id!=451 && post.id!=445 && post.id!=413 && post.id!=214 ) ? 
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Stack(
                      children: [
                        Center(
                          child: FadeInImage(
                            fadeInDuration: const Duration(seconds: 2),
                            placeholder: AssetImage('assets/img/placeholder.jpg'),
                            image: NetworkImage(
                              "https://test.t-i-s.jp/upload/news/"+post.photo,
                            ),
                            imageErrorBuilder: (context, error, stackTrace) { 
                              return Image.asset(
                                "assets/img/placeholder.jpg",
                              );
                            },                                                                           
                          ),
                        ),
                        dateToStringFormat(DateTime.now()) == post.createdAt.split(" ")[0] ? _newLogo(color) : Container(),
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
                      post.mainPoint,
                      maxLines: 3,
                      //overflow: TextOverflow.ellipsis,
                    ),
                    Expanded(
                      child: Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        post.createdAt,
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
          ),
    );
  }
  
}


