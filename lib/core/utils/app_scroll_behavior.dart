import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/// Custom [MaterialScrollBehavior] enabling smooth mouse drag, touch, and trackpad gestures
/// across Web and Desktop platforms for a desktop-like smooth scrolling experience.
class AppScrollBehavior extends MaterialScrollBehavior {
  const AppScrollBehavior();

  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.trackpad,
        PointerDeviceKind.stylus,
      };
}
