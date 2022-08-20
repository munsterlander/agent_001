import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';

import '../actors/player.dart';

enum DoorState {
  locked,
  unlocked,
}

class Door extends SpriteComponent with CollisionCallbacks {
  DoorState state = DoorState.locked;

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

  @override
  Future<void>? onLoad() {
    add(RectangleHitbox()..collisionType = CollisionType.passive);
    return super.onLoad();
  }

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    if (other is Player && state == DoorState.locked) {
      add(
        SequenceEffect(
          [
            MoveByEffect(
              Vector2(2, 0),
              LinearEffectController(0.025),
            ),
            MoveByEffect(
              Vector2(-4, 0),
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
