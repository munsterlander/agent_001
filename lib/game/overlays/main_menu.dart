import 'package:agent_001/game/game.dart';
import 'package:agent_001/game/overlays/instructions.dart';
import 'package:agent_001/game/overlays/settings_menu.dart';
import 'package:agent_001/utils/constants.dart';
import 'package:pixel_border/pixel_border.dart';
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
        child: Container(
          padding: const EdgeInsets.all(10.0),
          decoration: ShapeDecoration(
            shape: PixelBorder.solid(
              pixelSize: 2.0,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8.0),
                bottomRight: Radius.circular(16.0),
              ),
              color: whiteTextColor,
            ),
          ),
          height: 400,
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Agent 001',
                style: TextStyle(
                  color: whiteTextColor,
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: 200,
                height: 75,
                child: ElevatedButton(
                  onPressed: () {
                    gameRef.overlays.remove(id);
                    gameRef.add(
                      Level(levelData: gameRef.getLevelData(0)!),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: whiteTextColor,
                    shape: PixelBorder.shape(
                      borderRadius: BorderRadius.circular(10.0),
                      pixelSize: 5.0,
                    ),
                  ),
                  child: const Text(
                    'Play',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: blackTextColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: 200,
                height: 75,
                child: ElevatedButton(
                  onPressed: () {
                    gameRef.overlays.add(SettingsMenu.id);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: whiteTextColor,
                    shape: PixelBorder.shape(
                      borderRadius: BorderRadius.circular(10.0),
                      pixelSize: 5.0,
                    ),
                  ),
                  child: const Text(
                    'Settings',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: blackTextColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: 200,
                height: 75,
                child: ElevatedButton(
                  onPressed: () {
                    gameRef.overlays.add(Instructions.id);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: whiteTextColor,
                    shape: PixelBorder.shape(
                      borderRadius: BorderRadius.circular(10.0),
                      pixelSize: 5.0,
                    ),
                  ),
                  child: const Text(
                    'Instructions',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: blackTextColor,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
