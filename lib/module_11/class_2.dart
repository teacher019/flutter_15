import 'package:flutter/material.dart';
import 'package:flutter_15/module_11/widget/city_card.dart';
class Module11Class2 extends StatelessWidget {
  const Module11Class2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stack'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Stack(
                children: [
                  Container(
                    color: Colors.red,
                    height: 200,
                    width: 200,
                  ),
                  Positioned(
                    left: 20,
                    top: 20,
                    child: Container(
                      color: Colors.blue,
                      height: 150,
                      width: 150,
                    ),
                  ),
                  Positioned(
                    left: 45,
                    top: 45,
                    child: Container(
                      color: Colors.green,
                      height: 100,
                      width: 100,
                    ),
                  ),

                ],
              ),

              SizedBox(height: 15,),


              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CityCard(img: 'https://media.istockphoto.com/id/1210768445/photo/skyscraper-in-dhaka-metropolitan-area.jpg?s=612x612&w=0&k=20&c=qGFV2qpVXkUNtm8KYT2avrSZwcBcoeM9wIp4LdADgrI=', CityName: 'Dhaka', ratting: '3.8',),
                    SizedBox(width: 10,),
                    CityCard(img: 'https://media-cdn.tripadvisor.com/media/photo-s/1b/4e/60/58/cox-s-bazar-is-a-town.jpg', CityName: 'cox', ratting: '4.8',),
                    CityCard(
                      img:
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTtdUhaC5rpDkzKbopf5UF90ccKowzRiYxE8A&s',
                      CityName: 'Sylhet ',
                      ratting: '4.9',
                    ),
                  ],
                ),
              ),

              SizedBox(height: 15,),





              Stack(
                children: [
                  Image.network('https://images.unsplash.com/photo-1566073771259-6a8506099945'),

                  Container(

                    height: 180,
                    color: Colors.black.withOpacity(0.4),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Positioned(
                        top: 10,
                        left: 10,
                        child: Container(

                          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.green,
                          ),
                          child: Text('BEST DEAL',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20
                            ),
                          ),
                        ),
                      ),

                      IconButton(onPressed: (){}, icon: Icon(Icons.favorite,color: Colors.red,))
                    ],
                  )
                ],
              ),

              SizedBox(height: 10,),

              Stack(
                children: [
                  Image.network('https://images.unsplash.com/photo-1566073771259-6a8506099945'),

                  Positioned(
                      bottom: 20,
                      left: 20,
                      right: 20,
                      child: ElevatedButton(onPressed: (){}, child: Text('Book now')))
                ],
              )


            ],
          ),
        ),
      ),
    );
  }
}