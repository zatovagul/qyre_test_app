import 'test_setup.dart';
import 'unit/unit_test.dart' as unit_test;
import 'widget/widget_test.dart' as widget_test;

void main() {
  testSetUp();
  unit_test.main(['']);
  widget_test.main(['']);
}
