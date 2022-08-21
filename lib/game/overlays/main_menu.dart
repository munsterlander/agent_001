import 'package:agent_001/game/game.dart';
import 'package:agent_001/game/ui/button.dart';
import 'package:agent_001/game/level/level.dart';
import 'package:flutter/material.dart';

class MainMenu extends StatelessWidget {
  // An unique identified for this overlay.
  static const id = 'MainMenu';

  // Reference to parent game.
  final Agent001Game gameRef;

  const MainMenu({super.key, required this.gameRef});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 100,
              child: ElevatedButton(
                onPressed: () {
                  gameRef.overlays.remove(id);
                  gameRef.add(Level(levelData: gameRef.getLevelData(0)!));
                },
                child: const Text('Play'),
              ),
            ),
            SizedBox(
              width: 100,
              child: ElevatedButton(
                onPressed: () {
                  gameRef.overlays.remove(id);
                  //gameRef.overlays.add(Settings.id);
                },
                child: const Text('Settings'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
