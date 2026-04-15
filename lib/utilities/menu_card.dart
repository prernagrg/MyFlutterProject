import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MenuCard extends StatelessWidget {
  final String image;
  final String taste;
  final String title;
  final String price;
  final bool isveg;
  final bool isSpicy;
  final bool isPopular;

  // DISCOUNT
  final bool showDiscount;
  final String discountText;

  const MenuCard({
    super.key,
    required this.image,
    required this.taste,
    required this.title,
    required this.price,
    this.isPopular = false,
    this.isveg = false,
    this.isSpicy = false,
    this.showDiscount = false,
    this.discountText = "50% OFF",
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisSize: MainAxisSize.min,
        children: [
          // IMAGE SECTION
          Stack(
            clipBehavior: Clip.none,
            children: [
              // IMAGE
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                child: Image.asset(
                  image,
                  width: double.infinity,
                  height: 140,
                  fit: BoxFit.cover,
                ),
              ),

              // DISCOUNT BADGE (FIXED - GUARANTEED VISIBLE)
              if (showDiscount)
                Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    decoration: const BoxDecoration(
                      color: Color(0xFF239C1B),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8),
                      ),
                    ),
                    child: Text(
                      discountText,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

              // ADD BUTTON
              Positioned(
                bottom: 8,
                right: 8,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF1FFF4),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: const Color(0xFF239C1B)),
                  ),
                  child: const Icon(
                    Icons.add,
                    color: Color(0xFF239C1B),
                    size: 18,
                  ),
                ),
              ),
            ],
          ),

          // BODY
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // TOP ROW
                Row(
                  children: [
                    SvgPicture.asset(
                      isveg
                          ? 'assets/icons/veg.svg'
                          : 'assets/icons/nonveg.svg',
                      height: 12,
                      width: 12,
                    ),
                    const SizedBox(width: 5),

                    if (isSpicy)
                      SvgPicture.asset(
                        'assets/icons/chilli.svg',
                        height: 12,
                        width: 12,
                      ),

                    const SizedBox(width: 5),

                    Expanded(
                      child: Text(
                        taste,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 11,
                          color: taste == "Spicy" ? Colors.red : Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 6),

                // TITLE
                Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 13),
                ),

                const SizedBox(height: 6),

                // POPULAR
                if (isPopular)
                  Row(
                    children: [
                      Container(
                        width: 29,
                        height: 6,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            width: 18,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 6),
                      const Expanded(
                        child: Text(
                          "Highly reordered",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 10, color: Colors.grey),
                        ),
                      ),
                    ],
                  ),

                const SizedBox(height: 6),

                // PRICE
                Text(
                  price,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
