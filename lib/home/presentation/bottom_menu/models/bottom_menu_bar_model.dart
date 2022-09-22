import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';

class BottomMenuItem {
  final String? title;
  final LinearGradient? background;
  final Icon? icon;

  BottomMenuItem({this.title, this.background, this.icon});
}

var bottomMenuItem = [
  BottomMenuItem(
    title: "Panic Mode",
    background: const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color.fromARGB(255, 230, 124, 124),
        Color.fromARGB(255, 192, 55, 55),
      ],
    ),
    icon: const Icon(
      Icons.crisis_alert,
      color: Colors.white,
      size: 70,
    ),
  ),
  BottomMenuItem(
    title: "Clock In",
    background: const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color.fromARGB(255, 63, 134, 228),
          Color.fromARGB(255, 0, 90, 207),
        ]),
    icon: const Icon(
      Icons.alarm,
      color: Colors.white,
      size: 70,
    ),
  ),
  BottomMenuItem(
    title: "Flash Light",
    background: const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color.fromARGB(255, 245, 171, 125),
          Color(0xFFF0803C),
        ]),
    icon: const Icon(
      CommunityMaterialIcons.flashlight,
      color: Colors.white,
      size: 70,
    ),
  ),
  BottomMenuItem(
    title: "Report",
    background: const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color.fromARGB(255, 73, 201, 124),
        Color.fromARGB(255, 22, 107, 56),
      ],
    ),
    icon: const Icon(
      Icons.view_list,
      color: Colors.white,
      size: 70,
    ),
  ),
  BottomMenuItem(
    title: "Site Tour",
    background: const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color.fromARGB(255, 223, 135, 171),
        Color(0xFF8F2D56),
      ],
    ),
    icon: const Icon(
      Icons.pin_drop,
      color: Colors.white,
      size: 70,
    ),
  ),
  BottomMenuItem(
    title: "More",
    background: const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color.fromARGB(255, 134, 162, 223),
        Color(0xFF3B5998),
      ],
    ),
    icon: const Icon(
      CommunityMaterialIcons.dots_horizontal,
      color: Colors.white,
      size: 70,
    ),
  ),
];
