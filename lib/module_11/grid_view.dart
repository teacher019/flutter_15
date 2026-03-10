import 'package:flutter/material.dart';

class Gridv extends StatelessWidget {
  const Gridv({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Grid'),
        ),

        body: GridView.builder(

            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: 20,
            itemBuilder: (context,index){
              return Card(
                color: Colors.purple.shade200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.phone),
                    Text('Cash out',style: TextStyle(fontSize: 20),)
                  ],
                ),
              );
            }


        )



      // GridView.count(
      //   crossAxisCount: 2,
      //   crossAxisSpacing: 10,
      //   mainAxisSpacing: 10,
      //   children: [
      //     Container(
      //       color: Colors.red,
      //     ),
      //     Container(
      //       color: Colors.green,
      //     ),
      //     Container(
      //       color: Colors.orange,
      //     ),
      //
      //     Container(
      //       color: Colors.blue,
      //     ),
      //     Container(
      //       color: Colors.green,
      //     ),
      //   ],
      //
      // ),
    );
  }
}