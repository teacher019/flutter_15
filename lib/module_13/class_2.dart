import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';

class Module13Class2 extends StatefulWidget {
  final String name;
  Module13Class2({super.key, required this.name}){
    print(" 1. Constructor");
}


  @override
  State<Module13Class2> createState() {
    print(" 2. createState");
    return _Module13Class2State();
  }
}

class _Module13Class2State extends State<Module13Class2> {
  String name = 'AK';
  int seconds = 0;
  Timer ? time;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(" 3. initState");
    name = 'Akhalek';
    seconds = 5;
    time = Timer.periodic(Duration(seconds:1), (time){
      setState(() {
        seconds++;
      });
    });
  }
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print(" 4. didChangeDependencies");
  }
  @override
  Widget build(BuildContext context) {
    print("5. Build Called");
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(name, style: TextStyle(fontSize: 25,)),
            Text("Time running:${seconds}", style: TextStyle(fontSize: 25,)),
            Text(widget.name, style: TextStyle(fontSize: 25,)),
            ElevatedButton(onPressed: (){}, child: Text("user name")),
          ],
        ),
      ),
    );
  }
  @override
  void didUpdateWidget(covariant Module13Class2 oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }
  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
