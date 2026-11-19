import 'package:flutter_test/flutter_test.dart';
import 'package:cognitive_app/app/routes/route_names.dart';
import 'package:cognitive_app/core/utils/date_utils.dart';
import 'package:cognitive_app/core/utils/number_utils.dart';
import 'package:cognitive_app/core/utils/validation_utils.dart';

void main() {
  test('RouteNames defines core initial routes', () {
    expect(RouteNames.login, '/login');
    expect(RouteNames.home, '/home');
  });

  test('ValidationUtils validates email and password rules', () {
    expect(ValidationUtils.validateEmail(''), isNotNull);
    expect(ValidationUtils.validateEmail('invalid-email'), isNotNull);
    expect(ValidationUtils.validateEmail('user@example.com'), isNull);

    expect(ValidationUtils.validatePassword('123'), isNotNull);
    expect(ValidationUtils.validatePassword('123456'), isNull);
  });

  test('NumberUtils and AppDateUtils format metrics cleanly', () {
    expect(NumberUtils.formatAccuracy(87.5), '87.5%');
    expect(NumberUtils.formatReactionTime(420), '420 ms');
    expect(AppDateUtils.formatDurationSeconds(65), '01:05');
  });
}
