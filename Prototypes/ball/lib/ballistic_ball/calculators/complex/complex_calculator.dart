import 'package:flame/components.dart';

abstract class ComplexCalculator {
  /// Returns the distance the ball has traveled since the previous tick (returns null if the calculation is impossible)
  /// [deltaTime] a time in second since a previous tick
  Vector2? processTick(double deltaTime);
}
