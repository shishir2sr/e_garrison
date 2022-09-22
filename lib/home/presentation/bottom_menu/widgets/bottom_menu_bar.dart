import 'package:e_garrison/home/presentation/bottom_menu/widgets/bottom_menu_Item_column.dart';
import 'package:flutter/material.dart';

import '../models/bottom_menu_bar_model.dart';

class BottomMenuBar extends StatelessWidget {
  const BottomMenuBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(color: Colors.white),
      height: MediaQuery.of(context).size.height * 0.45,
      width: MediaQuery.of(context).size.width,
      child: GridView.count(
        shrinkWrap: true,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 3,
        children: bottomMenuItem
            .map((item) => BottomMenuItemColumn(item: item))
            .toList(),
      ),
    );
  }
}
