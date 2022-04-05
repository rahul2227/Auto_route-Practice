import 'package:auto_route/auto_route.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bottom_navigation_with_nested_routing_tutorial/routes/routes.gr.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class BottomNavigationHome extends StatefulWidget {
  const BottomNavigationHome({Key? key}) : super(key: key);

  @override
  State<BottomNavigationHome> createState() => _BottomNavigationHomeState();
}

class _BottomNavigationHomeState extends State<BottomNavigationHome> {
  int _deepIndex = -1;

  @override
  void initState() {
    // initDynamicLinks().then((value) => setState(() {
    //       _deepIndex = int.parse(value);
    //     }));
    // Future.delayed(Duration.zero, () => setDeepIndex());
    setDeepIndex();
    super.initState();
  }

  void setDeepIndex() async {
    var some = await initDynamicLinks();

    try {
      _deepIndex = int.parse(some);
    } on FormatException {
      print('Format Error');
    }

    print(_deepIndex);
  }

  // @override
  // void didChangeDependencies() async {
  //   //Future.delayed(Duration.zero, () => i)

  //   _deepIndex = int.parse(await initDynamicLinks());
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      homeIndex: _deepIndex,
      appBarBuilder: (context, tabsRouter) => AppBar(
        title: const Text('Router demo'),
        backgroundColor: Colors.indigo,
        centerTitle: true,
        leading: const AutoBackButton(),
        // actions: [], // I have to add action here so will need to pass data
      ),
      backgroundColor: Colors.indigo,
      routes: const [
        PostsRouter(),
        UsersRouter(),
        SettingsRouter(),
      ],
      bottomNavigationBuilder: (_, tabsRoute) => SalomonBottomBar(
        currentIndex: (_deepIndex == -1)
            ? tabsRoute.activeIndex
            : _deepIndex, // I can try and change the tab using this argument
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
            title: const Text('Posts'),
          ),
          SalomonBottomBarItem(
            selectedColor: Colors.pinkAccent[100],
            icon: const Icon(
              Icons.settings,
              size: 30,
            ),
            title: const Text('Posts'),
          ),
        ],
      ),
    );
  }

  Future<String> initDynamicLinks() async {
    try {
      FirebaseDynamicLinks.instance.onLink(
          onSuccess: (PendingDynamicLinkData? dynamicLinkData) async {
        final Uri? deeplink = dynamicLinkData?.link;
        if (deeplink != null) {
          return deeplink.queryParameters.values.first;
        }
      }, onError: (OnLinkErrorException e) async {
        print(e.message);
      });
    } on PlatformException {
      showDialog(
        context: this.context,
        builder: (_) => AlertDialog(
          title: const Text("Error"),
          content: const Text("Deep Link did not work"),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Camcel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
    return '';
  }
}

// intial function
// void initDynamicLinks() async {
//     // if (!_isfirst) return;
//     // _isfirst = false;
//     FirebaseDynamicLinks.instance.onLink(
//         onSuccess: (PendingDynamicLinkData? dynamicLinkData) async {
//       final Uri? deeplink = dynamicLinkData?.link;
//       if (deeplink != null) {
//         //print("deeplink data " + deeplink.queryParameters.values.first);
//         // AutoRouter.of(context).navigateNamed(deeplink.queryParameters.values.first);
//         //Navigator.of(context).pushNamed(deeplink.queryParameters.values.first);
//         // print("Should have done the work");
//         setState(() {
//           _deepIndex = int.parse(deeplink.queryParameters.values.first);
//           print('This is the current index that should change' +
//               _deepIndex.toString());
//         });
//       }
//       //  _changeisLoadingState();
//     }, onError: (OnLinkErrorException e) async {
//       print(e.message);
//       // _changeisLoadingState();
//     });
//   }