import 'package:flutter/material.dart';

class NavigationBarWidget extends StatefulWidget {
  const NavigationBarWidget({super.key});

  @override
  State<NavigationBarWidget> createState() => _NavigationBarWidgetState();
}

class _NavigationBarWidgetState extends State<NavigationBarWidget> {
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return NavigationBar(
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
        CircleAvatar(
          backgroundColor: Colors.white,
          child: Image.asset('assets/floating_button.png',fit: BoxFit.cover,),
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
