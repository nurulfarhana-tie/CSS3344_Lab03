import 'package:flutter/material.dart';
import '../../viewmodels/cruise_booking_viewmodel.dart';

class BookingControlsWidget extends StatelessWidget {
  final CruiseBookingViewModel viewModel;

  const BookingControlsWidget({super.key, required this.viewModel});

  Future<void> _pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: viewModel.selectedDate,
      firstDate: DateTime(2025),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      viewModel.updateDate(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    final String formattedDate =
        "${viewModel.selectedDate.day.toString().padLeft(2, '0')}/${viewModel.selectedDate.month.toString().padLeft(2, '0')}/${viewModel.selectedDate.year}";

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Trip Preferences',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            const Divider(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Cruise Date', style: TextStyle(fontSize: 13)),
                TextButton.icon(
                  onPressed: () => _pickDate(context),
                  icon: const Icon(Icons.calendar_month, size: 18),
                  label: Text(formattedDate, style: const TextStyle(fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Transport Mode', style: TextStyle(fontSize: 13)),
                DropdownButton<String>(
                  value: viewModel.selectedPackage,
                  items: viewModel.cruisePackages.map((pkg) {
                    return DropdownMenuItem<String>(
                      value: pkg,
                      child: Text(pkg, style: const TextStyle(fontSize: 13)),
                    );
                  }).toList(),
                  onChanged: (val) {
                    if (val != null) viewModel.updatePackage(val);
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Dark Mode Theme', style: TextStyle(fontSize: 13)),
                Switch(
                  value: viewModel.isDarkMode,
                  onChanged: viewModel.toggleTheme,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}