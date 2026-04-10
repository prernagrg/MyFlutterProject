import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learn/custom_textfield.dart';

class ReviewSheet extends StatefulWidget {
  const ReviewSheet({super.key});

  @override
  State<ReviewSheet> createState() => _ReviewSheetState();
}

class _ReviewSheetState extends State<ReviewSheet> {
  int selectedRating = 0;
  String getEmoji(int rating) {
    switch (rating) {
      case 1:
        return '😡'; // angry
      case 2:
        return '😕'; // unhappy
      case 3:
        return '😐'; // neutral
      case 4:
        return '🙂'; // happy
      case 5:
        return '😍'; // very happy
      default:
        return '😀'; // default
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 20,
        bottom: MediaQuery.of(context).viewInsets.bottom + 20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Drag handle
          Center(
            child: Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),

          // Title Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Write a Review",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: SizedBox(
                  height: 24,
                  child: SvgPicture.asset(
                    'assets/icons/wrong.svg',
                    height: 20,
                    colorFilter: ColorFilter.mode(
                      Colors.redAccent,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 18),

          const Text(
            'Rate this restaurant',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),

          const SizedBox(height: 23),

          // Rating stars
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: List.generate(5, (index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedRating = index + 1;
                      });
                    },
                    child: Padding(
                      padding: EdgeInsets.only(right: 4),
                      child: index < selectedRating
                          ? Icon(Icons.star, color: Color(0xFFFF6929), size: 35)
                          : Icon(
                              Icons.star_border_outlined,
                              size: 35,
                              color: Colors.grey[400],
                            ),
                    ),
                  );
                }),
              ),
              Text(getEmoji(selectedRating), style: TextStyle(fontSize: 24)),
            ],
          ),

          const SizedBox(height: 18),

          const Text(
            'Add Detailed Review',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),

          const SizedBox(height: 16),

          // Text field
          CustomTextField(hintText: "Eg: Don't make it too spicy"),

          SizedBox(height: 14),

          Row(
            children: [
              SvgPicture.asset('assets/icons/camera.svg'),
              SizedBox(width: 8),
              Text(
                'Add Photo',
                style: TextStyle(color: Color(0xFFFF6929), fontSize: 14),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Submit button
          SizedBox(
            width: double.infinity,
            height: 45,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFF6929),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                "Submit",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
