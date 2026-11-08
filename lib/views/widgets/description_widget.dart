import 'package:flutter/material.dart';

class DescriptionWidget extends StatelessWidget {
  final String description;

  const DescriptionWidget({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'About the Destination',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            description,
            style: TextStyle(
              fontSize: 12,
              height: 1.5,
              color: Theme.of(context).textTheme.bodyMedium?.color?.withOpacity(0.8),
            ),
          ),
        ],
      ),
    );
  }
}