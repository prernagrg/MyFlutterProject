import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SpecailMenuCard extends StatelessWidget {
  final String image;
  final String title;
  final String price;
  final bool isSpicy;
  final bool isPopular;
  final String discount;

  const SpecailMenuCard({
    super.key,
    required this.image,
    required this.title,
    required this.price,
    this.isSpicy = false,
    this.isPopular = false,
    this.discount = "",
  });

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Container(
        width: 170,
        height: 185, // 🔥 compact fixed height (important)
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              blurRadius: 4,
              color: Colors.black12,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ================= IMAGE SECTION =================
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(12),
                  ),
                  child: Image.asset(
                    image,
                    height: 80, // 🔥 reduced height
                    width: double.infinity,
                    fit: BoxFit.cover,
                    cacheWidth: 400, // 🚀 performance boost
                  ),
                ),

                // Discount badge
                if (discount.isNotEmpty)
                  Positioned(
                    top: 6,
                    left: 6,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        discount,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 9,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),

                // Add button
                Positioned(
                  bottom: 6,
                  right: 6,
                  child: Container(
                    height: 24,
                    width: 24,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE6F4EA),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Icon(Icons.add, size: 16, color: Colors.green),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 4),

            // ================= DETAILS =================
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Spicy row
                  if (isSpicy)
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/warning.svg',
                          height: 10,
                          width: 10,
                        ),
                        const SizedBox(width: 4),
                        const Text(
                          "Spicy",
                          style: TextStyle(color: Colors.red, fontSize: 10),
                        ),
                      ],
                    ),

                  if (isSpicy) const SizedBox(height: 2),

                  // Title
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(height: 2),

                  // Popular row
                  if (isPopular)
                    Row(
                      children: [
                        Container(
                          width: 14,
                          height: 3,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        const SizedBox(width: 4),
                        const Text(
                          "Highly reordered",
                          style: TextStyle(fontSize: 9, color: Colors.black45),
                        ),
                      ],
                    ),

                  const SizedBox(height: 4),

                  // Price
                  Text(
                    price,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
