import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../screens/home/dashboard_screen.dart';
import '../../screens/signup_patient_screen.dart';

final GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();

final Map<String, WidgetBuilder> routes = {
  LoginScreen.routeName: (context) => myRoute(const LoginScreen()),
  DashboardScreen.routeName: (context) => myRoute(const DashboardScreen()),
};

Widget myRoute(var widget) {
  return AnnotatedRegion<SystemUiOverlayStyle>(
    value: const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
    child: widget,
  );
}

class GlobalNavigationService {
  Future<dynamic> logOutUser(String route) async {
    // await inject<SharedHelper>().clearStorage();
    return navigationKey.currentState!
        .pushNamedAndRemoveUntil(route, (Route<dynamic> route) => false);
  }

  static void goback() {
    return navigationKey.currentState!.pop();
  }
}

// class RouteUri {
//   static const String home = '/';
//   static const String dashboard = '/dashboard';
//   static const String courseSection = '/course-sections/:course/:level';
//   static const String logout = '/logout';
//   static const String form = '/form';
//   static const String generalUi = '/general-ui';
//   static const String colors = '/colors';
//   static const String text = '/text';
//   static const String buttons = '/buttons';
//   static const String dialogs = '/dialogs';
//   static const String error404 = '/404';
//   static const String login = '/login';
//   static const String register = '/register';
//   static const String crud = '/crud';
//   static const String crudDetail = '/crud-detail';
//   static const String iframe = '/iframe';
// }

// class RouteName {
//   static const String course = 'course';
//   static const String home = 'home';
//   static const String dashboard = 'dashboard';
// }

// const List<String> unrestrictedRoutes = [
//   RouteUri.error404,
//   RouteUri.logout,
//   RouteUri.login, // Remove this line for actual authentication flow.
//   RouteUri.register, // Remove this line for actual authentication flow.
// ];

// const List<String> publicRoutes = [
//   // RouteUri.login, // Enable this line for actual authentication flow.
//   // RouteUri.register, // Enable this line for actual authentication flow.
// ];

// GoRouter appRouter(userDataProvider) {
//   return GoRouter(
//     initialLocation: RouteUri.login,
//     errorPageBuilder: (context, state) => NoTransitionPage<void>(
//         key: state.pageKey, child: const SizedBox() //const ErrorScreen(),
//         ),
//     routes: [
//       GoRoute(
//         path: RouteUri.login,
//         pageBuilder: (context, state) => NoTransitionPage<void>(
//           key: state.pageKey,
//           child: const LoginScreen(),
//         ),
//       ),
//       GoRoute(
//         path: RouteUri.logout,
//         pageBuilder: (context, state) => NoTransitionPage<void>(
//           key: state.pageKey,
//           child: const LogoutScreen(),
//         ),
//       ),
//       GoRoute(
//         path: RouteUri.home,
//         name: RouteName.home,
//         redirect: (state) => RouteUri.dashboard,
//       ),
//       GoRoute(
//         path: RouteUri.dashboard,
//         name: RouteName.dashboard,
//         pageBuilder: (context, state) => NoTransitionPage<void>(
//           key: state.pageKey,
//           child: const DashboardScreen(),
//         ),
//       ),
//       GoRoute(
//         path: RouteUri.courseSection,
//         name: RouteName.course,
//         // builder: (context, state) => const CourseSectionsScreen(),
//         pageBuilder: (context, state) => NoTransitionPage<void>(
//           key: state.pageKey,
//           child: const CourseSectionsScreen(),
//         ),
//       ),
//       // GoRoute(
//       //   path: RouteUri.generalUi,
//       //   pageBuilder: (context, state) => NoTransitionPage<void>(
//       //     key: state.pageKey,
//       //     child: const GeneralUiScreen(),
//       //   ),
//       // ),
//       // GoRoute(
//       //   path: RouteUri.colors,
//       //   pageBuilder: (context, state) => NoTransitionPage<void>(
//       //     key: state.pageKey,
//       //     child: const ColorsScreen(),
//       //   ),
//       // ),
//       // GoRoute(
//       //   path: RouteUri.text,
//       //   pageBuilder: (context, state) => NoTransitionPage<void>(
//       //     key: state.pageKey,
//       //     child: const TextScreen(),
//       //   ),
//       // ),
//       // GoRoute(
//       //   path: RouteUri.buttons,
//       //   pageBuilder: (context, state) => NoTransitionPage<void>(
//       //     key: state.pageKey,
//       //     child: const ButtonsScreen(),
//       //   ),
//       // ),
//       // GoRoute(
//       //   path: RouteUri.dialogs,
//       //   pageBuilder: (context, state) => NoTransitionPage<void>(
//       //     key: state.pageKey,
//       //     child: const DialogsScreen(),
//       //   ),
//       // ),
//       // GoRoute(
//       //   path: RouteUri.register,
//       //   pageBuilder: (context, state) {
//       //     return NoTransitionPage<void>(
//       //       key: state.pageKey,
//       //       child: const RegisterScreen(),
//       //     );
//       //   },
//       // ),
//       // GoRoute(
//       //   path: RouteUri.crud,
//       //   pageBuilder: (context, state) {
//       //     return NoTransitionPage<void>(
//       //       key: state.pageKey,
//       //       child: const CrudScreen(),
//       //     );
//       //   },
//       // ),
//       // GoRoute(
//       //   path: RouteUri.crudDetail,
//       //   pageBuilder: (context, state) {
//       //     return NoTransitionPage<void>(
//       //       key: state.pageKey,
//       //       child: CrudDetailScreen(id: state.queryParams['id'] ?? ''),
//       //     );
//       //   },
//       // ),
//       // GoRoute(
//       //   path: RouteUri.iframe,
//       //   pageBuilder: (context, state) => NoTransitionPage<void>(
//       //     key: state.pageKey,
//       //     child: const IFrameDemoScreen(),
//       //   ),
//       // ),
//     ],
//     redirect: (state) {
//       if (unrestrictedRoutes.contains(state.subloc)) {
//         return null;
//       } else if (publicRoutes.contains(state.subloc)) {
//         // Is public route.
//         // if (userDataProvider.isUserLoggedIn()) {
//         //   // User is logged in, redirect to home page.
//         //   return RouteUri.home;
//         // }
//       } else {
//         // Not public route.
//         // if (!userDataProvider.isUserLoggedIn()) {
//         //   // User is not logged in, redirect to login page.
//         //   return RouteUri.login;
//         // }
//       }

//       return null;
//     },
//   );
// }
