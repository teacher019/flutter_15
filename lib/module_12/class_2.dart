import 'package:flutter/material.dart';
import 'package:flutter_15/module_11/Grid_view.dart';
import 'package:flutter_15/module_11/class_1.dart';
import 'package:flutter_15/module_11/class_3.dart';
import 'package:flutter_15/module_11/widget/city_card.dart';

class Module12Class2 extends StatelessWidget {
  const Module12Class2({super.key});



  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: Text('Tabbar'),

          bottom: TabBar(
              indicator: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(10)
              ),
              indicatorPadding: EdgeInsets.all(1),
              labelColor: Colors.white,
              unselectedLabelColor: Colors.purple,
              unselectedLabelStyle: TextStyle(
                  fontSize: 18,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.black
              ),

              tabs: [
                Tab(
                  icon: Icon(Icons.home),
                  text: 'Home',
                ),
                Tab(
                  icon: Icon(Icons.favorite),
                  text: 'Fav',
                ),
                Tab(
                  icon: Icon(Icons.settings),
                  text: 'Setting',
                ),
              ]),

        ),

        body: TabBarView(children: [
          // Container(color: Colors.red,),
          // Container(color: Colors.green,),
          // Container(color: Colors.orange,),

          // Module11class1(),
          // Alert(),
          // Gridv(),

          Column(
            children: [
              CityCard(img: 'https://media.istockphoto.com/id/1210768445/photo/skyscraper-in-dhaka-metropolitan-area.jpg?s=612x612&w=0&k=20&c=qGFV2qpVXkUNtm8KYT2avrSZwcBcoeM9wIp4LdADgrI=', CityName: 'Dhaka', ratting: '3.8',),
              CityCard(img: 'https://media.istockphoto.com/id/1210768445/photo/skyscraper-in-dhaka-metropolitan-area.jpg?s=612x612&w=0&k=20&c=qGFV2qpVXkUNtm8KYT2avrSZwcBcoeM9wIp4LdADgrI=', CityName: 'Dhaka', ratting: '3.8',),
            ],
          ),

          CityCard(img: 'https://media-cdn.tripadvisor.com/media/photo-s/1b/4e/60/58/cox-s-bazar-is-a-town.jpg', CityName: 'cox', ratting: '4.8',),
          CityCard(
            img:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTtdUhaC5rpDkzKbopf5UF90ccKowzRiYxE8A&s',
            CityName: 'Sylhet ',
            ratting: '4.9',
          ),

        ]),
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(child: Column(
                children: [
                  CircleAvatar(
                    radius:42,
                    backgroundImage: NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrN3fMD9X1_p5b6lRSCGcpDtH9BcgEOsEZLg&s'
                    ),
                  ),
                  Text('Taufiqur Sabbir',
                    style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                  ),
                  Text('a@b.com',
                    style: TextStyle(fontSize: 14,),
                  ),
                ],
              )),



              ListTile(
                leading: Icon(Icons.home),
                title: Text('Dahboard'),

              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Dahboard'),

              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Dahboard'),

              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Dahboard'),

              ),
            ],
          ),
        ),
        endDrawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(child: Column(
                children: [
                  CircleAvatar(
                    radius:42,
                    backgroundImage: NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrN3fMD9X1_p5b6lRSCGcpDtH9BcgEOsEZLg&s'
                    ),
                  ),
                  Text('Taufiqur Sabbir',
                    style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                  ),
                  Text('a@b.com',
                    style: TextStyle(fontSize: 14,),
                  ),
                ],
              )),



              ListTile(
                leading: Icon(Icons.home),
                title: Text('Dahboard'),

              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Dahboard'),

              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Dahboard'),

              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Dahboard'),

              ),
            ],
          ),
        ),
      ),
    );
  }
}