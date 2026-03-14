import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:learn/foodcard.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  ExplorePageState createState() => ExplorePageState();
}

class ExplorePageState extends State<ExplorePage> {
  late ScrollController _scrollController;
  bool _isScrolled = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()
      ..addListener(() {
        if (_scrollController.hasClients &&
            _scrollController.offset >
                (MediaQuery.of(context).size.height * 0.3 - 100)) {
          if (!_isScrolled) setState(() => _isScrolled = true);
        } else {
          if (_isScrolled) setState(() => _isScrolled = false);
        }
      });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

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
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * 0.43,
            child: Image.asset('assets/images/map.png', fit: BoxFit.cover),
          ),
          CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverAppBar(
                automaticallyImplyLeading: false,
                expandedHeight: MediaQuery.of(context).size.height * 0.35,
                pinned: true,
                backgroundColor: _isScrolled
                    ? Colors.white
                    : Colors.transparent,
                surfaceTintColor: Colors.transparent,
                elevation: 0,
                toolbarHeight: 130,
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 8),
                    // Search Bar
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(color: Colors.black12, blurRadius: 5),
                        ],
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      child: TextField(
                        onChanged: (value) {},
                        decoration: InputDecoration(
                          icon: SvgPicture.asset(
                            'assets/icons/searchbar.svg',
                            height: 19,
                            width: 19,
                          ),
                          hintText: 'Search "biryani"',
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                            color: Colors.black45,
                            fontSize: 16,
                          ),
                          suffixIcon: SvgPicture.asset(
                            'assets/icons/microphone.svg',
                          ),
                          suffixIconConstraints: const BoxConstraints(
                            minHeight: 20,
                            minWidth: 20,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          _buildChip(Icons.tune, 'Filters'),
                          SizedBox(width: 8),
                          _buildChip(Icons.swap_vert, 'Sort By'),
                          SizedBox(width: 8),
                          _buildChip(
                            Icons.thumb_up_alt_outlined,
                            'Highly Recommend',
                          ),
                          SizedBox(width: 8),
                          _buildChip(
                            Icons.thumb_up_alt_outlined,
                            'Highly Recommend',
                          ),
                          SizedBox(width: 8),
                          _buildChip(
                            Icons.thumb_up_alt_outlined,
                            'Highly Recommend',
                          ),
                          SizedBox(width: 8),
                          _buildChip(
                            Icons.thumb_up_alt_outlined,
                            'Highly Recommend',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              sliverContainer(
                sliver: SliverPadding(
                  padding: EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 20,
                    bottom: 10,
                  ),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      final item = foodData[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: FoodCard(
                          foodCategory: item['foodCategory'],
                          foodImage: item['foodImage'],
                          minutes: item['minutes'],
                          foodname: item['foodname'],
                          rating: item['rating'],
                          status: item['status'],
                          time: item['time'],
                          vote: item['vote'],
                          isClose: item['isClose'],
                        ),
                      );
                    }, childCount: foodData.length),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget sliverContainer({required Widget sliver}) {
    return SliverToBoxAdapter(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: _isScrolled
              ? BorderRadius.zero
              : BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
        ),
        child: CustomScrollView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          slivers: [sliver],
        ),
      ),
    );
  }

  Widget _buildChip(IconData icon, String label) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(icon, size: 16, color: Colors.black87),
          SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
