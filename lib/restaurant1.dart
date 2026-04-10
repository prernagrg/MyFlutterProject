import 'package:flutter/material.dart';

class Restaurant1 extends StatelessWidget {
  final String? title;

  const Restaurant1({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                //image
                ClipRRect(
                  child: Image.asset(
                    'assets/images/carousel.img',
                    height: 300,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
