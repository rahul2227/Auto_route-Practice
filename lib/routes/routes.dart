import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../Custom/custom_detail.dart';
import '../Custom/custom_route.dart';
import '../auth/email_page.dart';
import '../auth/loginwrapper_page.dart';
import '../auth/password_page.dart';
import '../orders/order_history_page.dart';
import '../orders/order_page.dart';
import '../posts/invalid_post.dart';
import '../posts/post_guard.dart';
import '../posts/posts_page.dart';
import '../posts/single_post_page.dart';
import '../provider/order_wrapper.dart';
import '../settings/settings_page.dart';
import '../users/user_profile_page.dart';
import '../users/users_page.dart';
import '../bottom_navigation_home.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(
      path: '/',
      page: BottomNavigationHome,
      children: [
        AutoRoute(
          path: 'posts',
          name: 'PostsRouter',
          page: EmptyRouterPage,
          children: [
            AutoRoute(path: '', page: PostsPage),
            AutoRoute(
              path: ':postId',
              guards: [PostGuard],
              page: SinglePostPage,
            ),
            AutoRoute(
              path: 'invalidPostRoute',
              page: InvalidPostPage,
            ),
          ],
        ),
        AutoRoute(
          path: 'users',
          name: 'UsersRouter',
          page: EmptyRouterPage,
          children: [
            AutoRoute(path: '', page: UsersPage),
            AutoRoute(path: ':userId', page: UserProfilePage),
          ],
        ),
        AutoRoute(
          path: 'settings',
          name: 'SettingsRouter',
          page: SettingsPage,
        ),
        AutoRoute(
          path: 'ordersWrapper',
          name: 'OrdersWrapperPageRoute',
          page: OrdersWrapperPage,
          children: [
            AutoRoute(
              path: '',
              name: 'OrderRoute',
              page: OrderPage,
            ),
            AutoRoute(
              path: 'orderHistory',
              name: 'OrderHistoryRoute',
              page: OrderHistory,
            ),
          ],
        ),
        AutoRoute(
          path: 'dialog',
          name: 'DialogRouter',
          page: EmptyRouterPage,
          children: [
            AutoRoute(path: '', page: CustomRouteWrapper),
            CustomRoute(
              page: CustomDetail,
              name: 'CustomDetailRoute',
              transitionsBuilder: zoomInTransition,
              path: 'customDetail',
            ),
          ],
        ),
      ],
    ),
    AutoRoute(
      path: '/login',
      page: LoginWrapperPage,
      children: [
        AutoRoute(page: EmailLoginPage),
        AutoRoute(page: PasswordLoginPage),
      ],
    )
  ],
  replaceInRouteName: 'Page,Route',
)
class $NavigationRouter {}

Widget zoomInTransition(BuildContext context, Animation<double> animation,
    Animation<double> secondaryAnimation, Widget child) {
  return ScaleTransition(scale: animation, child: child);
}
