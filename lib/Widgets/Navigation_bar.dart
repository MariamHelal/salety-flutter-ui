import 'package:flutter/material.dart';

import '../views/Home_Page.dart';

class NavigationBarWidget extends StatefulWidget {
  const NavigationBarWidget({super.key});

  @override
  State<NavigationBarWidget> createState() => _NavigationBarWidgetState();
}

class _NavigationBarWidgetState extends State<NavigationBarWidget> {
  int currentPageIndex = 2;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
     // shadowColor: Colors.green,
      backgroundColor: Colors.white,
      height: 65,
      onDestinationSelected: (int index) {
        setState(() {
          currentPageIndex = index;
        });
      },
       // indicatorColor: Colors.amber[800],
      selectedIndex: currentPageIndex,
      destinations:  [
        const NavigationDestination(
          selectedIcon: Icon(Icons.search),
          icon: Icon(Icons.search_outlined),
          label: '',
        ),
        const NavigationDestination(
          icon: Icon(Icons.favorite_border),
          label: '',
        ),
        GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return HomePage();
            }));
          },
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: Image.asset('assets/floating_button.png',fit: BoxFit.cover,),
          ),
        ),
        const NavigationDestination(
          selectedIcon: Icon(Icons.notifications_none),
          icon: Icon(Icons.notifications_none_outlined),
          label: '',
        ),
        //FloatingActionButton(),
        const NavigationDestination(
          selectedIcon: Icon(Icons.person_2_outlined),
          icon: Icon(Icons.person_2_outlined),
          label: '',
        ),


      ],
    );
  }
}
