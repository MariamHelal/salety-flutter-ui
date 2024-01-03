import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:salety_market/views/Category_Page.dart';
import 'package:salety_market/views/Home_Page.dart';

import '../Widgets/Navigation_bar.dart';
import '../Widgets/Shopping/cart_page.dart';
import '../Widgets/Shopping/cart_provider.dart';
import '../Widgets/product_of_category_grid_view.dart';
import '../Widgets/search_widget.dart';

class ProductOfCategoriesPage extends StatelessWidget {
   ProductOfCategoriesPage({super.key, required this.category});
  final String category;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const NavigationBarWidget(),
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

              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                side: const BorderSide(
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
                  return const CartHasProducts();
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
                    return Text(value.getCounter().toString(),style: const TextStyle(color: Colors.white),);
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
                height: 40.h,
                color: Colors.green,
              ),
            ),

           SliverToBoxAdapter(child:Padding(
             padding: const EdgeInsets.all(16.0),
             child: SearchView(),
           ),),
              SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  sliver: ProductsOfCategoryGridView()),




          ],
        ),
      ),
    );
  }
}
