import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bottom_navigation_with_nested_routing_tutorial/auth/email_login.dart';
import 'package:flutter_bottom_navigation_with_nested_routing_tutorial/auth/login_wrapper.dart';
import 'package:flutter_bottom_navigation_with_nested_routing_tutorial/auth/password_login.dart';

import '../routes/routes.gr.dart';

void main() => runApp(AppWidget());

class AppWidget extends StatefulWidget {
  AppWidget({Key? key}) : super(key: key);

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  final _appRouter = NavigationRouter();

  var isLoggedIn = false;

  @override
  Widget build(BuildContext context) {
    // return const MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   title: 'Bottom Nav Bar with Nested Routing',
    //   home: LoginWrapperPage(),
    // );
    // return MaterialApp.router(
    //   routeInformationParser: _appRouter.defaultRouteParser(),
    //   routerDelegate: _appRouter.delegate(),
    //   debugShowCheckedModeBanner: false,
    //   title: 'Bottom Nav Bar with Nested Routing',
    // );

    return MaterialApp.router(
      routeInformationParser: _appRouter.defaultRouteParser(
        includePrefixMatches: true,
      ),
      routerDelegate: AutoRouterDelegate.declarative(
        _appRouter,
        routes: (_) => [
          // if the user is Logged in, they may proceed to the main App
          if (isLoggedIn)
            const BottomNavigationHome()
          else
            LoginWrapperRoute(
                onLogin: (isLoggedIn) => onResult(context, isLoggedIn))
        ],
      ),
    );
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
