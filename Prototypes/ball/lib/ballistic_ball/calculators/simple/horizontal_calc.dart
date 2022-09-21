import 'dart:math';

import 'calculator.dart';

/// This class contains calculations for a horizontal position of the ball
/// [startSpeed] a speed of the ball. Can be positive (if the ball is moving to the right) or negative
/// (if the ball is moving to the left)
/// [windSpeed] a speed of wind. Can be positive (if the wind is blowing to the right) or negative.
/// [airResistant] decreases a total absolute speed
class HorizontalCalculator implements Calculator {
  HorizontalCalculator({this.currentSpeed = 100, this.windSpeed = 0, this.airResistant = 0});

  double currentSpeed;
  final double windSpeed;
  final double airResistant;

  /// Returns the distance the ball has traveled since the previous tick (returns null if the calculation is impossible)
  /// [deltaTime] a time in second since a previous tick
  double? processTick(double deltaTime) {
    currentSpeed = currentSpeed + windSpeed * deltaTime;

    final double resultSpeed;
    if (currentSpeed > 0) {
      resultSpeed = max((currentSpeed - airResistant) * deltaTime, 0);
    } else {
      resultSpeed = min((currentSpeed + airResistant) * deltaTime, 0);
    }

    return resultSpeed;
  }
}
