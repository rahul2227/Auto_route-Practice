import 'dart:ffi';

import 'package:auto_route/auto_route.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';

import '../data/app_data.dart';
import '../routes/routes.gr.dart';
import '../widgets.dart';

class PostsPage extends StatefulWidget {
  PostsPage({Key? key}) : super(key: key);

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  final posts = Post.posts;

  // bool _isfirst = true;
  // @override
  // void didChangeDependencies() {
  //   if (_isfirst) {
  //     initDynamicLinks(context);
  //     _isfirst = false;
  //   }
  //   super.didChangeDependencies();
  // }

  // bool _isLoading = false, _isfirst = true;

  // void _changeisLoadingState() {
  //   setState(() {
  //     _isLoading = false;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // initDynamicLinks(context);
    return
        // (_isLoading)
        //     ? const SizedBox(
        //         height: 100,
        //         width: 100,
        //         child: CircularProgressIndicator(),
        //       )
        //:
        Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: ListView(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < posts.length; i++)
              PostTile(
                tileColor: posts[i].color,
                postTitle: posts[i].title,
                onTileTap: () {
                  context.router.push(
                    SinglePostRoute(postId: posts[i].id),
                  );

                  // context.router.pushNamed(path);
                },
              ),
          ],
        ),
      ),
    );
  }

  // void initDynamicLinks(BuildContext context) async {
  //   // if (!_isfirst) return;
  //   // _isfirst = false;
  //   FirebaseDynamicLinks.instance.onLink(
  //       onSuccess: (PendingDynamicLinkData? dynamicLinkData) async {
  //     final Uri? deeplink = dynamicLinkData?.link;
  //     if (deeplink != null) {
  //       print("deeplink data " + deeplink.queryParameters.values.first);
  //       AutoRouter.of(context)
  //           .navigateNamed(deeplink.queryParameters.values.first);
  //       //Navigator.of(context).pushNamed(deeplink.queryParameters.values.first);
  //       print("Should have done the work");
  //     }
  //     //  _changeisLoadingState();
  //   }, onError: (OnLinkErrorException e) async {
  //     print(e.message);
  //     // _changeisLoadingState();
  //   });
  // }
}
