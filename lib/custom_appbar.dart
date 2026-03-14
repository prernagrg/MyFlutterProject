import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isBack;
  final bool isTwoIcon;
  final Widget? icon;
  const CustomAppbar({
    super.key,
    required this.isTwoIcon,
    required this.icon,
    required this.title,
    required this.isBack,
  });

  @override
  Size get preferredSize => const Size.fromHeight(67);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        height: 67,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                isBack
                    ? Container(
                        width: 39,
                        height: 39,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: const Icon(Icons.arrow_back, size: 20),
                      )
                    : SizedBox(),
                isBack ? SizedBox(width: 14) : SizedBox(),
                SizedBox(
                  width: 213,
                  child: Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                isTwoIcon
                    ? Container(
                        padding: EdgeInsets.all(9.5),
                        child:
                            icon ?? SvgPicture.asset('assets/icons/call.svg'),
                      )
                    : SizedBox(),
                SizedBox(width: 8),
                Container(
                  padding: EdgeInsets.all(9.5),
                  child: SvgPicture.asset('assets/icons/more.svg'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
