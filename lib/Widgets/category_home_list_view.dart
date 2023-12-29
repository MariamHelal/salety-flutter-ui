import 'package:flutter/material.dart';

import '../models/category_model.dart';
import 'category_card.dart';

class CategoryHomeListView extends StatelessWidget {
  CategoryHomeListView({super.key});

  final List<CategoryModel> catergories = const [
    CategoryModel(
        CategoryName: 'خضراوات',
        Image1Name: 'assets/خضراوات.jpg',
        Logo1Name: 'assets/logos/Vegitable_Icon.png'),
    CategoryModel(
        CategoryName: 'بهارات',
        Image1Name: 'assets/بهارات.jpg',
        Logo1Name: 'assets/logos/spicy_icon.png'),
    CategoryModel(
        CategoryName: 'مجمدات',
        Image1Name: 'assets/مجمدات.jpg',
        Logo1Name: 'assets/logos/fish_icon.png'),
    CategoryModel(
        CategoryName: 'ورقيات',
        Image1Name: 'assets/ورقيات.jpg',
        Logo1Name: 'assets/logos/harbel_icon.png'),
    CategoryModel(
        CategoryName: 'فواكهة',
        Image1Name: 'assets/فاكهة.jpg',
        Logo1Name: 'assets/logos/fruits_icon.png'),
    CategoryModel(
        CategoryName: 'فواكه مجففة',
        Image1Name: 'assets/فواكه مجففة.jpg',
        Logo1Name: 'assets/logos/walnut_icon.png'),
    CategoryModel(
        CategoryName: 'دواجن',
        Image1Name: 'assets/دواجن.jpg',
        Logo1Name: 'assets/logos/hen_icon.png'),
    CategoryModel(
        CategoryName: 'تمور',
        Image1Name: 'assets/تمور.jpg',
        Logo1Name: 'assets/logos/dates_icon.png'),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 193.9,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: catergories.length,
          itemBuilder: (context, index) {
            return CategoeryCard(
              category: catergories[index],
              widthOfCard: 112,
              heightOfCard: 194,
              fontSizeOfCard: 17,
            );

          }),
    );
  }
}



