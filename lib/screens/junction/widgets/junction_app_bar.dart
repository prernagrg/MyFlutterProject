import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../junction_colors.dart';

class JunctionAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const JunctionAppBar({super.key, required this.title});

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: JunctionColors.backgroundWhite,
      elevation: 0,
      scrolledUnderElevation: 0,
      titleSpacing: 0,
      leading: Padding(
        padding: const EdgeInsets.only(left: 24, top: 12, bottom: 8),
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFFF2F2F2), width: 1.5),
          ),
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Color(0xFF1D1B20), size: 20),
            onPressed: () => Navigator.of(context).pop(),
            padding: EdgeInsets.zero,
          ),
        ),
      ),
      title: const Text(
        "Your Junction",
        style: TextStyle(
          color: Color(0xFF1D1B20),
          fontSize: 18,
          fontWeight: FontWeight.w700,
          letterSpacing: -0.5,
        ),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            'assets/icons/personadd.svg',
            width: 28,
            height: 28,
          ),
        ),
        IconButton(
          icon: const Icon(Icons.more_vert_rounded, color: Color(0xFF1D1B20), size: 26),
          onPressed: () {},
        ),
        const SizedBox(width: 12),
      ],
    );
  }
}
