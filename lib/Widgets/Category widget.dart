import 'package:flutter/material.dart';
import 'package:news_app/Models/CategoryModel.dart';
import 'package:news_app/Pages/Category%20page.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.categoryModel});

  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context,
            MaterialPageRoute(builder: (context) =>  CategoryPage(category: categoryModel.categoryName,)));
        },
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Container(
          width: 200,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(categoryModel.imageUrl),
                fit: BoxFit.fill,
              ),
              borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: Container(
              color: Colors.white,
              child: Text(
                categoryModel.categoryName,
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CategoryCardListView extends StatelessWidget {
  const CategoryCardListView({super.key});

  final List<CategoryModel> categories = const [
    CategoryModel(
        imageUrl: 'assets/images/Business.jpeg',
        categoryName: 'Business'),
    CategoryModel(
        imageUrl: 'assets/images/Health.jpeg',
        categoryName: 'Health'),
    CategoryModel(
        imageUrl: 'assets/images/Sports.jpeg',
        categoryName: 'Sports'),
    CategoryModel(
        imageUrl: 'assets/images/Science.jpeg',
        categoryName: 'Science'),
    CategoryModel(
        imageUrl: 'assets/images/Technology.jpeg',
        categoryName: 'Technology'),
    CategoryModel(
        imageUrl: 'assets/images/Entertainment.jpeg',
        categoryName: 'Entertainment'),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => CategoryCard(
          categoryModel: categories[index],
        ),
        itemCount: categories.length,
      ),
    );
  }
}

