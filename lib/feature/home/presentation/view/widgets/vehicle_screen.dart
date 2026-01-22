import 'package:flutter/material.dart';
import 'package:kosom_chat_gpt/core/assets/images/image_assets.dart';
import 'package:kosom_chat_gpt/core/utils/colors.dart';
import 'package:kosom_chat_gpt/core/utils/styles.dart';
import 'seats_screen.dart';

class VehicleScreen extends StatefulWidget {
  final GlobalKey<SeatsScreenState> seatsKey;
  const VehicleScreen({super.key, required this.seatsKey});

  @override
  State<VehicleScreen> createState() => _VehicleScreenState();
}

class _VehicleScreenState extends State<VehicleScreen> {
  int? selectedVehicle;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final itemWidth = (width - 20) / 4;

    Widget vehicleItem({
      required String title,
      required IconData icon,
      required String image,
      required int maxSeats,
      required int index,
    }) {
      final isSelected = selectedVehicle == index;
      return Expanded(
        child: InkWell(
          onTap: () async {
            setState(() {
              selectedVehicle = index;
            });
            final seats = await seatSelector(context, maxSeats);
            if (seats != null) {
              widget.seatsKey.currentState?.updateseats(seats);
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(2.5),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    image,
                    fit: BoxFit.cover,
                    width: itemWidth,
                    height: 100,
                  ),
                  Container(
                    height: 100,
                    width: itemWidth,
                    color: isSelected
                        ? KprimaryColor.withOpacity(0.5)
                        : Colors.grey.withOpacity(0.5),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(icon, color: Colors.white),
                      Text(
                        title,
                        maxLines: 2,
                        style: Styles.textStyle16.copyWith(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    return Row(
      children: [
        vehicleItem(
          title: 'شاحنة',
          icon: Icons.airport_shuttle,
          image: AssetsData.vehicle1,
          maxSeats: 12,
          index: 0,
        ),
        vehicleItem(
          title: 'دراجة نارية',
          icon: Icons.motorcycle_rounded,
          image: AssetsData.vehicle4,
          maxSeats: 1,
          index: 1,
        ),
        vehicleItem(
          title: 'أوتوبيس',
          icon: Icons.directions_bus_filled_outlined,
          image: AssetsData.vehicle2,
          maxSeats: 24,
          index: 2,
        ),
        vehicleItem(
          title: 'سيارة',
          icon: Icons.directions_car_filled_outlined,
          image: AssetsData.vehicle3,
          maxSeats: 3,
          index: 3,
        ),
      ],
    );
  }

  Future<int?> seatSelector(BuildContext context, int maxSeats) async {
    int count = 0;
    return await showModalBottomSheet<int>(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: count > 0 ? () => setState(() => count--) : null,
                    icon: CircleAvatar(
                      backgroundColor: count > 0 ? KprimaryColor : Colors.grey,
                      radius: 25,
                      child: const Icon(Icons.remove, color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Text(
                    '$count',
                    style: Styles.textStyle24.copyWith(color: Colors.black),
                  ),
                  const SizedBox(width: 20),
                  IconButton(
                    onPressed: count < maxSeats
                        ? () => setState(() => count++)
                        : null,
                    icon: CircleAvatar(
                      backgroundColor: count < maxSeats
                          ? KprimaryColor
                          : Colors.grey,
                      radius: 25,
                      child: const Icon(Icons.add, color: Colors.white),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () => Navigator.pop(context, count),
                style: ElevatedButton.styleFrom(
                  backgroundColor: KprimaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'اختر',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }
}
