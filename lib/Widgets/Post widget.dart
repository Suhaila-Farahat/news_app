import 'package:flutter/material.dart';
import 'package:news_app/Models/ArticleModel.dart';

// Code UI as Design
class PostCard extends StatelessWidget {
  const PostCard({super.key, required this.articleModel});

  final ArticleModel articleModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildImage(),
        const SizedBox(
          height: 10,
        ),
        Text(
          articleModel.title ?? '',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          articleModel.subTitle ?? '',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: Colors.black87,
            fontSize: 15,
          ),
        ),
      ],
    );
  }


  Widget buildImage() {
    if (articleModel.image !=null){
      return ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.network(
              articleModel.image!,
              height: 200,
              width: double.infinity,
              fit: BoxFit.fill,
            )
      );
    }
    return Image.asset(
      'assets/images/img.png',
      height: 200,
      width: double.infinity,
      fit: BoxFit.fill,
    );

  }

}

class PostCardListView extends StatelessWidget {
  const PostCardListView({super.key,required this.articles});

  final List<ArticleModel> articles;

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate(
            childCount: articles.length,
            (context, index) {
      return Padding(
          padding: const EdgeInsets.only(
              bottom: 30
          ),
          child: PostCard(
            articleModel: articles[index],
          ));
    }));
  }
}


