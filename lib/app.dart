import 'package:flutter/material.dart';
import 'package:flutter_15/module_10/class_1.dart';
import 'package:flutter_15/module_11/class_2.dart';
import 'package:flutter_15/module_11/class_3.dart';
import 'package:flutter_15/module_12/class_2.dart';
import 'package:flutter_15/module_12/class_3.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'module_12/navi/page_1.dart';
import 'module_12/navi/page_2.dart';
import 'module_12/navi/page_3.dart';
import 'module_13/class_1.dart';
import 'module_13/class_2.dart';
import 'module_13/class_3.dart';
import 'module_9/class_3.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_ , child) {

        return MaterialApp(

          routes: {
            '/':(context) =>  Class3(),
            '/class1':(context) =>  Module11Class1(),
            '/class2':(context) =>  Module11Class2(),
            '/class3':(context) =>  Alert(),
            '/page1':(context) =>  Page1(),
            '/page2':(context) =>  Page2(name: '',),
            '/page3':(context) =>  Page3(),
            '/Module12Class2':(context) =>  Module12Class2(),
            '/Module12Class3':(context) =>  Module12Class3(),
            '/Module13Class1':(context) =>  Module13Class1(),
            '/Module13Class2':(context) =>  Module13Class2(name: "Karim",),
            '/BottomNav':(context) =>  BottomNav(),
          },
          initialRoute: '/BottomNav',

          theme: ThemeData(
              brightness: Brightness.light,
              primaryColor: Colors.deepPurple,
              primarySwatch: Colors.deepPurple,

              scaffoldBackgroundColor: Colors.blue.shade50,

              elevatedButtonTheme: ElevatedButtonThemeData(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)
                      )
                  )
              ),


              inputDecorationTheme: InputDecorationTheme(
                  hintStyle: TextStyle(
                      fontSize: 18,
                      color: Colors.blue
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)
                  )
              ),

              appBarTheme: AppBarTheme(
                backgroundColor: Colors.blue,
                centerTitle: true,
              )

          ),

          debugShowCheckedModeBanner: false,
          title: 'Flutter 15',

        );


      },);

  }
}