import 'package:flutter/material.dart';
import 'package:news_app/views/article_view.dart';
import '../constants.dart';
import '../helper/news.dart';
import '../models/article_model.dart';

class CategoryNews extends StatefulWidget {

  final String category, name;
  CategoryNews({required this.category, required this.name});

  @override
  State<CategoryNews> createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {

  List<ArticleModel> articles = <ArticleModel>[];
  bool _loading = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCategoryNews();

  }

  getCategoryNews() async{
    CNews news = CNews();
    await news.getCNews(widget.category);
    articles = news.cnews;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lWhite,
      appBar: AppBar(
        leading: BackButton(
            color: dBlue,
        ),
        title: Text("News App", style: TextStyle(color: dBlue),),
      ),
      body: _loading ? Center(
        child: Container(
          child: CircularProgressIndicator(),
        ),
      ) : SingleChildScrollView(
        // physics: const ClampingScrollPhysics(),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: <Widget>[
              SizedBox(height: 15,),
              Text(widget.name, style: TextStyle(color: dBlue, fontWeight: FontWeight.w600, fontSize: 20),),
              Container(
                padding: EdgeInsets.only(top: 16),
                child: ListView.builder(
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: articles.length,
                    itemBuilder: (context, index){
                      return BlogTile(
                          imageUrl: articles[index].urlToImage,
                          title: articles[index].title,
                          desc: articles[index].desc,
                          url: articles[index].url);
                    }
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class BlogTile extends StatelessWidget {

  final String imageUrl, title, desc, url;
  const BlogTile({required this.imageUrl, required this.title, required this.desc, required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => ArticleView(blogUrl: url)));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        child: Column(
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(imageUrl)),
            SizedBox(height: 8,),
            Text(title, style: const TextStyle(
              fontSize: 17,
              color: dBlue,
              fontWeight: FontWeight.w500,
            ),),
            SizedBox(height: 8,),
            Text(desc, style: TextStyle(color: Colors.blueGrey),),
          ],
        ),
      ),
    );
  }
}
