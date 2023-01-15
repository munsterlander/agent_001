import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

class WallBlock extends SpriteComponent {
  WallBlock({
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
  Future<void> onLoad() async {
    await add(RectangleHitbox()..collisionType = CollisionType.passive);
  }
}
