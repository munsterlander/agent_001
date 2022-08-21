import 'package:agent_001/game/game.dart';
import 'package:agent_001/game/overlays/credits.dart';
import 'package:agent_001/utils/audio_manager.dart';
import 'package:agent_001/utils/constants.dart';
import 'package:pixel_border/pixel_border.dart';
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
                'Settings',
                style: TextStyle(
                  color: whiteTextColor,
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: 300,
                child: ValueListenableBuilder<bool>(
                  valueListenable: AudioManager.sfx,
                  builder: (context, sfx, child) => SwitchListTile(
                    activeColor: whiteTextColor,
                    title: const Text(
                      'Sound Effects',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: whiteTextColor,
                      ),
                    ),
                    value: sfx,
                    onChanged: (value) => AudioManager.sfx.value = value,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: 300,
                child: ValueListenableBuilder<bool>(
                  valueListenable: AudioManager.bgm,
                  builder: (context, bgm, child) => SwitchListTile(
                    activeColor: whiteTextColor,
                    title: const Text(
                      'Background Music',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: whiteTextColor,
                      ),
                    ),
                    value: bgm,
                    onChanged: (value) => AudioManager.bgm.value = value,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: 200,
                height: 75,
                child: ElevatedButton(
                  onPressed: () {
                    gameRef.overlays.add(Credits.id);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: whiteTextColor,
                    shape: PixelBorder.shape(
                      borderRadius: BorderRadius.circular(10.0),
                      pixelSize: 5.0,
                    ),
                  ),
                  child: const Text(
                    'Credits',
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
