import 'package:flutter/material.dart';

class ResponsiveUi extends StatelessWidget {
  const ResponsiveUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Container(
                width: 100,
                height: 100,
                color: Colors.red,
              ),

              Expanded(
                child: Container(
                  height: 100,
                  color: Colors.blue,
                ),
              )
            ],
          ),

          SizedBox(height: 10,),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.red,
                ),
              ),

              Expanded(
                flex: 2,
                child: Container(
                  height: 100,
                  color: Colors.green,
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  height: 100,
                  color: Colors.blue,
                ),
              )
            ],
          ),
          SizedBox(height: 10,),



          Row(
            children: [
              Flexible(

                child: Container(
                    color: Colors.red,
                    height: 100,
                    child: Text('Short')),
              ),
              Flexible(
                fit: FlexFit.tight,
                child: Container(
                    color: Colors.green,
                    height: 100,
                    child: Text('ghfth tghrf dfghbfdthn dfghd')),
              )
            ],
          )
        ],
      ),
    );
  }
}