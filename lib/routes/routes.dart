import 'package:auto_route/auto_route.dart';

// import '../auth/email_page.dart';
// import '../auth/login_wrapper.dart';
// import '../auth/passwords_page.dart';
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
            AutoRoute(path: ':postId', page: SinglePostPage),
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
        // AutoRoute(
        //   path: '/login',
        //   page: LoginWrapperPage,
        //   children: [
        //     AutoRoute(page: EmailPage),
        //     AutoRoute(page: PasswordPage),
        //   ],
        // )
      ],
    ),
  ],
  replaceInRouteName: 'Page,Route',
)
class $NavigationRouter {}
