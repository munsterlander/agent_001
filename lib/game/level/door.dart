import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';

import '../actors/player.dart';

enum DoorState {
  locked,
  unlocked,
}

class Door extends SpriteComponent with CollisionCallbacks {
  Door({
    super.sprite,
    super.paint,
    super.position,
    super.size,
    super.scale,
    super.angle,
    super.anchor,
    super.children,
    super.priority,
  });

  late ShapeHitbox hitbox;
  DoorState _state = DoorState.locked;

  DoorState get state => _state;
  set state(DoorState value) {
    if (_state != value && value == DoorState.unlocked) {
      hitbox.collisionType = CollisionType.inactive;
      add(
        OpacityEffect.fadeOut(
          LinearEffectController(0.5),
          onComplete: () => removeFromParent(),
        ),
      );
    }
    _state = value;
  }

  @override
  Future<void>? onLoad() {
    add(hitbox = RectangleHitbox()..collisionType = CollisionType.passive);
    return super.onLoad();
  }

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    if (other is Player && state == DoorState.locked && other.keyCount == 0) {
      add(
        SequenceEffect(
          [
            MoveByEffect(
              Vector2(1, 0),
              LinearEffectController(0.025),
            ),
            MoveByEffect(
              Vector2(-2, 0),
              LinearEffectController(0.025),
            ),
          ],
          alternate: true,
          repeatCount: 2,
        )..removeOnFinish = true,
      );
    }
    super.onCollisionStart(intersectionPoints, other);
  }
}
