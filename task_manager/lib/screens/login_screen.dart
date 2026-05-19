import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/controller/auth_controller.dart';
import 'package:task_manager/data/model/api_response.dart';
import 'package:task_manager/data/model/user_model.dart';
import 'package:task_manager/screens/forget_password_email_verification.dart';
import 'package:task_manager/screens/main_nav_screen.dart';
import 'package:task_manager/screens/sign_up_screen.dart';
import 'package:task_manager/utils/app_color.dart';
import 'package:task_manager/utils/urls.dart';
import 'package:task_manager/widgets/screen_background.dart';

import '../service/api_caller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future <void> _signIn() async {
    Map<String,dynamic>requestBody = {
      "email": _emailController.text,
      "password":_passwordController.text
    };

    final ApiResponse response =await ApiCaller.postRequest(URL: Urls.signInURL,
        body: requestBody
    );

    if(response.isSuccess){
      UserModel model = UserModel.fromJson(response.responseData['data']);
      String accessToken = response.responseData['token'];

      AuthController.saveUserData(model,accessToken);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainNavScreen()));
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Sign In success... ')));
    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(response.responseData['data'])));

    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(child: Padding(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 150,),
              Text('Get Started With',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: 25,),
              TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                      hintText: 'Email'
                  ),
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return 'Please Enter email';
                    }else{
                      return null;
                    }}
              ),
              SizedBox(height: 25,),
              TextFormField(
                obscureText: true,
                controller: _passwordController,
                decoration: InputDecoration(
                    hintText: 'Password'
                ),

                validator: (value){
                  if(value == null || value.isEmpty){
                    return 'Please Enter First name';
                  }else{
                    return null;
                  }
                },
              ),

              SizedBox(height: 25,),
              FilledButton(onPressed: (){
                if(_formKey.currentState!.validate()){
                  _signIn();
                }


              }, child: Icon(Icons.arrow_circle_right_outlined)),

              SizedBox(height: 55,),
              Center(
                child: Column(
                  children: [
                    TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgetPasswordEmailVerification()));
                    }, child: Text('Forget Password ?',style: TextStyle(color: Colors.grey),)),

                    RichText(text: TextSpan(
                        text: "Don't have an account? ",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),
                        children: [
                          TextSpan(
                              text: 'Sign up', style: TextStyle(
                              color: AppColor.Pcolor2,
                              fontWeight: FontWeight.w600
                          ),
                              recognizer: TapGestureRecognizer()..onTap = (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpScreen()));
                              }
                          )
                        ]
                    ))
                  ],
                ),
              )

            ],
          ),
        ),
      )),
    );
  }
}