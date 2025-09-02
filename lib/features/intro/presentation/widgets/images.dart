import 'dart:math';
import 'package:flutter/material.dart';

/// ── USE:  FourCircleCollage(size: 280, bg: Colors.black)
class FourCircleCollage extends StatelessWidget {
  const FourCircleCollage({
    super.key,
    required this.size,
    this.gap = 12,
    this.bg = const Color(0xFF0C0C0C),
    this.images = const [
      // replace with your assets/network images
      'https://anantaexpo.com/wp-content/uploads/2023/09/event-hostesses-bd.jpg', 
      'https://anantaexpo.com/wp-content/uploads/2023/09/event-hostesses-bd.jpg', 
      'https://anantaexpo.com/wp-content/uploads/2023/09/event-hostesses-bd.jpg',
      'https://anantaexpo.com/wp-content/uploads/2023/09/event-hostesses-bd.jpg', 
    ],
  });

  final double size;
  final double gap; // space between circles
  final Color bg;
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    final double tile = (size - gap) / 2; // circle size

    Widget circle(String url) => ClipOval(
          child: Image.network(url, width: tile, height: tile, fit: BoxFit.cover),
        );

    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // 4 circles precisely positioned with a tight inner gap
          Positioned(left: 0, top: 0, child: circle(images[0])),
          Positioned(right: 0, top: 0, child: circle(images[1])),
          Positioned(left: 0, bottom: 0, child: circle(images[2])),
          Positioned(right: 0, bottom: 0, child: circle(images[3])),

          // make the inner cross look rounded (like the screenshot)
          Align(
            alignment: Alignment.center,
            child: Container(
              width: gap,
              height: gap,
              decoration: BoxDecoration(
                color: bg,
                borderRadius: BorderRadius.circular(gap),
              ),
            ),
          ),

          // sparkle doodle (left)
          Positioned(
            left: -18,
            top: size * 0.28,
            child: const _Sparkle(size: 36),
          ),

          // small squiggle (right)
          Positioned(
            right: -6,
            top: size * 0.36,
            child: const _Squiggle(width: 28, height: 18),
          ),
        ],
      ),
    );
  }
}

/// 8-point sparkle like the design
class _Sparkle extends StatelessWidget {
  const _Sparkle({required this.size});
  final double size;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size.square(size),
      painter: _SparklePainter(),
    );
  }
}

class _SparklePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final p = Paint()
      ..color = Colors.white
      ..strokeWidth = 1.8
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    final c = Offset(size.width / 2, size.height / 2);
    final r = size.width / 2;
    for (int i = 0; i < 8; i++) {
      final a = pi / 4 * i;
      canvas.drawLine(c, c + Offset(cos(a) * r, sin(a) * r), p);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// small curved squiggle like the sample
class _Squiggle extends StatelessWidget {
  const _Squiggle({required this.width, required this.height});
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: Size(width, height), painter: _SquigglePainter());
  }
}

class _SquigglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final p = Paint()
      ..color = Colors.white
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    final path = Path()
      ..moveTo(0, size.height * .65)
      ..quadraticBezierTo(size.width * .25, 0, size.width * .5, size.height * .55)
      ..quadraticBezierTo(size.width * .7, size.height * 1.05, size.width, size.height * .35);
    canvas.drawPath(path, p);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
