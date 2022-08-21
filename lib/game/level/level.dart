import 'package:agent_001/game/level/door.dart';
import 'package:agent_001/game/level/health_up.dart';
import 'package:agent_001/game/level/turret.dart';
import 'package:agent_001/utils/level_data.dart';
import 'package:agent_001/utils/minisprite_ext.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:mini_sprite/mini_sprite.dart';

import '../../assets/assets.dart';
import '../../utils/constants.dart';
import '../actors/enemy.dart';
import '../actors/player.dart';
import '../game.dart';
import 'follow_cam.dart';
import 'key_component.dart';
import 'wall_block.dart';

class Level extends PositionComponent with HasGameRef<Agent001Game> {
  final LevelData levelData;
  late Map<PlayerState, SpriteAnimation> playerAnimationStateMap;
  late Map<EnemyState, SpriteAnimation> enemyAnimationStateMap;

  Level({
    required this.levelData,
    super.position,
    super.size,
    super.scale,
    super.angle,
    super.anchor,
    super.children,
    super.priority,
  });

  @override
  Future<void>? onLoad() async {
    gameRef.playerData.curretLevel = levelData.levelIndex;
    final map = MiniMap.fromDataString(levelData.levelString);
    if (levelData.levelIndex == 0) {
      gameRef.camera.snapTo(levelData.size / 2);
    } else {
      gameRef.camera.resetMovement();
      gameRef.camera.worldBounds = Rect.fromLTWH(
        0,
        0,
        levelData.size.x,
        levelData.size.y,
      );
    }

    playerAnimationStateMap = {
      PlayerState.idle: await gameRef.loadSpriteAnimationFromDataString(player),
      PlayerState.shoot:
          await gameRef.loadSpriteAnimationFromDataString(playerShootAnimation),
      PlayerState.walk:
          await gameRef.loadSpriteAnimationFromDataString(playerWalkAnimation),
    };

    enemyAnimationStateMap = {
      EnemyState.idle: await gameRef.loadSpriteAnimationFromDataString(enemy),
      EnemyState.shoot:
          await gameRef.loadSpriteAnimationFromDataString(enemyShootAnimation),
      EnemyState.walk: await gameRef.loadSpriteAnimationFromDataString(
        enemyWalkAnimation,
        stepTime: 0.3,
      ),
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
                    final nextLevelId = objectData.value['nextLevel'];
                    add(
                      Door(
                        sprite: gameRef.getSprite(data.value)!,
                        position: Vector2(
                          objectData.key.x * gridSize,
                          objectData.key.y * gridSize,
                        ),
                        size: Vector2.all(gridSize),
                        initialState: levelData.initialState,
                        isLevelDoor: nextLevelId != null,
                        onDoorOpen: () {
                          if (nextLevelId != null) {
                            final nextLevelData =
                                gameRef.getLevelData(int.parse(nextLevelId));
                            if (nextLevelData != null) {
                              parent?.add(Level(levelData: nextLevelData));
                            }
                            removeFromParent();
                          }
                        },
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
                case SpriteIds.heart:
                  {
                    add(
                      HealthUp(
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
                case SpriteIds.enemyTurret:
                  {
                    add(
                      Turret(
                        startAngle:
                            double.parse(objectData.value['startAngle']),
                        endAngle: double.parse(objectData.value['endAngle']),
                        rangeRadius:
                            double.parse(objectData.value['rangeRadius']),
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
                case SpriteIds.enemy:
                  {
                    final xy = objectData.value['targetPoint'].split(",");
                    final hasKey = objectData.value['hasKey'];
                    KeyComponent? keyComponent;

                    if (hasKey != null) {
                      keyComponent = KeyComponent(
                        sprite: gameRef.getSprite(SpriteIds.key)!,
                        position: Vector2(
                          objectData.key.x * gridSize,
                          objectData.key.y * gridSize,
                        ),
                        size: Vector2.all(gridSize) / 2,
                      );
                    }

                    final enemy = Enemy(
                      keyComponent: keyComponent,
                      targetPosition:
                          Vector2(double.parse(xy[0]), double.parse(xy[1])) *
                              gridSize,
                      animations: enemyAnimationStateMap,
                      current: EnemyState.walk,
                      size: Vector2.all(gridSize),
                      anchor: Anchor.center,
                      position: Vector2(
                        objectData.key.x * gridSize,
                        objectData.key.y * gridSize,
                      ),
                    );
                    add(enemy);
                    break;
                  }
              }
              break;
            }
        }
      }
    }
  }

  // void displayRetryOptions() {
  //   final text = TextComponent(
  //     text: 'Game Over',
  //     textRenderer: TextPaint(
  //       style: const TextStyle(
  //         fontFamily: 'PressStartP2',
  //         fontSize: 10,
  //         color: whiteTextColor,
  //       ),
  //     ),
  //   );

  //   add(
  //     NineTileBoxComponent(
  //       position: gameRef.size / 2,
  //       nineTileBox: NineTileBox(gameRef.getSprite(SpriteIds.dialog)!),
  //       children: [text],
  //       size: text.size,
  //     ),
  //   );
  // }
}
