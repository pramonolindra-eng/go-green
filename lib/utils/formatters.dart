/// Formats an integer with Indonesian-style thousands separators, e.g.
/// `formatPoints(1250)` → `'1.250'`.
///
/// Kept dependency-free (no `intl` package) since this is the only
/// formatting need so far — revisit if locale-aware formatting
/// becomes necessary elsewhere.
String formatPoints(int value) {
  final raw = value.abs().toString();
  final buffer = StringBuffer();

  for (var i = 0; i < raw.length; i++) {
    final positionFromEnd = raw.length - i;
    buffer.write(raw[i]);
    final isThousandsBoundary = positionFromEnd > 1 && positionFromEnd % 3 == 1;
    if (isThousandsBoundary) buffer.write('.');
  }

  return value < 0 ? '-$buffer' : buffer.toString();
}
