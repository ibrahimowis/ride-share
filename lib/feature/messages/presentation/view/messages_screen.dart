import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kosom_chat_gpt/core/shared/widgets/constants.dart';
import 'package:kosom_chat_gpt/core/utils/colors.dart';
import 'package:kosom_chat_gpt/core/utils/styles.dart';
import 'package:kosom_chat_gpt/feature/home/presentation/view/widgets/home_app_bar.dart';
import 'package:kosom_chat_gpt/feature/messages/presentation/view/widgets/PaymentRow.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({super.key});

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  int selectIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(color: KprimaryColor),

        SingleChildScrollView(
          child: Column(
            children: [
              HomeAppBar(),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 150,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.9),
                              blurRadius: 0.3,
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'الرصيد المتاح لك كمستخدم',
                                style: Styles.textStyle24.copyWith(
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'EGP 0',
                                style: Styles.textStyle30.copyWith(
                                  color: KprimarybuttonColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          'اخر المعاملات',
                          style: Styles.textStyle24.copyWith(
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(height: 70),
                      Text(
                        'لا توجد اي معاملات حاليا',
                        style: Styles.textStyle24.copyWith(color: Colors.grey),
                      ),
                      SizedBox(height: 70),

                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          height: 85,
                          decoration: BoxDecoration(
                            color: KprimarybuttonColor,
                            borderRadius: BorderRadius.all(Radius.circular(35)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.5),
                                blurRadius: 5,
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Colors.white,
                                  child: IconButton(
                                    onPressed: () {
                                      showModalBottomSheet(
                                        context: context,
                                        builder: (context) {
                                          return StatefulBuilder(
                                            builder: (context, setState) {
                                              return Container(
                                                height:
                                                    MediaQuery.of(
                                                      context,
                                                    ).size.height *
                                                    0.6,
                                                width: double.infinity,
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                    15.0,
                                                  ),
                                                  child: SingleChildScrollView(
                                                    child: Column(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets.only(
                                                                top: 15.0,
                                                                right: 25,
                                                                left: 25,
                                                              ),
                                                          child: Text(
                                                            'اختر طريقة الدفع المناسبة لك',
                                                            textAlign: TextAlign
                                                                .center,
                                                            maxLines: 2,
                                                            style: TextStyle(
                                                              color:
                                                                  KprimarybuttonColor,
                                                              fontSize: 30,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(height: 20),
                                                        PaymentRow(
                                                          text: 'كارت فوري',
                                                          isSelected:
                                                              selectIndex == 0,
                                                          onTap: () {
                                                            setState(() {
                                                              selectIndex = 0;
                                                            });
                                                          },
                                                        ),
                                                        SizedBox(height: 20),

                                                        PaymentRow(
                                                          text:
                                                              'محفظة الكترونية فوري',
                                                          isSelected:
                                                              selectIndex == 1,
                                                          onTap: () {
                                                            setState(() {
                                                              selectIndex = 1;
                                                            });
                                                          },
                                                        ),
                                                        SizedBox(height: 20),

                                                        PaymentRow(
                                                          text:
                                                              'رقم المرجعي لفوري',
                                                          isSelected:
                                                              selectIndex == 2,
                                                          onTap: () {
                                                            setState(() {
                                                              selectIndex = 2;
                                                            });
                                                          },
                                                        ),
                                                        SizedBox(height: 20),

                                                        PaymentRow(
                                                          text: 'انستاباي',
                                                          isSelected:
                                                              selectIndex == 3,
                                                          onTap: () {
                                                            setState(() {
                                                              selectIndex = 3;
                                                            });
                                                          },
                                                        ),
                                                        SizedBox(height: 20),

                                                        PaymentRow(
                                                          text: 'فيزا كارت',
                                                          isSelected:
                                                              selectIndex == 4,
                                                          onTap: () {
                                                            setState(() {
                                                              selectIndex = 4;
                                                            });
                                                          },
                                                        ),
                                                        SizedBox(height: 30),
                                                        textButtonCustom(
                                                          text: 'تاكيد',
                                                          color:
                                                              Colors.deepPurple,
                                                          textColor:
                                                              Colors.white,
                                                          onPressed: () {
                                                            if (selectIndex ==
                                                                -1) {
                                                              ScaffoldMessenger.of(
                                                                context,
                                                              ).showSnackBar(
                                                                SnackBar(
                                                                  backgroundColor:
                                                                      Colors
                                                                          .red,
                                                                  behavior:
                                                                      SnackBarBehavior
                                                                          .floating,
                                                                  margin:
                                                                      EdgeInsets.only(
                                                                        bottom:
                                                                            450,
                                                                      ),

                                                                  content: Text(
                                                                    'من فضلك اختر طريقه الدفع',
                                                                  ),
                                                                ),
                                                              );
                                                              return;
                                                            }
                                                            final routes = [
                                                              '/fawryScreen',
                                                              '/walletScreen',
                                                              '/fawryRefScreen',
                                                              '/instaPayScreen',
                                                              '/visaScreen',
                                                            ];
                                                            context.push(
                                                              routes[selectIndex],
                                                            );
                                                          },
                                                          fontsize: 25,
                                                        ),
                                                        SizedBox(height: 20),
                                                        textButtonCustom(
                                                          text: 'الغاء',
                                                          color:
                                                              Colors.deepPurple,
                                                          textColor:
                                                              Colors.white,
                                                          onPressed: () {
                                                            context.pop();
                                                          },
                                                          fontsize: 25,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      );
                                    },
                                    icon: Icon(Icons.arrow_back_rounded),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        'اضافة رصيد في المحفظة',
                                        style: Styles.textStyle19.copyWith(
                                          color: Colors.white,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Text(
                                        'اختر طريقه الدفع المناسبه لك',
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
