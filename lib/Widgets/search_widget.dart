import 'package:flutter/material.dart';

import 'filter_Dialog.dart';

class SearchView extends StatelessWidget {
   SearchView({super.key});
  var searchController = TextEditingController();
   String selectedRadio = '';
   String selectedRadioTile = '';
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 60,
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16)
              ),
              child: TextFormField(

                textDirection: TextDirection.rtl,
                controller: searchController,
                keyboardType: TextInputType.text,
                onFieldSubmitted: (value) {
                  print(value);
                },
                strutStyle: StrutStyle(
                  height: MediaQuery.of(context).size.height / 600,
                ),
                decoration: InputDecoration(
                  //filled: true,
                  //fillColor: Colors.white,
                  border: OutlineInputBorder(

                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  prefixIcon: Icon(Icons.search,color: Colors.grey,),
                  hintText: 'البحث عن المنتجات',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  hintTextDirection: TextDirection.rtl,
                  suffixIcon: Icon(Icons.cancel,color: Colors.grey,),
                ),
              ),
            ),
          ),

          const SizedBox(
            width: 10,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8), color: Colors.red,
            ),

            child: IconButton(
              onPressed: () {
                showModalBottomSheet(context: context, builder: (context){
                  return ListView(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                        alignment: Alignment.centerLeft,
                        child: Text('اختر تصنيف :',
                          textDirection: TextDirection.ltr,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),),
                      ),
                      FilterDialog(),
                      //SizedBox(height: 10,),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        width: double.infinity,
                        child: ElevatedButton(
                          style:ElevatedButton.styleFrom(
                            backgroundColor: Colors.green
                          ),
                         // color:Colors.green,
                          onPressed: ()async{
                            print(filterCategory);
                            Navigator.pop(context);
                        },
                          child: Text('Apply'),
                        ),
                      ),
                    ],
                  );
                });
                // final selectedCategories = await showDialog<List<String>>(
                //   context: context,
                //   builder: (context) => FilterDialog(),
                // );
              },
              icon: const Icon(Icons.filter_list_sharp),
              color: Colors.white,
              padding: const EdgeInsets.all(8),
              // style: IconButton.styleFrom(
              //   backgroundColor: Colors.redAccent,
              // ),
            ),
          ),
        ],
      ),
    );
  }
}
