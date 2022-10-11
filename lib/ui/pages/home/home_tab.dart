import 'package:flutter/material.dart';

import '../../../l10n/localization_helper.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(context.strings.myAvailabiliy),
            centerTitle: false,
          ),
        ],
      ),
    );
  }
}
