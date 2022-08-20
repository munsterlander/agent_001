import 'package:agent_001/utils/minisprite_ext.dart';
import 'package:flame/components.dart';
import 'package:flame_mini_sprite/flame_mini_sprite.dart';
import 'package:flutter/material.dart';
import 'package:mini_sprite/mini_sprite.dart';

import '../../assets/assets.dart';
import '../../utils/constants.dart';
import '../actors/player.dart';
import '../game.dart';
import 'wall_block.dart';

class Level extends Component with HasGameRef<Agent001> {
  Level({Iterable<Component>? children, int? priority});

  @override
  Future<void>? onLoad() async {
    final map = MiniMap.fromDataString(level1Map);
    final blockSprites = await MiniLibrary.fromDataString(blocks).toSprites(
      color: Colors.white,
      pixelSize: 1,
    );

    for (final objectData in map.objects.entries) {
      for (final data in objectData.value.entries) {
        switch (data.key) {
          case 'sprite':
            {
              switch (data.value) {
                case SpriteIds.playerStand:
                  {
                    final playerAnimationStateMap = {
                      PlayerState.idle: await gameRef
                          .loadSpriteAnimationFromDataString(player),
                      PlayerState.shoot:
                          await gameRef.loadSpriteAnimationFromDataString(
                              playerShootAnimation),
                      PlayerState.walk:
                          await gameRef.loadSpriteAnimationFromDataString(
                              playerWalkAnimation),
                    };

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
                    gameRef.camera.followComponent(playerComponent);
                    break;
                  }
                case SpriteIds.block:
                  {
                    add(
                      WallBlock(
                        sprite: blockSprites[SpriteIds.block]!,
                        position: Vector2(
                          objectData.key.x * gridSize,
                          objectData.key.y * gridSize,
                        ),
                        size: Vector2.all(gridSize),
                      ),
                    );
                    break;
                  }
                case SpriteIds.blockLeft:
                  {
                    add(
                      WallBlock(
                        sprite: blockSprites[SpriteIds.blockLeft]!,
                        position: Vector2(
                          objectData.key.x * gridSize,
                          objectData.key.y * gridSize,
                        ),
                        size: Vector2.all(gridSize),
                      ),
                    );
                    break;
                  }
                case SpriteIds.blockBottomLeft:
                  {
                    add(
                      WallBlock(
                        sprite: blockSprites[SpriteIds.blockBottomLeft]!,
                        position: Vector2(
                          objectData.key.x * gridSize,
                          objectData.key.y * gridSize,
                        ),
                        size: Vector2.all(gridSize),
                      ),
                    );
                    break;
                  }
                case SpriteIds.blockBottom:
                  {
                    add(
                      WallBlock(
                        sprite: blockSprites[SpriteIds.blockBottom]!,
                        position: Vector2(
                          objectData.key.x * gridSize,
                          objectData.key.y * gridSize,
                        ),
                        size: Vector2.all(gridSize),
                      ),
                    );
                    break;
                  }
                case SpriteIds.blockBottomRight:
                  {
                    add(
                      WallBlock(
                        sprite: blockSprites[SpriteIds.blockBottomRight]!,
                        position: Vector2(
                          objectData.key.x * gridSize,
                          objectData.key.y * gridSize,
                        ),
                        size: Vector2.all(gridSize),
                      ),
                    );
                    break;
                  }
                case SpriteIds.blockRight:
                  {
                    add(
                      WallBlock(
                        sprite: blockSprites[SpriteIds.blockRight]!,
                        position: Vector2(
                          objectData.key.x * gridSize,
                          objectData.key.y * gridSize,
                        ),
                        size: Vector2.all(gridSize),
                      ),
                    );
                    break;
                  }
                case SpriteIds.blockTopRight:
                  {
                    add(
                      WallBlock(
                        sprite: blockSprites[SpriteIds.blockTopRight]!,
                        position: Vector2(
                          objectData.key.x * gridSize,
                          objectData.key.y * gridSize,
                        ),
                        size: Vector2.all(gridSize),
                      ),
                    );
                    break;
                  }
                case SpriteIds.blockTop:
                  {
                    add(
                      WallBlock(
                        sprite: blockSprites[SpriteIds.blockTop]!,
                        position: Vector2(
                          objectData.key.x * gridSize,
                          objectData.key.y * gridSize,
                        ),
                        size: Vector2.all(gridSize),
                      ),
                    );
                    break;
                  }
                case SpriteIds.blockTopLeft:
                  {
                    add(
                      WallBlock(
                        sprite: blockSprites[SpriteIds.blockTopLeft]!,
                        position: Vector2(
                          objectData.key.x * gridSize,
                          objectData.key.y * gridSize,
                        ),
                        size: Vector2.all(gridSize),
                      ),
                    );
                    break;
                  }
                case SpriteIds.blockEndRight:
                  {
                    add(
                      WallBlock(
                        sprite: blockSprites[SpriteIds.blockEndRight]!,
                        position: Vector2(
                          objectData.key.x * gridSize,
                          objectData.key.y * gridSize,
                        ),
                        size: Vector2.all(gridSize),
                      ),
                    );
                    break;
                  }
                case SpriteIds.blockEndLeft:
                  {
                    add(
                      WallBlock(
                        sprite: blockSprites[SpriteIds.blockEndLeft]!,
                        position: Vector2(
                          objectData.key.x * gridSize,
                          objectData.key.y * gridSize,
                        ),
                        size: Vector2.all(gridSize),
                      ),
                    );
                    break;
                  }
                case SpriteIds.blockEndTop:
                  {
                    add(
                      WallBlock(
                        sprite: blockSprites[SpriteIds.blockEndTop]!,
                        position: Vector2(
                          objectData.key.x * gridSize,
                          objectData.key.y * gridSize,
                        ),
                        size: Vector2.all(gridSize),
                      ),
                    );
                    break;
                  }
                case SpriteIds.blockEndBottom:
                  {
                    add(
                      WallBlock(
                        sprite: blockSprites[SpriteIds.blockEndBottom]!,
                        position: Vector2(
                          objectData.key.x * gridSize,
                          objectData.key.y * gridSize,
                        ),
                        size: Vector2.all(gridSize),
                      ),
                    );
                    break;
                  }
                case SpriteIds.blockTopBottom:
                  {
                    add(
                      WallBlock(
                        sprite: blockSprites[SpriteIds.blockTopBottom]!,
                        position: Vector2(
                          objectData.key.x * gridSize,
                          objectData.key.y * gridSize,
                        ),
                        size: Vector2.all(gridSize),
                      ),
                    );
                    break;
                  }
                case SpriteIds.blockLeftRight:
                  {
                    add(
                      WallBlock(
                        sprite: blockSprites[SpriteIds.blockLeftRight]!,
                        position: Vector2(
                          objectData.key.x * gridSize,
                          objectData.key.y * gridSize,
                        ),
                        size: Vector2.all(gridSize),
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

    return super.onLoad();
  }
}
