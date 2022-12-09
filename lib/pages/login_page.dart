import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:loginui/pages/forgot_pass_page.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const LoginPage({super.key, required this.showLoginPage});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim());
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //VARIABLES AREA
    Widget helloAgainText = Text(
      'Hello Again!',
      style: GoogleFonts.bebasNeue(
        fontSize: 36,
      ),
    );

    Widget welcomeText = const Text(
      'Welcome back, you\'ve been missed!',
      style: TextStyle(fontSize: 20),
    );

    Widget emailTextField = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: _emailController,
        decoration: InputDecoration(
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

    Widget signInButton = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: GestureDetector(
          onTap: signIn,
          child: Container(
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(12)),
            child: const Center(
                child: Text('Sign In',
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
        const Text('Not a member?',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            )),
        GestureDetector(
          onTap: widget.showLoginPage,
          child: const Text(' Register now',
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

    Widget forgetPass = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: () => {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const ForgetPasswordPage();
              }))
            },
            child: const Text(
              'Forgot Password?',
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
//VARIABLES ABOVE
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
              forgetPass,
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
