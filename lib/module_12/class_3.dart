import 'package:flutter/material.dart';

class Module12Class3 extends StatefulWidget {
  const Module12Class3({super.key});

  @override
  State<Module12Class3> createState() => _Module12Class3State();
}

class _Module12Class3State extends State<Module12Class3> {
  bool selected = false;
  bool showMessage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  selected = !selected;
                });
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 900),
                height: selected ? 100 : 150,
                width: selected ? 100 : 150,
                decoration: BoxDecoration(
                    color: selected ? Colors.green : Colors.red,
                    borderRadius: BorderRadius.circular(20)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  selected = !selected;
                });
              },
              child: Container(
                height: selected ? 100 : 150,
                width: selected ? 100 : 150,
                decoration: BoxDecoration(
                    color: selected ? Colors.green : Colors.red,
                    borderRadius: BorderRadius.circular(20)),
              ),
            ),
            Divider(),
            ElevatedButton(onPressed: () {
              setState(() {
                showMessage = !showMessage;
              });
            }, child: Text('Add to cart')),
            AnimatedOpacity(
              opacity: showMessage ? 1 : 0,
              duration: Duration(milliseconds: 1000),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Added to cart',style: TextStyle(fontSize: 20),),
                ),
              ),
            ),

            SizedBox(height: 20,),

            AnimatedAlign(alignment: showMessage ? Alignment.topRight : Alignment.centerLeft, duration: Duration(milliseconds: 900), child:  CircleAvatar(
              radius:30,
              backgroundImage: NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrN3fMD9X1_p5b6lRSCGcpDtH9BcgEOsEZLg&s'
              ),
            ),),


            SizedBox(
              height: 200,
              child: Stack(
                children: [
                  ElevatedButton(onPressed: (){
                    setState(() {
                      showMessage = !showMessage;
                    });


                  }, child: Text('Toggle button')),

                  AnimatedPositioned(
                    duration: Duration(milliseconds: 900),
                    bottom: showMessage ? 0 : -120,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 120,

                      color: Colors.red,
                      alignment: Alignment.center,
                      child: Text('Test'),
                    ),
                  )
                ],
              ),
            )


          ],
        ),
      ),
    );
  }
}