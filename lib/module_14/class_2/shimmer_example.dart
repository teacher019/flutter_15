import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerExample extends StatefulWidget {
  const ShimmerExample({super.key});

  @override
  State<ShimmerExample> createState() => _ShimmerExampleState();
}

class _ShimmerExampleState extends State<ShimmerExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product list'),
      ),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context,index){
            return Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Card(
                child: Container(
                  height: 50,
                  width: double.infinity,
                  color: Colors.white,
                ),
              ),
            );
          }

      ),
    );
  }
}