import 'package:flutter/material.dart';

class IncreaseButton extends StatefulWidget {
  const IncreaseButton({super.key});

  @override
  IncreaseButtonState createState() => IncreaseButtonState();
}

class IncreaseButtonState extends State<IncreaseButton> {
  int count = 0;
  void increment() {
    setState(() {});
    count++;
  }

  void decrement() {
    setState(() {
      if (count > 0) {
        count--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent.shade100,
        actions: [Icon(Icons.logout)],
        title: Row(
          children: [
            Icon(Icons.arrow_back),
            SizedBox(width: 80),
            Text(
              'This is an App Bar',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,

                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    color: Colors.grey.shade300,
                    offset: Offset(5, 5),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Text('Count: $count', style: TextStyle(fontSize: 40)),
                ],
              ),
            ),
          ],
        ),
      ),

      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'increment',
            onPressed: increment,
            child: Icon(Icons.add),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            heroTag: 'decrement',
            onPressed: decrement,
            child: Icon(Icons.remove),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
