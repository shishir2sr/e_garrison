import 'package:e_garrison/core/presentation/theming/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'sidebar/sidebar_screen.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const SidebarScreen(),
      appBar: AppBar(
        backgroundColor: CustomColors.darkBlue,
        elevation: 5,
        title: const Text('Home'),
        centerTitle: true,
      ),
    );
  }
}
