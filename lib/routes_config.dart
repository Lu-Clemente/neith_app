import 'package:flutter/material.dart';
import 'package:neith/navigator_keys.dart';
import 'package:neith/tab_item_widget.dart';
import 'package:neith/views/auth/reset_password_view.dart';
import 'package:neith/views/home/home_view.dart';
import 'package:neith/views/index_view.dart';
import 'package:neith/views/profile/profile_view.dart';
import 'package:neith/views/search/search_view.dart';

get tabs => [
      TabItemWidget(
        routes: {
          '/': (BuildContext context) => const HomeView(),
        },
        navigatorKey: NavigatorKeys.navigatorKeyHome,
      ),
      TabItemWidget(
        routes: {
          '/': (BuildContext context) => const SearchView(),
        },
        navigatorKey: NavigatorKeys.navigatorKeySearch,
      ),
      TabItemWidget(
        routes: {
          '/': (BuildContext context) => const Scaffold(
                body: Center(
                  child: Text('Travel Plans'),
                ),
              ),
        },
        navigatorKey: NavigatorKeys.navigatorKeyTravelPlans,
      ),
      TabItemWidget(
        routes: {
          '/': (BuildContext context) => ProfileView(),
          '/profile/notifications': (BuildContext context) => const Scaffold(
                body: Center(
                  child: Text('Notifications'),
                ),
              ),
        },
        navigatorKey: NavigatorKeys.navigatorKeyProfile,
      ),
    ];

Map<String, WidgetBuilder> get routes => {
      '/': (context) => const IndexView(),
      '/profile/reset_password': (context) => const ResetPasswordView(),
    };
