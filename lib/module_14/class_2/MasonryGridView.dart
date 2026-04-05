import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
class Module14Class2 extends StatefulWidget {
  const Module14Class2({super.key});

  @override
  State<Module14Class2> createState() => _Module14Class2State();
}

class _Module14Class2State extends State<Module14Class2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('packages '),
      ),

      body: MasonryGridView.count(
        crossAxisCount: 2,
        itemCount: 10,
        itemBuilder: (context,index){
          return Card(
            child: Container(
              height: (index %2 +1)*100,
              color: Colors.blue,
              child: Text('Item $index'),
            ),
          );
        },

      ),
    );
  }
}