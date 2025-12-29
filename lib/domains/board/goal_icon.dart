import 'package:flutter/material.dart';
import 'package:ricochet_robots/domains/board/goal.dart';

IconData getIcon(GoalTypes type) {
  switch (type) {
    case GoalTypes.star:
      return Icons.star;
    case GoalTypes.sun:
      return Icons.wb_sunny;
    case GoalTypes.moon:
      return Icons.nightlight_round;
    case GoalTypes.planet:
      return Icons.language;
    default:
      return Icons.help;
  }
}

