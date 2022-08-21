import 'package:agent_001/game/game.dart';
import 'package:agent_001/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';
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
          height: 300,
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Agent 001',
                style: GoogleFonts.pressStart2p(
                  fontSize: 24.0,
                  color: whiteTextColor,
                ),
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: 150,
                height: 75,
                child: ElevatedButton(
                  onPressed: () {
                    gameRef.overlays.remove(id);
                    gameRef.add(
                      Level(levelData: gameRef.getLevelData(0)!),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: whiteTextColor,
                    shape: PixelBorder.shape(
                      borderRadius: BorderRadius.circular(10.0),
                      pixelSize: 5.0,
                    ),
                  ),
                  child: Text(
                    'Play',
                    style: GoogleFonts.pressStart2p(
                      fontSize: 14.0,
                      color: blackTextColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: 150,
                height: 75,
                child: ElevatedButton(
                  onPressed: () {
                    gameRef.overlays.remove(id);
                    //gameRef.overlays.add(Settings.id);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: whiteTextColor,
                    shape: PixelBorder.shape(
                      borderRadius: BorderRadius.circular(10.0),
                      pixelSize: 5.0,
                    ),
                  ),
                  child: Text(
                    'Settings',
                    style: GoogleFonts.pressStart2p(
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
