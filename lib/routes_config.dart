import 'package:flutter/material.dart';
import 'package:neith/navigator_keys.dart';
import 'package:neith/tab_item_widget.dart';
import 'package:neith/views/auth/login_view.dart';
import 'package:neith/views/auth/reset_password_view.dart';
import 'package:neith/views/home/home_view.dart';
import 'package:neith/views/index_view.dart';
import 'package:neith/views/profile/notification_view.dart';
import 'package:neith/views/profile/profile_view.dart';
import 'package:neith/views/search/search_view.dart';
import 'package:neith/views/travelplans/travel_plans_view.dart';
import 'package:neith/views/travelplans/travel_plans_wizard_first_trip_view.dart';
import 'package:neith/views/travelplans/travel_plans_wizard_intern_view.dart';

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
          '/': (BuildContext context) => const TravelPlansView(),
          '/wizard': (BuildContext context) => TravelPlansWizardInternView(
                grandfathercontext: context,
              ),
        },
        navigatorKey: NavigatorKeys.navigatorKeyTravelPlans,
      ),
      TabItemWidget(
        routes: {
          '/': (BuildContext context) => ProfileView(),
          '/profile/notifications': (BuildContext context) =>
              const NotificationView(),
        },
        navigatorKey: NavigatorKeys.navigatorKeyProfile,
      ),
    ];

Map<String, WidgetBuilder> get routes => {
      '/': (context) => const IndexView(),
      '/login': (context) => const LoginView(),
      '/profile/reset_password': (context) => const ResetPasswordView(),
      '/profile/notifications': (BuildContext context) =>
          const NotificationView(),
      '/wizard': (BuildContext context) =>
          const TravelPlansWizardFirstTripView(),
    };
