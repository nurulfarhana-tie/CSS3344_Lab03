import 'package:flutter/material.dart';

class HeaderImageWidget extends StatelessWidget {
  final String imagePath;
  final double? height;
  final String label;

  const HeaderImageWidget({
    super.key,
    required this.imagePath,
    this.height,
    this.label = 'Sibu Esplanade Landmark',
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          imagePath,
          width: double.infinity,
          height: height ?? 240,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              height: height ?? 240,
              color: Colors.indigo.shade200,
              child: const Center(
                child: Icon(Icons.directions_boat, size: 70, color: Colors.white70),
              ),
            );
          },
        ),
        Positioned(
          bottom: 12,
          left: 16,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}