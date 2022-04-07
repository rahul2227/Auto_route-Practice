import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bottom_navigation_with_nested_routing_tutorial/routes/routes.gr.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class BottomNavigationHome extends StatelessWidget {
  const BottomNavigationHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      appBarBuilder: (context, tabsRouter) => AppBar(
        title: const Text('Router demo'),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        leading: const AutoBackButton(),
      ),
      backgroundColor: Colors.deepPurple,
      routes: const [
        PostsRouter(),
        UsersRouter(),
        SettingsRouter(),
        //OrdersWrapperPageRoute(),
        DialogRouter(),
      ],
      bottomNavigationBuilder: (_, tabsRoute) => SalomonBottomBar(
        currentIndex: tabsRoute.activeIndex,
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 40,
        ),
        onTap: tabsRoute.setActiveIndex,
        items: [
          SalomonBottomBarItem(
            selectedColor: Colors.amber,
            icon: const Icon(
              Icons.post_add,
              size: 30,
            ),
            title: const Text('Posts'),
          ),
          SalomonBottomBarItem(
            selectedColor: Colors.blue[200],
            icon: const Icon(
              Icons.person,
              size: 30,
            ),
            title: const Text('Person'),
          ),
          SalomonBottomBarItem(
            selectedColor: Colors.pinkAccent[100],
            icon: const Icon(
              Icons.settings,
              size: 30,
            ),
            title: const Text('Settings'),
          ),
          // SalomonBottomBarItem(
          //   selectedColor: Colors.greenAccent,
          //   icon: const Icon(
          //     Icons.shopping_bag_rounded,
          //     size: 30,
          //   ),
          //   title: const Text('Orders'),
          // ),
          SalomonBottomBarItem(
            selectedColor: Colors.cyan,
            icon: const Icon(
              Icons.dashboard_customize,
              size: 30,
            ),
            title: const Text('Custom'),
          ),
        ],
      ),
    );
  }
}
