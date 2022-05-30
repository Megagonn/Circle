import 'package:flutter/material.dart';
import 'package:twit/firebase/fireauth.dart';
import 'package:twit/ui/homepage.dart';
import 'package:twit/ui/signupwithemail.dart';
import 'package:twit/utilities/ui.utl.dart';

class LoginWithEmail extends StatefulWidget {
  const LoginWithEmail({Key? key}) : super(key: key);

  @override
  State<LoginWithEmail> createState() => _LoginWithEmailState();
}

class _LoginWithEmailState extends State<LoginWithEmail> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool showPassword = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueAccent,
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.circle_outlined,
                        color: Colors.white,
                        size: 50,
                      )
                    ],
                  ),
                  const Spacer(),
                  Container(
                    margin: const EdgeInsets.only(bottom: 6),
                    child: TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Email',
                        hintStyle: const TextStyle(color: Colors.blueAccent),
                        focusedBorder: InputBorder.none,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50)),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 6),
                    child: TextFormField(
                      controller: passwordController,
                      obscuringCharacter: '•',
                      obscureText: showPassword,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Password',
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              showPassword = !showPassword;
                            });
                          },
                          icon: const Icon(Icons.remove_red_eye_outlined),
                        ),
                        hintStyle: const TextStyle(color: Colors.blueAccent),
                        focusedBorder: InputBorder.none,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50)),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 100,
                    child: FlatBtn(
                      label: 'Login',
                      onPress: () async {
                        var res = await FireAuth().login(
                            email: emailController.text,
                            password: passwordController.text);
                        if (res == 'success') {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Home()));
                        }
                      },
                      fontWeight: FontWeight.w600,
                      labelColor: Colors.white,
                      color: Colors.blueAccent,
                    ),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account?"),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const SignUpWithEmail()),);
                        },
                        child: const Text(
                          "Sign Up.",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
