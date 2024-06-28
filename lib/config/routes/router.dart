

// import 'package:flutter/services.dart';
// import 'package:taskwave/config/routes/imports.dart';
// import 'package:taskwave/config/ui/colors.dart';



// String get initRoute => AppRoutes.login;

// Route<dynamic> generateRoute(RouteSettings settings) {
//     final args = settings.arguments;

//     switch (settings.name) {
//            case AppRoutes.splash:
//       return _buildRoute(
//         settings: settings,
//         builder: ChangeNotifierProvider(
//           create: (_) => (),
//           child: const LoginScreen(),
//         ),
//       );
      
//         default:
//             return MaterialPageRoute(builder: (_) => LoginScreen());
//     }
   
// }


// MaterialPageRoute _buildRoute({
//   required RouteSettings settings,
//   required Widget builder,
// }) {
//   return MaterialPageRoute(
//     settings: settings,
//     maintainState: true,
//     builder: (_) => AnnotatedRegion<SystemUiOverlayStyle>(
//       value: const SystemUiOverlayStyle(
//         statusBarIconBrightness: Brightness.dark,
//         statusBarColor: AppColors.primary,
//       ),
//       child: builder,
//     ),
//   );
// }