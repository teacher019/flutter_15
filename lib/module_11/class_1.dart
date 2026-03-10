import 'package:flutter/material.dart';

class Module11class1 extends StatelessWidget {
  const Module11class1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('List'),
        ),
        body: ListView.builder(
            itemCount: 20,
            itemBuilder: (context,index){
              return  Card(
                child: ListTile(
                  title: Text('Taufiq $index'),
                  subtitle: Text('01792945445'),
                  leading: Icon(Icons.phone),
                  trailing: Icon(Icons.delete,color: Colors.red,),
                ),
              );
            }

        )


      // ListView(
      //   children: [
      //     Card(
      //       color: Colors.orange,
      //       child: ListTile(
      //         title: Text('Taufiq'),
      //         subtitle: Text('01792945445'),
      //         leading: Icon(Icons.phone),
      //         trailing: Icon(Icons.delete,color: Colors.red,),
      //       ),
      //     ),
      //     Card(
      //       child: ListTile(
      //         title: Text('Taufiq'),
      //         subtitle: Text('01792945445'),
      //         leading: Icon(Icons.phone),
      //         trailing: Icon(Icons.delete,color: Colors.red,),
      //       ),
      //     ),
      //     Card(
      //       child: ListTile(
      //         title: Text('Taufiq'),
      //         subtitle: Text('01792945445'),
      //         leading: Icon(Icons.phone),
      //         trailing: Icon(Icons.delete,color: Colors.red,),
      //       ),
      //     ),
      //     Card(
      //       child: ListTile(
      //         title: Text('Taufiq'),
      //         subtitle: Text('01792945445'),
      //         leading: Icon(Icons.phone),
      //         trailing: Icon(Icons.delete,color: Colors.red,),
      //       ),
      //     ),
      //     Card(
      //       child: ListTile(
      //         title: Text('Taufiq'),
      //         subtitle: Text('01792945445'),
      //         leading: Icon(Icons.phone),
      //         trailing: Icon(Icons.delete,color: Colors.red,),
      //       ),
      //     ),
      //     Card(
      //       child: ListTile(
      //         title: Text('Taufiq'),
      //         subtitle: Text('01792945445'),
      //         leading: Icon(Icons.phone),
      //         trailing: Icon(Icons.delete,color: Colors.red,),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}