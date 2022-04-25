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
        // OrdersWrapperPageRoute(),
        DialogRouter()
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
            title: const Text('User'),
          ),
          SalomonBottomBarItem(
            selectedColor: Colors.pinkAccent[100],
            icon: const Icon(
              Icons.settings,
              size: 30,
            ),
            title: const Text('Setting'),
          ),
          SalomonBottomBarItem(
            selectedColor: Colors.greenAccent,
            icon: const Icon(
              Icons.bookmark,
              size: 30,
            ),
            title: const Text('Custom'),
          ),
        ],
      ),
    );
  }
}
