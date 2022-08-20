import 'package:flame/components.dart';
import 'package:invert_me/assets/assets.dart';
import 'package:invert_me/game/actors/player.dart';
import 'package:invert_me/game/invert_me.dart';
import 'package:invert_me/utils/minisprite_ext.dart';

class Level extends Component with HasGameRef<InvertMe> {
  Level({Iterable<Component>? children, int? priority});

  @override
  Future<void>? onLoad() async {
    final playerAnimationStateMap = {
      PlayerState.idle: await gameRef.loadSpriteAnimationFromDataString(player),
      PlayerState.shooting:
          await gameRef.loadSpriteAnimationFromDataString(shootAnimation),
    };

    add(
      Player(
        animations: playerAnimationStateMap,
        current: PlayerState.shooting,
        size: Vector2.all(32),
        position: gameRef.size / 2,
      ),
    );
    return super.onLoad();
  }
}
