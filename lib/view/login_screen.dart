import 'package:bumditbul_flutter/component/bumditbul_loginjoin_button.dart';
import 'package:bumditbul_flutter/component/bumditbul_textfield.dart';
import 'package:bumditbul_flutter/const/bumditbul_colors.dart';
import 'package:bumditbul_flutter/widget/backarrow.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmController.dispose();
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
                  password: true,
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  hintText: '비밀번호를 다시 입력해주세요',
                  controller: confirmController,
                  password: true,
                ),
                const SizedBox(height: 30),
                LoginJoinButton(
                  onTap: () {
                    // 로그인 버튼 동작
                  },
                  text: '로그인',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}