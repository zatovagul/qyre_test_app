import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../constants/app_images.dart';
import '../../../../models/production/production_model.dart';
import '../../../../utils/date_util.dart';

class ProductionView extends StatelessWidget {
  final ProductionModel production;
  const ProductionView({
    super.key,
    required this.production,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return Container(
      height: 70,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: colorScheme.onBackground,
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Row(
        children: [
          Image.network(
            production.url,
            width: 70,
            height: 70,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 16),
          Expanded(child: _buildInfo(context)),
          const SizedBox(width: 6),
          SvgPicture.asset(AppImages.arrowRight),
          const SizedBox(width: 16),
        ],
      ),
    );
  }

  Widget _buildInfo(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          production.name,
          style: textTheme.headline3,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 4),
        Text.rich(
          TextSpan(
            style: textTheme.headline4,
            text: '${production.country}  ',
            children: [
              TextSpan(text: '${DateUtil.getDate(production.startDate)} - '),
              TextSpan(text: DateUtil.getDate(production.endDate)),
            ],
          ),
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
