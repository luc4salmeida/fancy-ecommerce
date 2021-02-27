library typography;

import 'package:flutter/material.dart';

/// A enumeration pattern to get defaults TextStyles
/// to make the app feel more identical
enum Typo {
  p,
  h1,
  h2,
  h3,
  h4,
  h5,
  h6,
}

extension TextExtension on TextStyle {
  TextStyle get p => copyWith(fontSize: 16.0);
  TextStyle get h1 => copyWith(fontSize: 32.0);
  TextStyle get h2 => copyWith(fontSize: 24.0);
  TextStyle get h3 => copyWith(fontSize: 18.0);
  TextStyle get h4 => copyWith(fontSize: 16.0);
  TextStyle get h5 => copyWith(fontSize: 13.0);
  TextStyle get h6 => copyWith(fontSize: 10.0);
}
