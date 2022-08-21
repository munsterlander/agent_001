import 'package:agent_001/game/level/wall_block.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

class Bullet extends RectangleComponent with CollisionCallbacks {
  double speed = 300;
  final Vector2 direction;

  Bullet({
    required this.direction,
    super.position,
    super.size,
    super.angle,
    super.anchor,
    super.children,
    super.priority,
    super.paint,
  }) {
    direction.normalize();
    angle = Vector2(0, -1).angleToSigned(direction);
  }

  @override
  Future<void>? onLoad() {
    add(RectangleHitbox()..collisionType = CollisionType.active);
    return super.onLoad();
  }

  @override
  void update(double dt) {
    position += direction * speed * dt;
    super.update(dt);
  }

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    if (other is WallBlock) {
      removeFromParent();
    }
    super.onCollisionStart(intersectionPoints, other);
  }

  @override
  void onCollisionEnd(PositionComponent other) {
    if (other is WallBlock) {
      removeFromParent();
    }
    super.onCollisionEnd(other);
  }
}
