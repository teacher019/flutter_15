import 'package:flutter/material.dart';
import 'package:task_manager/data/model/api_response.dart';
import 'package:task_manager/data/model/task_model.dart';
import 'package:task_manager/utils/urls.dart';
import 'package:task_manager/widgets/task_card.dart';

import '../service/api_caller.dart';
class CompletedTaskScreen extends StatefulWidget {
  const CompletedTaskScreen({super.key});

  @override
  State<CompletedTaskScreen> createState() => _CompletedTaskScreenState();
}

class _CompletedTaskScreenState extends State<CompletedTaskScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllTask();
  }

  List<TaskModel> allTask = [];

  Future <void> getAllTask() async {


    final ApiResponse response =await ApiCaller.getRequest(URL: Urls.taskByStatusURL('Completed'),
    );

    List<TaskModel> task = [];

    if(response.isSuccess){
      for(Map<String,dynamic>jsonData in response.responseData['data']){
        task.add(TaskModel.fromJson(jsonData));
      }

    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(response.responseData['data'])));

    }
    setState(() {
      allTask = task;
    });



    print(response.responseData);
    print(task.length);
    print(allTask.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:ListView.builder(
          itemCount: allTask.length,
          itemBuilder: (context, index) {
            return TaskCard(
              taskModel: allTask[index],
              CardColor: Colors.green,
              refreshParent: () {
                getAllTask();

              },
            );
          }) ,
    );
  }
}