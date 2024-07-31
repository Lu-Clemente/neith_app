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
    return SafeArea(
      child: Scaffold(
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
      ),
    );
  }
}
