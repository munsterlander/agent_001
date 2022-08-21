import 'package:agent_001/game/game.dart';
import 'package:agent_001/utils/constants.dart';
import 'package:pixel_border/pixel_border.dart';
import 'package:agent_001/game/level/level.dart';
import 'package:flutter/material.dart';

class SettingsMenu extends StatelessWidget {
  // An unique identified for this overlay.
  static const id = 'SettingsMenu';

  // Reference to parent game.
  final Agent001Game gameRef;

  const SettingsMenu({super.key, required this.gameRef});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10.0),
              decoration: ShapeDecoration(
                shape: PixelBorder.solid(
                  pixelSize: 2.0,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8.0),
                    bottomRight: Radius.circular(16.0),
                  ),
                  color: Colors.purple,
                ),
              ),
              height: 200,
              width: 400,
            ),
            SizedBox(
              width: 100,
              child: ElevatedButton(
                onPressed: () {
                  gameRef.overlays.remove(id);
                  gameRef.add(Level(levelData: gameRef.getLevelData(0)!));
                },
                child: const Text(
                  'Play',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: whiteTextColor,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 100,
              child: ElevatedButton(
                onPressed: () {
                  gameRef.overlays.remove(id);
                  //gameRef.overlays.add(Settings.id);
                },
                child: const Text(
                  'Settings',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: whiteTextColor,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
