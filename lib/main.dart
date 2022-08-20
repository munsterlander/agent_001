import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'game/invert_me.dart';

void main() {
  runApp(
    GameWidget<InvertMe>(
      game: InvertMe(),
    ),
  );
}
