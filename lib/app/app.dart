import 'package:flutter/material.dart';

import 'routes.dart';
import 'theme.dart';

/// Root widget of Go Green.
///
/// Deliberately thin: theming lives in [AppTheme], routing lives in
/// [AppRoutes] — this file only wires the two together so `main.dart`
/// stays a one-liner.
class GoGreenApp extends StatelessWidget {
  const GoGreenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Go Green',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      initialRoute: AppRoutes.splash,
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}
