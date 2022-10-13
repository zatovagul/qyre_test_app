import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../constants/app_images.dart';

class TaskView extends StatelessWidget {
  final String title;
  final double progress;
  final String buttonText;
  
  const TaskView({
    super.key,
    required this.title,
    required this.progress,
    required this.buttonText,
  }) : assert(progress >= 0 && progress <= 1);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final width = MediaQuery.of(context).size.width * 0.75;
    return Container(
      height: 136,
      width: width,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: colorScheme.onBackground,
      ),
      child: Column(
        children: [
          _buildTitle(context),
          const SizedBox(height: 18),
          _buildProgress(context),
          const Spacer(),
          _buildButton(context),
        ],
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Text(title);
  }

  Widget _buildProgress(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return LinearProgressIndicator(
      minHeight: 8,
      value: progress,
      color: colorScheme.primaryContainer,
    );
  }

  Widget _buildButton(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          buttonText,
          style: textTheme.bodyText1,
        ),
        const SizedBox(width: 4),
        SvgPicture.asset(AppImages.arrowRight)
      ],
    );
  }
}
