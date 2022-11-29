import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:mini_sprite/mini_sprite.dart';
import 'package:flame_mini_sprite/flame_mini_sprite.dart';

extension SpriteAnimationLoader on Game {
  Future<SpriteAnimation> loadSpriteAnimationFromDataString(
    String miniLibString, {
    Color color = Colors.white,
    double pixelSize = 1,
    double stepTime = 0.1,
  }) async {
    final spritesMap = await MiniLibrary.fromDataString(miniLibString)
        .toSprites(pixelSize: pixelSize, palette: [color]);

    return SpriteAnimation.spriteList(
      spritesMap.values.toList(),
      stepTime: stepTime,
    );
  }
}
