import 'dart:async';
import 'dart:html';

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
    final miniLibrary = MiniLibrary.fromDataString(library);
    final sprites = await miniLibrary.toSprites(
      color: Colors.white,
      pixelSize: 1,
    );

    final miniMap = MiniMap.fromDataString(map);
    for (final entry in miniMap.objects.entries) {
      final sprite = sprites[entry.value['sprite']];
      if (sprite != null) {
        print(entry.value['sprite']);
        unawaited(
          add(
            SpriteComponent(
              sprite: sprite,
              position: Vector2(
                (entry.key.x * 8).toDouble(),
                (entry.key.y * 8).toDouble(),
              ),
              size: Vector2(
                sprite.image.width.toDouble(),
                sprite.image.height.toDouble(),
              ),
            ),
          ),
        );
      }
    }

    camera.zoom = 4;
    camera.snapTo(-size / 2);
  }

  @override
  Future<void> update(double dt) async {}
}
