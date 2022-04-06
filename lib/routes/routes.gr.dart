// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i15;

import '../auth/email_login.dart' as _i13;
import '../auth/login_wrapper.dart' as _i2;
import '../auth/password_login.dart' as _i14;
import '../bottom_navigation_home.dart' as _i1;
import '../orders/order_history_page.dart' as _i12;
import '../orders/order_page.dart' as _i11;
import '../orders/order_wrapper.dart' as _i5;
import '../posts/invalid_post.dart' as _i8;
import '../posts/post_guard.dart' as _i16;
import '../posts/posts_page.dart' as _i6;
import '../posts/single_post_page.dart' as _i7;
import '../settings/settings_page.dart' as _i4;
import '../users/user_profile_page.dart' as _i10;
import '../users/users_page.dart' as _i9;

class NavigationRouter extends _i3.RootStackRouter {
  NavigationRouter(
      {_i15.GlobalKey<_i15.NavigatorState>? navigatorKey,
      required this.postGuard})
      : super(navigatorKey);

  final _i16.PostGuard postGuard;

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    BottomNavigationHome.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.BottomNavigationHome());
    },
    LoginWrapperRoute.name: (routeData) {
      final args = routeData.argsAs<LoginWrapperRouteArgs>();
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i2.LoginWrapperPage(key: args.key, onLogin: args.onLogin));
    },
    PostsRouter.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.EmptyRouterPage());
    },
    UsersRouter.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.EmptyRouterPage());
    },
    SettingsRouter.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.SettingsPage());
    },
    OrdersWrapperPageRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.OrdersWrapperPage());
    },
    PostsRoute.name: (routeData) {
      final args = routeData.argsAs<PostsRouteArgs>(
          orElse: () => const PostsRouteArgs());
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: _i6.PostsPage(key: args.key));
    },
    SinglePostRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<SinglePostRouteArgs>(
          orElse: () =>
              SinglePostRouteArgs(postId: pathParams.getInt('postId')));
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i7.SinglePostPage(key: args.key, postId: args.postId));
    },
    InvalidPostRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.InvalidPostPage());
    },
    UsersRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i9.UsersPage());
    },
    UserProfileRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<UserProfileRouteArgs>(
          orElse: () =>
              UserProfileRouteArgs(userId: pathParams.getInt('userId')));
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i10.UserProfilePage(key: args.key, userId: args.userId));
    },
    OrderRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i11.OrderPage());
    },
    OrderHistoryRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i12.OrderHistory());
    },
    EmailLoginRoute.name: (routeData) {
      final args = routeData.argsAs<EmailLoginRouteArgs>();
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i13.EmailLoginPage(key: args.key, onNext: args.onNext));
    },
    PasswordLoginRoute.name: (routeData) {
      final args = routeData.argsAs<PasswordLoginRouteArgs>();
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i14.PasswordLoginPage(key: args.key, onNext: args.onNext));
    }
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(BottomNavigationHome.name, path: '/', children: [
          _i3.RouteConfig(PostsRouter.name,
              path: 'posts',
              parent: BottomNavigationHome.name,
              children: [
                _i3.RouteConfig(PostsRoute.name,
                    path: '', parent: PostsRouter.name),
                _i3.RouteConfig(SinglePostRoute.name,
                    path: ':postId',
                    parent: PostsRouter.name,
                    guards: [postGuard]),
                _i3.RouteConfig(InvalidPostRoute.name,
                    path: 'invalidPostRoute', parent: PostsRouter.name)
              ]),
          _i3.RouteConfig(UsersRouter.name,
              path: 'users',
              parent: BottomNavigationHome.name,
              children: [
                _i3.RouteConfig(UsersRoute.name,
                    path: '', parent: UsersRouter.name),
                _i3.RouteConfig(UserProfileRoute.name,
                    path: ':userId', parent: UsersRouter.name)
              ]),
          _i3.RouteConfig(SettingsRouter.name,
              path: 'settings', parent: BottomNavigationHome.name),
          _i3.RouteConfig(OrdersWrapperPageRoute.name,
              path: 'ordersWrapper',
              parent: BottomNavigationHome.name,
              children: [
                _i3.RouteConfig(OrderRoute.name,
                    path: '', parent: OrdersWrapperPageRoute.name),
                _i3.RouteConfig(OrderHistoryRoute.name,
                    path: 'orderHistory', parent: OrdersWrapperPageRoute.name)
              ])
        ]),
        _i3.RouteConfig(LoginWrapperRoute.name, path: '/login', children: [
          _i3.RouteConfig(EmailLoginRoute.name,
              path: 'email-login-page', parent: LoginWrapperRoute.name),
          _i3.RouteConfig(PasswordLoginRoute.name,
              path: 'password-login-page', parent: LoginWrapperRoute.name)
        ])
      ];
}

/// generated route for
/// [_i1.BottomNavigationHome]
class BottomNavigationHome extends _i3.PageRouteInfo<void> {
  const BottomNavigationHome({List<_i3.PageRouteInfo>? children})
      : super(BottomNavigationHome.name, path: '/', initialChildren: children);

  static const String name = 'BottomNavigationHome';
}

/// generated route for
/// [_i2.LoginWrapperPage]
class LoginWrapperRoute extends _i3.PageRouteInfo<LoginWrapperRouteArgs> {
  LoginWrapperRoute(
      {_i15.Key? key,
      required dynamic Function(bool) onLogin,
      List<_i3.PageRouteInfo>? children})
      : super(LoginWrapperRoute.name,
            path: '/login',
            args: LoginWrapperRouteArgs(key: key, onLogin: onLogin),
            initialChildren: children);

  static const String name = 'LoginWrapperRoute';
}

class LoginWrapperRouteArgs {
  const LoginWrapperRouteArgs({this.key, required this.onLogin});

  final _i15.Key? key;

  final dynamic Function(bool) onLogin;

  @override
  String toString() {
    return 'LoginWrapperRouteArgs{key: $key, onLogin: $onLogin}';
  }
}

/// generated route for
/// [_i3.EmptyRouterPage]
class PostsRouter extends _i3.PageRouteInfo<void> {
  const PostsRouter({List<_i3.PageRouteInfo>? children})
      : super(PostsRouter.name, path: 'posts', initialChildren: children);

  static const String name = 'PostsRouter';
}

/// generated route for
/// [_i3.EmptyRouterPage]
class UsersRouter extends _i3.PageRouteInfo<void> {
  const UsersRouter({List<_i3.PageRouteInfo>? children})
      : super(UsersRouter.name, path: 'users', initialChildren: children);

  static const String name = 'UsersRouter';
}

/// generated route for
/// [_i4.SettingsPage]
class SettingsRouter extends _i3.PageRouteInfo<void> {
  const SettingsRouter() : super(SettingsRouter.name, path: 'settings');

  static const String name = 'SettingsRouter';
}

/// generated route for
/// [_i5.OrdersWrapperPage]
class OrdersWrapperPageRoute extends _i3.PageRouteInfo<void> {
  const OrdersWrapperPageRoute({List<_i3.PageRouteInfo>? children})
      : super(OrdersWrapperPageRoute.name,
            path: 'ordersWrapper', initialChildren: children);

  static const String name = 'OrdersWrapperPageRoute';
}

/// generated route for
/// [_i6.PostsPage]
class PostsRoute extends _i3.PageRouteInfo<PostsRouteArgs> {
  PostsRoute({_i15.Key? key})
      : super(PostsRoute.name, path: '', args: PostsRouteArgs(key: key));

  static const String name = 'PostsRoute';
}

class PostsRouteArgs {
  const PostsRouteArgs({this.key});

  final _i15.Key? key;

  @override
  String toString() {
    return 'PostsRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i7.SinglePostPage]
class SinglePostRoute extends _i3.PageRouteInfo<SinglePostRouteArgs> {
  SinglePostRoute({_i15.Key? key, required int postId})
      : super(SinglePostRoute.name,
            path: ':postId',
            args: SinglePostRouteArgs(key: key, postId: postId),
            rawPathParams: {'postId': postId});

  static const String name = 'SinglePostRoute';
}

class SinglePostRouteArgs {
  const SinglePostRouteArgs({this.key, required this.postId});

  final _i15.Key? key;

  final int postId;

  @override
  String toString() {
    return 'SinglePostRouteArgs{key: $key, postId: $postId}';
  }
}

/// generated route for
/// [_i8.InvalidPostPage]
class InvalidPostRoute extends _i3.PageRouteInfo<void> {
  const InvalidPostRoute()
      : super(InvalidPostRoute.name, path: 'invalidPostRoute');

  static const String name = 'InvalidPostRoute';
}

/// generated route for
/// [_i9.UsersPage]
class UsersRoute extends _i3.PageRouteInfo<void> {
  const UsersRoute() : super(UsersRoute.name, path: '');

  static const String name = 'UsersRoute';
}

/// generated route for
/// [_i10.UserProfilePage]
class UserProfileRoute extends _i3.PageRouteInfo<UserProfileRouteArgs> {
  UserProfileRoute({_i15.Key? key, required int userId})
      : super(UserProfileRoute.name,
            path: ':userId',
            args: UserProfileRouteArgs(key: key, userId: userId),
            rawPathParams: {'userId': userId});

  static const String name = 'UserProfileRoute';
}

class UserProfileRouteArgs {
  const UserProfileRouteArgs({this.key, required this.userId});

  final _i15.Key? key;

  final int userId;

  @override
  String toString() {
    return 'UserProfileRouteArgs{key: $key, userId: $userId}';
  }
}

/// generated route for
/// [_i11.OrderPage]
class OrderRoute extends _i3.PageRouteInfo<void> {
  const OrderRoute() : super(OrderRoute.name, path: '');

  static const String name = 'OrderRoute';
}

/// generated route for
/// [_i12.OrderHistory]
class OrderHistoryRoute extends _i3.PageRouteInfo<void> {
  const OrderHistoryRoute()
      : super(OrderHistoryRoute.name, path: 'orderHistory');

  static const String name = 'OrderHistoryRoute';
}

/// generated route for
/// [_i13.EmailLoginPage]
class EmailLoginRoute extends _i3.PageRouteInfo<EmailLoginRouteArgs> {
  EmailLoginRoute({_i15.Key? key, required Function onNext})
      : super(EmailLoginRoute.name,
            path: 'email-login-page',
            args: EmailLoginRouteArgs(key: key, onNext: onNext));

  static const String name = 'EmailLoginRoute';
}

class EmailLoginRouteArgs {
  const EmailLoginRouteArgs({this.key, required this.onNext});

  final _i15.Key? key;

  final Function onNext;

  @override
  String toString() {
    return 'EmailLoginRouteArgs{key: $key, onNext: $onNext}';
  }
}

/// generated route for
/// [_i14.PasswordLoginPage]
class PasswordLoginRoute extends _i3.PageRouteInfo<PasswordLoginRouteArgs> {
  PasswordLoginRoute({_i15.Key? key, required Function onNext})
      : super(PasswordLoginRoute.name,
            path: 'password-login-page',
            args: PasswordLoginRouteArgs(key: key, onNext: onNext));

  static const String name = 'PasswordLoginRoute';
}

class PasswordLoginRouteArgs {
  const PasswordLoginRouteArgs({this.key, required this.onNext});

  final _i15.Key? key;

  final Function onNext;

  @override
  String toString() {
    return 'PasswordLoginRouteArgs{key: $key, onNext: $onNext}';
  }
}
