import 'package:agent_001/game/game.dart';
import 'package:agent_001/utils/constants.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/geometry.dart';

import '../../utils/audio_manager.dart';
import '../actors/bullet.dart';
import '../actors/player.dart';

class Turret extends SpriteComponent with HasGameRef<Agent001Game> {
  final double range;

  Turret({
    required double startAngle,
    required double endAngle,
    required double rangeRadius,
    super.sprite,
    super.paint,
    super.position,
    super.size,
    super.scale,
    super.anchor = const Anchor(0.5, 0.35),
    super.children,
    super.priority,
  })  : range = rangeRadius * gridSize,
        super(angle: startAngle * degrees2Radians) {
    add(
      RotateEffect.to(
        endAngle * degrees2Radians,
        EffectController(
          alternate: true,
          infinite: true,
          duration: 3,
        ),
      ),
    );
  }

  bool _firing = false;
  set firing(bool value) {
    _firing = value;

    if (_firing) {
      if (!_fireRateTimer.isRunning()) {
        fire();
        _fireRateTimer.onTick = fire;
        _fireRateTimer.start();
      }
    } else {
      _fireRateTimer.onTick = null;
      _fireRateTimer.stop();
    }
  }

  final _fireRateTimer = Timer(0.5, autoStart: false, repeat: true);

  @override
  Future<void>? onLoad() {
    add(CircleHitbox()..collisionType = CollisionType.passive);
    return super.onLoad();
  }

  @override
  void update(double dt) {
    final dir = Vector2(0, 1)..rotate(angle);
    final ray = Ray2(
      origin: absolutePosition + dir * size.x / 1.5,
      direction: dir,
    );
    final result = gameRef.collisionDetection.raycast(ray);

    firing = (result != null &&
        result.distance != null &&
        result.distance! < range &&
        result.hitbox != null &&
        result.hitbox!.parent is Player);
    _fireRateTimer.update(dt);
    super.update(dt);
  }

  void fire() {
    final dir = -Vector2(0, -1)
      ..rotate(absoluteAngle);
    AudioManager.playSfx('turret_shoot.wav');
    gameRef.add(
      Bullet(
        direction: dir,
        size: Vector2(2, 3),
        position: absolutePosition + dir * 10,
      ),
    );
  }
}
