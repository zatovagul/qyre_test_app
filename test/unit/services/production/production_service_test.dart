import 'package:flutter_test/flutter_test.dart';
import 'package:qyre_test_app/di/di.dart';
import 'package:qyre_test_app/services/production/production_service.dart';

import '../../../test_setup.dart';

void main([List<String> strings = const []]) {
  if (strings.isEmpty) testSetUp();

  group('ProductionService', () {
    test('getProductions', () async {
      final productionService = locator<ProductionService>();
      final productions = await productionService.getProductions();
      expect(productions.length, 1);
      final prod = productions.first;
      expect(prod.country, 'Sweden');
      expect(prod.name, 'Production Name That is Long');
      expect(prod.startDate, DateTime.parse('2022-01-14'));
      expect(prod.endDate, DateTime.parse('2023-02-23 00:00:00.000'));
    });
  });
}
