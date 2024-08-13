import 'package:flutter/material.dart';
import 'package:neith/routes_config.dart';
import 'package:neith/views/index_controller.dart';
import 'package:neith/widgets/navigation_bar/navigation_bar.dart';

class IndexView extends StatefulWidget {
  const IndexView({super.key});

  @override
  State<IndexView> createState() => _IndexViewState();
}

class _IndexViewState extends State<IndexView> {
  final _controller = IndexController();

  void _onItemTapped(int index) {
    setState(() {
      _controller.onItemTapped(index: index);
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBarWidget(
        controller: _controller,
        onItemTapped: _onItemTapped,
      ),
      body: IndexedStack(
        index: _controller.currentTab,
        children: tabs,
      ),
    );
  }
}
