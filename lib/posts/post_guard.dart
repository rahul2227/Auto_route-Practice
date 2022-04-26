import 'package:auto_route/auto_route.dart';
import '../routes/routes.gr.dart';

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
