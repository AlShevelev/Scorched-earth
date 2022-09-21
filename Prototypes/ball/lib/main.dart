import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:flame/game.dart';

import 'game_field.dart';

void main() async {
  // Create an instance of the game
  final gameField = GameField();
  
  // Setup Flutter widgets and start the game in full screen portrait orientation
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.device.fullScreen();
  await Flame.device.setLandscape();
  
  runApp(
    GameWidget(game: gameField)
  );
}