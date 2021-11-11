import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:local_database1/pages/sign_in.dart';

class SignUpPage extends StatefulWidget {
  static const String id = "sign_up";

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  void doSignUp() {
    String userName = userNameController.text.toString().trim();
    String email = emailController.text.toString().trim();
    String phone = phoneController.text.toString().trim();
    String password = passwordController.text.toString().trim();

    var box2 = Hive.box("sign_up_database");
    box2.put("userName", userName);
    box2.put("email", email);
    box2.put("phone", phone);
    box2.put("password", password);

    print(box2.get("userName"));
    print(box2.get("email"));
    print(box2.get("phone"));
    print(box2.get("password"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff191c37),
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: const BoxConstraints(),
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                //mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SizedBox(
                    height: 120,
                  ),
                  const Text(
                    "Create",
                    style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    "Account",
                    style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  TextField(
                    controller: userNameController,
                    style: TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      hintText: "User name",
                      hintStyle: TextStyle(color: Colors.white),
                      icon: Icon(
                        Icons.account_circle_outlined,
                        color: Colors.white,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: emailController,
                    style: TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      hintText: "E-mail",
                      hintStyle: TextStyle(color: Colors.white),
                      icon: Icon(
                        Icons.email,
                        color: Colors.white,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: phoneController,
                    style: TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      hintText: "Phone number",
                      hintStyle: TextStyle(color: Colors.white),
                      icon: Icon(
                        Icons.phone,
                        color: Colors.white,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: passwordController,
                    style: TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      hintText: "Password",
                      hintStyle: TextStyle(color: Colors.white),
                      icon: Icon(
                        Icons.lock,
                        color: Colors.white,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  Container(
                    height: 60,
                    width: 60,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                    ),
                    child: FlatButton(
                      onPressed: () {
                        doSignUp();
                      },
                      child: const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an account",
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacementNamed(
                              context, SignInPage.id);
                        },
                        child: const Text(
                          'SIGN IN',
                          style: TextStyle(color: Colors.blue, fontSize: 17),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
