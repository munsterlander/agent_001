import 'package:agent_001/game/game.dart';
import 'package:agent_001/utils/constants.dart';
import 'package:flame/components.dart';
import 'package:flame/input.dart';

class SettingsMenu extends PositionComponent with HasGameRef<Agent001Game> {
  SettingsMenu({
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

  late ButtonComponent closeButton;
  late ButtonComponent instructionsButton;

  @override
  Future<void>? onLoad() async {
    add(
      closeButton = ButtonComponent(
        button: TextComponent(
          textRenderer: pixelFont14,
          text: 'Close',
        ),
        position: gameRef.size / 2,
        anchor: Anchor.center,
        onReleased: () {
          gameRef.router.pop();
        },
      ),
    );

    add(
      TextComponent(
        textRenderer: pixelFont24,
        text: 'Agent 001',
        position:
            Vector2(closeButton.position.x / 2, closeButton.position.y / 2),
      ),
    );

    add(
      NineTileBoxComponent(
        nineTileBox: NineTileBox(gameRef.getSprite(SpriteIds.button)!),
        position: closeButton.position,
        size: closeButton.size,
        anchor: Anchor.center,
      ),
    );

    add(
      NineTileBoxComponent(
        nineTileBox: NineTileBox(gameRef.getSprite(SpriteIds.dialog)!),
        position: closeButton.position,
        size: closeButton.size * 4,
        anchor: Anchor.center,
      ),
    );

    return super.onLoad();
  }
}
