import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:salety_market/models/cart_model.dart';
import '../../db_helper.dart';
import '../../views/Category_Page.dart';
import '../../views/Home_Page.dart';
import '../Navigation_bar.dart';
import 'cart_provider.dart';

class CartHasProducts extends StatefulWidget {
  const CartHasProducts({super.key});

  @override
  State<CartHasProducts> createState() => _CartHasProductsState();
}

class _CartHasProductsState extends State<CartHasProducts> {
  DBHelper? dbHelper = DBHelper();

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    final orientationDevice = MediaQuery.of(context).orientation;
    return orientationDevice == Orientation.portrait
        ? Scaffold(
            backgroundColor: Colors.grey[200],
            appBar: AppBar(
        backgroundColor: Colors.grey[200],
        elevation: 0,
        title: const Text('عربة التسوق',style: TextStyle(
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
            bottomNavigationBar: const NavigationBarWidget(),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: FutureBuilder(
                    future: cart.getData(),
                    builder:
                        (context, AsyncSnapshot<List<CartModel>> snapShot) {
                      if (snapShot.hasData) {
                        if (snapShot.data!.isEmpty) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Spacer(flex: 2,),
                              SizedBox(height: MediaQuery.of(context).size.height /5,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children:  [
                                  Icon(Icons.shopping_bag_outlined,color: Colors.red,size: 100.sp,),
                                  Text('عربة التسوق فارغة!',style: TextStyle(
                                      fontSize: 30.sp,
                                      fontWeight: FontWeight.bold
                                  ),),
                                  Text('اجعل سلتك سعيدة واضف منتجات',style: TextStyle(
                                      fontSize: 20.sp,
                                      color: Colors.black54
                                  ),),
                                ],
                              ),
                              //Spacer(flex: 2,),
                              SizedBox(height: MediaQuery.of(context).size.height /3.5,),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.green,
                                ),
                                alignment: Alignment.bottomCenter,
                                width: double.infinity,

                                child: MaterialButton(onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context){
                                    return const CategoryPage();
                                  }));
                                },
                                  child:  Center(
                                    child: Text('ابدأ التسوق', style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.bold,
                                    ),),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10.h,)
                            ],
                          );
                        } else {
                          return CustomScrollView(
                              slivers: [
                                SliverGrid.builder(
                                  itemCount: snapShot.data!.length,
                                  itemBuilder: (context, index) {
                                    return Slidable(
                                      endActionPane: ActionPane(
                                        motion: const StretchMotion(),
                                        children: [
                                          SlidableAction(
                                            onPressed: ((context){
                                            // delete
                                            showDialog(context: context, builder: (context) {
                                              return AlertDialog(
                                                elevation: 5,
                                                title: const Text('تأكيد الحذف ',
                                                  style: TextStyle(),
                                                ),
                                                content: const Text(
                                                    'هل انت متأكد من عملية الحذف'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () {
                                                      dbHelper!.delete(
                                                          snapShot.data![index].id!);
                                                      cart.removeCounter();
                                                      cart.removeTotalPrice(double.parse((snapShot.data![index].totalPriceOfProduct).toString()));
                                                      Navigator.pop(context, 'حذف');
                                                    },
                                                    child: const Text(
                                                        'حذف'),
                                                  ),
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.pop(
                                                          context,
                                                          'الغاء');
                                                      //onTap();
                                                    },
                                                    child: const Text(
                                                        'الغاء'),
                                                  ),
                                                ],
                                              );
                                            },
                                            );
                                          }),
                                            backgroundColor: Colors.red,
                                            icon: Icons.delete,
                                          ),
                                        ],
                                      ),
                                      child: Card(
                                        elevation: 5,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(8),
                                            color: Colors.white,
                                          ),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                flex: 7,
                                                child: Padding(
                                                  padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10.0),
                                                  child: Align(
                                                    alignment:
                                                    Alignment.centerRight,
                                                    child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        Align(
                                                          alignment: Alignment
                                                              .centerRight,
                                                          child: Text(
                                                            snapShot.data![index]
                                                                .productPrice
                                                                .toString(),
                                                            style:
                                                             TextStyle(
                                                              color: Colors.green,
                                                              fontSize: 15.sp,
                                                            ),
                                                            textAlign:
                                                            TextAlign.right,
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment: Alignment
                                                              .centerRight,
                                                          child: Text(
                                                            snapShot.data![index]
                                                                .productName,
                                                            style:  TextStyle(
                                                                color: Colors
                                                                    .black87,
                                                                fontSize: 17.sp),
                                                            textAlign:
                                                            TextAlign.right,
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment: Alignment
                                                              .centerRight,
                                                          child: Text(
                                                            snapShot.data![index]
                                                                .productQuantity,
                                                            style:  TextStyle(
                                                              color: Colors.black,
                                                              fontSize: 15.sp,
                                                            ),
                                                            textAlign:
                                                            TextAlign.right,
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                               Expanded(
                                                  child: SizedBox(
                                                    width: 40.w,
                                                  )),
                                              Expanded(
                                                child: Column(
                                                  children: [
                                                    IconButton(
                                                      onPressed: () {
                                                        int quantity = snapShot
                                                            .data![index]
                                                            .numbersOfProduct;
                                                        double price = snapShot
                                                            .data![index]
                                                            .productPrice;
                                                        quantity++;
                                                        double? newPrice =
                                                            price * quantity;

                                                        dbHelper!
                                                            .updateNumbersOfProduct(CartModel(
                                                            id: snapShot
                                                                .data![index]
                                                                .id,
                                                            productId: snapShot
                                                                .data![index]
                                                                .id
                                                                .toString(),
                                                            numbersOfProduct:
                                                            quantity,
                                                            image: snapShot
                                                                .data![index]
                                                                .image
                                                                .toString(),
                                                            productName: snapShot
                                                                .data![index]
                                                                .productName,
                                                            productQuantity:
                                                            snapShot
                                                                .data![
                                                            index]
                                                                .productQuantity
                                                                .toString(),
                                                            productPrice: snapShot
                                                                .data![index]
                                                                .productPrice,
                                                            totalPriceOfProduct:
                                                            newPrice))
                                                            .then((value) {
                                                          newPrice = 0;
                                                          quantity = 0;
                                                          cart.addTotalPrice(
                                                              double.parse(snapShot
                                                                  .data![index]
                                                                  .productPrice
                                                                  .toString()));
                                                        }).onError((error,
                                                            stackTrace) {
                                                          print(error.toString());
                                                        });
                                                      },
                                                      icon:  Icon(Icons.add),
                                                      iconSize: 15.sp,
                                                    ),
                                                    Text(
                                                      snapShot.data![index]
                                                          .numbersOfProduct
                                                          .toString(),
                                                      style:  TextStyle(
                                                          fontWeight:
                                                          FontWeight.w700,
                                                          fontSize: 15.sp),
                                                    ),
                                                    IconButton(
                                                      onPressed: () {
                                                        int quantity = snapShot
                                                            .data![index]
                                                            .numbersOfProduct;
                                                        double price = snapShot
                                                            .data![index]
                                                            .productPrice;
                                                        quantity--;
                                                        double? newPrice =
                                                            price * quantity;
                                                        if (quantity > 0) {
                                                          dbHelper!
                                                              .updateNumbersOfProduct(
                                                              CartModel(
                                                                numbersOfProduct:
                                                                quantity,
                                                                image: snapShot
                                                                    .data![index]
                                                                    .image
                                                                    .toString(),
                                                                productName: snapShot
                                                                    .data![index]
                                                                    .productName,
                                                                productQuantity:
                                                                snapShot
                                                                    .data![index]
                                                                    .productQuantity
                                                                    .toString(),
                                                                productPrice: snapShot
                                                                    .data![index]
                                                                    .productPrice,
                                                                totalPriceOfProduct:
                                                                newPrice,
                                                                id: snapShot
                                                                    .data![index].id,
                                                                productId: snapShot
                                                                    .data![index].id
                                                                    .toString(),
                                                              ))
                                                              .then((value) {
                                                            newPrice = 0;
                                                            quantity = 0;
                                                            cart.removeTotalPrice(
                                                                double.parse(snapShot
                                                                    .data![index]
                                                                    .productPrice
                                                                    .toString()));
                                                          }).onError((error,
                                                              stackTrace) {
                                                            print(
                                                                error.toString());
                                                          });
                                                        }
                                                      },
                                                      icon:  Icon(
                                                        Icons.remove,
                                                      ),
                                                      iconSize: 15.sp,
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 1,
                                      childAspectRatio: 1 / .35),
                                ),
                                 SliverToBoxAdapter(child: SizedBox(height: 10.h,)),
                                SliverToBoxAdapter(
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(16),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(8),
                                            color: Colors.white
                                        ),
                                        child: Column(
                                          children: [
                                            ReusableWidget(title: 'المجموع الفرعي', value: r'$' +cart.getTotalPrice().toStringAsFixed(2)),
                                            ReusableWidget(title: 'رسوم التوصيل', value: r'$' +'20'),
                                            const Divider(
                                              color: Colors.black54,
                                            ),
                                            ReusableWidget(title: 'المجموع الفرعي', value: r'$' +cart.getTotalPrice().toStringAsFixed(2)),

                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(8),
                                          color: Colors.green,
                                        ),
                                        alignment: Alignment.bottomCenter,
                                        width: double.infinity,

                                        child: MaterialButton(onPressed: (){

                                        },
                                          child:  Center(
                                            child: Text('الدفع', style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.bold,
                                            ),),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )

                              ]
                          );
                        }
                      } else if (snapShot.hasError) {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: Colors.green,
                          ),
                        );
                      }
                      return const Text('');
                      //return Text('');
                    }
                ),
                ),
              ),
            )

        : Scaffold(
            backgroundColor: Colors.grey[200],
            appBar: AppBar(
        backgroundColor: Colors.grey[200],
        elevation: 0,
        title: const Text('عربة التسوق',style: TextStyle(
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
            bottomNavigationBar: const NavigationBarWidget(),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: FutureBuilder(
                    future: cart.getData(),
                    builder:
                        (context, AsyncSnapshot<List<CartModel>> snapShot) {
                      if (snapShot.hasData) {
                        if (snapShot.data!.isEmpty) {
                          return ListView(
                            children: [
                              // Spacer(flex: 2,),
                             // SizedBox(height: MediaQuery.of(context).size.height /8,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children:  [
                                  Icon(Icons.shopping_bag_outlined,color: Colors.red,size: 100.sp,),
                                  Text('عربة التسوق فارغة!',style: TextStyle(
                                      fontSize: 30.sp,
                                      fontWeight: FontWeight.bold
                                  ),),
                                  Text('اجعل سلتك سعيدة واضف منتجات',style: TextStyle(
                                      fontSize: 20.sp,
                                      color: Colors.black54
                                  ),),
                                ],
                              ),
                              //Spacer(flex: 2,),
                              SizedBox(height: MediaQuery.of(context).size.height /20,),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.green,
                                ),
                                alignment: Alignment.bottomCenter,
                                width: double.infinity,

                                child: MaterialButton(onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context){
                                    return const CategoryPage();
                                  }));
                                },
                                  child:  Center(
                                    child: Text('ابدأ التسوق', style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.bold,
                                    ),),
                                  ),
                                ),
                              ),
                               SizedBox(height: 10.h,)

                            ],
                          );
                        } else {
                          return CustomScrollView(
                              slivers: [
                                SliverGrid.builder(
                                  itemCount: snapShot.data!.length,
                                  itemBuilder: (context, index) {
                                    return Slidable(
                                      endActionPane: ActionPane(
                                        motion: const StretchMotion(),
                                        children: [
                                          SlidableAction(onPressed:
                                          ((context){
                                            // delete
                                            showDialog(context: context, builder: (context) {
                                              return AlertDialog(
                                                elevation: 5,
                                                title: const Text('تأكيد الحذف ',
                                                  style: TextStyle(),
                                                ),
                                                content: const Text(
                                                    'هل انت متأكد من عملية الحذف'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () {
                                                      dbHelper!.delete(
                                                          snapShot.data![index].id!);
                                                      cart.removeCounter();
                                                      cart.removeTotalPrice(double.parse((snapShot.data![index].totalPriceOfProduct).toString()));
                                                      Navigator.pop(context, 'حذف');
                                                    },
                                                    child: const Text(
                                                        'حذف'),
                                                  ),
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.pop(
                                                          context,
                                                          'الغاء');
                                                      //onTap();
                                                    },
                                                    child: const Text(
                                                        'الغاء'),
                                                  ),
                                                ],
                                              );
                                            },
                                            );
                                          }),
                                          backgroundColor: Colors.red,
                                          icon: Icons.delete,
                                          ),
                                        ],
                                      ),
                                      child: Container(
                                        height: 200.w,
                                        child: Card(
                                          elevation: 5,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(8),
                                              color: Colors.white,
                                            ),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  flex: 7,
                                                  child: Padding(
                                                    padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10.0),
                                                    child: Align(
                                                      alignment:
                                                      Alignment.centerRight,
                                                      child: Column(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                        children: [
                                                          Align(
                                                            alignment: Alignment
                                                                .centerRight,
                                                            child: Text(
                                                              snapShot.data![index]
                                                                  .productPrice
                                                                  .toString(),
                                                              style:
                                                               TextStyle(
                                                                color: Colors.green,
                                                                fontSize: 15.sp,
                                                              ),
                                                              textAlign:
                                                              TextAlign.right,
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment: Alignment
                                                                .centerRight,
                                                            child: Text(
                                                              snapShot.data![index]
                                                                  .productName,
                                                              style:  TextStyle(
                                                                  color: Colors
                                                                      .black87,
                                                                  fontSize: 17.sp),
                                                              textAlign:
                                                              TextAlign.right,
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment: Alignment
                                                                .centerRight,
                                                            child: Text(
                                                              snapShot.data![index]
                                                                  .productQuantity,
                                                              style:  TextStyle(
                                                                color: Colors.black,
                                                                fontSize: 15.sp,
                                                              ),
                                                              textAlign:
                                                              TextAlign.right,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                 Expanded(
                                                    child: SizedBox(
                                                      width: 40.w,
                                                    )),
                                                Expanded(
                                                  child: Column(
                                                    children: [
                                                      IconButton(
                                                        onPressed: () {
                                                          int quantity = snapShot
                                                              .data![index]
                                                              .numbersOfProduct;
                                                          double price = snapShot
                                                              .data![index]
                                                              .productPrice;
                                                          quantity++;
                                                          double? newPrice =
                                                              price * quantity;

                                                          dbHelper!
                                                              .updateNumbersOfProduct(CartModel(
                                                              id: snapShot
                                                                  .data![index]
                                                                  .id,
                                                              productId: snapShot
                                                                  .data![index]
                                                                  .id
                                                                  .toString(),
                                                              numbersOfProduct:
                                                              quantity,
                                                              image: snapShot
                                                                  .data![index]
                                                                  .image
                                                                  .toString(),
                                                              productName: snapShot
                                                                  .data![index]
                                                                  .productName,
                                                              productQuantity:
                                                              snapShot
                                                                  .data![
                                                              index]
                                                                  .productQuantity
                                                                  .toString(),
                                                              productPrice: snapShot
                                                                  .data![index]
                                                                  .productPrice,
                                                              totalPriceOfProduct:
                                                              newPrice))
                                                              .then((value) {
                                                            newPrice = 0;
                                                            quantity = 0;
                                                            cart.addTotalPrice(
                                                                double.parse(snapShot
                                                                    .data![index]
                                                                    .productPrice
                                                                    .toString()));
                                                          }).onError((error,
                                                              stackTrace) {
                                                            print(error.toString());
                                                          });
                                                        },
                                                        icon:  Icon(Icons.add),
                                                        iconSize: 15.sp,
                                                      ),
                                                      Text(
                                                        snapShot.data![index]
                                                            .numbersOfProduct
                                                            .toString(),
                                                        style:  TextStyle(
                                                            fontWeight:
                                                            FontWeight.w700,
                                                            fontSize: 15.sp),
                                                      ),
                                                      IconButton(
                                                        onPressed: () {
                                                          int quantity = snapShot
                                                              .data![index]
                                                              .numbersOfProduct;
                                                          double price = snapShot
                                                              .data![index]
                                                              .productPrice;
                                                          quantity--;
                                                          double? newPrice =
                                                              price * quantity;
                                                          if (quantity > 0) {
                                                            dbHelper!
                                                                .updateNumbersOfProduct(
                                                                CartModel(
                                                                  numbersOfProduct:
                                                                  quantity,
                                                                  image: snapShot
                                                                      .data![index]
                                                                      .image
                                                                      .toString(),
                                                                  productName: snapShot
                                                                      .data![index]
                                                                      .productName,
                                                                  productQuantity:
                                                                  snapShot
                                                                      .data![index]
                                                                      .productQuantity
                                                                      .toString(),
                                                                  productPrice: snapShot
                                                                      .data![index]
                                                                      .productPrice,
                                                                  totalPriceOfProduct:
                                                                  newPrice,
                                                                  id: snapShot
                                                                      .data![index].id,
                                                                  productId: snapShot
                                                                      .data![index].id
                                                                      .toString(),
                                                                ))
                                                                .then((value) {
                                                              newPrice = 0;
                                                              quantity = 0;
                                                              cart.removeTotalPrice(
                                                                  double.parse(snapShot
                                                                      .data![index]
                                                                      .productPrice
                                                                      .toString()));
                                                            }).onError((error,
                                                                stackTrace) {
                                                              print(
                                                                  error.toString());
                                                            });
                                                          }
                                                        },
                                                        icon:  Icon(
                                                          Icons.remove,
                                                        ),
                                                        iconSize: 15.sp,
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  gridDelegate:
                                   SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio: 1.h / .15.w),
                                ),
                                 SliverToBoxAdapter(child: SizedBox(height: 10.h,),),
                                SliverToBoxAdapter(
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(16),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(8),
                                            color: Colors.white),
                                        child: Column(
                                          children: [
                                            ReusableWidget(
                                                title: 'المجموع الفرعي',
                                                value: r'$' +
                                                    cart
                                                        .getTotalPrice()
                                                        .toStringAsFixed(2)),
                                            ReusableWidget(
                                                title: 'رسوم التوصيل',
                                                value: r'$' + '20'),
                                            const Divider(
                                              color: Colors.black54,
                                            ),
                                            ReusableWidget(
                                                title: 'المجموع',
                                                value: r'$' +
                                                    cart
                                                        .getTotalPrice()
                                                        .toStringAsFixed(2)),
                                          ],
                                        ),
                                      ),
                                       SizedBox(
                                        height: 10.h,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(8),
                                          color: Colors.green,
                                        ),
                                        alignment: Alignment.bottomCenter,
                                        width: double.infinity,
                                        child: MaterialButton(
                                          onPressed: () {},
                                          child:  Center(
                                            child: Text(
                                              'الدفع',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20.sp,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ]
                          );
                        }
                      } else if (snapShot.hasError) {
                        return const Center(child: Text('try later app has error'));
                      }
                      return const Text('');
                      //return Text('');
                    }),
              ),
            ),
          );
  }
}

class ReusableWidget extends StatelessWidget {
  final String title, value;
  ReusableWidget({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(value, style: Theme.of(context).textTheme.subtitle2),
          Text(title, style: Theme.of(context).textTheme.subtitle2),
        ],
      ),
    );
  }
}
