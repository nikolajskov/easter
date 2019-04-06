library easter;

/// Calculates the date of Easter of the specified [year].
///
/// The [year] must be between 1583 and 4099.
/// Returns a [DateTime] object with the date of Easter set and the time portion left untouched.
DateTime getEaster(int year) {
  if (year < 1583) {
    throw ArgumentError.value(year, 'year', 'Year cannot be earlier than 1583.');
  }
  if (year > 4099) {
    throw ArgumentError.value(year, 'year', 'Year cannot be later than 4099.');
  }

  final g = year % 19;
  final c = year ~/ 100;
  final h = (c - (c ~/ 4) - ((8 * c + 13) ~/ 25) + 19 * g + 15) % 30;
  final i =
      h - (h ~/ 28) * (1 - (h ~/ 28) * (29 ~/ (h + 1)) * ((21 - g) ~/ 11));

  var day = i - ((year + (year ~/ 4) + i + 2 - c + (c ~/ 4)) % 7) + 28;
  var month = 3;

  if (day > 31) {
    month++;
    day -= 31;
  }

  var easter = DateTime(year, month, day);
  return easter;
}
