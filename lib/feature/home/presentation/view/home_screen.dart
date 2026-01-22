import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kosom_chat_gpt/core/shared/widgets/constants.dart';
import 'package:kosom_chat_gpt/core/utils/colors.dart';
import 'package:kosom_chat_gpt/core/utils/styles.dart';
import 'package:kosom_chat_gpt/feature/home/presentation/view/widgets/chose_time_screen.dart';
import 'package:kosom_chat_gpt/feature/home/presentation/view/widgets/from_to_screen.dart';
import 'package:kosom_chat_gpt/feature/home/presentation/view/widgets/gender_screen.dart';
import 'package:kosom_chat_gpt/feature/home/presentation/view/widgets/home_app_bar.dart';
import 'package:kosom_chat_gpt/feature/home/presentation/view/widgets/seats_screen.dart';
import 'package:kosom_chat_gpt/feature/home/presentation/view/widgets/to_from_screen.dart';
import 'package:kosom_chat_gpt/feature/home/presentation/view/widgets/vehicle_screen.dart';
import 'package:kosom_chat_gpt/feature/home/presentation/view/widgets/waiting_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int? selectedSeats;
  DateTime? selectedDateTime;
  String? errorMessage;
  String? selectedGender;
  void upDateGender(String gender) {
    setState(() {
      selectedGender = gender;
      errorMessage = null;
    });
  }

  void updateDateTime(DateTime datetime) {
    setState(() {
      selectedDateTime = datetime;
      errorMessage = null;
    });
  }

  void checkAndShowError() {
    selectedSeats = seatsKey.currentState?.getseats();
    if (selectedSeats == null ||
        selectedDateTime == null ||
        selectedGender == null) {
      setState(() {
        errorMessage = 'من فضلك قم بإكمال البيانات';
      });
    } else {
      setState(() {
        errorMessage = null;
      });
      context.push('/tripscreen');
    }
  }

  final GlobalKey<SeatsScreenState> seatsKey = GlobalKey<SeatsScreenState>();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(color: KprimaryColor),
        SingleChildScrollView(
          child: Column(
            children: [
              const HomeAppBar(),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const WaitingScreen(),
                          const SizedBox(height: 24),
                          const FromToScreen(),
                          const SizedBox(height: 17),
                          const ToFromScreen(),
                          const SizedBox(height: 17),
                          Text(
                            'اختار نوع المركبة',
                            style: Styles.textStyle19.copyWith(
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 13),
                          VehicleScreen(seatsKey: seatsKey),
                          const SizedBox(height: 28),
                          SeatsScreen(key: seatsKey),
                          const SizedBox(height: 28),
                          GenderScreen(
                            onGenderSelected: upDateGender,
                            selectedGender: selectedGender ?? '',
                          ),
                          const SizedBox(height: 10),
                          ChoseTimeScreen(
                            selectedDateTime: selectedDateTime,
                            onDateTimeSelected: updateDateTime,
                          ),
                          const SizedBox(height: 30),
                          textButtonCustom(
                            text: ' ابحث',
                            color: KprimarybuttonColor,
                            textColor: Colors.white,
                            onPressed: checkAndShowError,
                            fontsize: 25,
                          ),
                          if (errorMessage != null)
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Container(
                                width: double.infinity,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 15,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  errorMessage!,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            )
                          else
                            const SizedBox(height: 34),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
