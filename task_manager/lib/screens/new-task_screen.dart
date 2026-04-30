import 'package:flutter/material.dart';
import 'package:task_manager/utils/app_color.dart';
import 'package:task_manager/widgets/tm_appbar.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TmAppbar(),
    );
  }
}