import 'package:flutter/material.dart';

import '../../bottom_menu/widgets/bottom_menu_bar.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: const [
        BottomMenuBar(),
      ],
    );
  }
}
