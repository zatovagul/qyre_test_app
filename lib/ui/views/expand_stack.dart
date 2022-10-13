import 'package:flutter/material.dart';

class ExpandStack extends StatelessWidget {
  final bool expand;
  final Widget child;
  const ExpandStack({
    super.key,
    this.expand = false,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final top = MediaQuery.of(context).padding.top;
    final appBar = AppBar();
    final appBarHeight = appBar.preferredSize.height;
    return Padding(
      padding: EdgeInsets.only(top: top + appBarHeight),
      child: Stack(
        children: [
          AnimatedPositioned(
            left: 0,
            right: 0,
            top: expand ? 0 : -60,
            duration: const Duration(milliseconds: 100),
            child: child,
          ),
        ],
      ),
    );
  }
}
