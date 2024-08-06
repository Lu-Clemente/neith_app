import 'package:flutter/material.dart';
import 'package:neith/navigator_keys.dart';
import 'package:neith/views/profile/profile_view.dart';

import 'package:neith/widgets/app_bar/custom_app_bar_label.dart';
import 'package:neith/widgets/buttons/app_bar_action_button.dart';
import 'package:neith/widgets/buttons/go_back_button.dart';

enum NeithAppBarAction { notifications, profile }

class NeithAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool showBackButton;
  final void Function()? onBackButtonPressed;
  final String? title;
  final String? subtitle;
  final List<NeithAppBarAction?> actions;
  final bool? centerTitle;

  const NeithAppBar({
    this.showBackButton = true,
    this.onBackButtonPressed,
    this.actions = const [],
    this.title,
    this.subtitle,
    this.centerTitle = false,
    Key? key,
  }) : super(key: key);

  _renderLabel() {
    if (title == null && subtitle != null) {
      throw Exception('Subtitle is required when title is provided');
    }
    if (title != null && subtitle != null) {
      return CustomAppBarLabel(
        title: title!,
        subtitle: subtitle!,
      );
    }
    if (title != null && subtitle == null) {
      return Text(
        title!,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      );
    }
    return null;
  }

  void _goToProfileView(context) {
    Navigator.push(
      NavigatorKeys.navigatorKeyMain.currentContext!,
      MaterialPageRoute(
        builder: (context) => ProfileView(),
      ),
    );
  }

  void _goToNotifications(BuildContext context) {
    Navigator.push(
      NavigatorKeys.navigatorKeyMain.currentContext!,
      MaterialPageRoute(
        builder: (context) => const Scaffold(
          body: Center(
            child: Text('Notifications'),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 10.0,
      ),
      child: AppBar(
        leading: showBackButton ? const GoBackButton() : null,
        leadingWidth: 40,
        toolbarHeight: 40,
        automaticallyImplyLeading: showBackButton,
        title: _renderLabel(),
        centerTitle: centerTitle,
        actions: [
          actions.contains(NeithAppBarAction.notifications)
              ? AppBarActionButton(
                  onPressed: () => _goToNotifications(context),
                  icon: Icons.notifications_none_outlined,
                )
              : const SizedBox(),
          actions.contains(NeithAppBarAction.profile)
              ? AppBarActionButton(
                  onPressed: () => _goToProfileView(context),
                  icon: Icons.person_outline,
                )
              : const SizedBox(),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
