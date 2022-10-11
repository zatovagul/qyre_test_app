import 'package:flutter/material.dart';

class MenuTab extends StatefulWidget {
  const MenuTab({super.key});

  @override
  State<MenuTab> createState() => _MenuTabState();
}

class _MenuTabState extends State<MenuTab> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Menu Tab',
        style: Theme.of(context).textTheme.headline1,
      ),
    );
  }
}
