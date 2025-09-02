import 'package:flutter/material.dart';

class AsymmetricPhotoCollage extends StatelessWidget {
  const AsymmetricPhotoCollage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white, // background like the design
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // First row
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _circleImage(
                "https://picsum.photos/id/1027/400/400", 
                110, // smaller left
              ),
              const SizedBox(width: 12),
              _circleImage(
                "https://picsum.photos/id/1011/600/600", 
                150, // bigger right
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Second row
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _circleImage(
                "https://picsum.photos/id/1025/600/600", 
                150, // bigger left
              ),
              const SizedBox(width: 12),
              _circleImage(
                "https://picsum.photos/id/1005/600/600", 
                150, // also bigger right
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _circleImage(String url, double size) {
    return ClipOval(
      child: Image.network(
        url,
        width: size,
        height: size,
        fit: BoxFit.cover,
      ),
    );
  }
}
