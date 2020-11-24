import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uservices/ui/pages/favorites.page.dart';
import 'package:uservices/ui/pages/home.page.dart';
import 'package:uservices/ui/pages/profile.page.dart';

import 'agenda.page.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    AgendaPage(),
    FavoritesPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.deepOrange,
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          _onItemTapped(index);
        },
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        selectedLabelStyle: TextStyle(
          fontFamily: "SemiBold",
          fontSize: 12.0,
          color: Colors.white,
        ),
        unselectedLabelStyle: TextStyle(
          fontFamily: "SemiBold",
          fontSize: 12.0,
          color: Colors.white,
        ),
        items: [
          BottomNavigationBarItem(
            label: "Menu",
            icon: Icon(
              CupertinoIcons.home,
            ),
          ),
          BottomNavigationBarItem(
            label: "Agenda",
            icon: Icon(
              CupertinoIcons.calendar,
            ),
          ),
          BottomNavigationBarItem(
            label: "Favoritos",
            icon: Icon(
              CupertinoIcons.heart,
            ),
          ),
          BottomNavigationBarItem(
            label: "Perfil",
            icon: Icon(
              CupertinoIcons.person_alt_circle,
            ),
          ),
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
