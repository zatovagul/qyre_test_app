import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants/app_images.dart';

class AppBottomNavigationBar extends StatelessWidget {
  final int index;
  final ValueChanged<int> onTap;
  const AppBottomNavigationBar({
    super.key,
    required this.index,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return BottomNavigationBar(
      backgroundColor: colorScheme.primary,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      onTap: onTap,
      items: [
        _buildItem(context, '', AppImages.home),
        _buildItem(context, '', AppImages.menu),
        _buildItem(context, '', AppImages.notification, count: 2),
      ],
    );
  }

  BottomNavigationBarItem _buildItem(
    BuildContext context,
    String label,
    String asset, {
    int? count,
  }) {
    return BottomNavigationBarItem(
      icon: Stack(
        children: [
          SizedBox(
            width: 54,
            height: 44,
            child: Center(
              child: SvgPicture.asset(
                asset,
                width: 20,
              ),
            ),
          ),
          if (count != null)
            Positioned(
              top: 4,
              right: 8,
              child: _buildCount(context, count),
            ),
        ],
      ),
      label: label,
    );
  }

  Widget _buildCount(BuildContext context, int count) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    return Container(
      height: 16,
      width: 16,
      decoration: BoxDecoration(
        color: colorScheme.error,
        borderRadius: BorderRadius.circular(90),
      ),
      child: Center(
        child: Text(
          '$count',
          style: textTheme.subtitle2,
        ),
      ),
    );
  }
}
