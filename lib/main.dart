import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:salety_market/Widgets/Shopping/cart_provider.dart';
import 'package:salety_market/views/initial_page.dart';


void main() {
  runApp(const SelatyApp());
}

class SelatyApp extends StatelessWidget {
  const SelatyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider(
      create:  (_)=> CartProvider(),
      child: Builder(builder: (BuildContext context){
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: InitialPage(),
        );
      },),
    );
  }
}
