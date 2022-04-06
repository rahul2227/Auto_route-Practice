import 'package:auto_route/auto_route.dart';
import 'package:flutter_bottom_navigation_with_nested_routing_tutorial/auth/email_login.dart';
import 'package:flutter_bottom_navigation_with_nested_routing_tutorial/auth/login_wrapper.dart';
import 'package:flutter_bottom_navigation_with_nested_routing_tutorial/auth/password_login.dart';
import 'package:flutter_bottom_navigation_with_nested_routing_tutorial/posts/invalid_post.dart';
import 'package:flutter_bottom_navigation_with_nested_routing_tutorial/posts/post_guard.dart';

import '../posts/posts_page.dart';
import '../posts/single_post_page.dart';
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
        )
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
