import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:invest_app/pages/page/bottom_nav_bar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailAddressController = TextEditingController();
  final passwordController = TextEditingController();
  UserCredential? userCredential;
  bool isVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: body(),
    );
  }

  Widget body() {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Log In',
                style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(161, 0, 0, 0),
                    fontStyle: FontStyle.italic,
                    shadows: [
                      Shadow(
                          color: Color.fromARGB(134, 0, 0, 0),
                          blurRadius: 15,
                          offset: Offset(-5, 7))
                    ]),
              ),
              const SizedBox(
                height: 87,
              ),
              TextFieldWidget(
                hinText: 'Email address',
                controller: emailAddressController,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFieldWidget(
                hinText: 'Password',
                obscureText: isVisible,
                suffixIcon: IconButton(
                  onPressed: () {
                    isVisible = !isVisible;
                    setState(() {});
                  },
                  icon: isVisible
                      ? const Icon(Icons.visibility)
                      : const Icon(Icons.visibility_off),
                ),
                controller: passwordController,
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(255, 49, 160, 98),
                ),
                height: 60,
                width: double.infinity,
                child: TextButton(
                  onPressed: () async {
                    try {
                      UserCredential userCredential = await FirebaseAuth
                          .instance
                          .signInWithEmailAndPassword(
                              email: emailAddressController.text,
                              password: passwordController.text);

                      print(userCredential.user?.email);
                      // ignore: use_build_context_synchronously
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                 BottomNavigationBarWidget()),
                        (route) => false,
                      );
                    } on FirebaseAuthException catch (e) {
                      print('${e.stackTrace}');
                    }
                  },
                  child: const Text(
                    'Log In',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TextFieldWidget extends StatelessWidget {
  final String hinText;
  final bool? obscureText;
  final IconButton? suffixIcon;
  final TextEditingController controller;

  const TextFieldWidget({
    super.key,
    required this.hinText,
    this.obscureText,
    this.suffixIcon,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade400),
          borderRadius: BorderRadius.circular(20)),
      child: TextField(
        controller: controller,
        obscureText: obscureText ?? false,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          hintText: hinText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
