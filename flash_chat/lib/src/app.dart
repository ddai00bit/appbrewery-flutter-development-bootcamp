import 'package:flutter/material.dart';

import 'screens/chat_screen.dart';
import 'screens/login_screen.dart';
import 'screens/registration_screen.dart';
import 'screens/welcome_screen.dart';

class FlashChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: WelcomeScreen.ID,
      routes: {
        WelcomeScreen.ID: (context) => WelcomeScreen(),
        LoginScreen.ID: (context) => LoginScreen(),
        RegistrationScreen.ID: (context) => RegistrationScreen(),
        ChatScreen.ID: (context) => ChatScreen(),
      },
    );
  }
}
