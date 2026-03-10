
import 'package:flutter/material.dart';
import '../../module_11/grid_view.dart';

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Page-3'),
            ElevatedButton(onPressed: (){

              Navigator.push(context, MaterialPageRoute(builder: (context)=>Gridv()));
            }, child: Text('Gridv')),
            ElevatedButton(onPressed: (){
              Navigator.pop(context);
            }, child: Text('Back'))
          ],
        ),
      ),
    );
  }
}
