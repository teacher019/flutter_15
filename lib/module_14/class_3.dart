import 'package:flutter/material.dart';


class Module14Class3 extends StatelessWidget {
  const Module14Class3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Class 3'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)
                ),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                      child: Image.network('https://images.unsplash.com/photo-1726574686436-5ef90358e032?fm=jpg&q=60&w=3000&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aXBob25lJTIwMTN8ZW58MHx8MHx8fDA%3D', height: 200,width:200,fit: BoxFit.cover,),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Text('Test product', style: TextStyle(fontWeight: FontWeight.bold),),
                          SizedBox(height: 5,),
                          Text('৳ 500')
                        ],
                      ),
                    )
                  ],
                ),
              ),

              Column(
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        radius:50,
                        backgroundImage: NetworkImage(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrN3fMD9X1_p5b6lRSCGcpDtH9BcgEOsEZLg&s'
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 12,
                          width: 12,

                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.green,
                              border: Border.all(color: Colors.white,width: 2)
                          ),
                        ),
                      )
                    ],
                  ),
                  Text('Taufiqur Sabbir',
                    style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                  ),
                  Text('a@b.com',
                    style: TextStyle(fontSize: 14,),
                  ),
                ],
              ),
              SizedBox(height: 10,),

              Stack(
                children: [
                  Icon(Icons.notification_important_rounded, size: 60,),
                  Positioned(
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle
                      ),
                      child: Text('2',style: TextStyle(
                          color: Colors.white,fontSize: 13
                      ),),
                    ),
                  ),

                ],
              ),

              Card(
                child: ExpansionTile(title: Text('Order Details'),
                  leading: Icon(Icons.receipt),
                  children: [
                    ListTile(title: Text('Order ID :46567'),),
                    ListTile(title: Text('Total :560'),)
                  ],
                ),
              ),

              Stepper(
                  connectorColor: MaterialStateProperty.all(Colors.blue),
                  currentStep: 2,
                  steps:[
                    Step(title: Text('Order Placed'), content: SizedBox()),
                    Step(title: Text('Order Confirmed'), content: SizedBox()),
                    Step(title: Text('Processing'), content: SizedBox()),
                    Step(title: Text('Delivered'), content: SizedBox()),
                  ] )

            ],
          ),
        ),
      ),
    );
  }
}