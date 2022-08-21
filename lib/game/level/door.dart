import 'package:agent_001/utils/audio_manager.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';

import '../actors/player.dart';

enum DoorState {
  locked,
  unlocked,
}

class Door extends SpriteComponent with CollisionCallbacks {
  final void Function() onDoorOpen;
  final bool isLevelDoor;

  Door({
    required this.onDoorOpen,
    required this.isLevelDoor,
    DoorState initialState = DoorState.locked,
    super.sprite,
    super.paint,
    super.position,
    super.size,
    super.scale,
    super.angle,
    super.anchor,
    super.children,
    super.priority,
  }) : _state = initialState;

  late ShapeHitbox hitbox;
  DoorState _state = DoorState.locked;

  DoorState get state => _state;
  set state(DoorState value) {
    if ((_state != value && value == DoorState.unlocked)) {
      open();
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

  void open() {
    hitbox.collisionType = CollisionType.inactive;
    if (isLevelDoor) {
      AudioManager.playSfx('door.wav');
    }
    add(
      OpacityEffect.fadeOut(
        LinearEffectController(0.5),
        onComplete: () {
          onDoorOpen.call();
          removeFromParent();
        },
      ),
    );
  }
}
