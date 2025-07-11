import 'package:flutter/material.dart';

class AnimatedLogo extends StatefulWidget {
  const AnimatedLogo({super.key});

  @override
  State<AnimatedLogo> createState() => _AnimatedLogoState();
}

class _AnimatedLogoState extends State<AnimatedLogo> with TickerProviderStateMixin {
  late AnimationController floatController;
  late AnimationController pulseController;

  @override
  void initState() {
    super.initState();

    floatController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);

    pulseController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
      lowerBound: 0.95,
      upperBound: 1.05,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    floatController.dispose();
    pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([floatController, pulseController]),
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, -10 + 20 * floatController.value),
          child: Transform.scale(
            scale: pulseController.value,
            child: child,
          ),
        );
      },
      child: Container(
        width: 150,
        height: 150,
        decoration: const BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10)],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(45),
            topRight: Radius.circular(105),
            bottomLeft: Radius.circular(105),
            bottomRight: Radius.circular(45),
          ),
        ),
        child: const Center(
          child: Icon(Icons.event, size: 60, color: Colors.deepPurple),
        ),
      ),
    );
  }
}
