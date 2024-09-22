import 'package:go_router/go_router.dart';
import 'package:planify/screens/home_screen.dart';
import 'package:planify/screens/login_screen.dart';
import 'package:planify/screens/splash_screen.dart';

// GoRouter configuration
final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => SplashScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => LoginScreen(),
    ),
    GoRoute(
      path: '/homeScreen',
      builder: (context, state) => HomeScreen(),
    )
  ],
);
