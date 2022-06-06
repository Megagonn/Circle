import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twit/firebase/fireauth.dart';
import 'package:twit/ui/homepage.dart';
import 'package:twit/ui/loginwithemail.dart';
import 'package:twit/ui/signupwithemail.dart';
import 'package:twit/ui/testing.dart';
import 'package:twit/utilities/ui.utl.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool alreadyHasAccount = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
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
                        color: Colors.blueAccent,
                        size: 90,
                      ),
                    ],
                  ),
                  const Spacer(),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      "See what's happening in the world right now.",
                      style:
                          TextStyle(fontWeight: FontWeight.w800, fontSize: 30),
                    ),
                  ),
                  const Spacer(),
                  Column(
                    children: [
                      FlatBtn(
                        label: 'Continue with Google',
                        labelColor: Colors.black,
                        color: Colors.transparent,
                        fontWeight: FontWeight.bold,
                        onPress: () async {
                          if (alreadyHasAccount) {
                            var res = await FireAuth().signInWithGoogle();

                            if (res == 'success') {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Home(),
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Invalid credential...'),
                                ),
                              );
                            }
                          } else {
                            var res =
                                await FireAuth().signupWithGoogle(context);
                                if (res == 'success') {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Home(),
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                 const SnackBar(
                                  content: Text('email already exist'),
                                ),
                              );
                            }
                          }
                        },
                      ),
                      FlatBtn(
                        onPress: () {},
                        leading: Icons.apple_sharp,
                        label: 'Continue with Apple',
                        labelColor: Colors.black,
                        color: Colors.transparent,
                        fontWeight: FontWeight.bold,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Divider(
                            color: Colors.amber,
                          ),
                          Text("Or"),
                          Divider(
                            color: Colors.amber,
                          )
                        ],
                      ),
                      FlatBtn(
                        onPress: () {
                          alreadyHasAccount
                              ? Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const LoginWithEmail()))
                              : Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SignUpWithEmail()));
                        },
                        label: alreadyHasAccount ? "Login" : 'Create account',
                        labelColor: Colors.white,
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.normal,
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Text("By signing up, you agree to the "),
                            InkWell(
                              onTap: () {},
                              child: const Text(
                                "Terms of Service ",
                                style: TextStyle(color: Colors.blueAccent),
                              ),
                            ),
                            const Text("and")
                          ],
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: const Text(
                                "Privacy Policy, ",
                                style: TextStyle(color: Colors.blueAccent),
                              ),
                            ),
                            const Text("including "),
                            InkWell(
                              onTap: () {},
                              child: const Text(
                                "Cookie Use. ",
                                style: TextStyle(color: Colors.blueAccent),
                              ),
                            ),
                            const Text(
                              "Others ",
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                        const Text(
                            "will be able to find you by email or phone number when provided."),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(alreadyHasAccount
                          ? "Don't have an account?"
                          : "Have you signed up already?"),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            alreadyHasAccount = !alreadyHasAccount;
                          });
                        },
                        child: Text(
                          alreadyHasAccount ? "Sign Up" : "Login.",
                          style: const TextStyle(color: Colors.blueAccent),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
