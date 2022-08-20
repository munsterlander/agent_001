import 'package:agent_001/game/game.dart';
import 'package:agent_001/utils/constants.dart';
import 'package:flame/components.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';
import 'package:mini_sprite/mini_sprite.dart';
import 'package:flame_mini_sprite/flame_mini_sprite.dart';
import 'package:agent_001/assets/assets.dart';

class MainMenu extends PositionComponent with HasGameRef<Agent001Game> {
  MainMenu({
    super.position,
    super.size,
    super.scale,
    super.angle,
    super.anchor,
    super.children,
    super.priority,
  }) {
    positionType = PositionType.viewport;
  }

  late NineTileBoxComponent nineTileBoxComponent;

  @override
  Future<void>? onLoad() async {
    final miniLibrary = MiniLibrary.fromDataString(nineTB);
    final sprites = await miniLibrary.toSprites(
      color: Colors.white,
      pixelSize: 1,
    );

    final sprite = sprites['nineTileBox'];
    final boxSize = Vector2.all(100);
    final nineTileBox = NineTileBox(sprite!, destTileSize: 16);
    add(
      nineTileBoxComponent = NineTileBoxComponent(
        nineTileBox: nineTileBox,
        position: gameRef.size / 2,
        size: boxSize,
        anchor: Anchor.center,
      ),
    );

    add(
      ButtonComponent(
        button: TextBoxComponent(
          textRenderer: pixelFont,
          text: 'Play',
          boxConfig: TextBoxConfig(
            growingBox: true,
          ),
          pixelRatio: 100,
        ),
        position: gameRef.size / 2,
        anchor: Anchor.center,
        onReleased: () {
          gameRef.router.pushNamed('gameplay');
        },
      ),
    );
    return super.onLoad();
  }
}
