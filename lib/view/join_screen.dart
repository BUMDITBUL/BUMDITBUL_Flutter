import 'package:flutter/material.dart';

import '../component/bumditbul_loginjoin_button.dart';
import '../component/bumditbul_textfield.dart';
import '../const/bumditbul_colors.dart';
import '../widget/backarrow.dart';

class JoinScreen extends StatefulWidget {
  const JoinScreen({super.key});

  @override
  State<JoinScreen> createState() => _JoinScreenState();
}

class _JoinScreenState extends State<JoinScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
                const SizedBox(height: 30),
                LoginJoinButton(
                  onTap: () {
                    // 로그인 버튼 동작
                  },
                  text: '회원가입',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
