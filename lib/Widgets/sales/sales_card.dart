import 'package:flutter/material.dart';
import 'package:salety_market/models/sales_model.dart';

class SalesCard extends StatelessWidget {
  const SalesCard({super.key, required this.sales, required this.widthOfSalesCard, required this.heightOfSalesCard,});

  final SalesModel sales;
  final double widthOfSalesCard;
  final double heightOfSalesCard;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Container(
        height:heightOfSalesCard,
        width: widthOfSalesCard,
        decoration: BoxDecoration(
          image: DecorationImage(image:
          AssetImage(sales.image),fit: BoxFit.fill),
          color: Colors.amberAccent,
          borderRadius: BorderRadius.circular(16),
        ),

      ),
    );
  }
}
