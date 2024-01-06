import 'package:flutter/material.dart';

import 'package:nfc_app3/main_page.dart';
import 'package:nfc_app3/tabbar_page.dart';


void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: ('Nfc '),
     theme: ThemeData(
      primaryColor: Colors.black),
     home: const MainPage(),
    );
  }
}

class Homepage extends StatelessWidget {
  const Homepage({super.key});
  
  get basicTiles => null;
  
  get buildTile => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NFC Tag Manager', style: TextStyle(fontSize: 30),),
        centerTitle: true,
        actions: <Widget>[
          IconButton( 
            icon: const Icon(Icons.notifications),iconSize: 30,
             onPressed: (){},)
        ],
        backgroundColor: Colors.blueAccent,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          )
        ),
        ),

        body:Column(
          children: [ const Padding(padding: EdgeInsets.all(20)),
            ExpansionTile(
              title:  const Text('QUICK ACTIONS',style: TextStyle(fontSize: 20),),
              children: [
                ListTile(
                  leading: const Icon(Icons.add_circle),iconColor: Colors.orange,
                  title: const Text('Create Tag'),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const TabBarPage()));
                  },
                ),
                 ListTile(
                  title:const  Text('Read Tag'),
                  leading: const Icon(Icons.search_rounded),iconColor: Colors.blue,
                  onTap: () {
                    
                  },
                ),
               ListTile(
                  title: const Text('Clean Tag'),
                  leading: const Icon(Icons.restart_alt_rounded),iconColor: Colors.blue,
                  onTap: () {},
                )

              ],
              
            ),ExpansionTile(title: const Text('ADVANCED'),
            children: [
              ListTile(
                leading: const Icon(Icons.add_circle_outline),iconColor: Colors.green,
                title: const Text('Continous read tags'),
                onTap: () {
                  
                },
              ),
              ListTile(
                leading: const Icon(Icons.lock_outline_rounded),iconColor: Colors.red,
                title: const Text('Lock tag'),
                onTap: () {
                  
                 },
               ),
             ],
            ),
          ],
        ),
      );
    }
  }