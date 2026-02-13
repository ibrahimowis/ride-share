import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show ReadContext, BlocListener;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:kosom_chat_gpt/core/assets/images/image_assets.dart';
import 'package:kosom_chat_gpt/feature/auth/presentation/view_model/auth_cubit.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({super.key});

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(seconds: 2));
      context.read<AuthCubit>().checkAuth();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthenticatedState) {
          context.go('/navBar');
        } else if (state is UnAuthenticatedState) {
          context.go('/loginViewScreen');
        }
      },
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 0, 13, 189),
        body: Center(
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomLeft,
                child: Image.asset(
                  AssetsData.LaunchScreenframe,
                  width: 200,
                  height: 200,
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Image.asset(AssetsData.LaunchScreenframe2),
              ),
              Align(
                alignment: Alignment.center,
                child: SvgPicture.asset(
                  AssetsData.LaunchScreenlogo,
                  width: 400.0,
                  height: 400.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
