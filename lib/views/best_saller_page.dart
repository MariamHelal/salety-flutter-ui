import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:salety_market/views/Home_Page.dart';

import '../Widgets/Shopping/cart_provider.dart';
import '../Widgets/best_seller/best_sales_grid_view_page.dart';

class BestSallerPage extends StatelessWidget {
  const BestSallerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        elevation: 0,
        title: const Text('الأكثر مبيعا',style: TextStyle(
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
                      style: const TextStyle(color: Colors.white),
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
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [

               SizedBox(height: MediaQuery.of(context).size.height /30,),
              const Expanded(child: BestSallerGridView()),

            ],
          ),
        ),
      ),
    );
  }
}
