import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Widgets/Navigation_bar.dart';
import '../Widgets/Shopping/cart_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});
  List<IconData> icons = [
    Icons.person,
    Icons.shopping_cart,
    Icons.credit_card,
    Icons.favorite,
    Icons.attach_money_outlined,
    Icons.local_offer,
    Icons.location_on_sharp,
    Icons.notifications,
    Icons.settings,
  ];
  List<String> profileMatrialListtitle = [
    'عني',
    'طلباتي',
    'مدفوعاتي',
    'المفضل لدي',
    'المعاملات',
    'رمز ترويجي',
    'عنواني',
    'تنبيه',
    'إعدادات'
  ];
  @override
  Widget build(BuildContext context) {
    final orientationDevice = MediaQuery.of(context).orientation;
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.grey[200],
          elevation: 0,
          leading: Center(
            child: OutlinedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                side:  BorderSide(
                  color: Colors.black38,
                  width: .5.w,
                ),
                // fixedSize: Size(10, 30),
              ),
              child:  Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.black,
                size: 20.sp,
              ),
            ),
          ),
          actions: [
            Center(
              child: OutlinedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  side:  BorderSide(
                    color: Colors.black38,
                    width: .5.w,
                  ),
                  // fixedSize: Size(10, 30),
                ),
                child: Badge(
                  label: Consumer<CartProvider>(
                    builder: (BuildContext context, value, Widget? child) {
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
        body: orientationDevice == Orientation.portrait
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Stack(
                        alignment: AlignmentDirectional.topCenter,
                        children: [
                          Container(
                            //padding: EdgeInsets.only(top: 30),
                            margin: const EdgeInsets.only(top: 35),
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            width: double.infinity,

                            child: Column(
                              children:  [
                                SizedBox(
                                  height: 70.h,
                                ),
                                Text(
                                  'مريم هلال',
                                  style: TextStyle(
                                    fontSize: 17.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'mariamhelal595@gmail.com',
                                  style: TextStyle(
                                    color: Colors.white,
                                    //fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                )
                              ],
                            ),
                          ),
                          Stack(
                            alignment: AlignmentDirectional.bottomEnd,
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 50,
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Image.asset(
                                    'assets/profile_photo/photo.jpeg',
                                    fit: BoxFit.contain,
                                    alignment: Alignment.center,
                                  ),
                                ),
                              ),
                               CircleAvatar(
                                backgroundColor: Colors.red,
                                radius: 15,
                                child: Icon(
                                  Icons.camera_alt,
                                  color: Colors.white,
                                  size: 17.sp,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                     SliverToBoxAdapter(
                      child: SizedBox(
                        height: 20.h,
                      ),
                    ),
                    SliverGrid.builder(
                      itemCount: icons.length,
                      itemBuilder: (context, index) {
                        return Container(
                          width: 30.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.white,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                icons[index],
                                color: Colors.red,
                              ),
                              Text(
                                profileMatrialListtitle[index],
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          childAspectRatio: 1 / 1),
                    ),
                     SliverToBoxAdapter(
                      child: SizedBox(
                        height: 20.h,
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(30),
                            width: MediaQuery.of(context).size.width *.43,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.red,
                            ),
                            child: Column(
                              children:  [
                                const Icon(
                                  Icons.support,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                const Text(
                                  'مركز الدعم',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                           SizedBox(width: 10.w,),
                          Container(
                            padding: EdgeInsets.all(30),
                            width: MediaQuery.of(context).size.width *.43,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.green,
                            ),
                            child: Column(
                              children: [
                                const Icon(
                                  Icons.exit_to_app,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                const Text(
                                  'خروج',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Stack(
                        alignment: AlignmentDirectional.topStart,
                        children: [
                          Container(
                            //padding: EdgeInsets.only(top: 30),
                            margin: const EdgeInsets.only(top: 35),
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            width: double.infinity,

                            child: Container(
                              padding: const EdgeInsets.only(right: 20),
                              height: 100,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children:  [
                                  SizedBox(height: 10.h,),
                                  Text(
                                    'مريم هلال',
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Text(
                                    'mariamhelal595@gmail.com',
                                    style: TextStyle(
                                      color: Colors.white,
                                      //fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 40.0),
                            child: Stack(
                              alignment: AlignmentDirectional.bottomEnd,
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 50,
                                  child: Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Image.asset(
                                      'assets/profile_photo/photo.jpeg',
                                      fit: BoxFit.contain,
                                      alignment: Alignment.center,
                                    ),
                                  ),
                                ),
                                 CircleAvatar(
                                  backgroundColor: Colors.red,
                                  radius: 15,
                                  child: Icon(
                                    Icons.camera_alt,
                                    color: Colors.white,
                                    size: 17.sp,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                     SliverToBoxAdapter(
                      child: SizedBox(
                        height: 20.h,
                      ),
                    ),
                    SliverGrid.builder(
                      itemCount: icons.length,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.white,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                icons[index],
                                color: Colors.red,
                              ),
                               SizedBox(
                                height: 5.h,
                              ),
                              Text(
                                profileMatrialListtitle[index],
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 5,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          childAspectRatio: 1 / .8),
                    ),
                     SliverToBoxAdapter(
                      child: SizedBox(
                        height: 20.h,
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(30),
                            width: MediaQuery.of(context).size.width *.45,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.red,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children:  [
                                Icon(

                                  Icons.support,
                                  color: Colors.white,
                                  size: 30.sp,
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Text(
                                  'مركز الدعم',
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                           SizedBox(width: 10.w,),
                          Container(
                            padding: EdgeInsets.all(30),
                            width: MediaQuery.of(context).size.width *.45,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.green,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.exit_to_app,
                                  color: Colors.white,
                                  size: 30.sp,
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Text(
                                  'خروج',
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )

                  ],
                ),
              ));
  }
}
