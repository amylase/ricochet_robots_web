enum RobotColors {
  red,
  blue,
  green,
  yellow,
}

class Robot {
  final RobotColors color;

  const Robot({
    required this.color,
  });

  static Robot get red => const Robot(color: RobotColors.red);
  static Robot get blue => const Robot(color: RobotColors.blue);
  static Robot get green => const Robot(color: RobotColors.green);
  static Robot get yellow => const Robot(color: RobotColors.yellow);
}
