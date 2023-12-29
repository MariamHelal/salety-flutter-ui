import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../db_helper.dart';
import '../../models/best_saller_model.dart';
import '../../models/cart_model.dart';
import '../Shopping/cart_provider.dart';
import '../Shopping/shopping_card.dart';
import '../best_seller/best_sales_grid_view_page.dart';
import '../best_seller/best_saller_card.dart';

class ProductListView2 extends StatefulWidget {
   ProductListView2({super.key});

  @override
  State<ProductListView2> createState() => _ProductListView2State();
}

class _ProductListView2State extends State<ProductListView2> {
   final List<BestSallerModel> products=[
     BestSallerModel(image: 'assets/فواكه/ليمون.jpg', productName: 'ليمون', productQuantity: '1.0 Kg', productPrice: 7.50, id: 12, ),
     BestSallerModel(image: 'assets/خضراوات/كرنب.jpg', productName: 'كرنب', productQuantity: '1 ', productPrice: 10.00, id: 13, ),
     BestSallerModel(image: 'assets/بهارات/بهارات.jpg', productName: 'بهارات', productQuantity: '40 g', productPrice: 31.00, id: 14, ),
     BestSallerModel(image: 'assets/خضراوات/بطاطس.jpg', productName: 'بطاطس', productQuantity: '1.0 Kg', productPrice: 14.50, id: 15, ),
     BestSallerModel(image: 'assets/مجمدات/جمبري.jpg', productName: 'جمبري', productQuantity: '500 g', productPrice: 186.50, id: 16, ),
   ];

   DBHelper? dbHelper= DBHelper();

  @override
  Widget build(BuildContext context) {
    final cart=Provider.of<CartProvider>(context);
    return SizedBox(
      height: 275,
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


                  // bool flag = false;
                  // for (int i = 0; i < CartList.length; i++) {
                  //   if (products[index].productName ==
                  //       CartList[i].productName &&
                  //       products[index].productPrice ==
                  //           CartList[i].productPrice &&
                  //       products[index].image == CartList[i].image &&
                  //       products[index].productQuantity ==
                  //           CartList[i].productQuantity) {
                  //     flag = true;
                  //   }
                  // }
                  // if (flag == false) {
                  //   CartList.add(products[index]);
                  //   products[index].totalPriceOfProduct =
                  //       products[index].productPrice *
                  //           products[index].numbersOfProduct;
                  // } else {
                  //   products[index].numbersOfProduct++;
                  //   products[index].totalPriceOfProduct =
                  //       products[index].productPrice *
                  //           products[index].numbersOfProduct;
                  // }
                },
              ),
            );
          }),
    );
  }
}
