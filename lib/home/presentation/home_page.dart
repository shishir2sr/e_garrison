import 'package:community_material_icon/community_material_icon.dart';
import 'package:e_garrison/core/presentation/router/router.gr.dart';
import 'package:e_garrison/home/presentation/sidebar/pages/sidebar_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:auto_route/auto_route.dart';

import '../../core/presentation/theming/custom_colors.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AutoTabsRouter(
      routes: const [MainRoute(), GuardsRoute()],
      builder: ((context, child, animation) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: CustomColors.darkBlue,
            title: const Text('Dashboard'),
            centerTitle: true,
          ),
          backgroundColor: Colors.white,
          drawer: const SidebarScreen(),

          body: SlideTransition(
            position: Tween(
                    begin: const Offset(1.0, 0.0), end: const Offset(0.0, 0.0))
                .animate(animation),
            child: child,
          ),
          // body: FadeTransition(
          //   opacity: animation,
          //   child: child,
          // ),
          bottomNavigationBar: BottomNavigationBar(
            elevation: 10,
            currentIndex: tabsRouter.activeIndex,
            onTap: ((index) {
              tabsRouter.setActiveIndex(index);
            }),
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home_outlined,
                    size: 40,
                  ),
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(
                    CommunityMaterialIcons.shield_account_outline,
                    size: 40,
                  ),
                  label: 'Guards'),
            ],
          ),
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
