import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AnimatedAlignExample extends StatefulWidget {
  const AnimatedAlignExample({super.key});

  @override
  State<AnimatedAlignExample> createState() => _AnimatedAlignExampleState();
}

class _AnimatedAlignExampleState extends State<AnimatedAlignExample> {
  var _svgAlign = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated Align"),
      ),
      body: Stack(
        children: [
          AnimatedAlign(
            alignment: generateSvgAlign(_svgAlign),
            duration: const Duration(milliseconds: 200),
            child: SizedBox(
              width: 100,
              height: 100,
              child: SvgPicture.asset(
                "assets/images/amongus-right.svg",
                colorFilter: ColorFilter.mode(
                  Colors.amber.shade900,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
          AnimatedAlign(
            alignment: generateSvgAlign(_svgAlign - 1),
            duration: const Duration(milliseconds: 300),
            child: SizedBox(
              width: 100,
              height: 100,
              child: SvgPicture.asset(
                "assets/images/amongus-left.svg",
                colorFilter: ColorFilter.mode(
                  Colors.green.shade900,
                  BlendMode.srcIn,
                ),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            if (_svgAlign >= 9) {
              _svgAlign = 1;
              return;
            }

            _svgAlign++;
          });
        },
        shape: const CircleBorder(),
        child: const Icon(Icons.ac_unit_rounded),
      ),
    );
  }

  AlignmentGeometry generateSvgAlign(int value) {
    return switch (value) {
      0 => Alignment.bottomRight,
      1 => Alignment.topLeft,
      2 => Alignment.topCenter,
      3 => Alignment.topRight,
      4 => Alignment.centerLeft,
      5 => Alignment.center,
      6 => Alignment.centerRight,
      7 => Alignment.bottomLeft,
      8 => Alignment.bottomCenter,
      9 => Alignment.bottomRight,
      _ => throw Exception("Uhandled Aligment Value: $value")
    };
  }
}
