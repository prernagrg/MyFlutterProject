import 'package:flutter/material.dart';

class FoodCardStyle {
  final Color textColor;

  const FoodCardStyle({required this.textColor});

  static FoodCardStyle fromStatus(String status) {
    return FoodCardStyle(
      textColor: status == 'open' ? Colors.green : Colors.red,
    );
  }
}
