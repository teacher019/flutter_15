import 'package:flutter/material.dart';
import 'package:task_manager/data/model/api_response.dart';
import 'package:task_manager/data/model/task_model.dart';
import 'package:task_manager/data/model/task_status_count_model.dart';
import 'package:task_manager/screens/add_new_task_screen.dart';
import 'package:task_manager/utils/app_color.dart';
import 'package:task_manager/utils/urls.dart';
import 'package:task_manager/widgets/task_card.dart';
import 'package:task_manager/widgets/task_count_by_status.dart';
import 'package:task_manager/widgets/tm_appbar.dart';

import '../service/api_caller.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllTaskCount();
    getAllNewTask();
  }

  List<TaskStatusCountModel> taskCountByStatus= [];
  List<TaskModel> newTask= [];

  Future <void> getAllTaskCount() async {


    final ApiResponse response =await ApiCaller.getRequest(URL: Urls.getTaskCountURL,
    );

    List<TaskStatusCountModel> taskCount = [];

    if(response.isSuccess){
      for(Map<String,dynamic>jsonData in response.responseData['data']){
        taskCount.add(TaskStatusCountModel.fromJson(jsonData));
      }

    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(response.responseData['data'])));

    }
    setState(() {
      taskCountByStatus = taskCount;
    });



    print(response.responseData);
    print(taskCount.length);
    print(taskCountByStatus.length);
  }

  Future <void> getAllNewTask() async {


    final ApiResponse response =await ApiCaller.getRequest(URL: Urls.taskByStatusURL('New'),
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
      newTask = task;
    });



    print(response.responseData);
    print(task.length);
    print(newTask.length);
  }



  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 90,
              child: ListView.separated(
                itemCount: taskCountByStatus.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return TaskCountByStatus(
                    title: taskCountByStatus[index].sId.toString(),
                    count: taskCountByStatus[index].sum!.toInt(),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    width: 20,
                  );
                },
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: newTask.length,
                itemBuilder: (context, index) {
                  return TaskCard(
                    taskModel: newTask[index],
                    CardColor: Colors.blue,
                    refreshParent: () {
                      getAllTaskCount();
                      getAllNewTask();
                    },
                  );
                }),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>AddNewTaskScreen()));
      }, child: Icon(Icons.add),),
    );
  }
}