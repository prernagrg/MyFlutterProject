import 'package:flutter/material.dart';
import 'widgets/junction_app_bar.dart';
import 'widgets/junction_tabs.dart';
import 'widgets/junction_empty_state.dart';
import 'junction_colors.dart';

class JunctionScreen extends StatefulWidget {
  const JunctionScreen({super.key});

  @override
  State<JunctionScreen> createState() => _JunctionScreenState();
}

class _JunctionScreenState extends State<JunctionScreen> {
  int _selectedIndex = 0;

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
          Expanded(child: JunctionEmptyState(selectedIndex: _selectedIndex)),
        ],
      ),
    );
  }
}
