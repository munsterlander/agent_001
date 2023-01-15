import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';

class HealthUp extends SpriteComponent {
  HealthUp({
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

  late CircleHitbox hitbox;

  @override
  Future<void>? onLoad() async {
    await add(hitbox = CircleHitbox()..collisionType = CollisionType.passive);
  }

  void collect() {
    hitbox.collisionType = CollisionType.inactive;
    add(
      OpacityEffect.fadeOut(
        EffectController(
          duration: 0.1,
          alternate: true,
          repeatCount: 2,
        ),
        onComplete: () => removeFromParent(),
      ),
    );
  }
}
