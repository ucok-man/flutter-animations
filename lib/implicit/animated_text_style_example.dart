import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnimatedTextStyleExample extends StatefulWidget {
  const AnimatedTextStyleExample({super.key});

  @override
  State<AnimatedTextStyleExample> createState() =>
      _AnimatedTextStyleExampleState();
}

class _AnimatedTextStyleExampleState extends State<AnimatedTextStyleExample> {
  late bool isRunning = false;
  late double _letterSpacing;
  late double _fontSize;
  late Color _color;
  late double _blurRadius;

  @override
  void initState() {
    _initialState();
    super.initState();
  }

  void _initialState() {
    _letterSpacing = 2;
    _fontSize = 16;
    _color = Colors.white;
    _blurRadius = 15;
  }

  void _toogleAnimation() {
    setState(() {
      if (isRunning) {
        _letterSpacing = 25;
        _fontSize = 25;
        _color = Colors.black;
        _blurRadius = 0.5;
      } else {
        _initialState();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated Container"),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            isRunning = !isRunning;
            _toogleAnimation();
          },
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 400),
            style: GoogleFonts.alice(
                color: _color,
                letterSpacing: _letterSpacing,
                fontSize: _fontSize,
                shadows: [
                  Shadow(
                    color: Colors.black45,
                    blurRadius: _blurRadius,
                    offset: const Offset(0, 1),
                  )
                ]),
            child: const Text("Hello World"),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            isRunning = !isRunning;
            _toogleAnimation();
          });
        },
        shape: const CircleBorder(),
        child: isRunning
            ? const Icon(
                Icons.stop_circle,
                size: 40,
                color: Colors.red,
              )
            : const Icon(
                Icons.play_circle,
                size: 40,
                color: Colors.orange,
              ),
      ),
    );
  }
}
