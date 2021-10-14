import 'package:flutter/material.dart';

class NavItem {
  const NavItem({required this.widget, this.selectedWidget, this.text});
  final Widget widget;
  final Widget? selectedWidget;
  final Text? text;
}
