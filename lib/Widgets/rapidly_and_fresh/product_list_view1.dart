import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:salety_market/Widgets/best_seller/best_saller_card.dart';

import '../../db_helper.dart';
import '../../models/best_saller_model.dart';
import '../../models/cart_model.dart';
import '../Shopping/cart_provider.dart';

class ProductListView1 extends StatefulWidget {
  ProductListView1({super.key});

  @override
  State<ProductListView1> createState() => _ProductListView1State();
}

class _ProductListView1State extends State<ProductListView1> {
  final List<BestSallerModel> products = [
    BestSallerModel(
      image: 'assets/فواكه/مانجو.jpg',
      productName: 'مانجو',
      productQuantity: "1.0 Kg",
      productPrice: 30.79, id: 7,
    ),
    BestSallerModel(
        image: 'assets/فواكه/فراولة.jpg',
        productName: 'فراولة',
        productQuantity: "1 Kg",
        productPrice: 17.50, id: 8,),
    BestSallerModel(
        image: 'assets/دجاج/فرخة كاملة.jpg',
        productName: 'فرخة كاملة',
        productQuantity: '3 Kg',
        productPrice: 255.97, id: 9,
        ),
    BestSallerModel(
        image: 'assets/خضراوات/طماطم.jpg',
        productName: 'طماطم',
        productQuantity: '1 Kg',
        productPrice: 6.50, id: 10,
        ),
    BestSallerModel(
        image: 'assets/بهارات/فلفل اسود.jpg',
        productName: 'فلفل أسود',
        productQuantity: '45 g',
        productPrice: 32.95, id: 11,
        )
  ];

  DBHelper? dbHelper= DBHelper();

  @override
  Widget build(BuildContext context) {
    final cart=Provider.of<CartProvider>(context);
    final orientationDevice = MediaQuery.of(context).orientation;
    return orientationDevice == Orientation.portrait?
    SizedBox(
      height: 230.h,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: products.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: BestSallerCard(
                product: products[index],
                OnTap: () {
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
          }),
    ):
    SizedBox(
      height: 114.w,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: products.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: BestSallerCard(
                product: products[index],
                OnTap: () {
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
          }),
    );
  }
}
