import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final ValueNotifier<bool> _showPassword = ValueNotifier<bool>(true);
  GlobalKey<FormState> formKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Center(
              child: Image.asset(
                "assets/images/logo.png",
                width: 250,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text("Welcome to the innovation lab"),
            SizedBox(
              height: 150,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: emailController,
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return "Please enter your email";
                        }
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Email',
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ValueListenableBuilder<bool>(
                        valueListenable: _showPassword,
                        builder: (context, value, _) {
                          return TextFormField(
                            controller: passwordController,
                            obscureText: value,
                            validator: (value) {
                              if (value?.isEmpty ?? true) {
                                return "Please enter your password";
                              }
                            },
                            decoration: InputDecoration(
                              suffixIcon: GestureDetector(
                                child: Icon(
                                    value ? Icons.lock : Icons.lock_open,
                                    size: 22),
                                onTap: () {
                                  _showPassword.value = !_showPassword.value;
                                  _showPassword.notifyListeners();
                                },
                              ),
                              border: OutlineInputBorder(),
                              hintText: 'Password',
                            ),
                          );
                        }),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 30),
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {}
                        },
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 50, vertical: 20),
                            textStyle: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold)),
                        child: const Text('Submit'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
