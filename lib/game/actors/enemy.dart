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

class Enemy extends PositionComponent
    with HasGameRef<Agent001Game>, CollisionCallbacks {
  final double range = 150;
  final KeyComponent? keyComponent;
  double health = 100;

  Enemy({
    required Vector2 targetPosition,
    this.keyComponent,
    Map<EnemyState, SpriteAnimation>? animations,
    EnemyState? current,
    Map<EnemyState, bool> removeOnFinish = const {},
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
  Future<void> onLoad() async {
    await add(
      _circleHitbox = CircleHitbox.relative(
        1,
        parentSize: size / 1.5,
        anchor: Anchor.center,
        position: size / 2,
      )..collisionType = CollisionType.active,
    );

    await add(
      _PlayerDetector(
        size: Vector2.all(range),
        anchor: Anchor.center,
        position: size / 2,
      ),
    );
  }

  @override
  void update(double dt) {
    if (health > 0) {
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
    }
    super.update(dt);
  }

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    if (health > 0) {
      if (other is Bullet && other.bulletType == BulletType.player) {
        other.removeFromParent();
        AudioManager.playSfx('enemy_hit.wav');

        if (health > 0) {
          health -= 25;
          if (health == 0) {
            _circleHitbox.collisionType = CollisionType.inactive;
            _animationGroupComponent.add(
              OpacityEffect.fadeOut(
                EffectController(
                  duration: 0.1,
                  alternate: true,
                  repeatCount: 2,
                ),
                onComplete: () => die(),
              ),
            );
          }
        }
      }
    }
    super.onCollisionStart(intersectionPoints, other);
  }

  void fire() {
    if (player!.isAlive && health > 0) {
      AudioManager.playSfx('enemy_shoot.wav');
      final dir = player!.absolutePosition - absolutePosition;
      angle = Vector2(0, -1).angleToSigned(dir);
      gameRef.add(
        Bullet(
          bulletType: BulletType.enemy,
          direction: dir,
          size: Vector2(2, 3),
          position: absoluteCenter,
        ),
      );
    }
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
    // ignore: unused_element
    super.scale,
    // ignore: unused_element
    super.angle,
    super.anchor,
    // ignore: unused_element
    super.children,
    // ignore: unused_element
    super.priority,
  });

  @override
  Future<void> onLoad() async {
    await add(CircleHitbox()..collisionType = CollisionType.passive);
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
