import 'package:flutter/material.dart';
import '../page/homePage.dart';
import '../page/foodPage.dart';
import '../page/destinationPage.dart';
import '../page/profilePage.dart';
import '../page/savePage.dart';

class MyCustomNavBar extends StatefulWidget {
  const MyCustomNavBar({super.key});

  @override
  _MyCustomNavBarState createState() => _MyCustomNavBarState();
}

class _MyCustomNavBarState extends State<MyCustomNavBar> {
  int _selectedNavbar = 2;

  final List<Widget> _pages = [
    SavePage(),
    FoodPage(),
    HomePage(),
    DestinationPage(),
    ProfilePage(),
  ];

  void _changeSelectedNavBar(int index) {
    setState(() {
      _selectedNavbar = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedNavbar],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.bookmark), label: 'Bookmark'),
          BottomNavigationBarItem(icon: Icon(Icons.rice_bowl), label: 'Foods'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.tour), label: 'Tour'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: _selectedNavbar,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: _changeSelectedNavBar,
      ),
    );
  }
}
