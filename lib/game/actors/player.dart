import 'package:flame/components.dart';

enum PlayerState { idle, shooting }

class Player extends SpriteAnimationGroupComponent<PlayerState> {
  Player({
    super.animations,
    super.current,
    super.removeOnFinish,
    super.paint,
    super.position,
    super.size,
    super.scale,
    super.angle,
    super.anchor,
    super.children,
    super.priority,
  });
}
