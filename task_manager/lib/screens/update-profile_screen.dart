import 'package:flutter/material.dart';
import 'package:task_manager/controller/auth_controller.dart';
import 'package:task_manager/data/model/api_response.dart';
import 'package:task_manager/data/model/user_model.dart';
import 'package:task_manager/screens/main_nav_screen.dart';
import 'package:task_manager/utils/urls.dart';
import 'package:task_manager/widgets/screen_background.dart';
import 'package:task_manager/widgets/tm_appbar.dart';

import '../service/api_caller.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    UserModel user = AuthController.userData!;

    _emailController.text = user.email!;
    _firstNameController.text = user.firstName!;
    _lastNameController.text = user.lastName!;
    _mobileController.text = user.mobile!;
  }

  Future <void> updateProfile() async {
    Map<String,dynamic>requestBody = {
      "email":_emailController.text,
      "firstName":_firstNameController.text,
      "lastName":_lastNameController.text,
      "mobile":_mobileController.text,

    };

    if(_passwordController.text.isNotEmpty){
      requestBody['password'] = _passwordController.text;
    }

    final ApiResponse response =await ApiCaller.postRequest(URL: Urls.updateProfileURL,
        body: requestBody
    );

    if(response.isSuccess){
      UserModel model = UserModel(
        sId: AuthController.userData?.sId,
        email: _emailController.text,
        firstName:_firstNameController.text,
        lastName:_lastNameController.text,
        mobile:_mobileController.text,
      );

      AuthController.updateUserData(model);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainNavScreen()));
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Profile update success... ')));
    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(response.responseData['data'])));

    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TmAppbar(),
      body: ScreenBackground(child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 150,),
            Text('Update Profile',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: 25,),
            Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5)
              ),
              child: Row(
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Text('Photo'),
                    height: 50,
                    width: 80,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10)
                        )
                    ),
                  ),
                  SizedBox(width: 5,),
                  Expanded(child: Text('Upload image'))
                ],
              ),
            ),
            SizedBox(height: 25,),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                  hintText: 'Email'
              ),
            ),
            SizedBox(height: 25,),
            TextFormField(
              controller: _firstNameController,
              decoration: InputDecoration(
                  hintText: 'First Name'
              ),
            ),
            SizedBox(height: 25,),
            TextFormField(
              controller: _lastNameController,
              decoration: InputDecoration(
                  hintText: 'Last Name'
              ),
            ),
            SizedBox(height: 25,),
            TextFormField(
              controller: _mobileController,
              decoration: InputDecoration(
                  hintText: 'Mobile'
              ),
            ),
            SizedBox(height: 25,),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                  hintText: 'Password'
              ),
            ),

            SizedBox(height: 25,),
            FilledButton(onPressed: (){
              updateProfile();
            }, child: Icon(Icons.arrow_circle_right_outlined)),




          ],
        ),
      )),
    );
  }
}