import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_manager/screens/login_screen.dart';
import 'package:task_manager/utils/asset_path.dart';
import 'package:task_manager/widgets/screen_background.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});



  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  Future<void>moveToNextScreen() async{
    await Future.delayed(Duration(seconds: 3));
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder:(context)=>LoginScreen() ));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    moveToNextScreen();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(child: Center(child: SvgPicture.asset(AssetPaths.logo),),),
    );
  }
}