import 'package:flutter/material.dart';
import 'package:ricochet_robots/domains/board/robot.dart';

Color getActualColor(RobotColors color) {
  switch (color) {
    case RobotColors.red:
      return Colors.red;
    case RobotColors.blue:
      return Colors.blue;
    case RobotColors.green:
      return Colors.green;
    case RobotColors.yellow:
      return Colors.amber;
    default:
      return Colors.black;
  }
}

