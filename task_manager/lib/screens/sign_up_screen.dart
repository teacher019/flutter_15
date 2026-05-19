import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/controller/auth_controller.dart';
import 'package:task_manager/data/model/api_response.dart';
import 'package:task_manager/data/model/user_model.dart';
import 'package:task_manager/screens/login_screen.dart';
import 'package:task_manager/screens/main_nav_screen.dart';
import 'package:task_manager/screens/sign_up_screen.dart';
import 'package:task_manager/utils/app_color.dart';
import 'package:task_manager/utils/urls.dart';
import 'package:task_manager/widgets/screen_background.dart';
import 'package:http/http.dart' as http;

import '../service/api_caller.dart';
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();



  Future <void> signUp() async {
    Map<String,dynamic>requestBody = {
      "email":_emailController.text,
      "firstName":_firstNameController.text,
      "lastName":_lastNameController.text,
      "mobile":_mobileController.text,
      "password":_passwordController.text
    };

    final ApiResponse response =await ApiCaller.postRequest(URL: Urls.SignUpURL,
        body: requestBody
    );

    if(response.isSuccess){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 150,),
                Text('Join With Us',
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
                    }
                  },


                ),
                SizedBox(height: 25,),
                TextFormField(
                  controller: _firstNameController,
                  decoration: InputDecoration(
                      hintText: 'First Name'
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
                TextFormField(
                  controller: _lastNameController,
                  decoration: InputDecoration(
                      hintText: 'Last Name'
                  ),
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return 'Please Enter last name';
                    }else{
                      return null;
                    }
                  },
                ),
                SizedBox(height: 25,),
                TextFormField(
                  controller: _mobileController,
                  decoration: InputDecoration(
                      hintText: 'Mobile'
                  ),

                  validator: (value){
                    if(value == null || value.isEmpty){
                      return 'Please Enter mobile';
                    }else{
                      return null;
                    }
                  },
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
                      return 'Please Enter password';
                    }else{
                      return null;
                    }
                  },
                ),

                SizedBox(height: 25,),
                FilledButton(onPressed: (){
                  if(_formKey.currentState!.validate()){
                    signUp();
                  }
                }, child: Icon(Icons.arrow_circle_right_outlined)),

                SizedBox(height: 55,),
                Center(
                  child: Column(
                    children: [
                      RichText(text: TextSpan(
                          text: "Already have an account? ",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),
                          children: [
                            TextSpan(
                                text: 'Sign In', style: TextStyle(
                                color: AppColor.Pcolor2,
                                fontWeight: FontWeight.w600
                            ),
                                recognizer: TapGestureRecognizer()..onTap = (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
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
        ),
      )),
    );
  }
}