import 'package:flutter/material.dart';
import '../../viewmodels/cruise_booking_viewmodel.dart';

class TitleSectionWidget extends StatelessWidget {
  final CruiseBookingViewModel viewModel;

  const TitleSectionWidget({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  viewModel.destination.title,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  viewModel.destination.location,
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(
              viewModel.isStarred ? Icons.star : Icons.star_border,
              color: Colors.orange.shade700,
            ),
            onPressed: viewModel.toggleStar,
          ),
          Text(
            '${viewModel.destination.starCount}',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
