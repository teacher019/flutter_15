import 'package:flutter/material.dart';
import 'package:flutter_15/module_12/navi/page_2.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Page2(name: 'Taufiq')));
            }, child: Text('Navi-2')),


            ElevatedButton(onPressed: (){

              Navigator.push(context, MaterialPageRoute(builder: (context)=>Page2(name: 'Taufiq',)));


            }, child: Text('Page-2')),
            SizedBox(height: 30,),
            ElevatedButton(onPressed: (){}, child: Text('Page-3,')),
            Divider(),

            ElevatedButton(onPressed: (){
              Navigator.pushNamed(context, '/page2');


            }, child: Text('Navi 2.0 Page-2')),


            ElevatedButton(onPressed: (){
              Navigator.pushNamedAndRemoveUntil(context, '/page2',(route) => false);


            }, child: Text('Navi 2.0 Page-2 replace'))
          ],
        ),
      ),
    );
  }
}
