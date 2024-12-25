import 'package:flutter/material.dart';


class ActivityBarData {
  final String day;
  final double value;
  final Color color;

  ActivityBarData(this.day, this.value, this.color);
}

class ActivityData {
  final String day;
  final double value;

  ActivityData(this.day, this.value);
}

class ChartData {
  ChartData(this.category, this.value, this.color);

  final String category;
  final double value;
  final Color color;
}