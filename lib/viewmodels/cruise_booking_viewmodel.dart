import 'package:flutter/material.dart';
import '../models/cruise_destination.dart';

class CruiseBookingViewModel extends ChangeNotifier {
  // Destination Model Data
  final CruiseDestination destination = CruiseDestination(
    title: 'Rajang River Express Cruise',
    location: 'Sibu Waterfront, Sarawak',
    description:
    'Experience the heart of Sibu along Malaysia\'s longest river, the Rajang. '
        'Cruise past historic temples, timber hubs, and traditional waterfront settlements '
        'while experiencing authentic Sarawakian hospitality.',
    imagePath: 'assets/rajang.jpeg',
    starCount: 43,
  );

  // Application State
  bool isStarred = false;
  bool isDarkMode = false;
  DateTime selectedDate = DateTime(2026, 11, 15);
  String selectedPackage = 'Express Boat';

  final List<String> cruisePackages = [
    'Express Boat',
    'Private River Cruise',
    'Sunset Cruise',
    'Sunrise Cruise',
    'Rural Cruise',
    'SMI Park Cruise',
  ];

  // Dynamic Star Counter (Show before & after click)
  void toggleStar() {
    if (isStarred) {
      destination.starCount--;
      isStarred = false;
    } else {
      destination.starCount++;
      isStarred = true;
    }
    notifyListeners();
  }

  // Dark Mode Toggle
  void toggleTheme(bool value) {
    isDarkMode = value;
    notifyListeners();
  }

  // Date Selection
  void updateDate(DateTime newDate) {
    selectedDate = newDate;
    notifyListeners();
  }

  // Package Selection
  void updatePackage(String newPackage) {
    selectedPackage = newPackage;
    notifyListeners();
  }
}