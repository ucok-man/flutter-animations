import 'package:flutter/material.dart';

class AnimatedPositionedExample extends StatefulWidget {
  const AnimatedPositionedExample({super.key});

  @override
  State<AnimatedPositionedExample> createState() =>
      _AnimatedPositionedExampleState();
}

class _AnimatedPositionedExampleState extends State<AnimatedPositionedExample> {
  bool clicked = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated Positioned"),
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            const SizedBox(
              width: double.infinity,
              height: double.infinity,
            ),
            ...List.generate(
              4,
              (index) => AnimatedPositioned(
                left: clicked
                    ? generateX(index, size.width)
                    : ((size.width / 2) - 50),
                top: clicked
                    ? generateY(index, size.height)
                    : (size.height / 2) - 78,
                duration: const Duration(milliseconds: 500),
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                    color: Colors.blue,
                  ),
                  width: 100,
                  height: 100,
                ),
              ),
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.red,
            ),
          ],
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

  double generateX(int index, double constraint) {
    if (index == 0) {
      return ((constraint / 2) - 50) + 100;
    }

    if (index == 2) {
      return ((constraint / 2) - 50) - 100;
    }

    return ((constraint / 2) - 50);
  }

  double generateY(int index, double constraint) {
    if (index == 1) {
      return ((constraint / 2) - 78) + 100;
    }

    if (index == 3) {
      return ((constraint / 2) - 78) - 100;
    }

    return ((constraint / 2) - 78);
  }
}
