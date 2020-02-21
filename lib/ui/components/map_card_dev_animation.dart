import 'package:flutter/material.dart';
import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';

class AnimationMapCardDev {
  static SequenceAnimationBuilder animation() => SequenceAnimationBuilder()
      .addAnimatable(
          animatable: Tween<double>(begin: 0, end: 30),
          from: Duration.zero,
          to: Duration(milliseconds: 500),
          curve: Curves.easeOutQuart,
          tag: "cardUp")
      .addAnimatable(
        animatable: Tween<double>(begin: 0, end: 1),
        from: Duration.zero,
        to: Duration(milliseconds: 300),
        curve: Curves.easeOutQuart,
        tag: 'opacity',
      )
      .addAnimatable(
        animatable: Tween<double>(begin: 50, end: 111),
        from: Duration(milliseconds: 500),
        to: Duration(milliseconds: 700),
        tag: 'height',
      )
      .addAnimatable(
        animatable: Tween<double>(begin: 150, end: 16),
        from: Duration(milliseconds: 700),
        to: Duration(milliseconds: 900),
        tag: 'width',
      );
}
