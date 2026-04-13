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

  const MenuCard({
    super.key,
    required this.image,
    required this.taste,
    required this.title,
    required this.price,
    this.isPopular = false,
    this.isveg = false,
    this.isSpicy = false,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // IMAGE (fixed height, DO NOT change)
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      image,
                      width: double.infinity,
                      height: 140,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 6,
                    right: 6,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF1FFF4),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: const Color(0xFF17D445)),
                      ),
                      child: const Icon(
                        Icons.add,
                        color: Color(0xFF17D445),
                        size: 18,
                      ),
                    ),
                  ),
                ],
              ),

              // BODY (FLEXIBLE AREA)
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(6),
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
                                color: taste == "Spicy"
                                    ? Colors.red
                                    : Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 6),

                      // TITLE (flexible)
                      Text(
                        title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 13),
                      ),

                      const Spacer(), // KEY FIX (pushes bottom content down)
                      // PROGRESS BAR ROW
                      Row(
                        children: [
                          if (isPopular)
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
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 4),

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
              ),
            ],
          ),
        );
      },
    );
  }
}
