import 'package:flutter/material.dart';

class Alert extends StatelessWidget {
  const Alert({super.key});

  @override
  Widget build(BuildContext context) {

    bool _isClicked = false;

    void showAlertDialog() {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
            icon: Icon(
              Icons.delete,
              color: Colors.red,
              size: 50,
            ),
            title: Text('This is title'),
            content: Text('Are you sure...?'),
            actions: [
              TextButton(onPressed: () {}, child: Text('yes')),
              TextButton(onPressed: () {}, child: Text('No')),
            ],
          ));
    }

    void showSimpleDialog() {
      showDialog(
          context: context,
          builder: (context) => SimpleDialog(
            title: Text('This is title'),
            children: [
              SimpleDialogOption(
                onPressed: () {
                  print('Clicked');
                },
                child: Text('English'),
              ),
              SimpleDialogOption(
                onPressed: () {},
                child: Text('English'),
              ),
              SimpleDialogOption(
                onPressed: () {},
                child: Text('English'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text('Enter your age..?'),
                    TextField(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(onPressed: () {}, child: Text('Cancle')),
                        ElevatedButton(
                            onPressed: () {}, child: Text('Submit'))
                      ],
                    )
                  ],
                ),
              )
            ],
          ));
    }

    void showSnackBar() {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Item deleted'),
          action: SnackBarAction(label: 'Undo', onPressed: () {}),
        ),
      );
    }

    void showBottomSheet() {
      showModalBottomSheet(
          context: context,
          builder: (context) => Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,

              children: [
                Text('Choose option'),
                ListTile(
                  title: Text('Option-1'),
                ),
                ListTile(
                  title: Text('Option-2'),
                ),
                ListTile(
                  title: Text('Option-2'),
                ),
                ListTile(
                  title: Text('Option-2'),
                ),
              ],
            ),
          ));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Alert'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  showAlertDialog();
                },
                child: Text('Alert Dialog')),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  showSimpleDialog();
                },
                child: Text('Simple Dialog')),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  showSnackBar();
                },
                child: Text('Simple Snack bar')),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  showBottomSheet();
                },
                child: Text('Bottom Sheet')),

            Checkbox(value: true, onChanged: (value){
              _isClicked = !_isClicked;
            }),



            Checkbox(value: false, onChanged: (value){
              _isClicked = !_isClicked;
            }),


            Row(
              children: [
                Radio(value: 0, groupValue: 1, onChanged: (value){

                }),
                Text('Option-1'),

                Radio(value: 1, groupValue: 1, onChanged: (value){

                }),
                Text('Option-2'),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        print('Test');
      },child: Icon(Icons.add),),
    );
  }
}