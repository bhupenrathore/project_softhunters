// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:project/constants/app_colors.dart';
import 'package:project/models/login_api_model.dart';
import 'package:project/screens/components/my_text_form_field.dart';
import 'package:project/screens/components/token_manager.dart';
import 'package:project/screens/home_page.dart';
import 'package:project/services/login_api_services.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _rememberMe = false;
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 30),
                  const Text(
                    'Log in Now',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Please login to continue using our app',
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  associateField(),
                  const SizedBox(height: 20),
                  emailField(),
                  const SizedBox(height: 20),
                  passwordField(),
                  const SizedBox(height: 20),
                  rememberMeCheckbox(),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Forgot Password',
                          style: TextStyle(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 60),
                  loginButton(),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Don\'t have an account?'),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(color: AppColors.primaryColor),
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

  Widget associateField() {
    return const MyTextFormField(
      obscureText: false,
      labelText: "Associate",
    );
  }

  Widget emailField() {
    return MyTextFormField(
      obscureText: false,
      controller: emailController,
      labelText: "Email",
      textInputType: TextInputType.emailAddress,
      returnText: 'Please enter your email',
    );
  }

  Widget passwordField() {
    return MyTextFormField(
      obscureText: !_isPasswordVisible,
      controller: passwordController,
      labelText: "Password",
      textInputType: TextInputType.visiblePassword,
      returnText: 'Please enter your Password',
      iconButton: IconButton(
        icon: Icon(
          _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
          color: AppColors.primaryColor,
        ),
        onPressed: () {
          setState(() {
            _isPasswordVisible = !_isPasswordVisible;
          });
        },
      ),
    );
  }

  Widget rememberMeCheckbox() {
    return Row(
      children: [
        Checkbox(
          value: _rememberMe,
          onChanged: (value) {
            setState(() {
              _rememberMe = value!;
            });
          },
        ),
        const Text(
          'Remember Me',
          style: TextStyle(color: AppColors.primaryColor),
        ),
      ],
    );
  }

  Widget loginButton() {
    return SizedBox(
      height: 60,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          foregroundColor: Colors.white,
        ),
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            await makeApiRequest(context);
          }
        },
        child: const Text(
          'Login',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
    );
  }

  Future<void> makeApiRequest(BuildContext context) async {
    LoginPageApi api = LoginPageApi();
    LoginApiModel? response = await api.loginApiRequest(
        emailController.text, passwordController.text);

    if (response != null) {
      String token = response.token.toString();

      await TokenManager.setToken(token);
      print("my token: $token");

      showAlertDialog(
          context, response.message ?? 'No message received', response.status);
    } else {
      showAlertDialog(context, 'Login failed', false);
    }
  }

  void showAlertDialog(BuildContext context, String message, status) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Login Response'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
                if (status) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                }
              },
            ),
          ],
        );
      },
    );
  }
}
