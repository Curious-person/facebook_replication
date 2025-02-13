import 'package:facebook_replication/screens/login_screen.dart';
import 'package:facebook_replication/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../screens/home_screen.dart';
import '../screens/newsfeed_screen.dart';
import '../screens/profile_screen.dart';

void main() => runApp(const FacebookReplication());

class FacebookReplication extends StatelessWidget {
  const FacebookReplication({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size (412, 715),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          color: Colors.white,
          debugShowCheckedModeBanner: false,
          debugShowMaterialGrid: false,
          title: 'Facebook Replication',
          initialRoute: '/login',
          routes: {
            '/home': (context) => const HomeScreen(),
            '/login': (context) => const LogInScreen(),
            '/register': (context) => const RegisterScreen(),
              '/profile': (context) {
            final args = ModalRoute.of(context)!.settings.arguments as String;
            return ProfileScreen(username: args);
            },
          },
        );
      }
    );
  }
}