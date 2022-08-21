import 'package:agent_001/game/game.dart';
import 'package:agent_001/utils/constants.dart';
import 'package:flame/components.dart';
import 'package:flame/input.dart';

class Credits extends PositionComponent with HasGameRef<Agent001Game> {
  Credits({
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

  @override
  Future<void>? onLoad() async {
    add(
      closeButton = ButtonComponent(
        button: TextComponent(
          textRenderer: pixelFont14,
          text:
              'Credit goes to @DevKage (1000%) and a bit to Munsterlander.  Music by the wife of Munsterlander.  Google Font by CodeMan38.',
        ),
        position: gameRef.size / 2,
        anchor: Anchor.center,
        onReleased: () {
          gameRef.router.pop();
        },
      ),
    );

    add(
      NineTileBoxComponent(
        nineTileBox: NineTileBox(gameRef.getSprite(SpriteIds.dialog)!),
        position: closeButton.position,
        size: closeButton.size,
        anchor: Anchor.center,
      ),
    );

    return super.onLoad();
  }
}
