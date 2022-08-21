import 'package:agent_001/game/overlays/main_menu.dart';
import 'package:flame/game.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'game/game.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('google_fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });

  runApp(const Agent001GameApp());
}

Agent001Game _agent001Game = Agent001Game();

class Agent001GameApp extends StatelessWidget {
  const Agent001GameApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Agent 001 Bit',
      /* theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ), */
      home: Scaffold(
        body: GameWidget<Agent001Game>(
          game: _agent001Game,
          errorBuilder: (context, ex) {
            debugPrint(ex.toString());
            return const Center(
              child: Text('Sorry, something went wrong. Reload Fans'),
            );
          },
          overlayBuilderMap: {
            MainMenu.id: (_, Agent001Game gameRef) => MainMenu(gameRef),
            //GameOver.id: (_, Agent001Game gameRef) => GameOver(gameRef),
            //Settings.id: (_, Agent001Game gameRef) => Settings(gameRef),
            //NextLevel.id: (_, Agent001Game gameRef) => NextLevel(gameRef),
          },
          initialActiveOverlays: const [MainMenu.id],
        ),
      ),
    );
  }
}
