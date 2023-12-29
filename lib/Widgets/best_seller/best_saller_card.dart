import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salety_market/Widgets/Shopping/cart_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../db_helper.dart';
import '../../models/best_saller_model.dart';

class BestSallerCard extends StatelessWidget {
  BestSallerCard({super.key, required this.product, required this.OnTap});
  final BestSallerModel product;
  Function OnTap;

  @override
  Widget build(BuildContext context) {
    Function onTap;
    return Card(
      elevation: 8,
      child: Container(
        height: 300,
        width: 165,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.favorite,
                    color: Colors.green,
                  ),
                  color: Colors.white,
                  padding: const EdgeInsets.all(16),
                ),
                const Spacer(),
                Container(
                  //padding: EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(20)),
                      color: Colors.green),
                  child: const Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Text(
                      'عروض',
                      style: TextStyle(color: Colors.white, fontSize: 10),
                    ),
                  ),
                ),
              ],
            ),
            //SizedBox(height: 5,),
            SizedBox(
              height: 94,
              //width: MediaQuery.of(context).size.width / 2.3,
              child: Image.asset(
                product.image,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: Container(
                //padding: EdgeInsets.all(4),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.green),
                child: const Padding(
                  padding:
                      EdgeInsets.only(top: 4.0, bottom: 4, left: 30, right: 8),
                  child: Text(
                    'الأعلى مبيعا',
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Align(
                alignment: AlignmentDirectional.centerEnd,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      product.productName,
                      style: const TextStyle(fontSize: 12),
                    ),
                    Text(product.productQuantity),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Stack(
              alignment: AlignmentDirectional.topStart,
              children: [
                Container(
                  alignment: AlignmentDirectional.centerEnd,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey[200],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Text(
                      "${product.productPrice} EG",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: GestureDetector(
                    onTap: () {

                      OnTap();
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) {
                      //   return ShoppingPage();
                      // }));
                    },
                    child: const CircleAvatar(
                        radius: 17,
                        backgroundColor: Colors.red,
                        child: Icon(
                          Icons.shopping_cart_outlined,
                          color: Colors.white,
                          size: 20,
                        )),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
