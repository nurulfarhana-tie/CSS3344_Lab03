import 'package:flutter/material.dart';

class ActionBarWidget extends StatelessWidget {
  const ActionBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final Color color = Theme.of(context).colorScheme.primary;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildActionItem(context, Icons.call, 'CALL', color),
          _buildActionItem(context, Icons.near_me, 'ROUTE', color),
          _buildActionItem(context, Icons.share, 'SHARE', color),
        ],
      ),
    );
  }

  Widget _buildActionItem(BuildContext context, IconData icon, String label, Color color) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: color),
        const SizedBox(height: 6),
        Text(
          label,
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: color),
        ),
      ],
    );
  }
}