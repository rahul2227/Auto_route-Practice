import 'package:auto_route/auto_route.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bottom_navigation_with_nested_routing_tutorial/posts/post_guard.dart';

import '../routes/routes.gr.dart';

void main() async {
  await init();
  runApp(AppWidget());
}

Future init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}

class AppWidget extends StatefulWidget {
  AppWidget({Key? key}) : super(key: key);

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  final _appRouter = NavigationRouter(postGuard: PostGuard());
  var isLoggedIn = false;

  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   title: 'Bottom Nav Bar with Nested Routing',
    //   home: PostsPage(),
    // );
    return MaterialApp.router(
      routeInformationParser: _appRouter.defaultRouteParser(),
      routerDelegate: _appRouter.delegate(),
      debugShowCheckedModeBanner: false,
      title: 'Bottom Nav Bar with Nested Routing',
    );

    // return MaterialApp.router(
    //   routeInformationParser: _appRouter.defaultRouteParser(
    //     includePrefixMatches: true,
    //   ),
    //   routerDelegate: AutoRouterDelegate.declarative(
    //     _appRouter,
    //     routes: (_) => [
    //       if (isLoggedIn)
    //         const BottomNavigationHome()
    //       else
    //         LoginWrapperRoute(
    //             onLogin: (isLoggedIn) => onResult(context, isLoggedIn))
    //     ],
    //   ),
    // );
  }

  onResult(BuildContext context, bool isSuccess) {
    String mesg;
    if (isSuccess) {
      mesg = 'LoggedIn successfully';
      setState(() {
        isLoggedIn = true;
      });
    } else {
      mesg = 'Login failed';
    }
    print(mesg);
  }
}
