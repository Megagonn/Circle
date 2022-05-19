import 'package:flutter/material.dart';
import 'package:twit/utilities/ui.utl.dart';

class LoginWithEmail extends StatefulWidget {
  const LoginWithEmail({Key? key}) : super(key: key);

  @override
  State<LoginWithEmail> createState() => _LoginWithEmailState();
}

class _LoginWithEmailState extends State<LoginWithEmail> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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
                      controller: firstNameController,
                      textCapitalization: TextCapitalization.words,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'First name',
                        focusedBorder: InputBorder.none,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50)),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 6),
                    child: TextFormField(
                      controller: lastNameController,
                      textCapitalization: TextCapitalization.words,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Last name',
                        focusedBorder: InputBorder.none,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50)),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 6),
                    child: TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Email',
                        focusedBorder: InputBorder.none,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50)),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 6),
                    child: TextFormField(
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Phone',
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
                      obscureText: true,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Password',
                        focusedBorder: InputBorder.none,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50)),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 100,
                    child: FlatBtn(
                      label: 'Sign up',
                      onPress: () {},
                      fontWeight: FontWeight.w600,
                      labelColor: Colors.white,
                      color: Colors.blueAccent,
                    ),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Have you signed up already?"),
                      TextButton(
                        onPressed: () {
                          setState(() {
                          });
                        },
                        child: const Text(
                          "Login.",
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

// ff(TextEditingController controller, String label) {
//   return TextFormField(
//     controller: controller,
//     decoration: InputDecoration(
//       filled: true,
//       fillColor: Colors.white,
//       hintText: 'First name',
//       focusedBorder: InputBorder.none,
//       border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
//     ),
//   );
//   // return controller.text;
// }
