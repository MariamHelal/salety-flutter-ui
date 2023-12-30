import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../db_helper.dart';
import '../../models/best_saller_model.dart';
import '../../models/cart_model.dart';
import '../Shopping/cart_provider.dart';
import 'best_saller_card.dart';

class BestSallerGridView extends StatefulWidget {
  const BestSallerGridView({super.key});

  @override
  State<BestSallerGridView> createState() => _BestSallerGridViewState();
}

class _BestSallerGridViewState extends State<BestSallerGridView> {
  final List<BestSallerModel> products = [
    BestSallerModel(
      image: 'assets/فواكه/افوكادو.jpg',
      productName: 'أفوكادو',
      productQuantity: "0.5 Kg",
      productPrice: 54.98, id: 1,
    ),
    BestSallerModel(
        image: 'assets/خضراوات/carrots.jpeg',
        productName: 'جزر',
        productQuantity: '1.0 Kg',
        productPrice: 8.00, id: 2,
        ),
    BestSallerModel(
        image: 'assets/فواكه مجففة/عين جمل.jpg',
        productName: 'عين جمل',
        productQuantity: '0.4 Kg',
        productPrice: 89.50, id: 3,
        ),
    BestSallerModel(
        image: 'assets/خضراوات/peas.jpeg',
        productName: 'بازلاء',
        productQuantity: '1.0 Kg',
        productPrice: 18.50, id: 4,
        ),
    BestSallerModel(
        image: 'assets/خضراوات/pepper.jpeg',
        productName: 'فلفل ألوان (أحمر-أخضر)',
        productQuantity: '500 g',
        productPrice: 26.95, id: 5,
        ),
  ];

  DBHelper dbHelper= DBHelper();

  @override
  Widget build(BuildContext context) {
    final cart=Provider.of<CartProvider>(context);

    final orientationDevice = MediaQuery.of(context).orientation;
    return orientationDevice == Orientation.portrait
        ? GridView.builder(
            // physics: const BouncingScrollPhysics(),
            // scrollDirection: Axis.horizontal,
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
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 7,
                mainAxisSpacing: 7,
                childAspectRatio: 1 / 1.6
              ),
          )
        : GridView.builder(
            // physics: const BouncingScrollPhysics(),
            // scrollDirection: Axis.horizontal,
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
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 7,
                mainAxisSpacing: 7,
                childAspectRatio: 1 / 1.5),
          );
  }
}
