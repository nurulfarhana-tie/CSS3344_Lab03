import 'package:flutter/material.dart';
import '../viewmodels/cruise_booking_viewmodel.dart';
import 'widgets/header_image_widget.dart';
import 'widgets/title_section_widget.dart';
import 'widgets/action_bar_widget.dart';
import 'widgets/description_widget.dart';
import 'widgets/booking_controls_widget.dart';

class CruiseBookingScreen extends StatelessWidget {
  final CruiseBookingViewModel viewModel;

  const CruiseBookingScreen({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sibu River Cruise & Heritage'),
        centerTitle: true,
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return orientation == Orientation.portrait
              ? _buildPortraitLayout()
              : _buildLandscapeLayout();
        },
      ),
    );
  }

  Widget _buildPortraitLayout() {
    return ListView(
      children: [
        HeaderImageWidget(imagePath: viewModel.destination.imagePath),
        TitleSectionWidget(viewModel: viewModel),
        const Divider(height: 1),
        const ActionBarWidget(),
        const Divider(height: 1),
        DescriptionWidget(description: viewModel.destination.description),
        BookingControlsWidget(viewModel: viewModel),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildLandscapeLayout() {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Column(
            children: [
              Expanded(
                child: HeaderImageWidget(
                  imagePath: viewModel.destination.imagePath,
                  height: double.infinity,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: ListView(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            children: [
              TitleSectionWidget(viewModel: viewModel),
              const Divider(height: 1),
              const ActionBarWidget(),
              const Divider(height: 1),
              DescriptionWidget(description: viewModel.destination.description),
              BookingControlsWidget(viewModel: viewModel),
            ],
          ),
        ),
      ],
    );
  }
}