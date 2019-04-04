library easter;

DateTime getEaster(int year) {
  final g = year % 19;
  final c = year ~/ 100;
  final h = (c - (c ~/ 4) - ((8 * c + 13) ~/ 25) + 19 * g + 15) % 30;
  final i = h - (h ~/ 28) * (1 - (h ~/ 28) * (29 ~/ (h + 1)) * ((21 - g) ~/ 11));

  var day = i - ((year + (year ~/ 4) + i + 2 - c + (c ~/ 4)) % 7) + 28;
  var month = 3;

  if (day > 31) {
    month++;
    day -= 31;
  }

  var easter = DateTime(year, month, day);
  return easter;
}
