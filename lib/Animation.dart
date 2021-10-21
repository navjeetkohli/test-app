import 'package:flutter/material.dart';

class Animationbrain extends StatefulWidget {
  const Animationbrain({Key? key}) : super(key: key);

  @override
  _AnimationbrainState createState() => _AnimationbrainState();
}

class _AnimationbrainState extends State<Animationbrain> {
  double _width = 80;
  double _height =  80;

  double _updateState(){
    setState(() {
      _width = 80;
      _height = 80;
    });
  }
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 400),
      width: _width,
      height: _height,
      color: Colors.lightGreen,
      child: Center(
        child: Text('Animation for no reason!'),
    ),
    );
  }
}
