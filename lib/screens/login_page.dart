import 'package:flutter/material.dart';
import 'package:login_screen/screens/navigation_page.dart';
import '../models/user_data.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController(text: "asddasd@dsadas");
  final _passwordController = TextEditingController(text: "fdsafsd");

  void loginProcess() {
    if (formKey.currentState!.validate()) {
      final enteredEmail = emailController.text;
      final enteredPass = _passwordController.text;
      final data = UserData(userMail: enteredEmail, userPassword: enteredPass);
      //push - konulursa
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => NavigataionPage(
            userData: data,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 230, 230, 230),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.key,
                    size: 50,
                  ),
                  // Welcome to app
                  const Text(
                    "Hello",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    "Welcome back, you've been missed!",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 50),

                  // email textfield
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none),
                          hintText: "Enter your E-mail",
                          suffixIcon: IconButton(
                            onPressed: () {
                              emailController.clear();
                            },
                            icon: const Icon(Icons.cancel),
                          ),
                        ),
                        controller: emailController,
                        validator: (String? data) {
                          if (data!.isEmpty) {
                            return "Please enter an e-mail";
                          } else if (!RegExp(
                                  '^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]')
                              .hasMatch(data)) {
                            return "Please enter a valid e-mail";
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  // Password textfiled

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextFormField(
                        // TextInputType - textfieldın tipine etkiler
                        //visible password harf takımının üstünden numerik açar
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true, // it will close the password
                        controller: _passwordController,
                        validator: (String? data) {
                          if (data!.isEmpty) {
                            return "Please enter your password";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none),
                            hintText: "Enter your password",
                            suffixIcon: IconButton(
                                onPressed: () {
                                  _passwordController.clear();
                                },
                                icon: const Icon(Icons.cancel))),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  //Sign In Button
                  Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextButton(
                        onPressed: loginProcess,
                        style: ElevatedButton.styleFrom(
                          primary: const Color.fromARGB(255, 110, 235, 208),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 110, vertical: 10),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          elevation: 5,
                        ),
                        child: const Text("Sign In",
                            style:
                                TextStyle(color: Colors.white, fontSize: 24)),
                      ),
                    ),
                  ),

                  // Sign in Text button
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  //   child: Container(
                  //     padding: const EdgeInsets.all(15),
                  //     decoration: BoxDecoration(
                  //       color: Color.fromARGB(255, 110, 235, 208),
                  //       borderRadius: BorderRadius.circular(12),
                  //     ),
                  //     child: const Center(
                  //       child: Text(
                  //         "Sign In",
                  //         style: TextStyle(
                  //           color: Colors.white,
                  //           fontSize: 20,
                  //           fontWeight: FontWeight.bold,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),

                  const SizedBox(height: 30),

                  // Not a member? register now
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Not a member?",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        " Register now!",
                        style: TextStyle(
                          color: Color.fromARGB(255, 87, 187, 166),
                          fontWeight: FontWeight.bold,
                        ),
                      )
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
