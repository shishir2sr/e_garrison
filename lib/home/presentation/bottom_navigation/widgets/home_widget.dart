import 'package:flutter/material.dart';

import '../../bottom_menu/widgets/bottom_menu_bar.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: const Image(
              image: AssetImage('assets/images/googleMap.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const BottomMenuBar(),
      ],
    );
  }
}
