
import 'package:flutter/material.dart';

class Tab2 extends StatelessWidget {
  const Tab2({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(
                labelText: 'https://',
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