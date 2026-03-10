
import 'package:flutter/material.dart';
import 'package:flutter_15/module_12/navi/page_3.dart';

class Page2 extends StatelessWidget {
  final String name;
  const Page2({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(name, style: TextStyle(
                fontSize: 50
            ),),
            Text('Page-2'),
            ElevatedButton(onPressed: (){
              Navigator.pop(context);
            }, child: Text('Back')),

            ElevatedButton(onPressed: (){

              Navigator.push(context, MaterialPageRoute(builder: (context)=>Page3()));


            }, child: Text('page-3'))
          ],
        ),
      ),
    );
  }
}
