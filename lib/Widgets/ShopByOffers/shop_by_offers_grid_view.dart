import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salety_market/Widgets/ShopByOffers/shop_by_offers_card.dart';

import '../../models/shop_by_offers_model.dart';

class ShopByOffersGridView extends StatelessWidget {
  ShopByOffersGridView({super.key});
  final List<ShopByOffersModel> offers = [
    ShopByOffersModel(
      fontWeight1: FontWeight.bold,
      color: Colors.red,
      text1: '50 %',
      text2: 'خصم',
      fontSize1: 25.sp,
      fontWeight2: FontWeight.w300,
      fontSize2: 15.sp,
    ),
    ShopByOffersModel(
      fontWeight1: FontWeight.bold,
      color: Colors.lightBlue,
      text1: '40 %',
      text2: 'خصم',
      fontSize1: 25.sp,
      fontSize2: 15.sp,
      fontWeight2: FontWeight.w300,
    ),
    ShopByOffersModel(
      fontWeight1: FontWeight.bold,
      color: Colors.purple,
      text1: '30 %',
      text2: 'خصم',
      fontSize1: 25.sp,
      fontSize2: 15.sp,
      fontWeight2: FontWeight.w300,
    ),
    ShopByOffersModel(
      fontWeight1: FontWeight.bold,
      color: Colors.teal,
      text1: 'اختيارات',
      text2: 'الشهر',
      fontSize1: 17.sp,
      fontSize2: 17.sp,
      fontWeight2: FontWeight.bold,
    ),
    ShopByOffersModel(
      fontWeight1: FontWeight.bold,
      color: Colors.lightGreen,
      text1: 'أقل',
      text2: '99 SAR',
      fontSize1: 20.sp,
      fontSize2: 20.sp,
      fontWeight2: FontWeight.w500,
    ),
    ShopByOffersModel(
      fontWeight1: FontWeight.w400,
      color: Colors.orangeAccent,
      text1: 'اشتري 1 واحصل علي 1',
      text2: 'مجانا',
      fontSize1: 13.sp,
      fontSize2: 16.sp,
      fontWeight2: FontWeight.bold,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    final orientationDevice = MediaQuery.of(context).orientation;
    return orientationDevice == Orientation.portrait
        ? SliverGrid.builder(
            itemCount: offers.length,
            gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 17,
                mainAxisSpacing: 17,
                childAspectRatio: 1.w / 1.2.h),
            itemBuilder: (BuildContext context, int index) {
              return ShopByOffersCard(
                shopByOffer: offers[index],
              );
            },
          )
        : SliverGrid.builder(
            itemCount: offers.length,
            gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                childAspectRatio: 1.h /.3.w),
            itemBuilder: (BuildContext context, int index) {
              return ShopByOffersCard(
                shopByOffer: offers[index],
              );
            },
          );
  }
}
