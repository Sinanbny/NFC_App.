
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:nfc_manager/nfc_manager.dart';


class NfcMechanic extends StatefulWidget {
  const NfcMechanic({super.key});

  @override
  State<NfcMechanic> createState() => _NfcMechanicState();
}

class _NfcMechanicState extends State<NfcMechanic> {
  ValueNotifier<dynamic> result = ValueNotifier(null);
  
  get ndef => null;

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        
        appBar: AppBar(title: const Text('NFC '),),
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

              children:  [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue ),
                  onPressed: _tagRead, 
                  child: const Text('Read Tag')),

                  ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue ),
                  onPressed: _ndefWrite, 
                  child: const Text('Write Tag')),

                  ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue ),
                  onPressed: _ndefWriteLock, 
                  child: const Text('Ndef Write Lock')),

                  ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue ),
                  onPressed: _clear, 
                  child: const Text('Clear')),
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

void  _tagRead() {
 NfcManager.instance.startSession (onDiscovered: (NfcTag tag) async {
 result.value=tag.data;
 NfcManager.instance.stopSession();
 });
}

Future<void> _ndefWrite() async {
NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async{
  var ndef = Ndef.from(tag);
  if (ndef == null || !ndef.isWritable) {
    NfcManager.instance.stopSession(errorMessage: result.value);
  }
  return;
  });
  
   NdefMessage message = NdefMessage([
    NdefRecord.createText('Hello World!'),
    NdefRecord.createUri(Uri.parse('https://flutter.dev')),
    NdefRecord.createMime('text/plain', Uint8List.fromList('Hello'.codeUnits)),
    NdefRecord.createExternal(
            'com.example', 'mytype', Uint8List.fromList('mydata'.codeUnits)),
   ]);
   try{
     ndef;
    await ndef.write(message);
    
    result.value ='Succes to Ndef Write';
    NfcManager.instance.stopSession();
   } catch (e){
  result.value = e;
  NfcManager.instance.stopSession(errorMessage: result.value.toString());
  return;
  }
 }

void _clear(){
setState((){
  result = ValueNotifier(Null);
});
}

void _ndefWriteLock() {
    NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async{
var ndef = Ndef.from(tag);
if(ndef == null){
result.value = 'Tag is not ndef';
NfcManager.instance.stopSession(errorMessage: result.value.toString());
        return;
      }
      try {
        await ndef.writeLock();
        result.value = 'Success to "Ndef Write Lock"';
        NfcManager.instance.stopSession();
      } catch (e) {
        result.value = e;
        NfcManager.instance.stopSession(errorMessage: result.value.toString());
        return;
      }
     }
    );
   }
  }