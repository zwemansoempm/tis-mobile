import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:tis/app-format.dart';
import 'package:tis/bloc/get_news_category_mobile_bloc.dart';
import 'package:tis/model/category.dart';
import 'package:tis/model/newsCategory.dart';
import 'package:tis/model/posts.dart';
import 'package:tis/screens/tabs/top_news_screen.dart';
import 'package:tis/screens/top/top_detail.dart';

class TabNewsScreen extends StatefulWidget {
  final String categoryId;
  final Categories snapdata;

  const TabNewsScreen({Key key,@required this.categoryId, this.snapdata}) : super(key: key);
  @override
  _TabNewsScreenState createState() => _TabNewsScreenState();  

}

class _TabNewsScreenState extends State<TabNewsScreen> {  

  @override
  void initState() {     
    super.initState();  
  }

  @override
  void dispose() {
    super.dispose();
    _getAllDrainStream();
  }

  _getAllDrainStream(){
    getNewsCategoryMobileBloc..drainStream();  
  }

  @override
  Widget build(BuildContext context) {
   
    if(widget.categoryId=='35'){      
          return  TopNewsScreen(categoryId:'35',snapdata:widget.snapdata);
    }else{
          return StreamBuilder<NewsCategory>(
        stream: getNewsCategoryMobileBloc.subject.stream,
        builder: (context, AsyncSnapshot<NewsCategory> snapshot) {
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
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    height: MediaQuery.of(context).size.height / 3.1,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data.bigNews.length,
                      itemBuilder: (context, index){
                        final bigNews = snapshot.data.bigNews[index];
                        return Container(
                          margin: EdgeInsets.only(right: 8),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push<Widget>(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => TopDetailScreen(top:bigNews.id.toString()),
                                ),
                              );
                            },
                            child: _widgetBigNews(bigNews, Color(int.parse("0xff"+snapshot.data.cat.colorCode.replaceAll("#", "")))),
                            
                          ),
                        );
                      }
                    ), 
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.only(top: 8),
                ),

                SliverList(
                  delegate: SliverChildBuilderDelegate((context, index){
                    final post = snapshot.data.newsList[0][1][index];
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      child: _widgetSamll(post , Color(int.parse("0xff"+snapshot.data.cat.colorCode.replaceAll("#", "")))));
                    
                  },childCount: snapshot.data.newsList.length > 0 ? (snapshot.data.newsList[0].length > 0 ? snapshot.data.newsList[0][1].length : 0) : 0)
                ),

                SliverList(
                  delegate: SliverChildBuilderDelegate((context, index){
                    final post = snapshot.data.newsList[0][0][index];
                    
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8,),
                      child: _widgetMedium2(post,Color(int.parse("0xff"+snapshot.data.cat.colorCode.replaceAll("#", "")))),
                    ) ;
                    
                  },childCount: snapshot.data.newsList.length > 0 ?  (snapshot.data.newsList[0].length > 0 ? snapshot.data.newsList[0][0].length : 0) : 0)
                ),

                SliverList(
                  delegate: SliverChildBuilderDelegate((context, index){
                    List<PostsModel> posts = [];
                    for(int i=0 ; i< snapshot.data.moreNews[index].length ; i++){
                      posts.add(snapshot.data.moreNews[index][i]);
                    }

                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              //bigWidget
                              posts.length > 0 ? _widgetBig(posts[0]) : Container(),
                              SizedBox(width: 8,),
                              Container(
                                height: MediaQuery.of(context).size.height / 3.1,
                                width: MediaQuery.of(context).size.width /2 -12 ,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    //Medium widget
                                    posts.length > 1 ? _widgetMedium(posts[1]) : Container(),
                                    SizedBox(height: 8,),
                                    //Medium widget
                                    posts.length > 2 ? _widgetMedium(posts[2]) : Container(),
                                  ],
                                ),
                              ),

                          ],),
                        ),
                        // SmallWidget
                        posts.length > 3 ? _widgetSamll(posts[3], null)
                          : Container(),
                        
                        // SmallWidget
                        posts.length > 4 ? _widgetSamll(posts[4], null)
                          : Container(),

                        posts.length > 5 ? Padding(
                          padding: const EdgeInsets.only(left: 8,right: 8, ),
                          child: Row(
                            children: [
                              Container(
                                height: MediaQuery.of(context).size.height / 3.1,
                                width: MediaQuery.of(context).size.width /2 - 12 ,
                                child: Column(
                                  children: [
                                    //Medium widget
                                    _widgetMedium(posts[5]),
                                    SizedBox(height: 8,),
                                    //Medium widget
                                    posts.length > 7 ? _widgetMedium(posts[7]) : Expanded(flex: 1,child: Container(),)
                                  ],
                                ),
                              ),
                              SizedBox(width: 8,),
                              //bigWidget
                              posts.length > 6 ?_widgetBig(posts[6]) : Container(),
                          ],),
                        ) : Container(),
                        
                        posts.length > 8 ? Padding(
                          padding: const EdgeInsets.only(top: 8),
                          
                          child: _widgetMedium2(posts[8], null),
                        ): Container(),

                        posts.length > 9 ? Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: _widgetMedium2(posts[9], null),
                        ): Container(),
                      ],
                    );


                  }, childCount: snapshot.data.moreNews.length )
                ),

                SliverPadding(
                  padding: EdgeInsets.only(bottom: 12),
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
    
    
  }

  Widget _widgetBigNews(PostsModel post , Color color) {
    return Container(
        
        height: MediaQuery.of(context).size.height / 3.1,
        width: MediaQuery.of(context).size.width /2 - 12,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.maxFinite,
              height: MediaQuery.of(context).size.height/4.5,
              child: Stack(
                children: [
                  Center(
                    child:(post.photo!=null && post.photo!='' ) ? FadeInImage(
                      //fadeInDuration: const Duration(seconds: 2),
                      placeholder: AssetImage('assets/img/placeholder.jpg'),
                      image: NetworkImage(
                        "https://test.t-i-s.jp/upload/news/${post.photo}",
                      ),
                      imageErrorBuilder: (context, error, stackTrace) { 
                        return Image.asset(
                          "assets/img/placeholder.jpg",
                        );
                      },                                                                           
                    ) 
                    : Image.asset(
                      "assets/img/placeholder.jpg",
                      ),
                  ),
                  dateToStringFormat(DateTime.now()) == post.createdAt.split(" ")[0] ? Positioned(
                    top: 8,
                    left: 8,
                    child: _newLogo(color)
                  ) : Container()
                ]
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200]
                ),
                padding: EdgeInsets.symmetric(horizontal: 4,vertical: 4),
                
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      post.mainPoint,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        post.createdAt,
                        style: TextStyle(
                        color: Colors.black38,
                        fontWeight: FontWeight.bold,
                        fontSize: 12.0)
                      )
                    ),
                  ]
                ),
              ),
            ),
          ]
        )
      );
  }

  Widget _widgetMedium2(PostsModel post, Color color){
    return GestureDetector(
      onTap: () {
        Navigator.push<Widget>(
          context,
          MaterialPageRoute(
            builder: (context) => TopDetailScreen(top:post.id.toString()),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200]
        ),
        margin: EdgeInsets.symmetric(horizontal: 8),
        padding: EdgeInsets.all(8),
        height: 100,
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Stack(
                children: [
                  Center(
                    child: (post.photo!=null && post.photo!='' ) ? FadeInImage(
                      //fadeInDuration: const Duration(seconds: 2),
                      placeholder: AssetImage('assets/img/placeholder.jpg'),
                      image: NetworkImage(
                        "https://test.t-i-s.jp/upload/news/"+post.photo,
                      ),
                      imageErrorBuilder: (context, error, stackTrace) { 
                        return Image.asset(
                          "assets/img/placeholder.jpg",
                        );
                      },                                                                           
                    )
                    : Image.asset(
                          "assets/img/placeholder.jpg",
                        ),
                  ),
                  dateToStringFormat(DateTime.now()) == post.createdAt.split(" ")[0] ? 
                    _newLogo(color) : Container(),
              ]) 
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        post.mainPoint,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
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
                  ),
              ),
            )
          ],
        )
      ));
  }

  Widget _widgetBig(PostsModel post) {
    return GestureDetector(
      onTap: () {
        Navigator.push<Widget>(
          context,
          MaterialPageRoute(
            builder: (context) => TopDetailScreen(top:post.id.toString()),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200]
        ),
        height: MediaQuery.of(context).size.height / 3.1,
        width: MediaQuery.of(context).size.width /2 - 12,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.maxFinite,
              height: MediaQuery.of(context).size.height/4.5,
              child: (post.photo!=null && post.photo!='' ) ? FadeInImage(
                //fadeInDuration: const Duration(seconds: 2),
                placeholder: AssetImage('assets/img/placeholder.jpg'),
                image: NetworkImage(
                  "https://test.t-i-s.jp/upload/news/${post.photo}",
                ),
                imageErrorBuilder: (context, error, stackTrace) { 
                  return Image.asset(
                    "assets/img/placeholder.jpg",
                  );
                },                                                                           
              )
              : Image.asset(
                          "assets/img/placeholder.jpg",
                        ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 4,vertical: 4),
              
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    post.mainPoint,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      post.createdAt,
                      style: TextStyle(
                      color: Colors.black38,
                      fontWeight: FontWeight.bold,
                      fontSize: 12.0)
                    )
                  ),
                ]
              ),
            ),
          ]
        )
      ));
  }

  Widget _widgetMedium(PostsModel post) {
    return Expanded(
      child:GestureDetector(
        onTap: () {
          Navigator.push<Widget>(
            context,
            MaterialPageRoute(
              builder: (context) => TopDetailScreen(top:post.id.toString()),
            ),
          );
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          decoration: BoxDecoration(
                  color: Colors.grey[200]
                ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(post.mainPoint, maxLines: 2,overflow: TextOverflow.ellipsis,),
              Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  post.createdAt,
                  style: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0)
                )
              )
            ]
          )
        ),)
      );
  }

  Widget _widgetSamll(PostsModel post, Color color){
    return GestureDetector(
      onTap: () {
        Navigator.push<Widget>(
          context,
          MaterialPageRoute(
            builder: (context) => TopDetailScreen(top:post.id.toString()),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 8),
        padding: EdgeInsets.all(8),
        width: MediaQuery.of(context).size.width -16,
        decoration: BoxDecoration(
          color: Colors.grey[200]
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            dateToStringFormat(DateTime.now()) == post.createdAt.split(" ")[0] ?
              _newLogo(color) : Container(),
            Text(post.mainPoint, maxLines: 1,overflow: TextOverflow.ellipsis,),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                post.createdAt,
                style: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0)),
            ),
          ]
        ),
      ));
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
          Navigator.push(context, MaterialPageRoute(builder: (context) => TopDetailScreen(top: post.id.toString()),));
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
                            //fadeInDuration: const Duration(seconds: 2),
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


