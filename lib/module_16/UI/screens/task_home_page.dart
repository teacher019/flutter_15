import 'package:flutter/material.dart';

import '../../db/task-database.dart';
import '../../model/task-model.dart';

class TaskHomePage extends StatefulWidget {
  const TaskHomePage({super.key});

  @override
  State<TaskHomePage> createState() => _TaskHomePageState();
}

class _TaskHomePageState extends State<TaskHomePage> {
  TextEditingController controller = TextEditingController();
  List<Task> tasks = [];

  Future<void>refreshTask() async {
    tasks = await TaskDatabase.getTask();
    setState(() {

    });
  }


  Future<void>addTask() async {
    if(controller.text.isNotEmpty){
      await TaskDatabase.insertTask(Task(title: controller.text, isDone: false));
      controller.clear();
      refreshTask();
    }else{

    }

  }

  Future<void>deleteTask(int id) async {
    await TaskDatabase.deleteTask(id);
    refreshTask();

  }


  Future<void>toggleTaskStatus(Task task) async {
    await TaskDatabase.updateTask(Task(
        id: task.id,
        title: task.title,
        isDone: !task.isDone));
    refreshTask();

  }
  Future<void> showUpdateDialog(Task task) async {
    TextEditingController updateController =
    TextEditingController(text: task.title);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Update Task'),
          content: TextField(
            controller: updateController,
            decoration: InputDecoration(hintText: 'Enter new task'),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () async {
                if (updateController.text.isNotEmpty) {
                  await TaskDatabase.updateTask(
                    Task(
                      id: task.id,
                      title: updateController.text,
                      isDone: task.isDone,
                    ),
                  );

                  Navigator.pop(context);
                  refreshTask();

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Task updated')),
                  );
                }
              },
              child: Text('Update'),
            ),
          ],
        );
      },
    );
  }



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    refreshTask();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task with DB'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              children: [
                Expanded(child: TextFormField(
                  controller: controller,
                )),
                IconButton(onPressed: addTask, icon: Icon(Icons.add))
              ],
            ),
          ),

          Expanded(
            child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context,index){
                  final task = tasks[index];
                  return Dismissible(
                    key: Key(task.id.toString()),
                    direction: DismissDirection.endToStart,
                    background: Container(
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      color: Colors.red,
                      child: Icon(Icons.delete,color: Colors.white,),
                    ),
                    onDismissed: (_){
                      deleteTask(task.id!);
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Task deleted'))
                      );
                    },
                    child: Card(
                      child: ListTile(
                        leading: Checkbox(value: task.isDone, onChanged: (_){
                          toggleTaskStatus(task);
                        }),
                        title: Text(task.title,style: TextStyle(
                            decoration:  task.isDone ? TextDecoration.lineThrough :  TextDecoration.none,
                            color: task.isDone ? Colors.grey : Colors.black
                        ),),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {
                                showUpdateDialog(task);
                              },
                              icon: Icon(Icons.edit),
                            ),
                            IconButton(onPressed: (){
                              deleteTask(task.id!);
                            }, icon: Icon(Icons.delete,color: Colors.red,))
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}