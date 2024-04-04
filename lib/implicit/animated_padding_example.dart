import 'package:flutter/material.dart';

class AnimatedPaddingExample extends StatefulWidget {
  const AnimatedPaddingExample({super.key});

  @override
  State<AnimatedPaddingExample> createState() => _AnimatedPaddingExampleState();
}

class _AnimatedPaddingExampleState extends State<AnimatedPaddingExample> {
  List<Color> colors = [
    Colors.green,
    Colors.red,
    Colors.orange,
    Colors.blue,
    Colors.pink,
    Colors.brown
  ];

  double _paddingVal = 10;
  bool _expand = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated Padding"),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          ...List.generate(
            colors.length,
            (index) => AnimatedPadding(
              duration: const Duration(milliseconds: 500),
              padding: EdgeInsets.all(_paddingVal),
              child: Container(
                width: 100,
                height: 100,
                color: colors[index],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _expand = !_expand;

            if (_expand) {
              _paddingVal = 20;
            } else {
              _paddingVal = 10;
            }
          });
        },
        child: const Icon(Icons.expand),
      ),
    );
  }
}
