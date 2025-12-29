#!/usr/bin/env dart

import 'dart:io';
import 'package:args/args.dart';
import 'package:ricochet_robots/domains/board/board.dart';
import 'package:ricochet_robots/domains/board/board_id.dart';

void main(List<String> arguments) {
  final parser = ArgParser()
    ..addOption(
      'n',
      abbr: 'n',
      defaultsTo: '1',
      help: '出力する行数を指定します',
    );

  final results = parser.parse(arguments);
  final count = int.tryParse(results['n'] as String) ?? 1;

  if (count < 1) {
    stderr.writeln('エラー: -n は1以上の整数である必要があります');
    exit(1);
  }

  for (var i = 0; i < count; i++) {
    final board = Board.random;
    final boardId = BoardId.from(board: board);
    print(boardId.encoded);
  }
}

