import 'package:flutter/material.dart';
class Class2 extends StatelessWidget {
  const Class2({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    TextEditingController phoneController = TextEditingController();
    TextEditingController passwordController = TextEditingController();


    return Scaffold(
      appBar: AppBar(
        title: Text('class 2',
          style: TextStyle(
              color: Colors.white
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Image.network('https://upload.wikimedia.org/wikipedia/commons/thumb/e/e1/Logo_of_YouTube_%282015-2017%29.svg/960px-Logo_of_YouTube_%282015-2017%29.svg.png',
                height: 100,
                width: 200,
              ),

              InkWell(
                onTap: (){
                  print('clicked');
                },
                child: Image.asset('asset/YT.png',
                  height: 200,
                  width: 200,
                ),
              ),

              Text('Login Here ...!',
                style: TextStyle(
                    fontSize: 25
                ),
              ),

              TextFormField(
                controller: phoneController,
                decoration: InputDecoration(
                  hintText: 'Phone number',


                ),

                validator: (value){
                  if(value == null || value.isEmpty){
                    return ' Please Enter phone number';
                  }else if(value.length != 11){
                    return 'Enter valid phone number';
                  }else{
                    return null;
                  }
                },
              ),
              SizedBox(height: 40,),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                  hintText: 'Password',



                ),

                validator: (value){
                  if(value == null || value.isEmpty){
                    return ' Please Enter password';
                  }else if(value.length < 6){
                    return 'Password must be min 6 Char';
                  }else{
                    return null;
                  }
                },

              ),
              SizedBox(height: 20,),
              SizedBox(
                width: 300,
                child: ElevatedButton(

                    onPressed: (){
                      if(_formKey.currentState!.validate()){
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Login success')
                            ));
                      }

                    }, child: Text('Submit')),
              )
            ],
          ),
        ),
      ),
    );
  }
}