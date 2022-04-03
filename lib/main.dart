import 'package:flutter/material.dart';

import '../routes/routes.gr.dart';

void main() {
  runApp(AppWidget());
}

class AppWidget extends StatelessWidget {
  final _appRouter = NavigationRouter();

  AppWidget({Key? key}) : super(key: key);

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
  }
}
