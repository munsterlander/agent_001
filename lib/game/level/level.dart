import 'package:flame/components.dart';
import 'package:flutter/rendering.dart';
import 'package:invert_me/assets/assets.dart';
import 'package:invert_me/game/actors/player.dart';
import 'package:invert_me/game/invert_me.dart';
import 'package:invert_me/utils/constants.dart';
import 'package:invert_me/utils/minisprite_ext.dart';
import 'package:mini_sprite/mini_sprite.dart';

enum ObjectType { player, enemy }

extension ObjectString on ObjectType {
  String get name {
    switch (this) {
      case ObjectType.player:
        return 'player_stand';
      case ObjectType.enemy:
        return 'enemy';
      default:
        return '';
    }
  }
}

class Level extends Component with HasGameRef<InvertMe> {
  Level({Iterable<Component>? children, int? priority});

  @override
  Future<void>? onLoad() async {
    final map = MiniMap.fromDataString(level1Map);

    for (final objectData in map.objects.entries) {
      for (final data in objectData.value.entries) {
        switch (data.key) {
          case 'sprite':
            if (data.value == ObjectType.player.name) {
              final playerAnimationStateMap = {
                PlayerState.idle:
                    await gameRef.loadSpriteAnimationFromDataString(player),
                PlayerState.shoot: await gameRef
                    .loadSpriteAnimationFromDataString(playerShootAnimation),
                PlayerState.walk: await gameRef
                    .loadSpriteAnimationFromDataString(playerWalkAnimation),
              };

              add(
                Player(
                  animations: playerAnimationStateMap,
                  current: PlayerState.walk,
                  size: Vector2.all(32),
                  position: Vector2(
                    objectData.key.x * gridSize,
                    objectData.key.y * gridSize,
                  ),
                ),
              );
            } else if (data.value == ObjectType.enemy.name) {}
            break;
          default:
            debugPrint(data.toString());
        }
      }
    }

    return super.onLoad();
  }
}
