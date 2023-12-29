import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salety_market/Widgets/Shopping/cart_provider.dart';
import 'package:salety_market/Widgets/rapidly_and_fresh/product_list_view1.dart';
import 'package:salety_market/Widgets/search_widget.dart';
import 'package:salety_market/views/best_saller_page.dart';
import '../Widgets/ShopByOffers/shop_by_offers_grid_view.dart';
import '../Widgets/Shopping/cart_has_products.dart';
import '../Widgets/best_seller/best_saller_card.dart';
import '../Widgets/best_seller/best_saller_list_view.dart';
import '../Widgets/category_home_list_view.dart';
import '../Widgets/image_slider/Image_Slider.dart';
import '../Widgets/rapidly_and_fresh/fresh_salles_card.dart';
import '../Widgets/rapidly_and_fresh/product_list_view2.dart';
import '../Widgets/sales/sales_list_view.dart';
import '../db_helper.dart';
import '../models/best_saller_model.dart';
import '../models/cart_model.dart';
import 'Category_Page.dart';


class HomePage extends StatefulWidget {

   HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<BestSallerModel> products = [
    BestSallerModel(
      id: 1,
      image: 'assets/فواكه/افوكادو.jpg',
      productName: 'أفوكادو',
      productQuantity: "0.5 Kg",
      productPrice: 54.98,
    ),
    BestSallerModel(
        image: 'assets/خضراوات/carrots.jpeg',
        productName: 'جزر',
        productQuantity: '1.0 Kg',
        productPrice: 8.00, id: 2,),
    BestSallerModel(
        image: 'assets/فواكه مجففة/عين جمل.jpg',
        productName: 'عين جمل',
        productQuantity: '0.4 Kg',
        productPrice: 89.50,
      id:3,
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
    BestSallerModel(
        image: 'assets/ورقيات/نعناع.png',
        productName: 'نعناع فريش',
        productQuantity: '1 حزمة',
        productPrice: 7.89, id: 6,
        ),
  ];



  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Row(
                  children: [
                    OutlinedButton(
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
                    const Spacer(
                      flex: 1,
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: const [
                            Text(
                              'مريم هلال',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            Text('اهلا بك ')
                          ],
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 25,
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Image.asset(
                              'assets/profile_photo/photo.jpeg',
                              fit: BoxFit.contain,
                              alignment: Alignment.center,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 10,
                ),
              ),
               SliverToBoxAdapter(child: SearchView()),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 20,
                ),
              ),
              SliverToBoxAdapter(
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        print('عرض الكل ');
                      },
                      child: Row(
                        children: const [
                          Text(
                            'عرض الكل',
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          Icon(
                            Icons.play_arrow,
                            color: Colors.grey,
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                    const Spacer(
                      flex: 2,
                    ),
                    Row(
                      children: const [
                        Text(
                          'أعلي المبيعات',
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text('القيمة الأفضل؟'),
                      ],
                    ),
                  ],
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 20,
                ),
              ),
              const SliverToBoxAdapter(child: SalesListView()),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 20,
                ),
              ),
              SliverToBoxAdapter(
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const CategoryPage();
                        }));
                      },
                      child: Row(
                        children: const [
                          Text(
                            'عرض الكل',
                            style: TextStyle(color: Colors.grey),
                          ),
                          Icon(
                            Icons.play_arrow_rounded,
                            color: Colors.grey,
                            size: 20,
                          )
                        ],
                      ),
                    ),
                    const Spacer(
                      flex: 2,
                    ),
                    const Text(
                      'التصنيفات',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                  ],
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 10,
                ),
              ),
              SliverToBoxAdapter(child: CategoryHomeListView()),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 10,
                ),
              ),
              SliverToBoxAdapter(
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return BestSallerPage();
                        }));
                      },
                      child: Row(
                        children: const [
                          Text(
                            'عرض الكل',
                            style: TextStyle(color: Colors.grey),
                          ),
                          Icon(
                            Icons.play_arrow_rounded,
                            color: Colors.grey,
                            size: 20,
                          )
                        ],
                      ),
                    ),
                    const Spacer(
                      flex: 2,
                    ),
                    const Text(
                      'الأكثر مبيعا',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                  ],
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 10,
                ),
              ),
              BestSallerListView(),

              const SliverToBoxAdapter(
                  child: SizedBox(
                height: 10,
              )),

             SliverToBoxAdapter(child: ImageSlider()),
              SliverToBoxAdapter(
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                              return BestSallerPage();
                            }));
                      },
                      child: Row(
                        children: const [
                          Text(
                            'عرض الكل',
                            style: TextStyle(color: Colors.grey),
                          ),
                          Icon(
                            Icons.play_arrow_rounded,
                            color: Colors.grey,
                            size: 20,
                          )
                        ],
                      ),
                    ),
                    const Spacer(
                      flex: 2,
                    ),
                    const Text(
                      'تسوق حسب العروض',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                  ],
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 10,
                ),
              ),

              ShopByOffersGridView(),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 20,
                ),
              ),
              const SliverToBoxAdapter(child: Text(
                textAlign: TextAlign.right,
                'طازج وسريع',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 20,
                ),
              ),
              SliverToBoxAdapter(child: ProductListView1(),),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 20,
                ),
              ),
              SliverToBoxAdapter(child: ProductListView2(),),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 20,
                ),
              ),
              const SliverToBoxAdapter(child: FreshSales(),),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 10,
                ),
              ),
              //  SliverToBoxAdapter(child: Text('$size'))
            ],
          ),
        ),
      ),
    );
  }
}

