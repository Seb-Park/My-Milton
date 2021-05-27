import 'package:flutter/material.dart';

//Login
const TextStyle myMiltonTextStyle = TextStyle(
    fontFamily: 'Montserrat', fontSize: 40, fontWeight: FontWeight.w500);
const Color miltonTitleOrange = Color(0xFFfca503);

//Schedule
const double schedulePeriodWidth = 270;
const double topBarHeight = 150;
const double defaultDotSize = 15;
const double defaultTimelineWidth = 3;
const double topItemDistanceFromTop = 20;
const double scheduleItemBorderRadius = 50;
const double scheduleItemTextVerticalPadding = 8.0;
const double scheduleItemMargin = 8.0;
const double schedulePeriodFontSize = 15.0;
const double scheduleWeekdayChipBetweenPadding = 3.0;
const double scheduleTopBarInset = 30.0;

//Announcements
const double announcementCardMargin = 10.0;
const double announcementCardHeight = 90.0;
const double announcementCardBorderRadius = 10.0;
const double announcementProfilePicHeight = 60.0;
const double announcementProfilePicMargin = 8.0;
const double announcementTopBarHeight = 100.0;
const TextStyle announcementTitleTextStyle = TextStyle(
  fontWeight: FontWeight.bold,
  color: Colors.black,
);
const TextStyle announcementSecondaryTextStyle = TextStyle(color: Colors.grey);
const String announcementsErrorMessage = "Announcements could not be loaded";

//Announcement Colors
const Color announcementCardColor = Colors.white;

//Scaffold
const Color navBarColor = Color(0xFFf5f5f5);
const Color navBarSecondaryColor = Color(0xFF4abdff);
// const Color navButtonColor = Color(0xFFff9e61);
const Color navButtonColor = Color(0xFF4b4b4b);

const double floatingActionButtonSpacing = 8.0;
const double curvedTopBarCurvature = 30.0;

//Aaron's Class Colors
const Color paleOrange = Color(0xFFffe3d8);
const Color paleRed = Color(0xFFffcedd);
const Color palePink = Color(0xFFf6cef4);
const Color palePurple = Color(0xFFd8d8f3);
const Color paleBlue = Color(0xFFbfebfa);
const Color paleOcean = Color(0xFFccf4ec);
const Color paleGreen = Color(0xFFd0f9dc);
const Color darkGray75 = Color(0xFF4b4b4b);

const List<Color> periodColorOrder = [
  paleOrange,
  paleRed,
  palePink,
  palePurple,
  paleBlue,
  paleOcean,
  paleGreen,
  paleOrange
];

//Gradients
const Gradient dramaticOrangeGradient = LinearGradient(
  colors: [Color(0xFFF37335), Color(0xFFFDC830)],
);

const Gradient subtleLightOrangeGradient =
    LinearGradient(colors: [Color(0xFFffc67a), Color(0xFFffbc7d)]);

const Gradient subtleRedGradient =
    LinearGradient(colors: [Color(0xFFff82b0), Color(0xFFff7393)]);

const Gradient subtlePurpleGradient =
    LinearGradient(colors: [Color(0xFFe591ff), Color(0xFFbfa1ff)]);

const Gradient subtleLightBlueGradient =
    LinearGradient(colors: [Color(0xFF99d8ff), Color(0xFF91abff)]);

const Gradient subtleCyanGradient =
    LinearGradient(colors: [Color(0xFF67d7e6), Color(0xFF5ae6df)]);

const Gradient subtleGreenGradient =
    LinearGradient(colors: [Color(0xFF54e3d0), Color(0xFF84e3cd)]);

const Gradient subtleYellowGradient =
    LinearGradient(colors: [Color(0xFFf0e595), Color(0xFFe8da92)]);

const List<Gradient> subtleGradientsRainbow = [
  subtleRedGradient,
  subtleLightOrangeGradient,
  subtleYellowGradient,
  subtleGreenGradient,
  subtleCyanGradient,
  subtleLightBlueGradient,
  subtlePurpleGradient
];

const Gradient mainBrightBlueGradient = LinearGradient(
    colors: [Color(0xFF3a7bd5), Color(0xFF00d2ff)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight);

const Gradient mainBrightOrangeGradient = LinearGradient(
    colors: [Color(0xFFf83600), Color(0xFFfe8c00)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight);

const Gradient dramaticBrightOrangeGradient = LinearGradient(
    colors: [Color(0xFFf83600), Color(0xFFffac30)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight);

const Gradient loginScreenGradient = LinearGradient(
    colors: [Color(0xFF1fd2ff), Color(0xFF82b8ff)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight);
