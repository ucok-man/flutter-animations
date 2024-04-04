import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AnimatedPhysicalModelExample extends StatefulWidget {
  const AnimatedPhysicalModelExample({super.key});

  @override
  State<AnimatedPhysicalModelExample> createState() =>
      _AnimatedPhysicalModelExampleState();
}

class _AnimatedPhysicalModelExampleState
    extends State<AnimatedPhysicalModelExample> {
  bool clicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated Physical Model"),
      ),
      body: Center(
        child: AnimatedRotation(
          duration: const Duration(milliseconds: 1000),
          turns: clicked ? 2 : 1,
          child: AnimatedPhysicalModel(
            shape: BoxShape.circle,
            elevation: clicked ? 15 : 20,
            color: Colors.transparent,
            shadowColor: clicked ? Colors.amber : Colors.red,
            duration: const Duration(milliseconds: 1000),
            curve: Curves.bounceInOut,
            child: SvgPicture.asset(
              "assets/images/amongus-right.svg",
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            clicked = !clicked;
          });
        },
        child: const Icon(Icons.account_circle),
      ),
    );
  }
}
