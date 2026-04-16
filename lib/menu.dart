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
  String searchText = '';
  final List<String> tabs = [
    "Set Meal",
    "Pizza",
    "Momo",
    "Burger",
    "Drinks",
    "Dessert",
  ];

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
  ];

  final Map<String, List<Map<String, dynamic>>> menuData = {
    "Set Meal": [
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
    ],
    "Burger": [
      {
        'image': 'assets/images/momo.jpg',
        'name': 'Chicken Momo',
        'price': 'Rs 230',
        'taste': 'Spicy',
        'isVeg': false,
        'isSpicy': true,
        'isPopular': true,
      },
    ],
    "Drinks": [
      {
        'image': 'assets/images/momo.jpg',
        'name': 'Chicken Momo',
        'price': 'Rs 230',
        'taste': 'Spicy',
        'isVeg': false,
        'isSpicy': true,
        'isPopular': true,
      },
    ],
    "Dessert": [
      {
        'image': 'assets/images/momo.jpg',
        'name': 'Chicken Momo',
        'price': 'Rs 230',
        'taste': 'Spicy',
        'isVeg': false,
        'isSpicy': true,
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

      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            // HIDE ON SCROLL
            SliverAppBar(
              backgroundColor: Colors.white,
              expandedHeight: 340,
              floating: false,
              pinned: false,
              automaticallyImplyLeading: false,
              flexibleSpace: FlexibleSpaceBar(
                background: Column(
                  children: [
                    const SizedBox(height: 10),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Container(
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
                    ),

                    const SizedBox(height: 10),

                    // TODAY SPECIAL
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Today's Special",
                            style: TextStyle(fontWeight: FontWeight.w600),
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
                                      showDiscount:
                                          item["showDiscount"] ?? false,
                                      discountText:
                                          item["discountText"] ?? "50% OFF",
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // STICKY HEADER
            SliverPersistentHeader(
              pinned: true,
              delegate: _StickyHeader(
                child: Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      // FILTER
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

                      // TAB BAR
                      TabBar(
                        dividerColor: Colors.transparent,
                        tabAlignment: TabAlignment.start,
                        controller: _tabController,
                        isScrollable: true,
                        labelColor: Colors.orange,
                        unselectedLabelColor: Colors.black,
                        indicatorColor: Colors.orange,
                        tabs: tabs.map((tab) => Tab(text: tab)).toList(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ];
        },

        // GRID CONTENT
        body: TabBarView(
          controller: _tabController,
          children: tabs.map((tab) {
            final items = menuData[tab] ?? [];

            return GridView.builder(
              padding: const EdgeInsets.only(top: 10),
              itemCount: items.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
              ),
              itemBuilder: (context, index) {
                final item = items[index];

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
                  ),
                );
              },
            );
          }).toList(),
        ),
      ),
    );
  }

  // 🔘 FILTER BUTTON
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

  // 📌 BOTTOM SHEET
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

// STICKY HEADER CLASS
class _StickyHeader extends SliverPersistentHeaderDelegate {
  final Widget child;

  _StickyHeader({required this.child});

  @override
  double get minExtent => 110;

  @override
  double get maxExtent => 110;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return child;
  }

  @override
  bool shouldRebuild(_) => false;
}
