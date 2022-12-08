import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback showRegisterPage;
  const RegisterPage({super.key, required this.showRegisterPage});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget helloAgainText = Text(
      'Hello There!',
      style: GoogleFonts.bebasNeue(
        fontSize: 36,
      ),
    );
    Future signUp() async {
      try {
        if (_passwordController.text.trim() ==
            _confirmPasswordController.text.trim()) {
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
              email: _emailController.text.trim(),
              password: _passwordController.text.trim());
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
        }
      } catch (e) {
        print(e);
      }
    }

    Widget welcomeText = const Text(
      'Register Below with your details',
      style: TextStyle(fontSize: 20),
    );

    Widget emailTextField = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: _emailController,
        decoration: InputDecoration(
            icon: const Icon(
              Icons.email_rounded,
              color: Colors.deepPurple,
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(12)),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.deepPurple),
              borderRadius: BorderRadius.circular(12),
            ),
            hintText: 'Email',
            fillColor: Colors.grey[200],
            filled: true),
      ),
    );

    Widget passwordField = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: _passwordController,
        decoration: InputDecoration(
            icon: const Icon(
              Icons.password_rounded,
              color: Colors.deepPurple,
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(12)),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.deepPurple),
              borderRadius: BorderRadius.circular(12),
            ),
            hintText: 'Password',
            fillColor: Colors.grey[200],
            filled: true),
        obscureText: true,
      ),
    );
    Widget confirmPassField = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: _confirmPasswordController,
        decoration: InputDecoration(
            icon: const Icon(
              Icons.enhanced_encryption_rounded,
              color: Colors.deepPurple,
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(12)),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.deepPurple),
              borderRadius: BorderRadius.circular(12),
            ),
            hintText: 'Confirm Password',
            fillColor: Colors.grey[200],
            filled: true),
        obscureText: true,
      ),
    );

    Widget signInButton = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: GestureDetector(
          onTap: signUp,
          child: Container(
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(12)),
            child: const Center(
                child: Text('Sign Up',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18))),
          )),
    );

    Widget makingSpace(double space) {
      return SizedBox(
        height: space,
      );
    }

    Widget notMember = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('I am a member',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            )),
        GestureDetector(
          onTap: widget.showRegisterPage,
          child: const Text(' Login now',
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              )),
        ),
      ],
    );
    Widget iconApp = const Icon(
      Icons.flutter_dash,
      size: 100,
    );

    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: SafeArea(
            child: Center(
          child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              iconApp,
              makingSpace(25.0),
              //Hello Again
              helloAgainText,
              makingSpace(10.0),
              welcomeText,
              makingSpace(50.0),
              //Email TextField
              emailTextField,
              makingSpace(10.0),
              //Password TextField
              passwordField,
              makingSpace(10.0),
              confirmPassField,
              makingSpace(10.0),
              //signIn button
              signInButton,
              makingSpace(10.0),
              //register button
              notMember
            ]),
          ),
        )));
  }
}
