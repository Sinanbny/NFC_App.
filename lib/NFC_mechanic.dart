import 'package:flutter/material.dart';
import 'package:nfc_manager/nfc_manager.dart';


class NfcMechanic extends StatefulWidget {
  const NfcMechanic({super.key});

  @override
  State<NfcMechanic> createState() => _NfcMechanicState();
}

class _NfcMechanicState extends State<NfcMechanic> {
  ValueNotifier<dynamic> result = ValueNotifier(null);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('NFC app reader card flutter'),),
        body:  SafeArea(
          child:  FutureBuilder<bool>(future:NfcManager.instance.isAvailable(),builder:(context, ss) => ss.data !=true?
        Center(
          child: 
          Text('NfcManager.isAvailable(): ${ss.data}')) :
         Flex(
          direction: Axis.vertical,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(flex: 2,
          child:Container(
            margin: const EdgeInsets.all(4),
            constraints: const BoxConstraints.expand(),
            decoration: BoxDecoration(
              border: Border.all(
                width: 2,
                color: Colors.blue
              )
            ),
            padding: const EdgeInsets.all(10),
            child:  SingleChildScrollView(
              child: ValueListenableBuilder<dynamic>(
                valueListenable: result,
                 builder: (context ,value, _)=>Text('${value ?? ''}'),
             ),
            )
           )
          ),
          Flexible(
            flex: 3,
            child: GridView.count(
              padding: const EdgeInsets.all(4),
              crossAxisCount: 2,
              childAspectRatio: 4,
              crossAxisSpacing: 4,
              mainAxisSpacing: 4,

              children: const [
                
              ],
           )
          )
         ],
        )
       )
      )
     )
    );
  }
}