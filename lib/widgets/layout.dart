import 'dart:io';

import 'package:flutter/material.dart';
import 'package:neith/widgets/app_bar/neith_app_bar.dart';

class Layout extends StatelessWidget {
  final Widget body;
  final EdgeInsets padding;
  final NeithAppBar? appBar;

  const Layout({
    Key? key,
    required this.body,
    this.padding = const EdgeInsets.all(20.0),
    this.appBar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid
        ? SafeArea(
            child: BaseLayout(
              appBar: appBar,
              padding: padding,
              body: body,
            ),
          )
        : BaseLayout(
            appBar: appBar,
            padding: padding,
            body: body,
          );
  }
}

class BaseLayout extends StatelessWidget {
  const BaseLayout({
    super.key,
    required this.appBar,
    required this.padding,
    required this.body,
  });

  final NeithAppBar? appBar;
  final EdgeInsets padding;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: appBar != null
          ? Column(
              children: [
                appBar!,
                Padding(
                  padding: padding,
                  child: body,
                ),
              ],
            )
          : Padding(
              padding: padding,
              child: body,
            ),
    );
  }
}
