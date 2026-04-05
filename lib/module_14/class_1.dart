import 'package:flutter/material.dart';

class module14Class1 extends StatefulWidget {
  const module14Class1({super.key});

  @override
  State<module14Class1> createState() => _module14Class1State();
}

class _module14Class1State extends State<module14Class1> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom tabbar'),
      ),

      body: Column(
        children: [
          Container(
            height: 50,
            color: Colors.white,
          ),
          Container(
            color: Colors.white,
            child: TabBar(
                controller: _tabController,
                tabs: [
                  Tab(text: 'Home',),
                  Tab(text: 'Profile',),
                  Tab(text: 'Setting',),
                ]),
          ),

          Expanded(
            child: TabBarView(
                controller: _tabController,
                children: [
                  Center(child: Text('home view')),
                  Center(child: Text('Profile view')),
                  Center(child: Text('Setting view'))
                ]),
          )
        ],
      ),
    );
  }
}