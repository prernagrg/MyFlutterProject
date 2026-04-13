import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learn/custom_appBar.dart';
import 'package:learn/filter_sheet.dart';
import 'package:learn/utilities/menu_card.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<String> tabs = [
    "Set Meal",
    "Pizza",
    "Momo",
    "Burger",
    "Drinks",
    "Dessert",
  ];

  //CATEGORY-WISE DATA
  final Map<String, List<Map<String, dynamic>>> menuData = {
    "Set Meal": [
      {
        'image': 'assets/images/momo.jpg',
        'name': 'Set Meal Deluxe',
        'price': 'Rs 500',
        'taste': 'Mild',
        'isVeg': true,
        'isSpicy': false,
        'isPopular': true,
      },
      {
        'image': 'assets/images/momo.jpg',
        'name': 'Set Meal Deluxe',
        'price': 'Rs 500',
        'taste': 'Mild',
        'isVeg': true,
        'isSpicy': false,
        'isPopular': true,
      },
      {
        'image': 'assets/images/momo.jpg',
        'name': 'Set Meal Deluxe',
        'price': 'Rs 500',
        'taste': 'Mild',
        'isVeg': true,
        'isSpicy': false,
        'isPopular': true,
      },
      {
        'image': 'assets/images/momo.jpg',
        'name': 'Set Meal Deluxe',
        'price': 'Rs 500',
        'taste': 'Mild',
        'isVeg': true,
        'isSpicy': false,
        'isPopular': true,
      },
      {
        'image': 'assets/images/momo.jpg',
        'name': 'Set Meal Deluxe',
        'price': 'Rs 500',
        'taste': 'Mild',
        'isVeg': true,
        'isSpicy': false,
        'isPopular': true,
      },
      {
        'image': 'assets/images/momo.jpg',
        'name': 'Set Meal Deluxe',
        'price': 'Rs 500',
        'taste': 'Mild',
        'isVeg': true,
        'isSpicy': false,
        'isPopular': true,
      },
      {
        'image': 'assets/images/momo.jpg',
        'name': 'Set Meal Deluxe',
        'price': 'Rs 500',
        'taste': 'Mild',
        'isVeg': true,
        'isSpicy': false,
        'isPopular': true,
      },
      {
        'image': 'assets/images/momo.jpg',
        'name': 'Set Meal Deluxe',
        'price': 'Rs 500',
        'taste': 'Mild',
        'isVeg': true,
        'isSpicy': false,
        'isPopular': true,
      },
      {
        'image': 'assets/images/momo.jpg',
        'name': 'Set Meal Deluxe',
        'price': 'Rs 500',
        'taste': 'Mild',
        'isVeg': true,
        'isSpicy': false,
        'isPopular': true,
      },
      {
        'image': 'assets/images/momo.jpg',
        'name': 'Set Meal Deluxe',
        'price': 'Rs 500',
        'taste': 'Mild',
        'isVeg': true,
        'isSpicy': false,
        'isPopular': true,
      },
    ],

    "Pizza": [
      {
        'image': 'assets/images/pizza.jpg',
        'name': 'Cheese Pizza',
        'price': 'Rs 450',
        'taste': 'Medium Spicy',
        'isVeg': true,
        'isSpicy': true,
        'isPopular': true,
      },
      {
        'image': 'assets/images/pizza.jpg',
        'name': 'Cheese Pizza',
        'price': 'Rs 450',
        'taste': 'Medium Spicy',
        'isVeg': true,
        'isSpicy': true,
        'isPopular': true,
      },
      {
        'image': 'assets/images/pizza.jpg',
        'name': 'Cheese Pizza',
        'price': 'Rs 450',
        'taste': 'Medium Spicy',
        'isVeg': true,
        'isSpicy': true,
        'isPopular': true,
      },
      {
        'image': 'assets/images/pizza.jpg',
        'name': 'Cheese Pizza',
        'price': 'Rs 450',
        'taste': 'Medium Spicy',
        'isVeg': true,
        'isSpicy': true,
        'isPopular': true,
      },
      {
        'image': 'assets/images/pizza.jpg',
        'name': 'Cheese Pizza',
        'price': 'Rs 450',
        'taste': 'Medium Spicy',
        'isVeg': true,
        'isSpicy': true,
        'isPopular': true,
      },
      {
        'image': 'assets/images/pizza.jpg',
        'name': 'Cheese Pizza',
        'price': 'Rs 450',
        'taste': 'Medium Spicy',
        'isVeg': true,
        'isSpicy': true,
        'isPopular': true,
      },
      {
        'image': 'assets/images/pizza.jpg',
        'name': 'Cheese Pizza',
        'price': 'Rs 450',
        'taste': 'Medium Spicy',
        'isVeg': true,
        'isSpicy': true,
        'isPopular': true,
      },
      {
        'image': 'assets/images/pizza.jpg',
        'name': 'Cheese Pizza',
        'price': 'Rs 450',
        'taste': 'Medium Spicy',
        'isVeg': true,
        'isSpicy': true,
        'isPopular': true,
      },
      {
        'image': 'assets/images/pizza.jpg',
        'name': 'Cheese Pizza',
        'price': 'Rs 450',
        'taste': 'Medium Spicy',
        'isVeg': true,
        'isSpicy': true,
        'isPopular': true,
      },
      {
        'image': 'assets/images/pizza.jpg',
        'name': 'Cheese Pizza',
        'price': 'Rs 450',
        'taste': 'Medium Spicy',
        'isVeg': true,
        'isSpicy': true,
        'isPopular': true,
      },
    ],

    "Momo": [
      {
        'image': 'assets/images/momo.jpg',
        'name': 'Chicken Momo',
        'price': 'Rs 230',
        'taste': 'Spicy',
        'isVeg': false,
        'isSpicy': true,
        'isPopular': true,
      },
      {
        'image': 'assets/images/momo.jpg',
        'name': 'Veg Momo',
        'price': 'Rs 200',
        'taste': 'Mild',
        'isVeg': true,
        'isSpicy': false,
        'isPopular': false,
      },
      {
        'image': 'assets/images/momo.jpg',
        'name': 'Chicken Momo',
        'price': 'Rs 230',
        'taste': 'Spicy',
        'isVeg': false,
        'isSpicy': true,
        'isPopular': true,
      },
      {
        'image': 'assets/images/momo.jpg',
        'name': 'Veg Momo',
        'price': 'Rs 200',
        'taste': 'Mild',
        'isVeg': true,
        'isSpicy': false,
        'isPopular': false,
      },
      {
        'image': 'assets/images/momo.jpg',
        'name': 'Chicken Momo',
        'price': 'Rs 230',
        'taste': 'Spicy',
        'isVeg': false,
        'isSpicy': true,
        'isPopular': true,
      },
      {
        'image': 'assets/images/momo.jpg',
        'name': 'Veg Momo',
        'price': 'Rs 200',
        'taste': 'Mild',
        'isVeg': true,
        'isSpicy': false,
        'isPopular': false,
      },
    ],

    "Burger": [
      {
        'image': 'assets/images/carousel.png',
        'name': 'Chicken Burger',
        'price': 'Rs 350',
        'taste': 'Mild',
        'isVeg': false,
        'isSpicy': false,
        'isPopular': true,
      },
      {
        'image': 'assets/images/carousel.png',
        'name': 'Chicken Burger',
        'price': 'Rs 350',
        'taste': 'Mild',
        'isVeg': false,
        'isSpicy': false,
        'isPopular': true,
      },
      {
        'image': 'assets/images/carousel.png',
        'name': 'Chicken Burger',
        'price': 'Rs 350',
        'taste': 'Mild',
        'isVeg': false,
        'isSpicy': false,
        'isPopular': true,
      },
      {
        'image': 'assets/images/carousel.png',
        'name': 'Chicken Burger',
        'price': 'Rs 350',
        'taste': 'Mild',
        'isVeg': false,
        'isSpicy': false,
        'isPopular': true,
      },
      {
        'image': 'assets/images/carousel.png',
        'name': 'Chicken Burger',
        'price': 'Rs 350',
        'taste': 'Mild',
        'isVeg': false,
        'isSpicy': false,
        'isPopular': true,
      },
      {
        'image': 'assets/images/carousel.png',
        'name': 'Chicken Burger',
        'price': 'Rs 350',
        'taste': 'Mild',
        'isVeg': false,
        'isSpicy': false,
        'isPopular': true,
      },
      {
        'image': 'assets/images/carousel.png',
        'name': 'Chicken Burger',
        'price': 'Rs 350',
        'taste': 'Mild',
        'isVeg': false,
        'isSpicy': false,
        'isPopular': true,
      },
      {
        'image': 'assets/images/carousel.png',
        'name': 'Chicken Burger',
        'price': 'Rs 350',
        'taste': 'Mild',
        'isVeg': false,
        'isSpicy': false,
        'isPopular': true,
      },
      {
        'image': 'assets/images/carousel.png',
        'name': 'Chicken Burger',
        'price': 'Rs 350',
        'taste': 'Mild',
        'isVeg': false,
        'isSpicy': false,
        'isPopular': true,
      },
      {
        'image': 'assets/images/carousel.png',
        'name': 'Chicken Burger',
        'price': 'Rs 350',
        'taste': 'Mild',
        'isVeg': false,
        'isSpicy': false,
        'isPopular': true,
      },
    ],

    "Drinks": [
      {
        'image': 'assets/images/kfc.png',
        'name': 'Cold Drink',
        'price': 'Rs 100',
        'taste': 'Cold',
        'isVeg': true,
        'isSpicy': false,
        'isPopular': false,
      },
      {
        'image': 'assets/images/kfc.png',
        'name': 'Cold Drink',
        'price': 'Rs 100',
        'taste': 'Cold',
        'isVeg': true,
        'isSpicy': false,
        'isPopular': false,
      },
      {
        'image': 'assets/images/kfc.png',
        'name': 'Cold Drink',
        'price': 'Rs 100',
        'taste': 'Cold',
        'isVeg': true,
        'isSpicy': false,
        'isPopular': false,
      },
      {
        'image': 'assets/images/kfc.png',
        'name': 'Cold Drink',
        'price': 'Rs 100',
        'taste': 'Cold',
        'isVeg': true,
        'isSpicy': false,
        'isPopular': false,
      },
      {
        'image': 'assets/images/kfc.png',
        'name': 'Cold Drink',
        'price': 'Rs 100',
        'taste': 'Cold',
        'isVeg': true,
        'isSpicy': false,
        'isPopular': false,
      },
      {
        'image': 'assets/images/kfc.png',
        'name': 'Cold Drink',
        'price': 'Rs 100',
        'taste': 'Cold',
        'isVeg': true,
        'isSpicy': false,
        'isPopular': false,
      },
      {
        'image': 'assets/images/kfc.png',
        'name': 'Cold Drink',
        'price': 'Rs 100',
        'taste': 'Cold',
        'isVeg': true,
        'isSpicy': false,
        'isPopular': false,
      },
      {
        'image': 'assets/images/kfc.png',
        'name': 'Cold Drink',
        'price': 'Rs 100',
        'taste': 'Cold',
        'isVeg': true,
        'isSpicy': false,
        'isPopular': false,
      },
      {
        'image': 'assets/images/kfc.png',
        'name': 'Cold Drink',
        'price': 'Rs 100',
        'taste': 'Cold',
        'isVeg': true,
        'isSpicy': false,
        'isPopular': false,
      },
      {
        'image': 'assets/images/kfc.png',
        'name': 'Cold Drink',
        'price': 'Rs 100',
        'taste': 'Cold',
        'isVeg': true,
        'isSpicy': false,
        'isPopular': false,
      },
      {
        'image': 'assets/images/kfc.png',
        'name': 'Cold Drink',
        'price': 'Rs 100',
        'taste': 'Cold',
        'isVeg': true,
        'isSpicy': false,
        'isPopular': false,
      },
    ],

    "Dessert": [
      {
        'image': 'assets/images/chicken.jpg',
        'name': 'Ice Cream',
        'price': 'Rs 150',
        'taste': 'Sweet',
        'isVeg': true,
        'isSpicy': false,
        'isPopular': true,
      },
      {
        'image': 'assets/images/chicken.jpg',
        'name': 'Ice Cream',
        'price': 'Rs 150',
        'taste': 'Sweet',
        'isVeg': true,
        'isSpicy': false,
        'isPopular': true,
      },
      {
        'image': 'assets/images/chicken.jpg',
        'name': 'Ice Cream',
        'price': 'Rs 150',
        'taste': 'Sweet',
        'isVeg': true,
        'isSpicy': false,
        'isPopular': true,
      },
      {
        'image': 'assets/images/chicken.jpg',
        'name': 'Ice Cream',
        'price': 'Rs 150',
        'taste': 'Sweet',
        'isVeg': true,
        'isSpicy': false,
        'isPopular': true,
      },
      {
        'image': 'assets/images/chicken.jpg',
        'name': 'Ice Cream',
        'price': 'Rs 150',
        'taste': 'Sweet',
        'isVeg': true,
        'isSpicy': false,
        'isPopular': true,
      },
      {
        'image': 'assets/images/chicken.jpg',
        'name': 'Ice Cream',
        'price': 'Rs 150',
        'taste': 'Sweet',
        'isVeg': true,
        'isSpicy': false,
        'isPopular': true,
      },
      {
        'image': 'assets/images/chicken.jpg',
        'name': 'Ice Cream',
        'price': 'Rs 150',
        'taste': 'Sweet',
        'isVeg': true,
        'isSpicy': false,
        'isPopular': true,
      },
      {
        'image': 'assets/images/chicken.jpg',
        'name': 'Ice Cream',
        'price': 'Rs 150',
        'taste': 'Sweet',
        'isVeg': true,
        'isSpicy': false,
        'isPopular': true,
      },
      {
        'image': 'assets/images/chicken.jpg',
        'name': 'Ice Cream',
        'price': 'Rs 150',
        'taste': 'Sweet',
        'isVeg': true,
        'isSpicy': false,
        'isPopular': true,
      },
      {
        'image': 'assets/images/chicken.jpg',
        'name': 'Ice Cream',
        'price': 'Rs 150',
        'taste': 'Sweet',
        'isVeg': true,
        'isSpicy': false,
        'isPopular': true,
      },
      {
        'image': 'assets/images/chicken.jpg',
        'name': 'Ice Cream',
        'price': 'Rs 150',
        'taste': 'Sweet',
        'isVeg': true,
        'isSpicy': false,
        'isPopular': true,
      },
    ],
  };

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppbar(
        isTwoIcon: true,
        icon: const Icon(Icons.call),
        title: 'Menu',
        isBack: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
        child: Column(
          children: [
            // FILTER BAR
            SizedBox(
              height: 50,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildFilterButton(
                      icon: 'assets/icons/Filter.svg',
                      text: 'Filters',
                      showArrow: true,
                    ),
                    _buildFilterButton(
                      icon: 'assets/icons/veg.svg',
                      text: 'Veg',
                    ),
                    _buildFilterButton(
                      icon: 'assets/icons/nonveg.svg',
                      text: 'Non Veg',
                    ),
                    _buildFilterButton(
                      icon: 'assets/icons/veg.svg',
                      text: 'Veg',
                    ),
                    _buildFilterButton(
                      icon: 'assets/icons/nonveg.svg',
                      text: 'Non Veg',
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 4),

            // TAB BAR
            TabBar(
              controller: _tabController,
              isScrollable: true,
              labelColor: Colors.orange,
              unselectedLabelColor: Colors.black,
              indicatorColor: Colors.orange,
              dividerColor: Colors.transparent,
              tabs: tabs.map((tab) => Tab(text: tab)).toList(),
            ),

            const SizedBox(height: 10),

            // TAB CONTENT
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: tabs.map((tab) {
                  final tabItems = menuData[tab] ?? [];

                  return GridView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: tabItems.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          childAspectRatio: 0.75,
                        ),
                    itemBuilder: (context, index) {
                      final item = tabItems[index];

                      return MenuCard(
                        image: item["image"],
                        title: item["name"],
                        price: item["price"],
                        taste: item["taste"],
                        isveg: item["isVeg"],
                        isSpicy: item["isSpicy"],
                        isPopular: item["isPopular"],
                      );
                    },
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // FILTER BUTTON
  Widget _buildFilterButton({
    required String icon,
    required String text,
    bool showArrow = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(right: 7),
      child: InkWell(
        onTap: () => _displayFilterDialog(context),
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: const Color(0xFFCED7E2)),
          ),
          child: Row(
            children: [
              SvgPicture.asset(icon, height: 16, width: 16),
              const SizedBox(width: 8),
              Text(text),
              if (showArrow) const Icon(Icons.arrow_drop_down),
            ],
          ),
        ),
      ),
    );
  }

  // FILTER SHEET
  Future _displayFilterDialog(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          height: 570,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
          ),
          child: const FilterSheet(),
        );
      },
    );
  }
}
