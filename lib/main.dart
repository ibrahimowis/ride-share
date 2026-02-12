import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kosom_chat_gpt/core/utils/helper/app_router.dart';
import 'package:kosom_chat_gpt/feature/auth/data/repo/auth_repo.dart';
import 'package:kosom_chat_gpt/feature/auth/presentation/view_model/auth_cubit.dart';
import 'package:kosom_chat_gpt/feature/settings/data/repo/update_profile_repo.dart';
import 'package:kosom_chat_gpt/feature/settings/presentions/view_model/cubit/update_profile_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('ar'), Locale('en')],
      path: 'assets/translations',
      saveLocale: true,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(create: (context) => AuthCubit(AuthRepo())),
        BlocProvider<UpdateProfileCubit>(
          create: (context) => UpdateProfileCubit((UpdateProfileRepo())),
        ),
      ],
      child: MaterialApp.router(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
