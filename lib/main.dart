import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame_mini_sprite/flame_mini_sprite.dart';
import 'package:flutter/material.dart';
import 'package:mini_sprite/mini_sprite.dart';
import '../assets.dart';

void main() {
  runApp(GameWidget(game: InvertMe()));
}

class InvertMe extends FlameGame {
  @override
  Future<void> onLoad() async {
    final miniLibrary = MiniLibrary.fromDataString(stickManAnimation);

    final sprites = await miniLibrary.toSprites(
      color: Colors.white,
      pixelSize: 1,
    );

    final miniMap = MiniMap.fromDataString(animationMap);
    for (final entry in miniMap.objects.entries) {
      final sprite = sprites[entry.value['sprite']];
      if (sprite != null) {
        final information = entry.value['sprite'].split('_');
        switch (information[0].toString()) {
          case 'character':
            final int animationLength = int.parse(information[1]);
            List<Sprite> spriteList = [];
            for (int i = 1; i <= animationLength; i++) {
              final spriteName = '${information[0]}_${information[1]}_$i';
              spriteList.add(sprites[spriteName]!);
            }

            final animation = SpriteAnimation.spriteList(spriteList,
                stepTime: .2, loop: true);

            unawaited(add(
              SpriteAnimationComponent(
                animation: animation,
                position: Vector2(
                  (entry.key.x * 8).toDouble(),
                  (entry.key.y * 8).toDouble(),
                ),
                size: Vector2(
                  sprite.image.width.toDouble(),
                  sprite.image.height.toDouble(),
                ),
              ),
            ));
            break;
        }
      }
    }

    camera.zoom = 4;
    camera.snapTo(-size / 2);
  }
}
