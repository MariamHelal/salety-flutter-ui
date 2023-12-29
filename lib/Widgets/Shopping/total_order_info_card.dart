import 'package:flutter/material.dart';

class TotalOrderInfoCard extends StatelessWidget {
  const TotalOrderInfoCard({super.key});

  @override
  Widget build(BuildContext context) {

    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('',style: TextStyle(
                      fontSize: 15,
                    ),),
                    Text('الكود',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('',style: TextStyle(
                      fontSize: 15,
                    ),),
                    Text('المجموع الكلي',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Free',style: TextStyle(
                      fontSize: 15,
                    ),),
                    Text('رسوم التوصيل',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    )
                  ],
                ),
                Divider(
                  color: Colors.white,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(onPressed: () {  }, child: Text('',style: TextStyle(
                      fontSize: 15,
                    ),),
                    ),
                    Text('الاجمالي',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                      ),
                    )
                  ],
                ),
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
    );
  }
}

// double calculateTotalPrice(){
//   for (int i=0;i<=CartList.length;i++){
//     total+=CartList[i].totalPriceOfProduct;
//   }
//   return  total;
// }