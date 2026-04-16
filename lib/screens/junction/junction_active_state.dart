import 'package:flutter/material.dart';
import 'widgets/junction_app_bar.dart';
import 'widgets/junction_tabs.dart';
import 'widgets/junction_card.dart';
import 'junction_colors.dart';

class JunctionActiveState extends StatefulWidget {
  const JunctionActiveState({super.key});

  @override
  State<JunctionActiveState> createState() => _JunctionActiveStateState();
}

class _JunctionActiveStateState extends State<JunctionActiveState> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: JunctionColors.backgroundGrey,
      appBar: const JunctionAppBar(title: "Your Junction"),
      body: SafeArea(
        child: Column(
          children: [
            JunctionTabs(
              selectedIndex: _selectedIndex,
              onTabSelected: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.only(top: 24, bottom: 20),
                physics: const BouncingScrollPhysics(),
                children: const [
                  JunctionCard(
                    title: "Coffee Break",
                    subtitle: "Friday foodies gang",
                    groupIcon: 'assets/images/yummypos.jpg',
                    showHeat: false,
                  ),
                  JunctionCard(
                    title: "Coffee Break",
                    subtitle: "Friday foodies gang",
                    groupIcon: 'assets/images/momo.jpg',
                    showHeat: true,
                    activeCount: 2,
                  ),
                ],
              ),
            ),
            _buildBottomButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomButton() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 12, 24, 20),
      child: Container(
        height: 52,
        width: double.infinity,
        decoration: BoxDecoration(
          color: JunctionColors.primaryOrange,
          borderRadius: BorderRadius.circular(12),
        ),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.add, color: Colors.white, size: 20),
              SizedBox(width: 8),
              Text(
                "Add Friends",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
