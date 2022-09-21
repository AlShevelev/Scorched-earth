import 'dart:math';

import 'package:flame/components.dart';
import '../simple/calculator.dart';
import '../simple/horizontal_calc.dart';
import '../simple/vertical_calc.dart';

import 'complex_calculator.dart';

/// This class contains calculations for position of the ball
/// [speed] a speed of the ball.
/// [angle] an angle in degrees. Can be negative.
/// 0 means a right angle (pure vertical).
/// -90 means pure horizontal with a ball is moved to the left.
/// 90 means pure horizontal with a ball is moved to the right.
/// [windSpeed] a speed of wind. Can be positive (if the wind is blowing to the right) or negative.
/// [airResistant] decreases a total absolute speed
class ComplexCalculatorImpl implements ComplexCalculator {
  ComplexCalculatorImpl({
    double speed = 100,
    double angle = 0,
    double windSpeed = 0,
    double airResistant = 0,
    double gravity = 9.8,
  }) {
    final radialAngle = (-angle + 90) / 180 * pi;
    final horizontalSpeed = cos(radialAngle) * speed;
    final verticalSpeed = sin(radialAngle) * speed;

    _horizontal = HorizontalCalculator(currentSpeed: horizontalSpeed, windSpeed: windSpeed, airResistant: airResistant);
    _vertical = VerticalCalculator(startSpeed: verticalSpeed, gravity: gravity);
  }

  late final Calculator _horizontal;
  late final Calculator _vertical;

  /// Returns the distance the ball has traveled since the previous tick (returns null if the calculation is impossible)
  /// [deltaTime] a time in second since a previous tick
  Vector2? processTick(double deltaTime) {
    final x = _horizontal.processTick(deltaTime);
    final y = _vertical.processTick(deltaTime);

    if (x != null && y != null) {
      return Vector2(x, y);
    } else {
      return null;
    }
  }
}
