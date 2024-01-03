import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        return ScreenUtilInit(
          designSize: const Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (BuildContext context, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: InitialPage(),
            );
          },

        );
      },),
    );
  }
}
