import 'package:agent_001/game/actors/bullet.dart';
import 'package:agent_001/game/game.dart';
import 'package:agent_001/game/level/door.dart';
import 'package:agent_001/game/level/wall_block.dart';
import 'package:agent_001/utils/mouse_click_detector.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

import '../../utils/move_movement_detector.dart';

enum PlayerState { idle, shoot, walk }

class Player extends PositionComponent
    with
        KeyboardHandler,
        CollisionCallbacks,
        MouseMovementDetectorAwareComponent,
        MouseClickDetector,
        HasGameRef<Agent001Game> {
  final SpriteAnimationGroupComponent<PlayerState> _animationGroupComponent;
  late CircleHitbox _circleHitbox;

  Vector2 moveDirection = Vector2.zero();
  double speed = 100;
  bool _firing = false;
  final _fireRateTimer = Timer(1, autoStart: false, repeat: true);

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
  Future<void>? onLoad() {
    add(
      _circleHitbox = CircleHitbox.relative(
        1,
        parentSize: size / 1.5,
        anchor: Anchor.center,
        position: size / 2,
      )..collisionType = CollisionType.active,
    );
    return super.onLoad();
  }

  @override
  void update(double dt) {
    if (!_firing) {
      if (moveDirection.x == 0 && moveDirection.y == 0) {
        _animationGroupComponent.current = PlayerState.idle;
      } else {
        _animationGroupComponent.current = PlayerState.walk;
      }
    } else {
      _animationGroupComponent.current = PlayerState.shoot;
    }
    position += moveDirection * speed * dt;

    _fireRateTimer.update(dt);
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

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    if (other is WallBlock ||
        (other is Door && other.state == DoorState.locked)) {
      if (intersectionPoints.length == 2) {
        final midPoint = (intersectionPoints.elementAt(0) +
                intersectionPoints.elementAt(1)) /
            2;

        final collisionNormal = (_circleHitbox.absoluteCenter - midPoint);

        position += collisionNormal
            .normalized()
            .scaled(_circleHitbox.radius - collisionNormal.length);
      }
    }
    super.onCollision(intersectionPoints, other);
  }

  @override
  bool onMouseClickDown(DragDownInfo info) {
    fire();
    _firing = true;
    _fireRateTimer.onTick = fire;
    _fireRateTimer.start();
    return true;
  }

  @override
  bool onMouseClickUp(DragEndInfo info) {
    _firing = false;
    _fireRateTimer.onTick = null;
    _fireRateTimer.reset();
    return true;
  }

  @override
  bool onMouseClickCancel() {
    _firing = false;
    _fireRateTimer.onTick = null;
    _fireRateTimer.reset();
    return true;
  }

  void fire() {
    _animationGroupComponent.current = PlayerState.shoot;
    final dir = Vector2(0, -1)..rotate(absoluteAngle);
    gameRef.add(
      Bullet(
        direction: dir,
        size: Vector2(2, 3),
        position: absolutePosition + dir * 10,
      ),
    );
  }
}
