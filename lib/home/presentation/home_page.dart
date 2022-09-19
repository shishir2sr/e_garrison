import 'package:e_garrison/core/presentation/router/router.gr.dart';
import 'package:e_garrison/home/presentation/sidebar/sidebar_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:auto_route/auto_route.dart';

import '../../core/presentation/theming/custom_colors.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AutoTabsRouter(
      routes: const [MainRoute(), AnotherRoute()],
      builder: ((context, child, animation) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: CustomColors.darkBlue,
            title: const Text('Home'),
            centerTitle: true,
          ),
          backgroundColor: Colors.white,
          drawer: const SidebarScreen(),
          body: FadeTransition(
            opacity: animation,
            child: child,
          ),
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: tabsRouter.activeIndex,
              onTap: ((index) {
                tabsRouter.setActiveIndex(index);
              }),
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: 'home'),
                BottomNavigationBarItem(icon: Icon(Icons.map), label: 'map'),
              ]),
        );
      }),
    );
  }
}
// Scaffold(
//           backgroundColor: Colors.white,
//           drawer: const SidebarScreen(),
//           appBar: AppBar(
//             backgroundColor: CustomColors.darkBlue,
//             elevation: 5,
//             title: const Text('Home'),
//             centerTitle: true,
//           ),
//         );
//       }
