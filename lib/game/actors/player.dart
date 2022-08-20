import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

import '../../utils/move_movement_detector.dart';

enum PlayerState { idle, shoot, walk }

class Player extends PositionComponent
    with KeyboardHandler, MouseMovementDetectorAwareComponent {
  final SpriteAnimationGroupComponent<PlayerState> _animationGroupComponent;
  Vector2 moveDirection = Vector2.zero();
  double speed = 100;

  Player({
    Map<PlayerState, SpriteAnimation>? animations,
    PlayerState? current,
    Map<PlayerState, bool>? removeOnFinish,
    Paint? paint,
    super.position,
    super.size,
    super.scale,
    super.angle,
    super.anchor,
    super.children,
    super.priority,
  }) : _animationGroupComponent = SpriteAnimationGroupComponent<PlayerState>(
          animations: animations,
          current: current,
          removeOnFinish: removeOnFinish,
          paint: paint,
          size: size,
          position: Vector2(0, -size!.y / 4),
        ) {
    add(_animationGroupComponent);
  }

  @override
  void update(double dt) {
    if (moveDirection.x == 0 && moveDirection.y == 0) {
      _animationGroupComponent.current = PlayerState.idle;
    } else {
      _animationGroupComponent.current = PlayerState.walk;
    }
    position += moveDirection * speed * dt;
    super.update(dt);
  }

  @override
  bool onKeyEvent(RawKeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    moveDirection.x = 0;
    moveDirection.y = 0;

    moveDirection.y += (keysPressed.contains(LogicalKeyboardKey.keyW) ||
            keysPressed.contains(LogicalKeyboardKey.arrowUp))
        ? -1
        : 0;
    moveDirection.y += (keysPressed.contains(LogicalKeyboardKey.keyS) ||
            keysPressed.contains(LogicalKeyboardKey.arrowDown))
        ? 1
        : 0;
    moveDirection.x += (keysPressed.contains(LogicalKeyboardKey.keyA) ||
            keysPressed.contains(LogicalKeyboardKey.arrowLeft))
        ? -1
        : 0;
    moveDirection.x += (keysPressed.contains(LogicalKeyboardKey.keyD) ||
            keysPressed.contains(LogicalKeyboardKey.arrowRight))
        ? 1
        : 0;

    moveDirection.normalize();

    return true;
  }

  @override
  bool onMouseMove(PointerHoverInfo info) {
    angle = Vector2(0, -1).angleToSigned(info.eventPosition.game - position);
    return true;
  }
}
