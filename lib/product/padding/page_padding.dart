import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class PagePadding extends EdgeInsets {
  final BuildContext context;
  PagePadding.normalAll(this.context) : super.all(context.mediumValue);
}
