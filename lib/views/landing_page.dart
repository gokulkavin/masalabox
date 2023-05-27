import 'package:flutter/material.dart';

import 'call_page.dart';
import 'home_page.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage>
    with TickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(
      initialIndex: 0,
      length: 2,
      vsync: this,
    );
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Menu',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white70,
        elevation: 1,
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          HomePage(switchCallScreen: () {
            // DefaultTabController.of(context).animateTo(1);
            tabController.animateTo(1);
          }),
          CallPage(),
        ],
      ),
      bottomNavigationBar: Container(
        height: 60,
        color: Colors.white,
        child: TabBar(
          controller: tabController,
          indicatorColor: Colors.transparent,
          unselectedLabelColor: Colors.green.shade900,
          labelColor: Colors.orange[400],
          tabs: const [
            Tab(
              text: 'Home',
              icon: Icon(
                Icons.home_outlined,
              ),
            ),
            Tab(
              text: 'Call',
              icon: Icon(Icons.local_phone_outlined),
            ),
          ],
        ),
      ),
    );
  }
}
