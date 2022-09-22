// ignore: file_names
import 'package:flutter/material.dart';

import '../../../../core/presentation/theming/custom_colors.dart';
import '../models/bottom_menu_bar_model.dart';

class BottomMenuItemColumn extends StatelessWidget {
  const BottomMenuItemColumn({
    Key? key,
    required this.item,
  }) : super(key: key);

  final BottomMenuItem item;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40, width: 40,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), gradient: item.background),
      // child: item.icon,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            child: item.icon,
          ),
          const SizedBox(
            height: 12,
          ),
          Center(
            child: Text(item.title.toString(), style: kBottomMenuItemStyle),
          ),
        ],
      ),
    );
  }
}
