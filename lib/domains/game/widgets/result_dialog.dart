import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ricochet_robots/domains/board/position.dart';
import 'package:ricochet_robots/domains/board/robot.dart';
import 'package:ricochet_robots/domains/game/history.dart';

class ResultDialog extends StatelessWidget {
  final int moves;
  final List<History> histories;
  final void Function() onPressCancel;
  final void Function() onPressButton;

  const ResultDialog({
    Key? key,
    required this.moves,
    required this.histories,
    required this.onPressCancel,
    required this.onPressButton,
  }) : super(key: key);

  String _directionToString(Directions direction) {
    switch (direction) {
      case Directions.right:
        return '>';
      case Directions.left:
        return '<';
      case Directions.down:
        return 'v';
      case Directions.up:
        return '^';
    }
  }

  String _colorToInitial(RobotColors color) {
    switch (color) {
      case RobotColors.red:
        return 'R';
      case RobotColors.blue:
        return 'B';
      case RobotColors.green:
        return 'G';
      case RobotColors.yellow:
        return 'Y';
    }
  }

  String _encodeHistory() {
    return histories
        .map((history) =>
            '${_colorToInitial(history.color)}${_directionToString(history.direction)}')
        .join();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black12,
      child: AlertDialog(
        title: const Text('Congratulations!'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Finished in $moves moves.'),
            const SizedBox(height: 16),
            const Text(
              'Move History:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: Text(
                    histories.isEmpty ? 'No moves recorded.' : _encodeHistory(),
                    style: const TextStyle(
                      fontFamily: 'monospace',
                      fontSize: 16,
                    ),
                  ),
                ),
                if (histories.isNotEmpty)
                  IconButton(
                    icon: const Icon(Icons.copy),
                    onPressed: () {
                      Clipboard.setData(
                        ClipboardData(text: _encodeHistory()),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Move history copied to clipboard'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    },
                    tooltip: 'Copy to clipboard',
                  ),
              ],
            ),
          ],
        ),
        actions: [
          TextButton(onPressed: onPressCancel, child: const Text('Cancel')),
          TextButton(onPressed: onPressButton, child: const Text('Next')),
        ],
      ),
    );
  }
}
