import 'package:agent_001/game/level/door.dart';
import 'package:flame/components.dart';

class LevelData {
  final int width;
  final int height;
  final double gridSize;
  final String levelName;
  final String levelString;
  final DoorState initialState;
  final int levelIndex;

  const LevelData({
    required this.levelString,
    required this.levelName,
    required this.width,
    required this.height,
    required this.gridSize,
    required this.levelIndex,
    this.initialState = DoorState.locked,
  });

  Vector2 get size => Vector2(width.toDouble(), height.toDouble()) * gridSize;
}
