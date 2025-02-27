import 'package:bumditbul_flutter/widget/bumditbul_loginjoin_button.dart';
import 'package:bumditbul_flutter/widget//bumditbul_textfield.dart';
import 'package:bumditbul_flutter/const/bumditbul_colors.dart';
import 'package:bumditbul_flutter/const/bumditbul_text_style.dart';
import 'package:bumditbul_flutter/component/backarrow.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String? errorMessage;

  bool _isPasswordVisible = false;

  bool _validateEmail(String email) {
    return RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$').hasMatch(email);
  }

  void _login() {
    Focus.of(context).unfocus();
    bool isEmail = emailController.text.isEmpty || !_validateEmail(emailController.text);
    bool isPassword = passwordController.text.isEmpty;

    setState(() {
      if (isEmail || isPassword) {
        errorMessage = '입력하신 정보를 확인해주세요.';
      } else {
        errorMessage = null;
      }
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Backarrow(),
      backgroundColor: BumditbulColors.black900,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/image/BUMDITBUL_logo.png',
                    height: 107,
                    width: 110,
                  ),
                  const SizedBox(height: 50),
                  CustomTextField(
                    hintText: '이메일을 입력해주세요',
                    controller: emailController,
                    password: false,
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    hintText: '비밀번호를 입력해주세요',
                    controller: passwordController,
                    password: _isPasswordVisible,
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                      child: Icon(
                        _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  if (errorMessage != null) ...[
                    const SizedBox(height: 20),
                    Text(
                      errorMessage!,
                      style: BumditbulTextStyle.ErrorMsg(color: BumditbulColors.green400)
                    ),
                  ],
                  const SizedBox(height: 50),
                  LoginJoinButton(
                    onTap: _login,
                    text: '로그인',
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