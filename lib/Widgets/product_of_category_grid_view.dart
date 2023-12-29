import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../db_helper.dart';
import '../models/best_saller_model.dart';
import '../models/cart_model.dart';
import 'Shopping/cart_provider.dart';
import 'Shopping/shopping_card.dart';
import 'best_seller/best_sales_grid_view_page.dart';
import 'best_seller/best_saller_card.dart';

class ProductsOfCategoryGridView extends StatelessWidget {
   ProductsOfCategoryGridView({super.key, });
  final List<BestSallerModel> products=[
    BestSallerModel(image: 'assets/خضراوات/carrots.jpeg', productName: 'جزر', productQuantity: '1.0 Kg', productPrice: 8.00, id: 2,),
    BestSallerModel(image: 'assets/خضراوات/peas.jpeg', productName: 'بازلاء', productQuantity: '1.0 Kg', productPrice: 18.50, id: 4, ),
    BestSallerModel(image: 'assets/خضراوات/pepper.jpeg', productName: 'فلفل ألوان (احمر-اخضر)', productQuantity: '500 g', productPrice: 26.95, id: 5,),
    BestSallerModel(image: 'assets/خضراوات/باذنجان.jpg', productName: 'باذنجان', productQuantity: '2.0 Kg', productPrice: 2.95, id: 17, ),
    BestSallerModel(image: 'assets/خضراوات/طماطم.jpg', productName: 'طماطم', productQuantity: '1.0 Kg', productPrice: 6.50, id: 10,),

  ];

  final List<String> ListOfCategoryName=[
    'vegetables','fruits'
  ];
   DBHelper? dbHelper= DBHelper();

  @override
  Widget build(BuildContext context) {
    final cart=Provider.of<CartProvider>(context);
    final orientationDevice = MediaQuery.of(context).orientation;
    return  orientationDevice == Orientation.portrait
        ? SliverGrid.builder(
      // shrinkWrap: true,
      // physics: NeverScrollableScrollPhysics(),
      // physics: const BouncingScrollPhysics(),
      // scrollDirection: Axis.horizontal,
      itemCount: products.length,
      itemBuilder: (context, index) {
        return BestSallerCard(
          product: products[index],
          OnTap: (){
            dbHelper!.insert(
                CartModel(
                  numbersOfProduct: 1,
                  image: products[index].image,
                  productName: products[index].productName,
                  productQuantity: products[index].productQuantity,
                  productPrice: products[index].productPrice,
                  totalPriceOfProduct: products[index].productPrice,
                  id: products[index].id,
                  productId: products[index].productName.toString(),
                )
            ).then((value) {
              print('product is added to cart');
              cart.addTotalPrice(double.parse(products[index].productPrice.toString()));
              cart.addCounter();
            }).onError((error, stackTrace) {
              print(error.toString());
            });
        },
        );
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 7,
          mainAxisSpacing: 7,
          childAspectRatio: 1 / 1.6),
    )
        : SliverGrid.builder(
      // shrinkWrap: true,
      // physics: NeverScrollableScrollPhysics(),
      // physics: const BouncingScrollPhysics(),
      // scrollDirection: Axis.horizontal,
      itemCount: products.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: BestSallerCard(
            product: products[index],
            OnTap: (){
              dbHelper!.insert(
                  CartModel(
                    numbersOfProduct: 1,
                    image: products[index].image,
                    productName: products[index].productName,
                    productQuantity: products[index].productQuantity,
                    productPrice: products[index].productPrice,
                    totalPriceOfProduct: products[index].productPrice,
                    id: products[index].id,
                    productId: products[index].productName.toString(),
                  )
              ).then((value) {
                print('product is added to cart');
                cart.addTotalPrice(double.parse(products[index].productPrice.toString()));
                cart.addCounter();
              }).onError((error, stackTrace) {
                print(error.toString());
              });

            },
          ),
        );
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 7,
          mainAxisSpacing: 7,
          childAspectRatio: 1 / 1.43),
    );  }
}
