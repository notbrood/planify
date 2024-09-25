import 'package:go_router/go_router.dart';
import 'package:planify/screens/home_screen.dart';
import 'package:planify/screens/login_screen.dart';
import 'package:planify/screens/priority_tasks.dart';
import 'package:planify/screens/splash_screen.dart';

// GoRouter configuration
final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/homeScreen',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/priorityTasks',
      builder: (context, state) => const PriorityTasksScreen(),
    )
  ],
);
