import 'package:flutter/material.dart';
import '../junction_colors.dart';

class JunctionEmptyState extends StatelessWidget {
  final int selectedIndex;

  const JunctionEmptyState({super.key, this.selectedIndex = 0});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 60),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: AspectRatio(
            aspectRatio: 1,
            child: Image.asset(
              'assets/images/yummypos.jpg',
              fit: BoxFit.contain,
            ),
          ),
        ),
        const SizedBox(height: 48),
        const Text(
          "No Junction Yet",
          style: TextStyle(
            fontFamily: 'Poppins',
            color: JunctionColors.primaryOrange,
            fontSize: 18,
            letterSpacing: -0.2,
            height: 1.5,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 16),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 48),
          child: Text(
            "Create a junction and start hanging out with your squad.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Poppins',
              color: JunctionColors.textGrey,
              fontSize: 14,
              letterSpacing: -0.2,
              height: 1.5,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        const Spacer(),
        _buildBottomButton(context),
        const SizedBox(height: 32),
      ],
    );
  }

  Widget _buildBottomButton(BuildContext context) {
    String label = selectedIndex == 0 ? "Create Junction" : "Add Friends";

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        height: 56,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: JunctionColors.primaryOrange.withOpacity(0.2),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: JunctionColors.primaryOrange,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.add, color: Colors.white, size: 20),
              const SizedBox(width: 18),
              Text(
                label,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  color: Colors.black,
                  fontSize: 14,
                  letterSpacing: 0.4,
                  height: 1.5,
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
