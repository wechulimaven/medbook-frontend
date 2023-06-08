import 'package:flutter/material.dart';

class SidebarMenuConfig {
  final String uri;
  final IconData icon;
  final String title;
  final List<SidebarChildMenuConfig> children;

  const SidebarMenuConfig({
    required this.uri,
    required this.icon,
    required this.title,
    List<SidebarChildMenuConfig>? children,
    Map<String, String>? arguments,
  }) : children = children ?? const [];
}

class SidebarChildMenuConfig {
  final String uri;
  final IconData icon;
  final String title;
  final List<SidebarChildChildMenuConfig> children;
  final Map<String, String> childArguments;

  const SidebarChildMenuConfig({
    required this.uri,
    required this.icon,
    required this.title,
    List<SidebarChildChildMenuConfig>? children,
    Map<String, String>? childArguments,
  })  : children = children ?? const [],
        childArguments = childArguments ?? const {};
}

class SidebarChildChildMenuConfig {
  final String uri;
  final IconData icon;
  final String title;
  final Map<String, String> childChildArguments;

  const SidebarChildChildMenuConfig({
    required this.uri,
    required this.icon,
    required this.title,
    Map<String, String>? childChildArguments,
  }) : childChildArguments = childChildArguments ?? const {};
}
