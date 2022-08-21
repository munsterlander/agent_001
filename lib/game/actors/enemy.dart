import 'package:agent_001/game/actors/player.dart';
import 'package:agent_001/game/game.dart';
import 'package:agent_001/game/level/key_component.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/geometry.dart';
import 'package:flutter/painting.dart';

import '../../utils/audio_manager.dart';
import 'bullet.dart';

enum EnemyState { idle, shoot, walk }

class Enemy extends PositionComponent with HasGameRef<Agent001Game> {
  final double range = 150;
  final KeyComponent? keyComponent;

  Enemy({
    required Vector2 targetPosition,
    this.keyComponent,
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

  late SequenceEffect moveEffect;

  final Vector2 targetA;
  final Vector2 targetB;

  Player? player;
  bool get isPlayerInRange => player != null;

  bool _firing = false;
  set firing(bool value) {
    _firing = value;

    if (_firing) {
      moveEffect.pause();

      if (_fireRateTimer.finished || _fireRateTimer.progress == 0) {
        fire();
        _fireRateTimer.onTick = fire;
        _fireRateTimer.start();
      }
    } else {
      moveEffect.resume();
      _fireRateTimer.onTick = null;
      _fireRateTimer.reset();
    }
  }

  final _fireRateTimer = Timer(0.3, autoStart: false);

  // ignore: unused_field
  late CircleHitbox _circleHitbox;
  final SpriteAnimationGroupComponent<EnemyState> _animationGroupComponent;

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

    add(
      _PlayerDetector(
        size: Vector2.all(range),
        anchor: Anchor.center,
        position: size / 2,
      ),
    );
    return super.onLoad();
  }

  @override
  void update(double dt) {
    if (isPlayerInRange) {
      final relVec = (player!.absolutePosition - absolutePosition);
      if (relVec.length < range) {
        final forwardVec = Vector2(0, -1)..rotate(angle);
        relVec.normalize();
        if (forwardVec.dot(relVec) > 0.6) {
          final result = gameRef.collisionDetection
              .raycast(Ray2(origin: absoluteCenter, direction: relVec));
          if (result != null &&
              result.hitbox != null &&
              result.hitbox!.parent! is Player) {
            firing = true;
          } else {
            firing = false;
          }
        } else {
          firing = false;
        }
      } else {
        firing = false;
        player = null;
      }
    }

    _fireRateTimer.update(dt);
    super.update(dt);
  }

  void fire() {
    AudioManager.playSfx('enemy_shoot.wav');
    final dir = player!.absolutePosition - absolutePosition;
    angle = Vector2(0, -1).angleToSigned(dir);
    gameRef.add(
      Bullet(
        direction: dir,
        size: Vector2(2, 3),
        position: absoluteCenter,
      ),
    );
  }

  void die() {
    if (keyComponent != null) {
      keyComponent?.position = absolutePosition;
      gameRef.add(keyComponent!);
    }
    removeFromParent();
  }
}

class _PlayerDetector extends PositionComponent
    with CollisionCallbacks, ParentIsA<Enemy> {
  _PlayerDetector({
    super.position,
    required super.size,
    super.scale,
    super.angle,
    super.anchor,
    super.children,
    super.priority,
  });

  @override
  Future<void>? onLoad() {
    add(CircleHitbox()..collisionType = CollisionType.passive);
    return super.onLoad();
  }

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    if (other is Player) {
      parent.player = other;
    }
    super.onCollisionStart(intersectionPoints, other);
  }
}
