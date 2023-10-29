// ignore: file_names
import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({super.key});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) => const LinearGradient(
        colors: [Colors.white70, Colors.white70],
        begin: Alignment.bottomCenter,
        end: Alignment.center,
      ).createShader(bounds),
      blendMode: BlendMode.darken,
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background2.jpg"),
            fit: BoxFit.fill,
            colorFilter: ColorFilter.mode(
              Color.fromRGBO(255, 255, 255, 0.4),
              BlendMode.dstOut,
            ),
          ),
        ),
      ),
    );
  }
}
