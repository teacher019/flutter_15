import 'package:flutter/material.dart';

class Class3 extends StatelessWidget {
  const Class3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.blue[50],
      // backgroundColor: Colors.blue.withOpacity(0.9),
        backgroundColor: Colors.blue.shade100,
        appBar: AppBar(
            title: Text('Class 3'),
            backgroundColor: Colors.blue.shade300
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)
                        // borderRadius: BorderRadius.all(Radius.circular(10))
                        // borderRadius: BorderRadius.only(topRight: Radius.circular(50))

                      )
                  ),
                  onPressed: (){},
                  child: Text('Button 1')),
              SizedBox(height: 10,),
              SizedBox(
                // width: double.infinity,
                height: 50,
                width: 250,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)
                          // borderRadius: BorderRadius.all(Radius.circular(10))
                          // borderRadius: BorderRadius.only(topRight: Radius.circular(50))

                        )
                    ),
                    onPressed: (){
                      print('hello clicked');
                    },
                    child: Text('Button 2')),
              ),

              SizedBox(height: 10,),

              OutlinedButton(
                  style: OutlinedButton.styleFrom(),
                  onPressed: (){

                  }, child: Text('Submit')),

              TextButton(onPressed: (){
                print('read more');

              }, child: Text('Read more')),

              Icon(Icons.delete, color: Colors.red,size: 30,),

              IconButton(onPressed: (){
                print('called');
              }, icon: Icon(Icons.call)),


              GestureDetector(
                  onTap: (){
                    print('on tap');

                  },
                  onLongPress: (){
                    print('on long press');

                  },

                  onDoubleTap: (){
                    print('on onDoubleTap');

                  },

                  child: Text('This is test text')),



              InkWell(
                  onTap: (){
                    print('InkWell on tap');

                  },
                  onLongPress: (){
                    print('InkWell on long press');

                  },

                  onDoubleTap: (){
                    print('InkWell on onDoubleTap');

                  },
                  child: Text('This is test text-2'))



            ],
          ),
        )
    );
  }
}