import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AnimatedContainerExample extends StatefulWidget {
  const AnimatedContainerExample({super.key});

  @override
  State<AnimatedContainerExample> createState() =>
      _AnimatedContainerExampleState();
}

class _AnimatedContainerExampleState extends State<AnimatedContainerExample> {
  Color _containerColor = Colors.black;
  Color _svgColor = Colors.white;
  double _size = 100;
  bool isRunning = false;

  void _toogleAnimation() {
    setState(() {
      if (!isRunning) {
        _containerColor = Colors.black;
        _svgColor = Colors.white;
        _size = 100;
      } else {
        // swap color
        var cache = _containerColor;
        _containerColor = _svgColor;
        _svgColor = cache;

        // change size
        if (_size == 100) {
          _size = 300;
        } else {
          _size = 100;
        }
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
          child: AnimatedContainer(
            curve: Curves.easeInOutCubicEmphasized,
            duration: const Duration(milliseconds: 700),
            height: _size,
            width: _size,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              color: _containerColor,
            ),
            child: SvgPicture.asset(
              "assets/images/amongus-right.svg",
              colorFilter: ColorFilter.mode(_svgColor, BlendMode.srcIn),
            ),
            onEnd: () {
              _toogleAnimation();
            },
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
                Icons.stop,
                size: 40,
              )
            : const Icon(
                Icons.play_circle,
                size: 40,
              ),
      ),
    );
  }
}
