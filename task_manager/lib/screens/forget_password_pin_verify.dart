import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/screens/forget_password_set_password.dart';
import 'package:task_manager/screens/login_screen.dart';
import 'package:task_manager/utils/app_color.dart';
import 'package:task_manager/widgets/screen_background.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
class ForgetPasswordPinVerify extends StatefulWidget {
  const ForgetPasswordPinVerify({super.key});

  @override
  State<ForgetPasswordPinVerify> createState() => _ForgetPasswordPinVerifyState();
}

class _ForgetPasswordPinVerifyState extends State<ForgetPasswordPinVerify> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 150,),
            Text('PIN Verification',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: 25,),

            PinCodeTextField(
              appContext: context,
              length: 6,
              obscureText: true,
              animationType: AnimationType.fade,
              keyboardType: TextInputType.number,

              pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(7),
                  fieldWidth: 40,
                  fieldHeight: 50,
                  activeFillColor: Colors.white,
                  inactiveFillColor: Colors.white,
                  inactiveColor: Colors.grey.shade200,
                  selectedColor: AppColor.Pcolor2
              ),
              backgroundColor: Colors.transparent,
            ),

            SizedBox(height: 25,),
            FilledButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgetPasswordSetPassword()));
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
      )),
    );
  }
}