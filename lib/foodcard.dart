import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FoodCard extends StatelessWidget {
  final String foodname;
  final String foodImage;
  final String status;
  final double rating;
  final int vote;
  final String time;
  final String minutes;
  final String foodCategory;
  final bool isClose;
  const FoodCard({
    super.key,
    required this.foodname,
    required this.foodImage,
    required this.status,
    required this.rating,
    required this.vote,
    required this.time,
    required this.minutes,
    required this.foodCategory,
    required this.isClose,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              //foodimagemi
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  foodImage,
                  height: 160,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

              //hearticon
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  padding: EdgeInsets.all(6),
                  child: Icon(Icons.favorite_border, size: 20, color: Colors.black54),
                ),
              ),

              //kfc logo cutout effect
              Positioned(
                bottom: 0,
                left: 0,
                height: 38,
                width: 38,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topRight: Radius.circular(10)),
                  ),
                  padding: EdgeInsets.only(top: 4, left: 2, bottom: 4, right: 6),
                  child: Image.asset('assets/images/kfc.png'),
                ),
              ),

              //open status cutout effect
              Positioned(
                bottom: 0,
                left: 38,
                child: Container(
                  padding: EdgeInsets.only(left: 8, right: 12, top: 8, bottom: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topRight: Radius.circular(10)),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.circle,
                        color: isClose ? Colors.red : Colors.green,
                        size: 8,
                      ),
                      SizedBox(width: 4),
                      Text(
                        isClose ? 'Closed' : 'Open',
                        style: TextStyle(
                          color: isClose ? Colors.red : Colors.green,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          // Text Content
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  foodname,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87),
                ),
              ),
              SizedBox(width: 8),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(41, 255, 207, 135),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.star,
                      size: 14,
                      color: const Color.fromARGB(255, 234, 172, 80),
                    ),
                    SizedBox(width: 2),
                    Text(
                      '$rating ($vote)',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 230, 149, 28),
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 6),
          Row(
            children: [
              SvgPicture.asset('assets/icons/timer.svg', height: 14, colorFilter: ColorFilter.mode(Colors.black54, BlendMode.srcIn)),
              SizedBox(width: 4),
              Text(
                time,
                style: TextStyle(fontSize: 13, color: Colors.black54),
              ),
              SizedBox(width: 6),
              Icon(Icons.circle, color: Colors.grey.shade400, size: 4),
              SizedBox(width: 6),
              Text(
                minutes,
                style: TextStyle(fontSize: 13, color: Colors.black54),
              ),
              SizedBox(width: 6),
              Icon(Icons.circle, color: Colors.grey.shade400, size: 4),
              SizedBox(width: 6),
              Text(
                foodCategory,
                style: TextStyle(fontSize: 13, color: Colors.black54),
              ),
            ],
          ),
          SizedBox(height: 12),
          DottedLine(dashColor: Colors.black12),
          SizedBox(height: 12),
          Row(
            children: [
              SvgPicture.asset('assets/icons/mdi_bike-fast.svg', height: 16),
              SizedBox(width: 4),
              Text(
                'Free delivery',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(height: 12, width: 1, color: Colors.black26),
              ),
              SvgPicture.asset('assets/icons/Shape.svg', height: 14),
              SizedBox(width: 4),
              Text(
                'Buy 1 get one free',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: Colors.green.shade700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
