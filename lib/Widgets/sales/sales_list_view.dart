import 'package:flutter/material.dart';

import '../../models/sales_model.dart';
import 'sales_card.dart';

class SalesListView extends StatelessWidget {
  const SalesListView({super.key});
  final List<SalesModel> sales = const [
    SalesModel(image: 'assets/sales/4.jpg'),
    SalesModel(image: 'assets/sales/2.jpg'),
    SalesModel(image: 'assets/sales/6.jpg'),
    SalesModel(image: 'assets/sales/3.jpg'),
    SalesModel(image: 'assets/sales/1.jpg'),
    SalesModel(image: 'assets/sales/5.jpg'),
    SalesModel(image: 'assets/sales/7.jpg'),

  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:109.01,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: sales.length,
          itemBuilder: (context, index) {
            return SalesCard(
              sales: sales[index],
              heightOfSalesCard: 96.97,
              widthOfSalesCard: 196.3,
            );
          }),
    );
  }
}
