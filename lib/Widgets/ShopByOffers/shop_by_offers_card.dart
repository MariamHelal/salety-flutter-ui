import 'package:flutter/material.dart';
import 'package:salety_market/models/shop_by_offers_model.dart';

class ShopByOffersCard extends StatelessWidget {
  const ShopByOffersCard({super.key, required this.shopByOffer});
  final ShopByOffersModel shopByOffer;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: shopByOffer.color,
      ),
      height: 120,
      width: MediaQuery.of(context).size.width / 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              textAlign:TextAlign.right,
              shopByOffer.text1,
              style: TextStyle(
                fontWeight: shopByOffer.fontWeight1,
                color: Colors.white,
                fontSize: shopByOffer.fontSize1,

              ),
            ),
            Text(
              shopByOffer.text2,
              style: TextStyle(
                fontWeight: shopByOffer.fontWeight2,
                color: Colors.white,
                fontSize: shopByOffer.fontSize2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
