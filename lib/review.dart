import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learn/custom_appBar.dart';
import 'package:learn/utilities/rating_bar.dart';
import 'package:learn/utilities/review_card.dart';
import 'package:learn/utilities/review_sheet.dart'; // your ReviewCard file

class ReviewPage extends StatefulWidget {
  const ReviewPage({super.key});

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  final List<Map<String, dynamic>> reviews = [
    {
      'name': 'Sanya Sharma',
      'time': '2 months ago',
      'rating': '4.6',
      'comment':
          'Absolutely loved my experience! The staff were extremely friendly and attentive.',
      'profileImage': 'assets/images/UserPhoto.png',
      'images': [
        'assets/images/image1.png',
        'assets/images/image2.png',
        'assets/images/image3.png',
      ],
    },
    {
      'name': 'Ram Singh Bahadur Thapa Kaji',
      'time': '3 months ago',
      'rating': '5',
      'comment': 'Great service and nice environment.',
      'profileImage': 'assets/images/UserPhoto.png',
      'images': [],
    },
    {
      'name': 'Hari Gurung',
      'time': '1 month ago',
      'rating': '4',
      'comment': 'Nice place, will visit again.',
      'profileImage': 'assets/images/UserPhoto.png',
      'images': [],
    },
    {
      'name': 'Anita Rai',
      'time': '5 months ago',
      'rating': '4.5',
      'comment': 'Loved the ambience and friendly staff.',
      'profileImage': 'assets/images/UserPhoto.png',
      'images': [
        'assets/images/image1.png',
        'assets/images/image2.png',
        'assets/images/image3.png',
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppbar(
        isTwoIcon: true,
        icon: SvgPicture.asset('assets/icons/call.svg', width: 20, height: 20),
        title: 'Rating and Review',
        isBack: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.only(bottom: 16),
        itemCount: reviews.length + 1, // +1 for top rating
        itemBuilder: (context, index) {
          if (index == 0) {
            return const TopRatingSection();
          }
          final review = reviews[index - 1];
          return ReviewCard(
            name: review['name'],
            time: review['time'],
            rating: review['rating'],
            comment: review['comment'],
            profileImage: review['profileImage'],
            images: review['images'] != null
                ? List<String>.from(review['images'])
                : null,
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: SizedBox(
          height: 50,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFF6929),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                builder: (context) {
                  return const ReviewSheet();
                },
              );
            },
            child: const Text(
              "Write Review",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TopRatingSection extends StatelessWidget {
  const TopRatingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        border: BorderDirectional(bottom: BorderSide(color: Colors.black12)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Rating and Review', style: TextStyle(fontSize: 16)),
          const SizedBox(height: 12),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 16, right: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Row(
                      children: [
                        Text('4.6', style: TextStyle(fontSize: 20)),
                        Text('/5', style: TextStyle(color: Colors.black45)),
                      ],
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(Icons.star, color: Color(0xFFCFBB00)),
                        Icon(Icons.star, color: Color(0xFFCFBB00)),
                        Icon(Icons.star, color: Color(0xFFCFBB00)),
                        Icon(Icons.star, color: Color(0xFFCFBB00)),
                      ],
                    ),
                  ],
                ),
              ),
              const Expanded(
                child: Column(
                  children: [
                    RatingBar(line: 0.3, value: 32),
                    RatingBar(line: 0.2, value: 16),
                    RatingBar(line: 0.1, value: 8),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
