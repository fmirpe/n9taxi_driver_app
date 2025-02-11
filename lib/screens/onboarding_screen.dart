import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'login_signup_screen.dart';
import 'map_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  static const String route = '/onboarding';

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    return user != null ? const MapScreen() : const LoginSignupScreen();
  }
}
