import 'package:flutter/material.dart';

class MyhomePage extends StatelessWidget {
  final String? title;
  const MyhomePage({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent.shade100,
        actions: [Icon(Icons.logout)],
        title: Row(
          children: [
            Icon(Icons.arrow_back),
            Text(
              'This is an AppBar',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.all(Radius.circular(12)),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    color: Colors.grey.shade300,
                    offset: Offset(5, 5),
                  ),
                ],
              ),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Only because I save my best replies for you',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.copy, size: 20, color: Colors.grey.shade700),
                      SizedBox(width: 4),
                      Icon(Icons.share, size: 20, color: Colors.grey.shade700),
                      SizedBox(width: 4),
                      Icon(
                        Icons.heart_broken_outlined,
                        size: 20,
                        color: Colors.grey.shade700,
                      ),
                      SizedBox(width: 4),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 20,
                    color: Colors.grey.shade300,
                    offset: Offset(5, 5),
                  ),
                ],
              ),
              width: double.infinity,
              child: Column(
                children: [
                  Text(
                    'A Simple Form ',
                    style: TextStyle(
                      color: Colors.blueAccent.shade100,
                      fontSize: 30,
                    ),
                  ),
                  SizedBox(height: 15),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Enter Your Name',
                      hintText: 'Type here ...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Enter Your Password',
                      hintText: 'Type here ...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 100),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: SizedBox(
                      width: double.infinity,
                      child: TextButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(15),
                          backgroundColor: Colors.blueAccent.shade100,
                        ),
                        child: Text(
                          'Submit',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Text(
                    'The sky above the quiet valley shimmered in shades of amber and violet as the sun slowly disappeared behind the hills. A gentle breeze moved through the tall grass, carrying with it the scent of rain and distant pine trees. Somewhere near the riverbank, a lantern flickered to life, casting soft golden reflections across the rippling water.',
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Text(
                    'The sky above the quiet valley shimmered in shades of amber and violet as the sun slowly disappeared behind the hills. A gentle breeze moved through the tall grass, carrying with it the scent of rain and distant pine trees. Somewhere near the riverbank, a lantern flickered to life, casting soft golden reflections across the rippling water.',
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Text(
                    'The sky above the quiet valley shimmered in shades of amber and violet as the sun slowly disappeared behind the hills. A gentle breeze moved through the tall grass, carrying with it the scent of rain and distant pine trees. Somewhere near the riverbank, a lantern flickered to life, casting soft golden reflections across the rippling water.',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
