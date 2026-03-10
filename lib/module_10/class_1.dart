import 'package:flutter/material.dart';

class Module11Class1 extends StatelessWidget {
  const Module11Class1({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController phoneController = TextEditingController();
    TextEditingController passwordController = TextEditingController();


    return Scaffold(
      body: SafeArea(

          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                SizedBox(height: 10,),
                TextField(
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      helperText: 'Phone number',
                      hintText: 'Enter phone number',

                      labelText: 'Phone number',

                      helperStyle: TextStyle(

                      ),

                      hintStyle: TextStyle(

                      ),

                      prefixIcon: Icon(Icons.phone),
                      suffixIcon: Icon(Icons.check),

                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50)
                      )
                  ),
                ),
                SizedBox(height: 30,),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      helperText: 'Password',
                      hintText: 'Enter Password ',

                      labelText: 'Password',

                      helperStyle: TextStyle(

                      ),

                      hintStyle: TextStyle(

                      ),

                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: Icon(Icons.remove_red_eye),

                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50)
                      )
                  ),
                ),

                SizedBox(
                  width: 200,
                  height: 40,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white
                      ),
                      onPressed: (){

                        if(phoneController.text.isEmpty){

                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Please enter phone number')
                              ));
                        }else if(phoneController.text.length != 11){
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Please enter valid phone number')
                              ));
                        }else{
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(passwordController.text)
                              ));
                        }

                      },
                      child: Text('Submit')),
                ),


                SizedBox(height: 40,),

                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          width: 1,
                          color: Colors.black
                      ),

                      boxShadow: [
                        BoxShadow(
                            color: Colors.green.withOpacity(0.3),
                            offset: Offset(4, 10)
                        ),

                        BoxShadow(
                            color: Colors.blue.withOpacity(0.3),
                            offset: Offset(-10, -10)
                        ),
                      ]
                  ),
                  height: 70,
                  width: 200,
                  child: Text('Continer text'),
                )
              ],
            ),
          )

      ),
    );
  }
}