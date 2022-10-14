import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class GradientCard extends StatelessWidget {
  final String image;
  final String title;
  final String info;
  final Color startColor;
  final Color endColor;

  const GradientCard({
    super.key,
    required this.image,
    required this.title,
    required this.info,
    required this.startColor,
    required this.endColor,
  });

  BoxDecoration _decoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(4),
      gradient: LinearGradient(
        colors: [startColor, endColor],
        begin: const Alignment(-1, -1),
        end: const Alignment(1, 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Container(
      height: 140,
      decoration: _decoration(),
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 12,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(image),
          const SizedBox(height: 12),
          Text(
            title,
            style: textTheme.button,
          ),
          const SizedBox(height: 3),
          Expanded(
            child: Text(
              info,
              style: textTheme.subtitle2,
              overflow: TextOverflow.fade,
            ),
          ),
        ],
      ),
    );
  }
}
