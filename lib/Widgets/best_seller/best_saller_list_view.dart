import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:salety_market/Widgets/best_seller/best_saller_card.dart';

import '../../db_helper.dart';
import '../../models/best_saller_model.dart';
import '../../models/cart_model.dart';
import '../Shopping/cart_provider.dart';

class BestSallerListView extends StatefulWidget {
  const BestSallerListView({super.key});

  @override
  State<BestSallerListView> createState() => _BestSallerListViewState();
}

class _BestSallerListViewState extends State<BestSallerListView> {
  final List<BestSallerModel> products = [
    BestSallerModel(
      image: 'assets/فواكه/مانجو.jpg',
      productName: 'مانجو',
      productQuantity: "1.0 Kg",
      productPrice: 30.79, id: 7,
    ),
    BestSallerModel(
        image: 'assets/خضراوات/carrots.jpeg',
        productName: 'جزر',
        productQuantity: '1.0 Kg',
        productPrice: 8.00, id: 2,  ),
    BestSallerModel(
        image: 'assets/فواكه مجففة/عين جمل.jpg',
        productName: 'عين جمل',
        productQuantity: '0.4 Kg',
        productPrice: 89.50, id: 3, ),
    BestSallerModel(
        image: 'assets/خضراوات/peas.jpeg',
        productName: 'بازلاء',
        productQuantity: '1.0 Kg',
        productPrice: 18.50, id: 4, )
  ];

  DBHelper? dbHelper= DBHelper();

  @override
  Widget build(BuildContext context) {
    final cart=Provider.of<CartProvider>(context);
    final orientationDevice = MediaQuery.of(context).orientation;
    return orientationDevice == Orientation.portrait
        ? SliverGrid.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(left: 12.0),
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
      },
      gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        // crossAxisSpacing: 5,
        // mainAxisSpacing: 5,
        childAspectRatio: 1.w / 1.4.h,
      ),
    )
        : SliverGrid.builder(
            itemCount: products.length,
            gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 7,
                mainAxisSpacing: 7,
                childAspectRatio: 1.h / .59.w),
            itemBuilder: (BuildContext context, int index) {
              return BestSallerCard(
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
              );
            },
          );
  }
}


