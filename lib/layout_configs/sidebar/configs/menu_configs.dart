import 'package:flutter/material.dart';

import '../../portal_master_layout/portal_master_layout.dart';
import 'sidebar_model.dart';

final sidebarMenuConfigs = [
  const SidebarMenuConfig(
    uri: "DashboardScreen.routeName",
    icon: Icons.dashboard_rounded,
    title: "Dasboard",
  ),
  const SidebarMenuConfig(
    uri: '',
    icon: Icons.interests_rounded,
    title: "Patients",
    children: [
      SidebarChildMenuConfig(
          uri: "",
          icon: Icons.circle_outlined,
          title: "CPA course",
          childArguments: {
            "course": "CPA"
          },
          children: [
            SidebarChildChildMenuConfig(
              uri: "CourseSectionsScreen.routeName",
              // uri: RouteUri.courseSection,
              icon: Icons.foundation_outlined,
              title: "CPA Foundation",
              childChildArguments: {"level": "FOUNDATION"},
            ),
          ]),
      SidebarChildMenuConfig(
          uri: "",
          icon: Icons.circle_outlined,
          title: "ATD course",
          childArguments: {
            "course": "ATD"
          },
          children: [
            // SidebarChildChildMenuConfig(
            //   uri: CourseSectionsScreen.routeName,
            //   icon: Icons.foundation_outlined,
            //   title: "Level 1",
            //   childChildArguments: {"level": "ATD LEVEL I"},
            // ),
            // SidebarChildChildMenuConfig(
            //   uri: CourseSectionsScreen.routeName,
            //   icon: Icons.indeterminate_check_box_outlined,
            //   title: "Level 2",
            //   childChildArguments: {"level": "ATD LEVEL II"},
            // ),
            // SidebarChildChildMenuConfig(
            //   uri: CourseSectionsScreen.routeName,
            //   icon: Icons.switch_access_shortcut_outlined,
            //   title: "Level 3",
            //   childChildArguments: {"level": "ATD LEVEL III"},
            // ),
          ]),
      SidebarChildMenuConfig(
          uri: "",
          icon: Icons.circle_outlined,
          title: "Services",
          childArguments: {},
          children: [
            // SidebarChildChildMenuConfig(
            //   uri: CourseSectionsScreen.routeName,
            //   icon: Icons.foundation_outlined,
            //   title: "CIFA Foundation",
            //   childChildArguments: {"level": "FOUNDATION"},
            // ),
            // SidebarChildChildMenuConfig(
            //   uri: CourseSectionsScreen.routeName,
            //   icon: Icons.indeterminate_check_box_outlined,
            //   title: "CIFA Intermediate",
            //   childChildArguments: {"level": "INTERMEDIATE"},
            // ),
            // SidebarChildChildMenuConfig(
            //   uri: CourseSectionsScreen.routeName,
            //   icon: Icons.switch_access_shortcut_outlined,
            //   title: "CIFA Advanced",
            //   childChildArguments: {"level": "ADVANCED"},
            // ),
          ]),
    ],
  ),
  const SidebarMenuConfig(
    uri: "",
    icon: Icons.library_books_rounded,
    title: "Orders",
    children: [
      // SidebarChildMenuConfig(
      //   uri: ApprovedOrdersScreen.routeName,
      //   icon: Icons.circle_outlined,
      //   title: "Approved orders",
      // ),
      // SidebarChildMenuConfig(
      //   uri: UnapprovedOrdersScreen.routeName,
      //   icon: Icons.circle_outlined,
      //   title: "Unapproved orders",
      // ),
      // SidebarChildMenuConfig(
      //   uri: RejectededOrdersScreen.routeName,
      //   icon: Icons.circle_outlined,
      //   title: "Rejected orders",
      // ),
      // SidebarChildMenuConfig(
      //   uri: RedeemedOrdersScreen.routeName,
      //   icon: Icons.circle_outlined,
      //   title: "Redeemed orders",
      // ),
      // SidebarChildMenuConfig(
      //   uri: OrdersInUserCartScreen.routeName,
      //   icon: Icons.circle_outlined,
      //   title: "Orders in cart",
      // ),
    ],
  ),
  const SidebarMenuConfig(
    uri: "AllUsersScreen.routeName",
    icon: Icons.laptop_windows_rounded,
    title: "Users",
  ),
];

const localeMenuConfigs = [
  LocaleMenuConfig(
    languageCode: 'en',
    name: 'English',
  ),
  LocaleMenuConfig(
    languageCode: 'zh',
    scriptCode: 'Hans',
    name: '中文 (简体)',
  ),
  LocaleMenuConfig(
    languageCode: 'zh',
    scriptCode: 'Hant',
    name: '中文 (繁體)',
  ),
];
