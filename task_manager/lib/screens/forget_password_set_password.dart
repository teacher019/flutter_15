import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/screens/forget_password_pin_verify.dart';
import 'package:task_manager/screens/login_screen.dart';
import 'package:task_manager/utils/app_color.dart';
import 'package:task_manager/widgets/screen_background.dart';

class ForgetPasswordSetPassword extends StatefulWidget {
  const ForgetPasswordSetPassword({super.key});

  @override
  State<ForgetPasswordSetPassword> createState() => _ForgetPasswordSetPasswordState();
}

class _ForgetPasswordSetPasswordState extends State<ForgetPasswordSetPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 150,),
            Text('Set Password',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: 25,),
            TextFormField(
              decoration: InputDecoration(
                  hintText: 'Password'
              ),
            ),
            SizedBox(height: 25,),
            TextFormField(
              decoration: InputDecoration(
                  hintText: 'Confirm Password'
              ),
            ),

            SizedBox(height: 25,),
            FilledButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgetPasswordPinVerify()));
            }, child: Text('Confirm')),

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
      )),
    );
  }
}