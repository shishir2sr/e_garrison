import '../../../../core/presentation/theming/custom_colors.dart';
import '../models/sidebar_model.dart';

import 'package:flutter/material.dart';

class SideBarRow extends StatelessWidget {
  final SidebarItem item;

  const SideBarRow({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        // ignore: avoid_unnecessary_containers
        Container(
          width: 42,
          height: 42,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              gradient: item.background),
          child: item.icon,
        ),
        const SizedBox(
          width: 12,
        ),
        Center(
          child: Text(item.title.toString(), style: kCalloutLabelStyle),
        ),
      ],
    );
  }
}
