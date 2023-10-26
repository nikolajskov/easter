[![Build Status](https://travis-ci.org/nikolajskov/easter.svg?branch=master)](https://travis-ci.org/nikolajskov/easter)


# easter

Small Dart package that calculates the date of Easter from 1583 to 4099.

## Usage

Calling the getEaster() method with a year as parameter returns a [DateTime](https://api.dartlang.org/stable/dart-core/DateTime-class.html) object with year, month and day properties set for Easter Sunday of the specified year. The time part of the [DateTime](https://api.dartlang.org/stable/dart-core/DateTime-class.html) object is not set.

```dart
import 'package:easter/easter.dart';

var easter = getEaster(2024);
print(easter); // 2024-03-31 00:00:00.000
```