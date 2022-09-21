import 'calculator.dart';

/// This class contains calculations for a vertical position of the ball
class VerticalCalculator implements Calculator {
  VerticalCalculator({this.startSpeed = 100, this.gravity = 9.8});

  double startSpeed;
  final double gravity;

  double _totalTime = 0;
  int _currentDirection = -1;

  /// Returns the distance the ball has traveled since the previous tick (returns null if the calculation is impossible)
  /// [deltaTime] a time in second since a previous tick
  double? processTick(double deltaTime) {
    _totalTime = _totalTime + deltaTime;
    final currentSpeed = startSpeed + _currentDirection * (gravity * _totalTime);

    // Switch a direction
    if (currentSpeed <= 0) {
      _currentDirection = 1;
      startSpeed = 0;
      _totalTime = 0;
      return null;
    } else {
      return -_currentDirection * currentSpeed * deltaTime;
    }
  }
}
