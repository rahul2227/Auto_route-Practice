import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter_bottom_navigation_with_nested_routing_tutorial/deep_links/deep_link_page.dart';
import 'package:flutter_bottom_navigation_with_nested_routing_tutorial/posts/posts_page.dart';

import '../routes/routes.gr.dart';
import '../posts/post_guard.dart';

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

  // FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;
  // @override
  // void initState() {
  //   initDynamicLinks();
  //   super.initState();
  // }

  // Future<void> initDynamicLinks() async {
  //   dynamicLinks.onLink.listen((dynamicLinkData) {
  //     // print(
  //     //     "This is the Deep Link path parameter ${dynamicLinkData.link.path}");
  //     // Navigator.pushNamed(context, dynamicLinkData.link.path);
  //     print(
  //         "This is the Deep Link path parameter ${dynamicLinkData.link.queryParameters.values.first}");
  //     Navigator.pushNamed(
  //         context, dynamicLinkData.link.queryParameters.values.first);
  //     // context.router
  //     //     .pushNamed(dynamicLinkData.link.queryParameters.values.first);
  //   }).onError((error) {
  //     print('onLink error');
  //     print(error.message);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   title: 'Bottom Nav Bar with Nested Routing',
    //   home: PostsPage(),
    //   routes: {'/settings': ((context) => const DeepLinkPage())},
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
    //       // if the user is Logged in, they may proceed to the main App
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

/*
// intial function
  void initDynamicLinks() async {
    if (!_isfirst) return;
    _isfirst = false;
    FirebaseDynamicLinks.instance.onLink(
        onSuccess: (PendingDynamicLinkData? dynamicLinkData) async {
      final Uri? deeplink = dynamicLinkData?.link;
      if (deeplink != null) {
        print("deeplink data " + deeplink.queryParameters.values.first);

        print('/${deeplink.pathSegments.elementAt(1)}');

        AutoRouter.of(context)
            .navigateNamed('/${deeplink.pathSegments.elementAt(1)}');
        Navigator.of(context).pushNamed(deeplink.queryParameters.values.first);

        print('/${deeplink.pathSegments.elementAt(1)}');

        Navigator.pushNamed(context, '/${deeplink.pathSegments.elementAt(1)}');
        Navigator.push
        print("Should have done the work");
        setState(() {
          _deepIndex = int.parse(deeplink.queryParameters.values.first);
          print('This is the current index that should change' +
              _deepIndex.toString());
        });
      }
      //  _changeisLoadingState();
    }, onError: (OnLinkErrorException e) async {
      print(e.message);
      // _changeisLoadingState();
    });
  }
  */