import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../constants/app_images.dart';
import '../../../../l10n/localization_helper.dart';

class JobOfferPlaceHolder extends StatelessWidget {
  const JobOfferPlaceHolder({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    return Container(
      height: 128,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: colorScheme.onBackground,
      ),
      child: Row(
        children: [
          SvgPicture.asset(AppImages.jobOffer),
          const SizedBox(width: 18),
          Expanded(
            child: Column(
              children: [
                Text(
                  context.strings.jobOfferInfo,
                  style: textTheme.headline4?.copyWith(fontSize: 16),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      context.strings.goToProfile,
                      style: textTheme.bodyText1,
                    ),
                    const SizedBox(width: 4),
                    SvgPicture.asset(AppImages.arrowRight)
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
