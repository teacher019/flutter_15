import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class M10Class3 extends StatelessWidget {
  const M10Class3({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;
    double screenHeight = screenSize.height;

    final Orientation orientation = MediaQuery.of(context).orientation;


    return Scaffold(
      appBar: AppBar(
        title: Text('responsive'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            orientation == Orientation.portrait ? Column(
              children: [

                Container(
                  height: 150,
                  width: 300,
                  color: Colors.red,
                ),

                Text('Test text',
                  style:  TextStyle(
                      fontSize: 20
                  ),
                ),

                Container(
                  height: 150.h,
                  width: 300.w,
                  color: Colors.green,
                ),

                Text('Test text -2',
                  style:  TextStyle(
                      fontSize: 20.sp
                  ),
                )
              ],
            ) :  Row(
              children: [

                Container(
                  height: 100,
                  width: 200,
                  color: Colors.red,
                ),

                Text('Test text',
                  style:  TextStyle(
                      fontSize: 20
                  ),
                ),

                Container(
                  height: screenHeight*0.10,
                  width: screenWidth*0.3,
                  color: Colors.green,
                ),

                Text('Test text -2',
                  style:  TextStyle(
                      fontSize: 20*1
                  ),
                )
              ],
            ),



          ],
        ),
      ),
    );
  }
}