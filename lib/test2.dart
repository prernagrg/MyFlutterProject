import 'package:flutter/material.dart';

class Test2 extends StatefulWidget {
  const Test2({super.key});

  @override
  Test2State createState() => Test2State();
}

class Test2State extends State<Test2> {
  String searchText = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade200,
        actions: [Icon(Icons.logout)],
        title: Row(
          children: [
            Icon(Icons.arrow_back),
            SizedBox(width: 80),
            Text('This is an app Bar', style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 6)],
              ),
              margin: EdgeInsets.all(6),
              child: TextField(
                onChanged: (value) {
                  searchText = value;
                },
                decoration: InputDecoration(
                  hintText: 'Search here',
                  prefixIcon: Icon(Icons.search),
                  border: InputBorder.none,
                  suffixIcon: Icon(Icons.mic),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
