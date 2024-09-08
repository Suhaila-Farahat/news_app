import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Models/ArticleModel.dart';
import 'package:news_app/Services/News%20services.dart';
import 'Post widget.dart';

// Code Building UI With Data

class PostCardListViewBuilder extends StatefulWidget {
  const PostCardListViewBuilder({super.key, required this.category});
  final String category;

  @override
  State<PostCardListViewBuilder> createState() => _PostCardListViewBuilderState();
}

class _PostCardListViewBuilderState extends State<PostCardListViewBuilder> {

  var futureData;

  @override
  void initState() {
    super.initState();
    futureData = NewsService(Dio()).getTopHeadlines(category: widget.category);
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder <List<ArticleModel>>(
        future: futureData ,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return PostCardListView(
                articles:snapshot.data!
            );
          }
          else if (snapshot.hasError) {
            return const SliverToBoxAdapter(
                child: Text('ERORR!!!!'));
          }
          else {
            return const SliverToBoxAdapter(
                child: Center(child: CircularProgressIndicator()));
          }
        }
    );
  }
}