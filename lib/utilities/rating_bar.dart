import 'package:flutter/material.dart';

class RatingBar extends StatelessWidget {
  final double line;
  final int value;
  const RatingBar({super.key, required this.line, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          SizedBox(width: 6),
          Icon(Icons.star, size: 16, color: Colors.orange),
          SizedBox(width: 8),

          //progressbar
          SizedBox(
            width: 140,
            child: LinearProgressIndicator(
              value: line,
              backgroundColor: Colors.grey.shade300,
              color: Colors.orange,
              minHeight: 6,
            ),
          ),
          SizedBox(width: 14),
          Text('$value'),
        ],
      ),
    );
  }
}
