import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings',style: TextStyle(fontSize: 30)),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          )
        ),
      ),body: Column(
        children: [
          const Padding(padding: (EdgeInsets.all(12))),
          ExpansionTile(
            initiallyExpanded: true,
            title: const Text('PLUS',style: TextStyle(fontSize: 20),),
            children: [
              ListTile(
                leading: const Icon(Icons.remove_circle_outline_rounded),iconColor: Colors.red,
                title: const Text('Remove all Ads '),
                onTap: () {
                  
                },
              ),
              ListTile(
                title: const Text('Restore purchase 🥳'),
                onTap: () {
                  
                },
              )
            ],
            )
        ],
      ),
    );
  }
}