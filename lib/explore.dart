import 'package:flutter/material.dart';
import 'package:learn/foodcard.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  ExplorePageState createState() => ExplorePageState();
}

class ExplorePageState extends State<ExplorePage> {
  final List<Map<String, dynamic>> foodData = [
    {
      'foodname': 'Paneer Malai Tikka Restaurant',
      'foodCategory': 'Indian',
      'foodImage': 'assets/images/explorepizza.png',
      'minutes': '7m',
      'rating': 3.5,
      'status': 'open',
      'time': '27-40 mins',
      'vote': 90,
      'isClose': false,
    },
    {
      'foodname': 'Chicken Burger Hub',
      'foodCategory': 'Fast Food',
      'foodImage': 'assets/images/explorepizza.png',
      'minutes': '5m',
      'rating': 4.2,
      'status': 'closed',
      'time': '20-30 mins',
      'vote': 120,
      'isClose': true,
    },
    {
      'foodname': 'Veggie Delight',
      'foodCategory': 'Vegan',
      'foodImage': 'assets/images/explorepizza.png',
      'minutes': '10m',
      'rating': 4.0,
      'status': 'open',
      'time': '15-25 mins',
      'vote': 75,
      'isClose': false,
    },
    {
      'foodname': 'Pizza Palace',
      'foodCategory': 'Italian',
      'foodImage': 'assets/images/explorepizza.png',
      'minutes': '8m',
      'rating': 4.5,
      'status': 'open',
      'time': '25-35 mins',
      'vote': 200,
      'isClose': true,
    },
    {
      'foodname': 'Sushi Corner',
      'foodCategory': 'Japanese',
      'foodImage': 'assets/images/explorepizza.png',
      'minutes': '12m',
      'rating': 4.7,
      'status': 'closed',
      'time': '30-45 mins',
      'vote': 180,
      'isClose': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 40),
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Explore Restaurant',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Home"),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: foodData.length,
                itemBuilder: (context, index) {
                  final item = foodData[index];
                  return FoodCard(
                    foodCategory: item['foodCategory'],
                    foodImage: item['foodImage'],
                    minutes: item['minutes'],
                    foodname: item['foodname'],
                    rating: item['rating'],
                    status: item['status'],
                    time: item['time'],
                    vote: item['vote'],
                    isClose: item['isClose'],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
