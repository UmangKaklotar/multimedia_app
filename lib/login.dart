import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'global.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: loginKey,
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF3F5751),
                Color(0xFF851C51),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              const Spacer(),
              const Text(
                "Sign In",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              const Spacer(),
              TextFormField(
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'Enter a User Name';
                  }
                },
                style: const TextStyle(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0xFFFFC2E0),
                    ),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0xFFFFC2E0),
                    ),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  hintText: "User Name",
                  hintStyle: const TextStyle(
                    color: Color(0xFFFFC2E0),
                  ),
                  contentPadding: const EdgeInsets.all(16),
                ),
                onSaved: (val) {
                  setState(() {
                    username = val.toString();
                  });
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                obscureText: true,
                obscuringCharacter: "*",
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'Enter a Password';
                  } else if (val.length < 8) {
                    return 'Enter a Minimun 8 Character';
                  } else {
                    if (val != password) {
                      return 'Enter a Valid Password';
                    }
                  }
                },
                style: const TextStyle(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0xFFFFC2E0),
                    ),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0xFFFFC2E0),
                    ),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  hintText: "Password",
                  hintStyle: const TextStyle(
                    color: Color(0xFFFFC2E0),
                  ),
                  contentPadding: const EdgeInsets.all(16),
                ),
                onSaved: (val) {
                  setState(() {
                    userPassword = val.toString();
                  });
                },
              ),
              Row(
                children: [
                  Expanded(
                    child: CheckboxListTile(
                      activeColor: const Color(0xffffffff),
                      checkColor: const Color(0xff633951),
                      visualDensity:
                      const VisualDensity(horizontal: -4, vertical: -4),
                      controlAffinity: ListTileControlAffinity.leading,
                      contentPadding: EdgeInsets.zero,
                      value: isLogin,
                      onChanged: (val) {
                        setState(() {
                          isLogin = val!;
                        });
                      },
                      title: const Text(
                        "Remember Me",
                        style: TextStyle(
                          color: Color(0xFFFFC2E0),
                        ),
                      ),
                    ),
                  ),
                  const Text(
                    "Forgot Password",
                    style: TextStyle(color: Color(0xFFFFC2E0), fontSize: 15),
                  ),
                ],
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () async {
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  setState(() {
                    loginKey.currentState!.save();
                    if (loginKey.currentState!.validate()) {
                      if (userPassword == password) {
                        Navigator.pushReplacementNamed(context, 'home');
                        prefs.setBool('login', isLogin);
                      }
                    }
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffD50870),
                  fixedSize: const Size(200, 40),
                ),
                child: const Text(
                  "Sign In",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              const Spacer(),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
