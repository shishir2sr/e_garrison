import 'package:flutter/material.dart';

class SidebarItem {
  SidebarItem({this.title, this.background, this.icon});

  String? title;
  LinearGradient? background;
  Icon? icon;
}

var sidebarItem = [
  SidebarItem(
    title: "Home",
    background: const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFF00AEFF),
        Color(0xFF0076FF),
      ],
    ),
    icon: const Icon(
      Icons.home,
      color: Colors.white,
    ),
  ),
  SidebarItem(
    title: "My Profile",
    background: const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xFFFA7d75),
          Color(0xFFC23D61),
        ]),
    icon: const Icon(
      Icons.person,
      color: Colors.white,
    ),
  ),
  SidebarItem(
    title: "Reports",
    background: const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xFFFAD64A),
          Color(0xFFEA880F),
        ]),
    icon: const Icon(
      Icons.list,
      color: Colors.white,
    ),
  ),
  SidebarItem(
    title: "Settings",
    background: const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFF4E62CC),
        Color(0xFF202A78),
      ],
    ),
    icon: const Icon(
      Icons.settings,
      color: Colors.white,
    ),
  ),
];
