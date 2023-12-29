import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salety_market/Widgets/Shopping/shopping_card.dart';
import 'package:salety_market/models/best_saller_model.dart';
import 'package:salety_market/models/cart_model.dart';
import '../../db_helper.dart';
import '../../views/Category_Page.dart';
import '../../views/Home_Page.dart';
import '../Navigation_bar.dart';
import 'cart_provider.dart';
import 'total_order_info_card.dart';

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
                                children: const [
                                  Icon(Icons.shopping_bag_outlined,color: Colors.red,size: 100,),
                                  Text('عربة التسوق فارغة!',style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold
                                  ),),
                                  Text('اجعل سلتك سعيدة واضف منتجات',style: TextStyle(
                                      fontSize: 20,
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
                                    return CategoryPage();
                                  }));
                                },
                                  child: const Center(
                                    child: Text('ابدأ التسوق', style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10,)
                            ],
                          );
                        } else {
                          return CustomScrollView(

                              slivers: [
                                SliverGrid.builder(
                                  itemCount: snapShot.data!.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      height: 150,
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
                                                child: IconButton(
                                                  onPressed: () {
                                                    showDialog(
                                                      context: context,
                                                      builder: (context) {
                                                        return AlertDialog(
                                                          elevation: 5,
                                                          title: const Text(
                                                            'تأكيد الحذف ',
                                                            style: TextStyle(),
                                                          ),
                                                          content: const Text(
                                                              'هل انت متأكد من عملية الحذف'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () {
                                                                dbHelper!.delete(
                                                                    snapShot
                                                                        .data![
                                                                    index]
                                                                        .id!);
                                                                cart.removeCounter();
                                                                cart.removeTotalPrice(
                                                                    double.parse(snapShot
                                                                        .data![
                                                                    index]
                                                                        .totalPriceOfProduct
                                                                        .toString()));
                                                                Navigator.pop(
                                                                    context,
                                                                    'حذف');
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
                                                  },
                                                  icon: Icon(Icons.delete),
                                                ),
                                              ),
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
                                                            const TextStyle(
                                                              color: Colors.green,
                                                              fontSize: 15,
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
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black87,
                                                                fontSize: 17),
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
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                              fontSize: 15,
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
                                              const Expanded(
                                                  child: SizedBox(
                                                    width: 40,
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
                                                      icon: const Icon(Icons.add),
                                                      iconSize: 15,
                                                    ),
                                                    Text(
                                                      snapShot.data![index]
                                                          .numbersOfProduct
                                                          .toString(),
                                                      style: const TextStyle(
                                                          fontWeight:
                                                          FontWeight.w700,
                                                          fontSize: 15),
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
                                                      icon: const Icon(
                                                        Icons.remove,
                                                      ),
                                                      iconSize: 15,
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
                                SliverToBoxAdapter(child: SizedBox(height: 10,)),
                                SliverToBoxAdapter(
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(16),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(8),
                                            color: Colors.white
                                        ),
                                        child: Column(
                                          children: [
                                            ReusableWidget(title: 'المجموع الفرعي', value: r'$' +cart.getTotalPrice().toStringAsFixed(2)),
                                            ReusableWidget(title: 'رسوم التوصيل', value: r'$' +'20'),
                                            Divider(
                                              color: Colors.black54,
                                            ),
                                            ReusableWidget(title: 'المجموع الفرعي', value: r'$' +cart.getTotalPrice().toStringAsFixed(2)),

                                          ],
                                        ),
                                      ),
                                      SizedBox(
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
                                          child: const Center(
                                            child: Text('الدفع', style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
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
                        return Text('try later app has error');
                      }
                      return Text('');
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
                              SizedBox(height: MediaQuery.of(context).size.height /5,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const [
                                  Icon(Icons.shopping_bag_outlined,color: Colors.red,size: 100,),
                                  Text('عربة التسوق فارغة!',style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold
                                  ),),
                                  Text('اجعل سلتك سعيدة واضف منتجات',style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black54
                                  ),),
                                ],
                              ),
                              //Spacer(flex: 2,),
                              SizedBox(height: MediaQuery.of(context).size.height /4,),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.green,
                                ),
                                alignment: Alignment.bottomCenter,
                                width: double.infinity,

                                child: MaterialButton(onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context){
                                    return CategoryPage();
                                  }));
                                },
                                  child: const Center(
                                    child: Text('ابدأ التسوق', style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10,)

                            ],
                          );
                        } else {
                          return CustomScrollView(
                              slivers: [
                                SliverGrid.builder(
                                  itemCount: snapShot.data!.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      height: 150,
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
                                                child: IconButton(
                                                  onPressed: () {
                                                    showDialog(
                                                      context: context,
                                                      builder: (context) {
                                                        return AlertDialog(
                                                          elevation: 5,
                                                          title: const Text(
                                                            'تأكيد الحذف ',
                                                            style: TextStyle(),
                                                          ),
                                                          content: const Text(
                                                              'هل انت متأكد من عملية الحذف'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () {
                                                                dbHelper!.delete(
                                                                    snapShot
                                                                        .data![
                                                                    index]
                                                                        .id!);
                                                                cart.removeCounter();
                                                                cart.removeTotalPrice(double.parse((snapShot.data![index].productPrice).toString()));
                                                                Navigator.pop(
                                                                    context,
                                                                    'حذف');
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
                                                  },
                                                  icon: Icon(Icons.delete),
                                                ),
                                              ),
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
                                                            const TextStyle(
                                                              color: Colors.green,
                                                              fontSize: 15,
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
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black87,
                                                                fontSize: 17),
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
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                              fontSize: 15,
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
                                              const Expanded(
                                                  child: SizedBox(
                                                    width: 40,
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
                                                      icon: const Icon(Icons.add),
                                                      iconSize: 15,
                                                    ),
                                                    Text(
                                                      snapShot.data![index]
                                                          .numbersOfProduct
                                                          .toString(),
                                                      style: const TextStyle(
                                                          fontWeight:
                                                          FontWeight.w700,
                                                          fontSize: 15),
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
                                                      icon: const Icon(
                                                        Icons.remove,
                                                      ),
                                                      iconSize: 15,
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
                                      crossAxisCount: 2,
                                      childAspectRatio: 1 / .35),
                                ),
                                SliverToBoxAdapter(child: SizedBox(height: 10,),),
                                SliverToBoxAdapter(
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(16),
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
                                            Divider(
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
                                        height: 10,
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
                                          child: const Center(
                                            child: Text(
                                              'الدفع',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
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
                        return Center(child: Text('try later app has error'));
                      }
                      return Text('');
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
