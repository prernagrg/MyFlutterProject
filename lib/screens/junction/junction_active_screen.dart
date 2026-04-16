import 'package:flutter/material.dart';
import 'widgets/junction_app_bar.dart';
import 'widgets/junction_tabs.dart';
import 'widgets/junction_list_view.dart';
import 'widgets/junction_empty_state.dart';
import 'junction_colors.dart';

class JunctionActiveScreen extends StatefulWidget {
  const JunctionActiveScreen({super.key});

  @override
  State<JunctionActiveScreen> createState() => _JunctionActiveScreenState();
}

class _JunctionActiveScreenState extends State<JunctionActiveScreen> {
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: JunctionColors.backgroundWhite,
      appBar: const JunctionAppBar(title: "Your Junction"),
      body: Column(
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
            child: _selectedIndex == 0
                ? const JunctionListView()
                : const JunctionEmptyState(selectedIndex: 1),
          ),
        ],
      ),
    );
  }
}
