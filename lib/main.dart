import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'providers/map_provider.dart';
import 'providers/user_provider.dart';
import 'screens/cash_earned_screen.dart';
import 'screens/completed_trip_screen.dart';
import 'screens/login_signup_screen.dart';
import 'screens/map_screen.dart';
import 'screens/onboarding_screen.dart';
import 'theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyBpyrJlOBgcTcOgCsZqqLv_gdq_7lUUi34',
      appId: '1:31172218743:android:3b4501b0c94883837c5b72',
      messagingSenderId: '31172218743',
      projectId: 'n9driverapp',
      storageBucket: 'n9driverapp.appspot.com',
    ),
  );
  runApp(const TaxiAppDriver());
}

class TaxiAppDriver extends StatelessWidget {
  const TaxiAppDriver({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: MapProvider()),
        ChangeNotifierProvider.value(value: UserProvider.initialize()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'N9 Taxi App Driver',
        initialRoute: OnboardingScreen.route,
        theme: theme,
        routes: {
          OnboardingScreen.route: (_) => const OnboardingScreen(),
          LoginSignupScreen.route: (_) => const LoginSignupScreen(),
          MapScreen.route: (_) => const MapScreen(),
          CompletedTripsScreen.route: (_) => const CompletedTripsScreen(),
          CashEarnedScreen.route: (_) => const CashEarnedScreen(),
        },
      ),
    );
  }
}
