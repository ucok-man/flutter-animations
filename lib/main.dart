import 'package:flutter/material.dart';
import 'package:flutter_animations/implicit/animated_align_example.dart';
import 'package:flutter_animations/implicit/animated_container_example.dart';
import 'package:flutter_animations/implicit/animated_opacity.dart';
import 'package:flutter_animations/implicit/animated_padding_example.dart';
import 'package:flutter_animations/implicit/animated_physical_model.dart';
import 'package:flutter_animations/implicit/animated_positioned.dart';
import 'package:flutter_animations/implicit/animated_text_style_example.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Animations',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
        useMaterial3: true,
        primarySwatch: Colors.amber,
      ),
      home: Center(
        child: ListView(
          children: const [
            Divider(),
            SectionButton(
              title: "#1 implicit Animation Align",
              page: AnimatedAlignExample(),
            ),
            SectionButton(
              title: "#2 implicit Animation Container",
              page: AnimatedContainerExample(),
            ),
            SectionButton(
              title: "#3 implicit Animation TextStyle",
              page: AnimatedTextStyleExample(),
            ),
            SectionButton(
              title: "#4 implicit Animation Opacity",
              page: AnimatedOpacityExample(),
            ),
            SectionButton(
              title: "#5 implicit Animation Padding",
              page: AnimatedPaddingExample(),
            ),
            SectionButton(
              title: "#6 implicit Animation Physical Model",
              page: AnimatedPhysicalModelExample(),
            ),
            SectionButton(
              title: "#7 implicit Animation Positioned",
              page: AnimatedPositionedExample(),
            ),
          ],
        ),
      ),
    );
  }
}

class SectionButton extends StatelessWidget {
  final Widget page;
  final String title;

  const SectionButton({
    super.key,
    required this.page,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => page,
            ),
          );
        },
        child: Text(title),
      ),
    );
  }
}
