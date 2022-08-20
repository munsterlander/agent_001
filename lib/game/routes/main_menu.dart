import 'package:agent_001/game/game.dart';
import 'package:agent_001/utils/constants.dart';
import 'package:flame/components.dart';
import 'package:flame/input.dart';

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

  late ButtonComponent playButton;
  late ButtonComponent instructionsButton;

  @override
  Future<void>? onLoad() async {
    add(
      playButton = ButtonComponent(
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

    add(
      TextBoxComponent(
        textRenderer: pixelFont,
        text: 'Agent 001',
        boxConfig: TextBoxConfig(
          growingBox: true,
        ),
        pixelRatio: 100,
        position: Vector2(playButton.position.x / 2, playButton.position.y / 2),
      ),
    );

    add(
      NineTileBoxComponent(
        nineTileBox: NineTileBox(gameRef.getSprite(SpriteIds.button)!),
        position: playButton.position,
        size: playButton.size,
        anchor: Anchor.center,
      ),
    );

    add(
      NineTileBoxComponent(
        nineTileBox: NineTileBox(gameRef.getSprite(SpriteIds.dialog)!),
        position: playButton.position,
        size: playButton.size * 4,
        anchor: Anchor.center,
      ),
    );

    add(
      instructionsButton = ButtonComponent(
        button: TextBoxComponent(
          textRenderer: pixelFont,
          text: 'Instructions',
          boxConfig: TextBoxConfig(
            growingBox: true,
          ),
          pixelRatio: 100,
        ),
        position: Vector2(playButton.position.x, (playButton.position.y * 1.4)),
        anchor: Anchor.center,
        onReleased: () {
          gameRef.router.pushNamed('instructions');
        },
      ),
    );

    add(
      NineTileBoxComponent(
        nineTileBox: NineTileBox(gameRef.getSprite(SpriteIds.button)!),
        position: instructionsButton.position,
        size: instructionsButton.size,
        anchor: Anchor.center,
      ),
    );

    return super.onLoad();
  }
}
