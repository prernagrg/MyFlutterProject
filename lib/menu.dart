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
  String searchText = '';

  late TabController _tabController;

  final List<String> tabs = [
    "Set Meal",
    "Pizza",
    "Momo",
    "Burger",
    "Drinks",
    "Dessert",
  ];

  // ✅ TODAY SPECIAL (updated with discount)
  final List<Map<String, dynamic>> todaysSpecial = [
    {
      'image': 'assets/images/pizza.jpg',
      'name': 'Cheese Pizza',
      'price': 'Rs 450',
      'taste': 'Medium Spicy',
      'isVeg': true,
      'isSpicy': true,
      'isPopular': true,
      'showDiscount': true,
      'discountText': '50% OFF',
    },
    {
      'image': 'assets/images/momo.jpg',
      'name': 'Chicken Momo',
      'price': 'Rs 230',
      'taste': 'Spicy',
      'isVeg': false,
      'isSpicy': true,
      'isPopular': true,
      'showDiscount': true,
      'discountText': '60% OFF',
    },
    {
      'image': 'assets/images/chowmein.jpg',
      'name': 'Burger Combo',
      'price': 'Rs 350',
      'taste': 'Mild',
      'isVeg': false,
      'isSpicy': false,
      'isPopular': true,
      'showDiscount': true,
      'discountText': '30% OFF',
    },
  ];

  // ✅ MENU DATA (same structure + discount added)
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
        'showDiscount': true,
        'discountText': '40% OFF',
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
        'showDiscount': true,
        'discountText': '50% OFF',
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
        'showDiscount': true,
        'discountText': '20% OFF',
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
        'showDiscount': true,
        'discountText': '25% OFF',
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // SEARCH BAR
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
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
                  hintStyle: TextStyle(color: Colors.black45, fontSize: 16),
                  suffixIcon: SvgPicture.asset('assets/icons/microphone.svg'),
                  suffixIconConstraints: const BoxConstraints(
                    minHeight: 20,
                    minWidth: 20,
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 10),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Today's Special",
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 12),

                SizedBox(
                  height: 240,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: todaysSpecial.length,
                    itemBuilder: (context, index) {
                      final item = todaysSpecial[index];

                      return Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: SizedBox(
                          width: 160,
                          child: MenuCard(
                            image: item['image'],
                            title: item['name'],
                            price: item['price'],
                            taste: item['taste'],
                            isveg: item['isVeg'],
                            isSpicy: item['isSpicy'],
                            isPopular: item['isPopular'],
                            showDiscount: item["showDiscount"] ?? false,
                            discountText: item["discountText"] ?? "50% OFF",
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 14),

          // FILTER BAR
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: SizedBox(
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
          ),

          const SizedBox(height: 4),

          // TAB BAR
          TabBar(
            tabAlignment: TabAlignment.start,
            dividerColor: Colors.transparent,
            controller: _tabController,
            isScrollable: true,
            labelColor: Colors.orange,
            unselectedLabelColor: Colors.black,
            indicatorColor: Colors.orange,
            tabs: tabs.map((tab) => Tab(text: tab)).toList(),
          ),

          const SizedBox(height: 10),

          // GRID CONTENT
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: tabs.map((tab) {
                final tabItems = menuData[tab] ?? [];

                return GridView.builder(
                  itemCount: tabItems.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.75,
                  ),
                  itemBuilder: (context, index) {
                    final item = tabItems[index];

                    return Padding(
                      padding: EdgeInsets.only(
                        left: index % 2 == 0 ? 16 : 8,
                        right: index % 2 == 0 ? 8 : 16,
                      ),
                      child: MenuCard(
                        image: item["image"],
                        title: item["name"],
                        price: item["price"],
                        taste: item["taste"],
                        isveg: item["isVeg"],
                        isSpicy: item["isSpicy"],
                        isPopular: item["isPopular"],
                        showDiscount: item["showDiscount"] ?? false,
                        discountText: item["discountText"] ?? "50% OFF",
                      ),
                    );
                  },
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

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
              SvgPicture.asset(icon, height: 16),
              const SizedBox(width: 8),
              Text(text),
              if (showArrow) const Icon(Icons.arrow_drop_down),
            ],
          ),
        ),
      ),
    );
  }

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
