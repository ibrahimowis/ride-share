import 'package:flutter/material.dart';
import 'package:kosom_chat_gpt/core/assets/images/image_assets.dart';
import 'package:kosom_chat_gpt/core/utils/colors.dart';
import 'package:kosom_chat_gpt/core/utils/styles.dart';
import 'package:kosom_chat_gpt/feature/home/presentation/view/widgets/home_app_bar.dart';

class AboutappViewbody extends StatelessWidget {
  const AboutappViewbody({super.key});

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
                    Align(
                      heightFactor: 0.35,
                      alignment: Alignment.bottomCenter,
                      child: Image.asset(AssetsData.loginLogo, width: 300),
                    ),
                    Center(
                      child: Text(
                        'رحلتك تبدأ معنأ',
                        style: Styles.textStyle19.copyWith(
                          color: KprimaryColor,
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
                                      '  مهمتنا',
                                      style: Styles.textStyle19.copyWith(
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      '  نسعي لتوفير خدمة نقل أمنة ومريحة وموثوقة , تربط بين المسافرين والس~قين بطريقة سهلة وفعالة. هدفنا هو جعل كل رحلة تجربة مميزة ',
                                      maxLines: 4,
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
                                  Icons.rocket_launch,
                                  size: 35,
                                  color: Colors.amber[900],
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
                      height: 150,
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
                                      '  رؤيتنا',
                                      style: Styles.textStyle19.copyWith(
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      ' أن نكون الخيار الاول للنقل الذكي في المنطقة , ونساهم في تطوير زسائل المواصلات بتقنيات حديثة ومبتكرة. ',
                                      maxLines: 3,
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
                                  Icons.remove_red_eye,
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
                                      '  ما يميزنا',
                                      style: Styles.textStyle19.copyWith(
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      'أسعار تنافسية وشفافة  ',
                                      maxLines: 4,
                                      overflow: TextOverflow.ellipsis,
                                      style: Styles.textStyle16.copyWith(
                                        color: Colors.black,
                                      ),
                                    ),

                                    Text(
                                      '  سائقون مدربون ومعتمدون  ',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: Styles.textStyle16.copyWith(
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      '  خدمة عملاء علي مدار الساعة  ',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: Styles.textStyle16.copyWith(
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      'تتبع الرحلة ف الوقت الفعلي    ',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: Styles.textStyle16.copyWith(
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      'امان وراحة في كل رحلة',
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
                                  Icons.star_rate_rounded,
                                  size: 35,
                                  color: Colors.green,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
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
                                    Icons.support_agent,
                                    size: 35,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                '  نحن هنا لمساعدتك',
                                style: Styles.textStyle24.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                ' فريق خدمة العملاء متاح علي مدار الساعة للاجابة علي استفساراتك وحل مشاكلك. ',
                                maxLines: 2,
                                textDirection: TextDirection.rtl,
                                overflow: TextOverflow.ellipsis,
                                style: Styles.textStyle16.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
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
