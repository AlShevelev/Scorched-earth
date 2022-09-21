abstract class Calculator {
  /// Returns the distance the ball has traveled since the previous tick (returns null if the calculation is impossible)
  /// [deltaTime] a time in second since a previous tick
  double? processTick(double deltaTime);
}
