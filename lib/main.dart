import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movies_project/Providers/language_provider.dart';
import 'package:movies_project/Ui/home/HomeScreen.dart';
import 'package:movies_project/Ui/home/Taps/Authentication/Register.dart';
import 'package:movies_project/Ui/home/Taps/Authentication/forgot_password.dart';
import 'package:movies_project/Ui/home/Taps/bottom_navigation_bar/home.dart';
import 'package:movies_project/Ui/home/Taps/introduction_screen/onbording_screen%201.dart';
import 'package:movies_project/Ui/home/Taps/introduction_screen/onbording_screen%202.dart';
import 'package:movies_project/Ui/home/Taps/introduction_screen/onbording_screen%203.dart';
import 'package:movies_project/Ui/home/Taps/introduction_screen/onbording_screen%204.dart';
import 'package:movies_project/Ui/home/Taps/introduction_screen/onbording_screen%205.dart';
import 'package:movies_project/Ui/home/Taps/introduction_screen/onbording_screen%206.dart';
import 'package:movies_project/Ui/home/Taps/Authentication/login_Screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:movies_project/Ui/home/Taps/profile/home_profile_tab.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // await Firebase.initializeApp();
  // await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  runApp(ChangeNotifierProvider(
    create: (context) => LanguageProvider(),
    child: MyApp(),
  ));
}

// Remove this placeholder class and import the generated firebase_options.dart instead

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<LanguageProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      initialRoute: LoginScreen.routeName,

      routes: {
        OnboardingScreen1.routeName: (context) => OnboardingScreen1(),
        OnboardingScreen2.routeName: (context) => OnboardingScreen2(),
        OnboardingScreen3.routeName: (context) => OnboardingScreen3(),
        OnboardingScreen4.routeName: (context) => OnboardingScreen4(),
        OnboardingScreen5.routeName: (context) => OnboardingScreen5(),
        OnboardingScreen6.routeName: (context) => OnboardingScreen6(),
        LoginScreen.routeName: (context) => LoginScreen(),
        RegisterScreen.routeName: (context) => RegisterScreen(),
        ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
        HomeProfileTab.routeName: (context) => HomeProfileTab(),
        HomeScreen.routeName: (context) => HomeScreen(),
      },
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(languageProvider
          .currentLocale), // Use the current locale from the provider
    );
  }
}
