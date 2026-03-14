import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:learn/custom_appBar.dart';

class RestaurantMenu extends StatelessWidget {
  const RestaurantMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        icon: SvgPicture.asset('assets/icons/call.svg'),
        isBack: false,
        isTwoIcon: true,
        title:
            'This is an AppBar so that this is not done for the extreme line of content',
      ),
    );
  }
}
