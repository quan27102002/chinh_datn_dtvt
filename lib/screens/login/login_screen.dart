import 'package:datn_trung/app/app_routers.dart';
import 'package:datn_trung/provider/user_provider.dart';
import 'package:datn_trung/res/fonts/app_fonts.dart';
import 'package:datn_trung/res/images/app_images.dart';
import 'package:datn_trung/themes/app_colors.dart';
import 'package:datn_trung/util/app_function.dart';
import 'package:datn_trung/widget/simple_button.dart';
import 'package:datn_trung/widget/simple_input.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _login() async {
    AppFunction.showLoading(context);
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      // ignore: use_build_context_synchronously
      context.read<UserProvider>().saveEmailUser(_emailController.text.trim());
      // ignore: use_build_context_synchronously
      AppFunction.hideLoading(context);

      Navigator.pushNamed(
        // ignore: use_build_context_synchronously
        context,
        AppRouters.dashBoard,
      );
    } on FirebaseAuthException catch (e) {
      // ignore: use_build_context_synchronously
      AppFunction.hideLoading(context);
      String errorMessage;
      if (e.code == 'user-not-found') {
        errorMessage = 'Không tìm thấy tài khoản người dùng';
      } else if (e.code == 'wrong-password') {
        errorMessage = 'Sai mật khẩu';
      } else {
        errorMessage = 'Lỗi không xác định';
      }
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        alignment: Alignment.center,
        child: Column(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AppImages.logoEV,
                    width: 150,
                    height: 150,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Login to your account",
                    style: AppFonts.quicksand700(
                      24,
                      AppColors.kPrimary,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        SimpleInput(
                          titleInput: "Email",
                          labelText: "Enter your email",
                          controller: _emailController,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SimpleInput(
                          titleInput: "Password",
                          labelText: "Enter your password",
                          controller: _passwordController,
                          obscureText: true,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        SimpleButton(
                          titleButton: "Log in",
                          onPressed: () {
                            if (_emailController.text.isEmpty ||
                                _passwordController.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text("Vui lòng điền đầy đủ thông tin")),
                              );
                            } else if (_emailController.text.isNotEmpty &&
                                _passwordController.text.isNotEmpty) {
                              _login();
                            }
                          },
                        )
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Don't have an account? ",
                          style: AppFonts.quicksandMedium500(
                            16,
                            const Color(0xFF212121).withOpacity(0.6),
                          ),
                        ),
                        TextSpan(
                          text: "Create account",
                          style: AppFonts.quicksandMedium500(
                            16,
                            AppColors.kPrimary,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
