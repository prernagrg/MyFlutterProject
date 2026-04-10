import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learn/custom_appBar.dart';
import 'package:learn/filter_sheet.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<String> tabs = ["All", "Pizza", "Burger", "Drinks", "Dessert"];

  final List<String> filters = ["Veg", "Non-Veg", "Popular", "New", "Offers"];
  final List<Map<String, String>> items = List.generate(
    10,
    (index) => {"name": "Item $index", "price": "\$${index + 5}"},
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppbar(
        isTwoIcon: true,
        icon: Icon(Icons.call),
        title: 'Menu',
        isBack: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 0, bottom: 24),
        child: Column(
          children: [
            //Filter sheet horizontal scroll
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      _displayFilterDialog(context);
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: Color(0xFFCED7E2), width: 1),
                      ),
                      child: Container(
                        padding: EdgeInsets.all(0),
                        child: Row(
                          children: [
                            SvgPicture.asset('assets/icons/Filter.svg'),
                            SizedBox(width: 8),
                            Text('Filters'),
                            SizedBox(width: 6),
                            Icon(Icons.arrow_drop_down),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 7),
                  InkWell(
                    onTap: () {
                      _displayFilterDialog(context);
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: Color(0xFFCED7E2), width: 1),
                      ),
                      child: Container(
                        padding: EdgeInsets.all(0),
                        child: Row(
                          children: [
                            SvgPicture.asset('assets/icons/veg.svg'),
                            SizedBox(width: 8),
                            Text('Veg'),
                            SizedBox(width: 6),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 7),
                  InkWell(
                    onTap: () {
                      _displayFilterDialog(context);
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: Color(0xFFCED7E2), width: 1),
                      ),
                      child: Container(
                        padding: EdgeInsets.all(0),
                        child: Row(
                          children: [
                            SvgPicture.asset('assets/icons/nonveg.svg'),
                            SizedBox(width: 8),
                            Text('Non veg'),
                            SizedBox(width: 6),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 7),
                  InkWell(
                    onTap: () {
                      _displayFilterDialog(context);
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: Color(0xFFCED7E2), width: 1),
                      ),
                      child: Container(
                        padding: EdgeInsets.all(0),
                        child: Row(
                          children: [
                            SvgPicture.asset('assets/icons/veg.svg'),
                            SizedBox(width: 8),
                            Text('Veg'),
                            SizedBox(width: 6),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 7),
                  InkWell(
                    onTap: () {
                      _displayFilterDialog(context);
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: Color(0xFFCED7E2), width: 1),
                      ),
                      child: Container(
                        padding: EdgeInsets.all(0),
                        child: Row(
                          children: [
                            SvgPicture.asset('assets/icons/nonveg.svg'),
                            SizedBox(width: 8),
                            Text('Non veg'),
                            SizedBox(width: 6),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //Tabbar
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: tabs.map((tab) {
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 0.8,
                    ),
                    itemBuilder: (context, index) {
                      final item = items[index];

                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.orange.shade50,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.fastfood, size: 40),
                            const SizedBox(height: 10),
                            Text(item["name"]!),
                            Text(item["price"]!),
                          ],
                        ),
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

  Future _displayFilterDialog(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          height: 570,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: FilterSheet(),
        );
      },
    );
  }
}
