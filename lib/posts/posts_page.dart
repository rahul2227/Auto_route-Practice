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

  FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;
  @override
  void initState() {
    initDynamicLinks();
    super.initState();
  }

  Future<void> initDynamicLinks() async {
    dynamicLinks.onLink.listen((dynamicLinkData) {
      // print(
      //     "This is the Deep Link path parameter ${dynamicLinkData.link.path}");
      // Navigator.pushNamed(context, dynamicLinkData.link.path);
      print(
          "This is the Deep Link path parameter ${dynamicLinkData.link.queryParameters.values.first}");
      // Navigator.pushNamed(
      //     context, dynamicLinkData.link.queryParameters.values.first);
      context.router
          .pushNamed(dynamicLinkData.link.queryParameters.values.first);
    }).onError((error) {
      print('onLink error');
      print(error.message);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: ListView(
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
}
