import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class MapAnimation extends StatefulWidget {
  @override
  _MapAnimationState createState() => _MapAnimationState();
}

class _MapAnimationState extends State<MapAnimation> {
  final String _path = 'lib/assets/animations/maps_fork.flr';
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      child: FlareActor(
        _path,
        alignment: Alignment.center,
        fit: BoxFit.contain,
        animation: 'anim',
      ),
    );
  }
}
