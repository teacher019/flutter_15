import 'package:flutter/material.dart';
import 'package:flutter_15/module_13/class_3.dart';
import 'package:flutter_15/module_14/class_1.dart';
import 'package:flutter_15/module_14/class_2/MasonryGridView.dart';
import 'package:flutter_15/module_14/class_2/shimmer_example.dart';
import 'package:flutter_15/module_14/responsive_ui.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    navigateNextPage();
  }

  void navigateNextPage(){
    Future.delayed(Duration(seconds: 10),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ShimmerExample()));

    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,

        child: Lottie.network('https://assets9.lottiefiles.com/packages/lf20_touohxv0.json',width: 20,),
      ),
    );
  }
}