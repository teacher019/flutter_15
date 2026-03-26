import 'package:flutter/material.dart';

class Module13Class1 extends StatefulWidget {
  const Module13Class1({super.key});

  @override
  State<Module13Class1> createState() => _Module13Class1State();
}

class _Module13Class1State extends State<Module13Class1> {
  int number = 0;
  bool isShow = false;
  String LongText = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum";
  bool isReadMore = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(number.toString(),style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold
            ),),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,

              children: [
                ElevatedButton(onPressed: (){

                  setState(() {
                    number++;
                    print(number);
                  });
                }, child: Text('+',style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ))),
                SizedBox(width: 20,),
                ElevatedButton(onPressed: (){
                  setState(() {
                    number--;
                    print(number);
                  });

                }, child: Text('-',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    )
                )),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                obscureText: isShow,
                decoration: InputDecoration(
                    hintText: 'Password',
                    suffixIcon: IconButton(onPressed: (){
                      setState(() {
                        isShow = !isShow;
                      });
                    }, icon: Icon( isShow ? Icons.visibility : Icons.visibility_off))
                ),
              ),
            ),


            IconButton(onPressed: (){
              setState(() {
                isShow = !isShow;
              });
            }, icon: Icon(isShow ? Icons.favorite_border : Icons.favorite , color: Colors.red, size: 70,)),


            Column(
              children: [
                Text(isReadMore ? LongText  :'Lorem Ipsum is simply dummy text of the printing and typesetting'),
                TextButton(onPressed: (){
                  setState(() {
                    isReadMore = !isReadMore;
                  });
                }, child: Text(isReadMore ? 'Hide' : 'Read more'))
              ],
            )
          ],
        ),
      ),
    );
  }
}