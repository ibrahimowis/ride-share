import 'package:go_router/go_router.dart';
import 'package:kosom_chat_gpt/feature/home/presentation/view/driver_sign_in_screen.dart';
import 'package:kosom_chat_gpt/feature/auth/presentation/view/verify_opt_view.dart';
import 'package:kosom_chat_gpt/feature/auth/presentation/view/sign_up_view.dart';
import 'package:kosom_chat_gpt/feature/auth/presentation/view/login_view.dart';
import 'package:kosom_chat_gpt/feature/home/presentation/view/widgets/nav-bar_screen.dart';
import 'package:kosom_chat_gpt/feature/messages/presentation/view/widgets/fawry_ref_screen.dart';
import 'package:kosom_chat_gpt/feature/messages/presentation/view/widgets/fawry_screen.dart';
import 'package:kosom_chat_gpt/feature/messages/presentation/view/widgets/insta_pay_screen.dart';
import 'package:kosom_chat_gpt/feature/messages/presentation/view/widgets/visa_screen.dart';
import 'package:kosom_chat_gpt/feature/messages/presentation/view/widgets/wallet_screen.dart';
import 'package:kosom_chat_gpt/feature/settings/presentions/view/widgets/aboutApp_viewbody.dart';
import 'package:kosom_chat_gpt/feature/settings/presentions/view/widgets/help_info_screen.dart';
import 'package:kosom_chat_gpt/feature/settings/presentions/view/widgets/personal_profile_info.dart';
import 'package:kosom_chat_gpt/feature/settings/presentions/view/widgets/policy_view_body_screen.dart';
import 'package:kosom_chat_gpt/feature/splash/presentation/views/onBoarding_screen/splash_view_body.dart';
import 'package:kosom_chat_gpt/feature/splash/presentation/views/launch_screen.dart';
import 'package:kosom_chat_gpt/feature/trips/presentation/view/trips_screen.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(path: ('/'), builder: (context, state) => const LaunchScreen()),
      GoRoute(
        path: ('/splashViewBody'),
        builder: (context, state) => SplashViewBody(),
      ),
      GoRoute(
        path: ('/loginViewScreen'),
        builder: (context, state) => LoginView(),
      ),
      GoRoute(
        path: ('/driverScreen'),
        builder: (context, state) => DriverSignInScreen(),
      ),
      GoRoute(path: ('/navBar'), builder: (context, state) => Nav_Bar_screen()),
      GoRoute(
        path: ('/signinScreen'),
        builder: (context, state) => SignUpView(),
      ),
      GoRoute(
        path: ('/checkscreen'),
        builder: (context, state) {
          final email = state.extra as String;
          return VerifyOtpView(email: email);
        },
      ),
      GoRoute(
        path: ('/tripscreen'),
        builder: (context, state) => Trips_screen(),
      ),
      GoRoute(
        path: ('/helpInfoScreen'),
        builder: (context, state) => HelpInfoScreen(),
      ),
      GoRoute(
        path: ('/aboutAppViewBody'),
        builder: (context, state) => AboutappViewbody(),
      ),
      GoRoute(
        path: ('/policyViewBodyScreen'),
        builder: (context, state) => PolicyViewBodyScreen(),
      ),
      GoRoute(
        path: ('/fawryScreen'),
        builder: (context, state) => FawryScreen(),
      ),
      GoRoute(
        path: ('/walletScreen'),
        builder: (context, state) => WalletScreen(),
      ),
      GoRoute(
        path: ('/fawryRefScreen'),
        builder: (context, state) => FawryRefScreen(),
      ),
      GoRoute(
        path: ('/instaPayScreen'),
        builder: (context, state) => InstaPayScreen(),
      ),
      GoRoute(path: ('/visaScreen'), builder: (context, state) => VisaScreen()),
      GoRoute(
        path: ('/personalProfileInfo'),
        builder: (context, state) => PersonalProfileInfo(),
      ),
    ],
  );
}
