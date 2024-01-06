import 'package:flutter/material.dart';
import 'package:nfc_app3/main.dart';
import 'package:nfc_app3/setting_page.dart';


import 'menu_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

int _currentIndex =0;

List pages =[
  const Homepage(),
  const MenuPage(),
  const SettingsPage(),
];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: pages [_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int newIndex){
          setState(() {
            _currentIndex = newIndex;
          });
        },
        items: const [

          BottomNavigationBarItem(
           
           label: 'home',
           icon: Icon(Icons.home),
          ),

          BottomNavigationBarItem(
           
           label: 'Created Tags',
           icon: Icon(Icons.menu_open_rounded),
          ),

          BottomNavigationBarItem(
           
           label: 'Settings',
           icon: Icon(Icons.settings),
          ),
        ],
      ),
    );
  }
}