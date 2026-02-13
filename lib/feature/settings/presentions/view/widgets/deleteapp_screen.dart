import 'package:flutter/material.dart';
import 'package:kosom_chat_gpt/core/shared/widgets/constants.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kosom_chat_gpt/feature/auth/presentation/view_model/auth_cubit.dart';

class DeleteappScreen extends StatelessWidget {
  const DeleteappScreen({super.key});

  void _showConfirmationDialog(
    BuildContext context,
    String message,
    VoidCallback onYes,
  ) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('تأكيد'),
        content: Text(message, style: const TextStyle(fontSize: 20)),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('لا', style: TextStyle(fontSize: 25)),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
              onYes();
            },
            child: const Text('نعم', style: TextStyle(fontSize: 25)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: textButtonCustom(
            text: 'حذف الحساب',
            color: Colors.red,
            textColor: Colors.white,
            fontsize: 17,
            onPressed: () {
              _showConfirmationDialog(context, 'هل تريد حذف الحساب؟', () {
                print('Delete account executed');
              });
            },
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: textButtonCustom(
            text: 'تسجيل الخروج',
            color: Colors.red,
            textColor: Colors.white,
            fontsize: 17,
            onPressed: () {
              _showConfirmationDialog(context, 'هل تريد تسجيل الخروج؟', () {
                context.read<AuthCubit>().logout();
                context.go('/loginViewScreen');
              });
            },
          ),
        ),
      ],
    );
  }
}
