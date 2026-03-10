import 'package:flutter/material.dart';

class CityCard extends StatelessWidget {
  final String img,CityName,ratting;

  const CityCard({
    super.key, required this.img, required this.CityName, required this.ratting,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(img,
          height: 280,
        ),
        Container(

          height: 280,
          color: Colors.black.withOpacity(0.4),
        ),

        Positioned(
          top: 20,
          left: 20,
          child: Container(

            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.blue,
            ),
            child: Text(CityName,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20
              ),
            ),
          ),
        ),

        Positioned(
          top: 20,
          right: 20,
          child: Text('⭐${ratting}',
            style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold
            ),
          ),
        ),

      ],
    );
  }
}