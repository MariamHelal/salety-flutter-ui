import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salety_market/Widgets/category_list_view.dart';
import 'package:salety_market/views/Home_Page.dart';
import '../Widgets/Navigation_bar.dart';
import '../Widgets/Shopping/cart_provider.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {




  @override
  Widget build(BuildContext context) {
    final double size =  MediaQuery.of(context).size.height ;
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
      bottomNavigationBar: NavigationBarWidget(),
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
          child: Column(
            children: [
              //SliverToBoxAdapter(child: SizedBox(height: 10,)),

               const SizedBox(height: 10,
              ),
              Expanded(child: CategoryListView()),
              const SizedBox(height: 10,),
             // Center(child: Text('$size'),),
            ],
          ),
        ),
      ),

    );
  }
}
