import 'package:flame/components.dart';

class LevelData {
  final int width;
  final int height;
  final double gridSize;
  final String levelName;
  final String levelString;

  const LevelData({
    required this.levelString,
    required this.levelName,
    required this.width,
    required this.height,
    required this.gridSize,
  });

  Vector2 get size => Vector2(width.toDouble(), height.toDouble()) * gridSize;
}
