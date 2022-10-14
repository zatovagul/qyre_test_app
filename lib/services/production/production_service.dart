import '../../models/production/production_model.dart';

abstract class ProductionService {
  Future<List<ProductionModel> >getProductions();
}
