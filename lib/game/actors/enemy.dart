import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flutter/painting.dart';

enum EnemyState { idle, shoot, walk }

class Enemy extends PositionComponent {
  late SequenceEffect moveEffect;

  final Vector2 targetA;
  final Vector2 targetB;

  Enemy({
    required Vector2 targetPosition,
    Map<EnemyState, SpriteAnimation>? animations,
    EnemyState? current,
    Map<EnemyState, bool>? removeOnFinish,
    Paint? paint,
    super.position,
    super.size,
    super.scale,
    super.angle,
    super.anchor,
    super.children,
    super.priority,
  })  : _animationGroupComponent = SpriteAnimationGroupComponent<EnemyState>(
          animations: animations,
          current: current,
          removeOnFinish: removeOnFinish,
          paint: paint,
          size: size,
          position: Vector2(0, -size!.y / 4),
        ),
        targetA = targetPosition.clone(),
        targetB = position!.clone() {
    moveEffect = SequenceEffect(
      [
        MoveEffect.to(
          targetPosition,
          EffectController(speed: 50),
          onComplete: () {
            angle = Vector2(0, -1).angleToSigned(targetB - absolutePosition);
          },
        )..removeOnFinish = false,
        MoveEffect.to(
          position.clone(),
          EffectController(speed: 50),
          onComplete: () {
            angle = Vector2(0, -1).angleToSigned(targetA - absolutePosition);
          },
        )..removeOnFinish = false,
      ],
      infinite: true,
    );

    add(_animationGroupComponent);
    add(moveEffect);
  }

  // ignore: unused_field
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
