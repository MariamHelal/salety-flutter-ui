import 'package:flutter/material.dart';

import '../models/category_model.dart';
import 'category_card.dart';

class CategoryListView extends StatelessWidget {
  CategoryListView({super.key, });
 // final Function categoryPageName;
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

  // final List ListContent;
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      return orientation == Orientation.portrait
          ? GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                //mainAxisExtent: 100,
                  crossAxisCount: 2,
                  crossAxisSpacing: 25,
                  mainAxisSpacing: 25,
                  childAspectRatio: 1 / 1.4),
              itemCount: catergories.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return Text('data');
                    }));
                  },
                  child: CategoeryCard(
                    category: catergories[index],
                    widthOfCard: MediaQuery.of(context).size.width / 3.5,
                    heightOfCard: MediaQuery.of(context).size.height / 3.5, fontSizeOfCard: 20,
                  ),
                );
              },
            )
          : GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                //maxCrossAxisExtent: 100,
                crossAxisCount: 4,
                childAspectRatio: 1 /1.3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: catergories.length,
              itemBuilder: (context, index) {
                return CategoeryCard(
                    category: catergories[index],
                    widthOfCard: MediaQuery.of(context).size.width / 2.5,
                    heightOfCard: MediaQuery.of(context).size.width / 4,
                    fontSizeOfCard: 20,);
              },
            );
    });
  }
}


