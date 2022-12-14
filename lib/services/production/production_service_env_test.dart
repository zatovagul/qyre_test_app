import 'package:injectable/injectable.dart';

import '../../constants/app_images.dart';
import '../../models/production/production_model.dart';
import 'production_service.dart';

@Injectable(as: ProductionService, env: [Environment.test])
class ProductionServiceTest extends ProductionService {
  @override
  Future<List<ProductionModel>> getProductions() async {
    final List<ProductionModel> productions = [];
    productions.addAll([
      ProductionModel(
        url: AppImages.webImage,
        name: 'Production Name That is Long',
        country: 'Sweden',
        startDate: DateTime(2022, 1, 14),
        endDate: DateTime(2023, 2, 23),
      ),
    ]);
    return productions;
  }
}