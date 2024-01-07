import 'package:flutter/material.dart';

import 'package:nfc_app3/tab1.dart';
import 'package:nfc_app3/tab2.dart';
import 'package:nfc_app3/tab3.dart';

class TabBarPage extends StatefulWidget {
  const TabBarPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _TabBarPageState createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Create Tag',style: TextStyle(fontSize: 34),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                const SizedBox(height: 30),
                Container(
                  
                  width: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: TabBar(
                          unselectedLabelColor: Colors.white,
                          labelColor: Colors.black,
                          indicatorColor: Colors.white,
                          indicatorWeight: 3,
                          indicator: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          controller: tabController,
                          tabs: const [
                            Tab(
                              text: 'Text',
                            ),
                            Tab(
                              text: 'URL',
                            ),Tab(
                              text: 'Siri shortcuts',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    controller: tabController,
                    children: const [
                      Tab1(),
                      Tab2(),
                      Tab3(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}