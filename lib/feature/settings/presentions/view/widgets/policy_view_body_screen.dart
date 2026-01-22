import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:kosom_chat_gpt/core/utils/colors.dart';
import 'package:kosom_chat_gpt/core/utils/styles.dart';
import 'package:kosom_chat_gpt/feature/home/presentation/view/widgets/home_app_bar.dart';

class PolicyViewBodyScreen extends StatelessWidget {
  const PolicyViewBodyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KprimaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(height: 170, child: HomeAppBar()),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 209, 204, 237),
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.9),
                              blurRadius: 0.9,
                            ),
                          ],
                        ),
                        height: 250,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 5),
                                child: CircleAvatar(
                                  radius: 35,
                                  backgroundColor: const Color.fromARGB(
                                    255,
                                    89,
                                    64,
                                    226,
                                  ),
                                  child: Icon(
                                    Icons.shield_rounded,
                                    size: 35,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              AutoSizeText(
                                'سياسة الخصوصية',
                                minFontSize: 12,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: Styles.textStyle30.copyWith(
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'حماية بياناتك أولويتنا',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: Styles.textStyle19.copyWith(
                                  color: Colors.deepPurpleAccent,
                                ),
                              ),
                              SizedBox(height: 5),
                              AutoSizeText(
                                'أخر تحديث: 25 نوفمبر 2025',
                                maxLines: 1,
                                minFontSize: 12,
                                overflow: TextOverflow.ellipsis,
                                style: Styles.textStyle16.copyWith(
                                  color: Colors.grey[800],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.9),
                            blurRadius: 0.9,
                          ),
                        ],
                      ),
                      height: 200,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Directionality(
                                textDirection: TextDirection.rtl,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'مقدمة',
                                      style: Styles.textStyle19.copyWith(
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      'نحن في تطبيق "On Way" نقدر خصوصيتك ونلتزم بحماية بياناتك الشخصية , تصوح هذه الساية كيفية جمعنا واستخدامنا وحماية معلوماتك عند استخدام خدماتنا.',
                                      maxLines: 5,
                                      overflow: TextOverflow.ellipsis,
                                      style: Styles.textStyle16.copyWith(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: CircleAvatar(
                                radius: 25,
                                backgroundColor: Colors.white,
                                child: Icon(
                                  Icons.error_outline,
                                  size: 35,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.9),
                            blurRadius: 0.9,
                          ),
                        ],
                      ),
                      height: 210,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Directionality(
                                textDirection: TextDirection.rtl,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'كيف نستخدم بياناتك',
                                      textDirection: TextDirection.rtl,
                                      style: Styles.textStyle19.copyWith(
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      'توفير خدمة النقل وتنسيق الرحلات',
                                      maxLines: 1,
                                      textDirection: TextDirection.rtl,
                                      overflow: TextOverflow.ellipsis,
                                      style: Styles.textStyle16.copyWith(
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(height: 3),

                                    Text(
                                      'تحسين تجربة المستخدم وجودة الخدمة',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: Styles.textStyle16.copyWith(
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(height: 3),

                                    Text(
                                      'معالجة المدفوعات بشكل امن',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: Styles.textStyle16.copyWith(
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(height: 3),

                                    Text(
                                      'ارسال اشعارات مهمة حول الرحلات',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: Styles.textStyle16.copyWith(
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(height: 3),

                                    Text(
                                      'تحليل البيانات لتطوير الخدمات',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: Styles.textStyle16.copyWith(
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: CircleAvatar(
                                radius: 25,
                                backgroundColor: Colors.white,
                                child: Icon(
                                  Icons.settings_applications,
                                  size: 35,
                                  color: Colors.green,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.9),
                            blurRadius: 0.9,
                          ),
                        ],
                      ),
                      height: 300,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Directionality(
                                textDirection: TextDirection.rtl,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'مشاركة البيانات',
                                      style: Styles.textStyle19.copyWith(
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      'لا نبيع ولا نؤجر معلوماتك الشخصية لاطراف ثالثة. قد نشارك البيانات فقط في الحالات التاليةك',
                                      maxLines: 4,
                                      overflow: TextOverflow.ellipsis,
                                      style: Styles.textStyle16.copyWith(
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(height: 3),

                                    Text(
                                      'مع السائقين لتنسيق رحلتك',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: Styles.textStyle16.copyWith(
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(height: 3),

                                    Text(
                                      'مع مقدمي خدمات الدفع الامنة',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: Styles.textStyle16.copyWith(
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(height: 3),

                                    Text(
                                      'عند الضروره القانونية او الامتثال للقونين',
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: Styles.textStyle16.copyWith(
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(height: 3),

                                    Text(
                                      'مع شركاء موثوقين لتحسين الخدمة ( بموجب اتفاقيات صارمة)',
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: Styles.textStyle16.copyWith(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: CircleAvatar(
                                radius: 25,
                                backgroundColor: Colors.white,
                                child: Icon(
                                  Icons.share,
                                  size: 35,
                                  color: Colors.purple[800],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.9),
                            blurRadius: 0.9,
                          ),
                        ],
                      ),
                      height: 240,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Directionality(
                                textDirection: TextDirection.rtl,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'ملفات تعريف الارتباط',
                                      style: Styles.textStyle19.copyWith(
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      'نستخدم ملفات تعريف الارتباط ل:',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: Styles.textStyle16.copyWith(
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(height: 3),

                                    Text(
                                      'تحسين اداءالتطبيق',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: Styles.textStyle16.copyWith(
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(height: 3),

                                    Text(
                                      'تذكر تفضيلاتك',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: Styles.textStyle16.copyWith(
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(height: 3),

                                    Text(
                                      'تحليل استخدام التطبيق',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: Styles.textStyle16.copyWith(
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(height: 3),

                                    Text(
                                      'تخصيص المحتوي',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: Styles.textStyle16.copyWith(
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(height: 3),
                                    Text(
                                      'يمكنك اداة اعدادات ملفات تعريف الارتباط من خلال اعدادات المتصفح',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: Styles.textStyle16.copyWith(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: CircleAvatar(
                                radius: 25,
                                backgroundColor: Colors.white,
                                child: Icon(
                                  Icons.cookie,
                                  size: 35,
                                  color: Colors.brown,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 106, 86, 222),
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.9),
                              blurRadius: 0.9,
                            ),
                          ],
                        ),
                        height: 200,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 5),
                                child: CircleAvatar(
                                  radius: 25,
                                  backgroundColor: const Color.fromARGB(
                                    255,
                                    106,
                                    86,
                                    222,
                                  ),
                                  child: Icon(
                                    Icons.question_mark_rounded,
                                    size: 35,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(height: 5),
                              AutoSizeText(
                                'لديك استفسارات حول خصوصيتك؟',
                                minFontSize: 12,
                                overflow: TextOverflow.ellipsis,

                                style: Styles.textStyle19.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'تواصل معنا في اي وقت للحصول علي اجابات حول سياسة الخصوصية او حقوقك',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: Styles.textStyle16.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 30),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 243, 243, 238),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(
                              255,
                              254,
                              230,
                              11,
                            ).withValues(alpha: 10),
                            blurRadius: 1,
                          ),
                        ],
                      ),
                      height: 120,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Directionality(
                                textDirection: TextDirection.rtl,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'تحديثات السياسة',
                                      style: Styles.textStyle19.copyWith(
                                        color: Colors.yellow[800],
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      'قد نحدث هذه السياسة من وقت لاخر سنخبرك بأي تغيرات مهمة عبر التطبيق أو البريد الالكتروني',
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: Styles.textStyle16.copyWith(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: CircleAvatar(
                                radius: 25,
                                backgroundColor: Colors.white,
                                child: Icon(
                                  Icons.restart_alt,
                                  size: 35,
                                  color: Colors.yellow[800],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 50),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
