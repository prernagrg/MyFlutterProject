import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class JunctionCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final dynamic groupIcon; // Can be IconData or String (path)
  final int activeCount;
  final bool showHeat;

  const JunctionCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.groupIcon,
    this.activeCount = 2,
    this.showHeat = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFF2F2F2)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 15,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildGroupIcon(),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 2),
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF1D1B20),
                        letterSpacing: -0.2,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color(0xFF7A7F94),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              if (showHeat)
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "$activeCount ",
                        style: const TextStyle(
                          color: Color(0xFF1D1B20),
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      ),
                      const Text("🔥", style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ),
            ],
          ),
          const SizedBox(height: 20),
          _buildAvatarStack(),
          const SizedBox(height: 20),
          _buildJoinButton(),
        ],
      ),
    );
  }

  Widget _buildGroupIcon() {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: const Color(0xFFF9F9F9),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Center(child: _getIconWidget()),
      ),
    );
  }

  Widget _getIconWidget() {
    if (groupIcon is String) {
      if ((groupIcon as String).endsWith('.svg')) {
        return SvgPicture.asset(groupIcon as String, width: 24, height: 24);
      } else {
        return Image.asset(groupIcon as String, fit: BoxFit.cover);
      }
    }
    return const Icon(Icons.group_rounded, color: Colors.black, size: 24);
  }

  Widget _buildAvatarStack() {
    return SizedBox(
      height: 34,
      child: Stack(
        children: [
          ...List.generate(3, (index) => _buildAvatar(index)),
          Positioned(
            left: 3 * 18.0,
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFFF2F2F2),
                border: Border.all(color: Colors.white, width: 2),
              ),
              alignment: Alignment.center,
              child: const Text(
                "+2",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF1D1B20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAvatar(int index) {
    return Positioned(
      left: index * 18.0,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 2),
        ),
        child: const CircleAvatar(
          radius: 15,
          backgroundColor: Color(0xFFE0E0E0),
          backgroundImage: AssetImage('assets/images/yummypos.jpg'),
        ),
      ),
    );
  }

  Widget _buildJoinButton() {
    return Container(
      width: double.infinity,
      height: 48,
      decoration: BoxDecoration(
        color: const Color(0xFFFFF2EB),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFFF6A2A).withOpacity(0.25)),
      ),
      alignment: Alignment.center,
      child: const Text(
        "Join Now",
        style: TextStyle(
          color: Color(0xFF586377),
          fontWeight: FontWeight.w600,
          fontSize: 15,
        ),
      ),
    );
  }
}
