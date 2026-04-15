import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchBar extends StatelessWidget {
  final Function(String) onChanged;

  const SearchBar({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 5)],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          icon: SvgPicture.asset(
            'assets/icons/searchbar.svg',
            height: 19,
            width: 19,
          ),
          hintText: 'Search "biryani"',
          border: InputBorder.none,
          hintStyle: const TextStyle(color: Colors.black45, fontSize: 16),
          suffixIcon: SvgPicture.asset('assets/icons/microphone.svg'),
        ),
      ),
    );
  }
}
