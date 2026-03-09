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
    return Column(
      children: [
        Stack(
          children: [
            //foodimagemi
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                foodImage,
                height: 175,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            //hearticon
            Positioned(
              top: 10,
              right: 10,

              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                padding: EdgeInsets.all(5),
                child: Icon(Icons.favorite_border),
              ),
            ),

            //kfc logo
            Positioned(
              bottom: 0,
              left: 0,
              height: 34,
              width: 34,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(8)),
                ),
                padding: EdgeInsets.only(top: 4, left: 2, bottom: 3, right: 5),
                child: Image.asset('assets/images/kfc.png'),
              ),
            ),

            //open
            Positioned(
              bottom: 0,
              left: 34,
              child: Container(
                padding: EdgeInsets.only(left: 8, right: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(8)),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.circle,
                      color: isClose ? Colors.red : Colors.green,
                      size: 8,
                    ),
                    Text(
                      isClose ? 'close' : 'open',
                      style: TextStyle(
                        color: isClose ? Colors.red : Colors.green,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 1)],
            borderRadius: BorderRadius.circular(6),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.62,
                    child: Text(
                      foodname,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(41, 255, 207, 135),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.star,
                          size: 12,
                          color: const Color.fromARGB(152, 234, 172, 80),
                        ),
                        Text(
                          '$rating ($vote)',
                          style: TextStyle(
                            color: const Color.fromARGB(218, 255, 174, 52),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  SvgPicture.asset('assets/icons/timer.svg'),
                  SizedBox(width: 8),
                  Text(
                    time,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(width: 8),
                  Icon(Icons.circle, color: Colors.orange, size: 6),
                  SizedBox(width: 5),
                  Text(
                    minutes,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(width: 8),
                  Icon(Icons.circle, color: Colors.orange, size: 6),
                  SizedBox(width: 5),
                  Text(
                    foodCategory,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              SizedBox(height: 8),
              DottedLine(dashColor: Colors.black12),
              SizedBox(height: 8),
              Row(
                children: [
                  SvgPicture.asset('assets/icons/mdi_bike-fast.svg'),
                  SizedBox(width: 6),
                  Text(
                    'Free delivery',
                    style: TextStyle(
                      fontSize: 14,
                      color: const Color.fromARGB(255, 191, 17, 5),
                    ),
                  ),
                  SizedBox(width: 15),
                  Text('|', style: TextStyle(color: Colors.black12)),
                  SizedBox(width: 4),
                  SvgPicture.asset('assets/icons/Shape.svg'),
                  SizedBox(width: 6),

                  Text(
                    'Buy 1 get one free',
                    style: TextStyle(
                      fontSize: 14,
                      color: const Color.fromARGB(255, 29, 97, 32),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 14),
      ],
    );
  }
}
