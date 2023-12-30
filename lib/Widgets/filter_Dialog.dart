import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FilterDialog extends StatefulWidget {
  const FilterDialog({super.key});

  @override
  State<FilterDialog> createState() => _FilterDialogState();
}
dynamic filterCategory;
setPref(String key,dynamic value)async{
  SharedPreferences prefs= SharedPreferences.getInstance() as SharedPreferences;
  prefs.setString(key, value);
  prefs.setInt(key, value);
}
getPref(){
  SharedPreferences prefs= SharedPreferences.getInstance() as SharedPreferences;
  setState(){
    filterCategory=prefs.getString('selected');
  }
}



class _FilterDialogState extends State<FilterDialog> {
  List<String> filterList = [
    'خضراوات',
    'فواكه',
    'مجمدات',
    'فواكه مجففه',
    'دجاج',
    'ورقيات',
    //'بهارات',

  ];
  late String selectedRadio;
  late String selectedRadioTile;
  void initState() {
    super.initState();
     selectedRadio = '';
    selectedRadioTile ='';
  }

  setSelectedRadioTile(String val) {
    setState(() {
      selectedRadioTile = val;
    });
  }


  @override
  Widget build(BuildContext context) {
   bool isSelected=false;
   final orientationDevice = MediaQuery.of(context).orientation;
   return orientationDevice == Orientation.portrait?
   SizedBox(
     height: 350,
     child: ListView.builder(
       shrinkWrap: true,
       physics: NeverScrollableScrollPhysics(),
       itemCount: filterList.length,

       itemBuilder: (BuildContext context, int index) {
         return RadioListTile(

           value: filterList[index],
           groupValue: selectedRadioTile,
           title: Text(filterList[index]),
           onChanged: (value) {
             print("Radio Tile pressed $value");
             setSelectedRadioTile('$value');
             isSelected=true;
             filterCategory=value;

           },
           activeColor: Colors.green,
           selected: isSelected,

         );
       },

     ),
   ):SizedBox(
     height: 170,
     child: GridView.builder(
       shrinkWrap: true,
       physics: NeverScrollableScrollPhysics(),
       itemCount: filterList.length,
       itemBuilder: (BuildContext context, int index) {
         return RadioListTile(

           value: filterList[index],
           groupValue: selectedRadioTile,
           title: Text(filterList[index]),
           onChanged: (value) {
             print("Radio Tile pressed $value");
             setSelectedRadioTile('$value');
             isSelected=true;
             filterCategory=value;

           },
           activeColor: Colors.green,
           selected: isSelected,

         );
       }, gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
       crossAxisCount: 2,
       crossAxisSpacing: 1,
       mainAxisSpacing: 1,
       childAspectRatio: 1 / .1,
     ),

     ),
   );
  }
}
dynamic selected;






