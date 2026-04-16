import 'package:flutter/material.dart';
import 'junction_card.dart';

class JunctionListView extends StatelessWidget {
  const JunctionListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            padding: const EdgeInsets.only(top: 10, bottom: 20),
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
                groupIcon: 'assets/images/yummypos.jpg',
                showHeat: true,
                activeCount: 2,
              ),
            ],
          ),
        ),
        _buildBottomButton(context),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildBottomButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Container(
        height: 58,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFFF6929).withOpacity(0.25),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFFF6929),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.add_rounded, color: Colors.white, size: 22),
              SizedBox(width: 10),
              Text(
                "Create Junction",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
