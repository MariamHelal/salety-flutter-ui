import 'package:flutter/material.dart';

class FreshSales extends StatelessWidget {
  const FreshSales({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      textDirection: TextDirection.rtl,
      alignment: Alignment.topLeft,
        children: [
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        width: double.infinity,
        height: 200,
        child: const Image(
          image: AssetImage(
            'assets/خصومات/3.jpg',
          ),
          fit: BoxFit.cover,
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(17.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'خصومات',
              style: TextStyle(
                color: Colors.red,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'صحية طازجة %',
              style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.w600,
                  fontSize: 23),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                onPressed: () {},
                child: const Text(
                  'اطلب الأن',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                  ),
                ))
          ],
        ),
      )
    ]);
  }
}
