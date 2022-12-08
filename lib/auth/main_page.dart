import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:loginui/auth/auth_page.dart';
import 'package:loginui/pages/home_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) =>
            snapshot.hasData ? const HomePage() : const AuthPage(),
      ),
    );
  }
}
