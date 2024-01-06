


import 'package:flutter/material.dart';

class Tab1 extends StatelessWidget {
  const Tab1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(
  
                labelText: 'Content',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)
                  ),
                )
              ),
            ),ElevatedButton(
              onPressed: (){}, 
              child: const Text('Write to tag'),
              ),

            const SizedBox(
              height: 8,
            )
          ],
        ),
      )
    );
  }
}