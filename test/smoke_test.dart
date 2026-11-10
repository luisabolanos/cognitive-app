import 'package:flutter_test/flutter_test.dart';
import 'package:cognitive_app/app/routes/route_names.dart';

void main() {
  test('RouteNames defines core initial routes', () {
    expect(RouteNames.login, '/login');
    expect(RouteNames.home, '/home');
  });
}
