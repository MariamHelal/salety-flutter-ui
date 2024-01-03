import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import '../../models/best_saller_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BestSallerCard extends StatefulWidget {
  BestSallerCard({super.key, required this.product, required this.OnTap});
  final BestSallerModel product;
  Function OnTap;

  @override
  State<BestSallerCard> createState() => _BestSallerCardState();
}

class _BestSallerCardState extends State<BestSallerCard> {
  bool isLiked=false;
  Future<bool> onLikeButtonTapped(bool isLiked) async{
    /// send your request here
    // final bool success= await sendRequest();

    /// if failed, you can do nothing
    // return success? !isLiked:isLiked;

    return !isLiked;
  }
  @override
  Widget build(BuildContext context) {
    Function onTap;
    return Card(
      elevation: 8,
      child: Container(
        height: 250.h,
        width: 150.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Row(
              children: [
                // LikeButton(
                //   //circleColor: CircleColor(start: Colors.red,end: Colors.green),
                //   isLiked: isLiked,
                //   padding: EdgeInsets.all(10),
                //   size: 30,
                //   onTap: onLikeButtonTapped,
                //   likeBuilder: (isLiked){
                //     final color=isLiked?Colors.red :Colors.grey;
                //
                //     //print('isLiked $isLiked');
                //     return Icon(
                //       size: 30,
                //       Icons.favorite,
                //       color: color,
                //     );
                //   },
                //
                // ),

                IconButton(

                  onPressed: () {

                   setState(() {

                   });
                  },
                  icon: const Icon(
                    Icons.favorite,
                    color: Colors.green,
                  ),
                  color: Colors.white,
                  padding: const EdgeInsets.all(16),
                ),
                const Spacer(),
                Container(
                  //padding: EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(20)),
                      color: Colors.green),
                  child:  Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Text(
                      'عروض',
                      style: TextStyle(color: Colors.white, fontSize: 10.sp),
                    ),
                  ),
                ),
              ],
            ),
            //SizedBox(height: 5,),
            SizedBox(
              height: 80.h,
              //width: MediaQuery.of(context).size.width / 2.3,
              child: Image.asset(
                widget.product.image,
                fit: BoxFit.cover,
              ),
            ),
             SizedBox(
              height: 5.h,
            ),
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: Container(
                //padding: EdgeInsets.all(4),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.green),
                child:  Padding(
                  padding:
                      EdgeInsets.only(top: 4.0, bottom: 4, left: 30, right: 8),
                  child: Text(
                    'الأعلى مبيعا',
                    style: TextStyle(color: Colors.white, fontSize: 10.sp),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Align(
                alignment: AlignmentDirectional.centerEnd,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      widget.product.productName,
                      style:  TextStyle(fontSize: 12.sp),
                    ),
                    Text(widget.product.productQuantity),
                  ],
                ),
              ),
            ),
             SizedBox(
              height: 10.h,
            ),
            Stack(
              alignment: AlignmentDirectional.topStart,
              children: [
                Container(
                  alignment: AlignmentDirectional.centerEnd,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey[200],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Text(
                      "${widget.product.productPrice} EG",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: GestureDetector(
                    onTap: () {

                      widget.OnTap();
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) {
                      //   return ShoppingPage();
                      // }));
                    },
                    child:  CircleAvatar(
                        radius: 17.r,
                        backgroundColor: Colors.red,
                        child: Icon(
                          Icons.shopping_cart_outlined,
                          color: Colors.white,
                          size: 20.sp,
                        )),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
