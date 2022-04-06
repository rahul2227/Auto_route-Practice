import 'package:auto_route/auto_route.dart';
import 'package:flutter_bottom_navigation_with_nested_routing_tutorial/posts/invalid_post.dart';
import 'package:flutter_bottom_navigation_with_nested_routing_tutorial/routes/routes.gr.dart';

class PostGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final postId = resolver.route.pathParams.get('postId');

    if (postId == 2) {
      router.push(const InvalidPostRoute());
    } else {
      resolver.next(true);
    }
  }
}
