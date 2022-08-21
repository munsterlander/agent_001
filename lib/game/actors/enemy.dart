import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/painting.dart';

enum EnemyState { idle, shoot, walk }

class Enemy extends PositionComponent {
  Enemy({
    Map<EnemyState, SpriteAnimation>? animations,
    EnemyState? current,
    Map<EnemyState, bool>? removeOnFinish,
    Paint? paint,
    Vector2? position,
    Vector2? size,
    Vector2? scale,
    double? angle,
    Anchor? anchor,
    super.children,
    super.priority,
  }) : _animationGroupComponent = SpriteAnimationGroupComponent<EnemyState>(
          animations: animations,
          current: current,
          removeOnFinish: removeOnFinish,
          paint: paint,
          size: size,
          position: Vector2(0, -size!.y / 4),
        ) {
    add(_animationGroupComponent);
  }

  late CircleHitbox _circleHitbox;
  final SpriteAnimationGroupComponent<EnemyState> _animationGroupComponent;

  @override
  Future<void>? onLoad() {
    debugMode = true;
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
}
