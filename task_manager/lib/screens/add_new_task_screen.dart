import 'package:flutter/material.dart';
import 'package:task_manager/data/model/api_response.dart';
import 'package:task_manager/screens/main_nav_screen.dart';
import 'package:task_manager/utils/urls.dart';
import 'package:task_manager/widgets/screen_background.dart';
import 'package:task_manager/widgets/tm_appbar.dart';

import '../service/api_caller.dart';
class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({super.key});

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  Future <void> addNewTask() async {
    Map<String,dynamic>requestBody = {
      "title":titleController.text,
      "description": descriptionController.text,
      "status":"New"
    };

    final ApiResponse response =await ApiCaller.postRequest(URL: Urls.createTaskURL,
        body: requestBody
    );

    if(response.isSuccess){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainNavScreen()));
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Sign In success... ')));
    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(response.responseData['data'])));

    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TmAppbar(),
      body: ScreenBackground(child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [


            SizedBox(height: 150,),
            Text('Add New Task',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: 25,),
            TextFormField(
              controller: titleController,
              decoration: InputDecoration(
                  hintText: 'Title'
              ),
            ),
            SizedBox(height: 25,),
            TextFormField(
              controller: descriptionController,
              maxLines: 6,
              decoration: InputDecoration(
                  hintText: 'Description'
              ),
            ),

            SizedBox(height: 25,),
            FilledButton(onPressed: (){
              addNewTask();

            }, child: Icon(Icons.arrow_circle_right_outlined)),


          ],
        ),
      )),
    );
  }
}