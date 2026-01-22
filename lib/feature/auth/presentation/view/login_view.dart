import 'package:flutter/material.dart';
import 'package:kosom_chat_gpt/feature/auth/presentation/view/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LoginViewBody());
  }
}
