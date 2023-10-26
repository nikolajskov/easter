import 'dart:convert';
import 'package:test/test.dart';
import 'package:easter/easter.dart';
import 'package:test/test.dart';

void main() async {
  final json = await File('test/test_data.json').readAsString();
  List<DateTime> data = <DateTime>[];
  (jsonDecode(json) as List<dynamic>)
      .forEach((item) => data.add(DateTime.parse(item)));

  group('Get date of Easter', () {
    for (final expected in data) {
      final year = expected.year;
      test(year, () {
        final actual = getEaster(year);
        expect(actual, expected);
      });
    }
  });

  group('Invalid year throws error', () {
    var data = [-1, 0, 326, 1582, 4100];
    for (final year in data) {
      test(year, () {
        expect(() => getEaster(year), throwsArgumentError);
      });
    }
  });
}
