import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/palette.dart';
import 'package:flutter/material.dart';

import 'calculators/complex/complex_calculator.dart';
import 'calculators/complex/complex_calculator_impl.dart';

class Ball extends PositionComponent {
  Ball(this.screenSize);

  final Vector2 screenSize;

  static final paint = BasicPalette.green.paint();
  static final radius = 3.0;

  final ComplexCalculator calculator = ComplexCalculatorImpl(
    speed: 100,
    angle: 25,
    windSpeed: 0,
    airResistant: 0,
    gravity: 9.8,
  );

  @override
  Future<void> onLoad() async {
    super.onLoad();

    position = _transformCoordinates(Vector2(screenSize.x / 2, 0));
    size = Vector2(radius * 2, radius * 2);

    anchor = Anchor.center;
  }

  @override
  void update(double deltaTime) {
    final deltaDistance = calculator.processTick(deltaTime);

    if (deltaDistance != null) {
      final newPosition = _transform(position, deltaX: deltaDistance.x, deltaY: deltaDistance.y);

      // If the ball reaches the top border, it must move along the border
      if (newPosition.y < 0) {
        position = Vector2(newPosition.x, 0);
      } else {
        position = newPosition;
      }
    }

    super.update(deltaTime);
  }

  @override
  void render(Canvas canvas) {
    canvas.drawCircle(Offset(size.x / 2, size.y / 2), radius, paint);
    super.render(canvas);
  }

  Vector2 _transformCoordinates(Vector2 oldCoordinates) {
    return Vector2(oldCoordinates.x, screenSize.y - oldCoordinates.y);
  }

  Vector2 _transform(Vector2 old, {double deltaX = 0, double deltaY = 0}) {
    final oldTransformed = _transformCoordinates(old);
    return _transformCoordinates(Vector2(oldTransformed.x + deltaX, oldTransformed.y + deltaY));
  }
}
