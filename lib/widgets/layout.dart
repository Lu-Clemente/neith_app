import 'dart:io';

import 'package:flutter/material.dart';
import 'package:neith/views/index_controller.dart';
import 'package:neith/widgets/app_bar/neith_app_bar.dart';

class Layout extends StatelessWidget {
  final Widget? body;
  final EdgeInsets padding;
  final NeithAppBar? appBar;
  final bool? navBar;
  final IndexController? controller;
  final Function(int)? onItemTapped;

  const Layout({
    Key? key,
    this.body,
    this.padding = const EdgeInsets.all(20.0),
    this.appBar,
    this.navBar,
    this.controller,
    this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: appBar,
      body: Platform.isAndroid
          ? SafeArea(
              child: Padding(
                padding: padding,
                child: body,
              ),
            )
          : Padding(
              padding: padding,
              child: body,
            ),
    );
  }
}
