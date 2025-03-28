import 'package:flutter/material.dart';
import '../widget/bumditbul_loginjoin_button.dart';
import '../widget//bumditbul_textfield.dart';
import '../const/bumditbul_colors.dart';
import '../component/backarrow.dart';

class JoinScreen extends StatefulWidget {
  const JoinScreen({super.key});

  @override
  State<JoinScreen> createState() => _JoinScreenState();
}

class _JoinScreenState extends State<JoinScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmController = TextEditingController();
  String? errorMessage;

  bool _isPasswordVisible = false;
  bool _isConfirmVisible = false;

  bool _validateEmail(String email) {
    return RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$')
        .hasMatch(email);
  }

  void _join() {
    Focus.of(context).unfocus();
    setState(() {
      bool isEmail =
          emailController.text.isEmpty || !_validateEmail(emailController.text);
      bool isPassword = passwordController.text.isEmpty;
      bool isConfirmPassword = confirmController.text.isEmpty ||
          confirmController.text != passwordController.text;

      if (isEmail || isPassword || isConfirmPassword) {
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
    confirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackArrow(),
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
                  password: !_isPasswordVisible,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                    child: Icon(
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                CustomTextField(
                    hintText: '비밀번호를 다시 입력해주세요',
                    controller: confirmController,
                    password: !_isConfirmVisible,
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _isConfirmVisible = !_isConfirmVisible;
                        });
                      },
                      child: Icon(
                        _isConfirmVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.white,
                      ),
                    )),
                if (errorMessage != null) ...[
                  const SizedBox(height: 20),
                  Text(
                    errorMessage!,
                    style: TextStyle(
                        color: BumditbulColors.green400, fontSize: 10),
                  ),
                ],
                const SizedBox(height: 50),
                LoginJoinButton(
                  onTap: () {
                    _join();
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
