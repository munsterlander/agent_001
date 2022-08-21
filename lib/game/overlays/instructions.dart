import 'package:agent_001/game/game.dart';
import 'package:agent_001/utils/constants.dart';
import 'package:pixel_border/pixel_border.dart';
import 'package:flutter/material.dart';

class Instructions extends StatelessWidget {
  // An unique identified for this overlay.
  static const id = 'Instructions';

  // Reference to parent game.
  final Agent001Game gameRef;

  const Instructions({super.key, required this.gameRef});

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
          height: 450,
          width: 500,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Instructions',
                style: TextStyle(
                  color: whiteTextColor,
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 40),
              const Text(
                'Welcome Agent 001!\n\nYou are a special agent on a daring one bit adventure.  You either live or you die, because in the end, its all zeroes and ones.\nIn order to navigate this wonderful world, use the standard A = Left, W = Up, S = Down, D = Right.  The spacebar fires the weapon and the mouse controls the look direction.\n\nBest of luck Agent 001!',
                style: TextStyle(
                  color: whiteTextColor,
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: 200,
                height: 75,
                child: ElevatedButton(
                  onPressed: () {
                    gameRef.overlays.remove(id);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: whiteTextColor,
                    shape: PixelBorder.shape(
                      borderRadius: BorderRadius.circular(10.0),
                      pixelSize: 5.0,
                    ),
                  ),
                  child: const Text(
                    'Close',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: blackTextColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
