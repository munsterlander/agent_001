import 'package:agent_001/game/level/door.dart';
import 'package:agent_001/utils/level_data.dart';
import 'package:agent_001/utils/minisprite_ext.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:mini_sprite/mini_sprite.dart';

import '../../assets/assets.dart';
import '../../utils/constants.dart';
import '../actors/player.dart';
import '../game.dart';
import 'follow_cam.dart';
import 'key_component.dart';
import 'wall_block.dart';

class Level extends Component with HasGameRef<Agent001Game> {
  final LevelData levelData;

  Level({
    required this.levelData,
    Iterable<Component>? children,
    int? priority,
  });

  @override
  Future<void>? onLoad() async {
    final map = MiniMap.fromDataString(levelData.levelString);
    gameRef.camera.worldBounds = Rect.fromLTWH(
      0,
      0,
      levelData.size.x,
      levelData.size.y,
    );

    final playerAnimationStateMap = {
      PlayerState.idle: await gameRef.loadSpriteAnimationFromDataString(player),
      PlayerState.shoot:
          await gameRef.loadSpriteAnimationFromDataString(playerShootAnimation),
      PlayerState.walk:
          await gameRef.loadSpriteAnimationFromDataString(playerWalkAnimation),
    };

    _spawnObjects(map, playerAnimationStateMap);
    return super.onLoad();
  }

  void _spawnObjects(
    MiniMap map,
    Map<PlayerState, SpriteAnimation> playerAnimationStateMap,
  ) {
    for (final objectData in map.objects.entries) {
      for (final data in objectData.value.entries) {
        switch (data.key) {
          case 'sprite':
            {
              switch (data.value) {
                case SpriteIds.playerStand:
                  {
                    final playerComponent = Player(
                      animations: playerAnimationStateMap,
                      current: PlayerState.walk,
                      size: Vector2.all(gridSize),
                      anchor: Anchor.center,
                      position: Vector2(
                        objectData.key.x * gridSize,
                        objectData.key.y * gridSize,
                      ),
                    );
                    add(playerComponent);

                    final followCam = FollowCam(
                      target: playerComponent,
                      deadZoneRadius: 10,
                      smoothingSpeed: playerComponent.speed,
                    );
                    add(followCam);
                    gameRef.camera.followComponent(followCam);
                    break;
                  }
                case SpriteIds.block:
                case SpriteIds.blockLeft:
                case SpriteIds.blockBottomLeft:
                case SpriteIds.blockBottom:
                case SpriteIds.blockBottomRight:
                case SpriteIds.blockRight:
                case SpriteIds.blockTopRight:
                case SpriteIds.blockTop:
                case SpriteIds.blockTopLeft:
                case SpriteIds.blockEndRight:
                case SpriteIds.blockEndLeft:
                case SpriteIds.blockEndTop:
                case SpriteIds.blockEndBottom:
                case SpriteIds.blockTopBottom:
                case SpriteIds.blockLeftRight:
                  {
                    add(
                      WallBlock(
                        sprite: gameRef.getSprite(data.value)!,
                        position: Vector2(
                          objectData.key.x * gridSize,
                          objectData.key.y * gridSize,
                        ),
                        size: Vector2.all(gridSize),
                      ),
                    );
                    break;
                  }

                case SpriteIds.door:
                  {
                    add(
                      Door(
                        sprite: gameRef.getSprite(data.value)!,
                        position: Vector2(
                          objectData.key.x * gridSize,
                          objectData.key.y * gridSize,
                        ),
                        size: Vector2.all(gridSize),
                      ),
                    );
                    break;
                  }
                case SpriteIds.key:
                  {
                    add(
                      KeyComponent(
                        sprite: gameRef.getSprite(data.value)!,
                        position: Vector2(
                          objectData.key.x * gridSize,
                          objectData.key.y * gridSize,
                        ),
                        size: Vector2.all(gridSize) / 2,
                      ),
                    );
                    break;
                  }
              }
              break;
            }
          default:
            debugPrint(data.toString());
        }
      }
    }
  }
}
