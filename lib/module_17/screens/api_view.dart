import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_15/module_17/model/post_model.dart';
import 'package:flutter_15/module_17/utils/urls.dart';
import 'package:http/http.dart' as http;
class ApiView extends StatefulWidget {
  const ApiView({super.key});

  @override
  State<ApiView> createState() => _ApiViewState();
}

class _ApiViewState extends State<ApiView> {
  List<postModel> posts = [];
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();

  Future<void>addPost() async {
    final response =await http.post(
      Uri.parse(Urls.createPost),
      body: json.encode({
        "title": titleController.text,
        "body":bodyController.text
      }),
    );

    print(json.encode({
      "title": titleController.text,
      "body":bodyController.text
    }),);


    log(response.statusCode.toString());


    if(response.statusCode == 201 || response.statusCode == 200){
      Navigator.pop(context);
      await fetchPosts();
    }
  }

  showAddPostDialog(){
    showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text('Add post'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: 'Title',

              ),
            ),
            SizedBox(height: 10,),
            TextFormField(
              controller: bodyController,
              decoration: InputDecoration(
                labelText: 'Body',

              ),
            )

          ],
        ),
        actions: [
          TextButton(onPressed: (){
            Navigator.pop(context);
          }, child: Text('Cancel')),

          ElevatedButton(onPressed: (){
            addPost();
          }, child: Text('Add'))
        ],
      );
    });

  }

  Future<void>fetchPosts() async {
    final response = await http.get(Uri.parse(Urls.getPost));
    log(response.toString());

    if(response.statusCode == 200){
      List data = json.decode(response.body);

      setState(() {
        posts = data.map((e)=>postModel.fromJson(e)).toList();
      });
    }else{

    }

  }

  Future<void>deletePosts(String id) async {
    final response = await http.delete(Uri.parse(Urls.deletePost(id)));
    log(response.statusCode.toString());
    log(response.body.toString());
    if(response.statusCode == 200){
      await fetchPosts();
      setState(() {

      });
    }else{

    }

  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchPosts();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts'),
      ),
      body: ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context,index){
            final post = posts[index];
            return Card(
              child: ListTile(
                title: Text(post.title.toString()),
                subtitle: Text( post.body.toString()),
                trailing: IconButton(onPressed: (){
                  deletePosts(post.id.toString());
                }, icon: Icon(Icons.delete,color: Colors.red,)),
              ),
            );
          }

      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        showAddPostDialog();
      },child: Icon(Icons.add),),
    );
  }
}