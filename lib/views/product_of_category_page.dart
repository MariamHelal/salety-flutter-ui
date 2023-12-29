import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salety_market/views/Category_Page.dart';
import 'package:salety_market/views/Home_Page.dart';

import '../Widgets/Navigation_bar.dart';
import '../Widgets/Shopping/cart_has_products.dart';
import '../Widgets/Shopping/cart_provider.dart';
import '../Widgets/best_seller/best_sales_grid_view_page.dart';
import '../Widgets/best_seller/best_saller_card.dart';
import '../Widgets/product_of_category_grid_view.dart';
import '../Widgets/search_widget.dart';
import '../models/best_saller_model.dart';

class ProductOfCategoriesPage extends StatelessWidget {
   ProductOfCategoriesPage({super.key, required this.category});
  final String category;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBarWidget(),
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
        leading: SizedBox(
          height: 26,
          //width: 40,
          child: Center(
            child: OutlinedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return HomePage();
                }));
                // Navigator.pop(context);
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) {
                //       return onBackReturnPage;
                //     }));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                side: BorderSide(
                  color: Colors.black38,
                  width: .5,
                ),
                // fixedSize: Size(10, 30),
              ),
              child: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.black,
                size: 20,
              ),
            ),
          ),
        ),
        title: Text(category,
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        actions: [
          Center(
            child: OutlinedButton(
              onPressed: () {

                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return CartHasProducts();
                }));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                side: const BorderSide(
                  color: Colors.black38,
                  width: .5,
                ),
                // fixedSize: Size(10, 30),
              ),
              child: Badge(
                label: Consumer<CartProvider>(

                  builder: (BuildContext context, value, Widget? child) {
                    return Text(value.getCounter().toString(),style: TextStyle(color: Colors.white),);
                  },
                ),

                child: const Icon(
                  Icons.local_mall_outlined,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                width: double.infinity,
                height: 40,
                color: Colors.green,
              ),
            ),

           SliverToBoxAdapter(child:Padding(
             padding: const EdgeInsets.all(16.0),
             child: SearchView(),
           ),),
              SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  sliver: ProductsOfCategoryGridView()),

           //const SliverToBoxAdapter(child: SizedBox(height: 30,))
           // Spacer(flex: 2,),


          ],
        ),
      ),
    );
  }
}
