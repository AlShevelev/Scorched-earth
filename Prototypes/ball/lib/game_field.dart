
import 'package:flame/game.dart';

import 'ballistic_ball/ball.dart';

class GameField extends FlameGame {
  @override
  Future<void> onLoad() async {
    super.onLoad();

    // A screen rotation must be turned on!!!
    // (if not we should swipe size.x & size.y)
    final Vector2 gameFieldSize;

    if(size.x < size.y) {
      gameFieldSize = Vector2(size.y, size.x);
    } else {
      gameFieldSize = size;
    }


    add(Ball(gameFieldSize));
  }
}