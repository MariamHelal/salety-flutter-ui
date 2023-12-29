import 'package:flutter/material.dart';

import '../models/category_model.dart';
import '../views/product_of_category_page.dart';

class CategoeryCard extends StatelessWidget {
   const CategoeryCard({super.key, required this.category, required this.widthOfCard, required this.heightOfCard, required this.fontSizeOfCard, });
   final double widthOfCard;
   final double heightOfCard;
   final double fontSizeOfCard;
  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return ProductOfCategoriesPage(category: category.CategoryName,);
        }));
      },
      child: Padding(
        padding:  const EdgeInsets.only(bottom: 8.0),
        child: Card(
          elevation: 5,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white,

            ),
            height: heightOfCard,
            width: widthOfCard,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: Text(
                    category.CategoryName,
                    style:  TextStyle(
                      color: Colors.black,
                      fontSize: fontSizeOfCard ,
                    ),
                  ),
                ),
                const Spacer(flex: 1,),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8)
                  ),
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Image.asset(
                          category.Image1Name ,
                          fit: BoxFit.cover,
                        ),
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 30,
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Image.asset(
                            category.Logo1Name,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
