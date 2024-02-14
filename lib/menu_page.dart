import 'package:flutter/material.dart';
import 'package:nfc_app3/tabbar_page.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Created Tags', style: TextStyle(fontSize: 30),),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          )
        ),
        ),body: Column(
      children: [const Padding(padding: EdgeInsets.all(12)),

      ExpansionTile(
        initiallyExpanded: true,
        title: const Text('Create your first tag'),
        subtitle: Title(color: Colors.grey, child: const Text('(Add NFC tag)',style: TextStyle(fontSize: 12),)),
        children:  [
          ListTile(
            leading: const Icon(Icons.add_circle),iconColor: Colors.orange,
            title: const Text('Create Tag'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder:(context)=> const TabBarPage()));
            },
           
          ),
                  
        ],
       ),
      ],
    )
   );      
  }
}