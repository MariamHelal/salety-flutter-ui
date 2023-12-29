import 'package:flutter/material.dart';
import 'package:salety_market/Widgets/Shopping/cart_has_products.dart';
import 'package:salety_market/models/best_saller_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../delete_alert_dialog.dart';

//Future<SharedPreferences> sharedPreferences = SharedPreferences.getInstance();

class ShoppingCard extends StatefulWidget {
  ShoppingCard({
    required this.price,
    required this.name,
    required this.amount,

    required this.onTap,
  });
  final double price;
  final String name;
  final String amount;
  Function onTap;

  @override
  State<ShoppingCard> createState() => _ShoppingCardState();
}

class _ShoppingCardState extends State<ShoppingCard> {
  //final BestSallerModel category;

  @override
  Widget build(BuildContext context) {
    return Container(
      //width: 40,
      child: Card(
        elevation: 5,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
          ),
          //height: 100,
          child: Row(
            // crossAxisAlignment: CrossAxisAlignment.center,
           // mainAxisAlignment: MainAxisAlignment.end,
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
                          content: const Text('هل انت متأكد من عملية الحذف'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context, 'حذف');
                              },
                              child: const Text('حذف'),
                            ),
                            TextButton(
                              onPressed: () {

                                Navigator.pop(context, 'الغاء');
                                //onTap();
                              },
                              child: const Text('الغاء'),
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
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            '${widget.price} ',
                            style: const TextStyle(
                              color: Colors.green,
                              fontSize: 15,
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            widget.name,
                            style:
                                TextStyle(color: Colors.black87, fontSize: 17),
                            textAlign: TextAlign.right,
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            widget.amount,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            ),
                            textAlign: TextAlign.right,
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

                      },
                      icon: const Icon(Icons.add),
                      iconSize: 15,
                    ),
                    Text(
                      '',
                      style: const TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 15),
                    ),
                    IconButton(
                      onPressed: () {

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
  }
}
