import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:learn/explore.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  int currentIndex = 0;
  String searchText = '';
  String selectedSort = 'Sort by'; //default
  final List<String> sortOptions = [
    'Sort by',
    'Popular',
    'Price: Low to High',
    'Price: High to Low',
    'Rating',
  ];
  String underRs = 'Under Rs 500';
  final List<String> underOptions = [
    'Under Rs 500',
    'Under Rs 1000',
    'Under Rs 1500',
    'Under Rs 2000',
  ];

  String specialCombo = 'Special Combo';
  final List<String> comboOptions = [
    'Special Combo',
    'Momo Combo',
    'Sekuwa Combo',
    'Buffet Street Food Combo',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.blue.withValues(alpha: 0.23),
                Colors.blue.withValues(alpha: 0.2),
                Colors.transparent,
              ],
            ),
          ),
          padding: EdgeInsets.all(24),
          child: Container(
            margin: EdgeInsets.only(top: 25, bottom: 12),
            child: Column(
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/boxicons_location.svg',
                                ),
                                SizedBox(width: 8),
                                Text(
                                  'Ratnachowk',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              'Pokhara, Street No 14',
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            SvgPicture.asset('assets/icons/heart.svg'),
                            SizedBox(width: 8),
                            SvgPicture.asset('assets/icons/notification.svg'),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    //Searchbar
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
                        onChanged: (value) {
                          searchText = value;
                        },
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
                  ],
                ),
                SizedBox(height: 14),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 21, horizontal: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(blurRadius: 5, color: Colors.black12),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Container(
                                height: 55,
                                width: 55,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: AssetImage('assets/images/momo.jpg'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(height: 8),
                              Text('All', style: TextStyle(fontSize: 14)),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                height: 55,
                                width: 55,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/images/pizza.jpg',
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(height: 8),
                              Text('pizza', style: TextStyle(fontSize: 14)),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                height: 55,
                                width: 55,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/images/chowmein.jpg',
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(height: 8),
                              Text('Chowmein', style: TextStyle(fontSize: 14)),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                height: 55,
                                width: 55,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/images/chicken.jpg',
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(height: 8),
                              Text('chicken', style: TextStyle(fontSize: 14)),
                            ],
                          ),
                        ],
                      ),

                      SizedBox(height: 14),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Container(
                              width: 150,
                              padding: EdgeInsets.symmetric(
                                horizontal: 5,
                                vertical: 0,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 5,
                                  ),
                                ],
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  value: selectedSort,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedSort = value!;
                                    });
                                  },
                                  items: sortOptions.map((option) {
                                    return DropdownMenuItem(
                                      value: option,
                                      child: Text(option),
                                    );
                                  }).toList(),
                                  dropdownColor: Colors.white,
                                  style: TextStyle(color: Colors.black),
                                  icon: Icon(Icons.keyboard_arrow_down),
                                  isExpanded: true,
                                  alignment: Alignment.center,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 12),
                          Expanded(
                            child: Container(
                              width: 150,
                              padding: EdgeInsets.symmetric(
                                horizontal: 5,
                                vertical: 0,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 5,
                                  ),
                                ],
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  value: underRs,
                                  onChanged: (value) {
                                    setState(() {
                                      underRs = value!;
                                    });
                                  },
                                  items: underOptions.map((option) {
                                    return DropdownMenuItem(
                                      value: option,
                                      child: Text(option),
                                    );
                                  }).toList(),
                                  dropdownColor: Colors.white,
                                  style: TextStyle(color: Colors.black),
                                  icon: Icon(Icons.keyboard_arrow_down),
                                  isExpanded: true,
                                  alignment: Alignment.center,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 12),
                          Expanded(
                            child: Container(
                              width: 150,
                              padding: EdgeInsets.symmetric(
                                horizontal: 5,
                                vertical: 0,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 5,
                                  ),
                                ],
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  value: specialCombo,
                                  onChanged: (value) {
                                    setState(() {
                                      specialCombo = value!;
                                    });
                                  },
                                  items: comboOptions.map((option) {
                                    return DropdownMenuItem(
                                      value: option,
                                      child: Text(option),
                                    );
                                  }).toList(),
                                  dropdownColor: Colors.white,
                                  style: TextStyle(color: Colors.black),
                                  icon: Icon(Icons.keyboard_arrow_down),
                                  isExpanded: true,
                                  alignment: Alignment.center,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                //carousel
                Column(
                  children: [
                    CarouselSlider(
                      options: CarouselOptions(
                        height: 200,
                        viewportFraction: 1,
                        autoPlay: true,
                        autoPlayAnimationDuration: Duration(milliseconds: 1000),
                        onPageChanged: (index, reason) {
                          setState(() {
                            currentIndex = index;
                          });
                        },
                        enlargeCenterPage: true,
                      ),
                      items:
                          [
                            'assets/images/carousel.png',
                            'assets/images/carousel.png',
                            'assets/images/carousel.png',
                          ].map((i) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Container(
                                  width: double.infinity,
                                  margin: EdgeInsets.symmetric(vertical: 12),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image: AssetImage(i),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                );
                              },
                            );
                          }).toList(),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [0, 1, 2].map((index) {
                        bool isActive = currentIndex == index;

                        return AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          margin: EdgeInsets.symmetric(horizontal: 4),
                          width: isActive ? 20 : 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: isActive ? Colors.black : Colors.grey,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ExplorePage(),
                      ),
                    );
                  },
                  child: const Text("Explore"),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: [Color(0xFFFF6929), Color(0xFFD87A52)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: SvgPicture.asset('assets/icons/scan-code.svg'),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      //navbar
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          padding: EdgeInsets.all(0),
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SvgPicture.asset('assets/icons/home.svg'),
              SvgPicture.asset('assets/icons/restro.svg'),
              SvgPicture.asset('assets/icons/orders.svg'),
              SvgPicture.asset('assets/icons/profile.svg'),
            ],
          ),
        ),
      ),
    );
  }
}
