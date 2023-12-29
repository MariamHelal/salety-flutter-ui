import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salety_market/views/Home_Page.dart';

import '../Widgets/Shopping/cart_provider.dart';
import '../Widgets/best_seller/best_sales_grid_view_page.dart';
import '../Widgets/best_seller/best_saller_card.dart';
import '../Widgets/best_seller/best_saller_list_view.dart';
import '../models/best_saller_model.dart';

class BestSallerPage extends StatelessWidget {
  BestSallerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        elevation: 0,
        title: Text('عربة التسوق',style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),),
        centerTitle: true,
        leading:  Center(
          child: OutlinedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) {
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
        actions: [
          Center(
            child: OutlinedButton(
              onPressed: () {},
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
                  builder: (BuildContext context, value,
                      Widget? child) {
                    return Text(
                      value.getCounter().toString(),
                      style: TextStyle(color: Colors.white),
                    );
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
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [

              SizedBox(height: 10,),
              Expanded(child: BestSallerGridView()),

            ],
          ),
        ),
      ),
    );
  }
}
