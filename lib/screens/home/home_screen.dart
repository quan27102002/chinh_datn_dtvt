import 'package:datn_trung/model/device_model.dart';
import 'package:datn_trung/res/fonts/app_fonts.dart';
import 'package:datn_trung/res/images/app_images.dart';
import 'package:datn_trung/screens/home/device_card.dart';
import 'package:datn_trung/screens/home/quick_action.dart';
import 'package:datn_trung/screens/home/room_card.dart';
import 'package:datn_trung/screens/home/summary_header.dart';
import 'package:datn_trung/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double tempData = 0;
  double humiData = 0;
  

  Future<void> _initData() async {
    DatabaseReference tempFirebase =
        FirebaseDatabase.instance.ref('/monitor').child('temp');
    DatabaseReference humiFirebase =
        FirebaseDatabase.instance.ref('/monitor').child('humi');

    tempFirebase.onValue.listen((event) {
      var data = event.snapshot.value;
      setState(() {
        tempData = double.parse(data.toString());
      });
    });

    humiFirebase.onValue.listen((event) {
      var data = event.snapshot.value;
      setState(() {
        humiData = double.parse(data.toString());
      });
    });
  }

  

  @override
  void initState() {
    _initializeData();
   
    super.initState();
  }

  Future<void> _initializeData() async {
    await _initData();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(height: 32 + MediaQuery.of(context).padding.top),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  'Good Morning, Codefarmer',
                  style: AppFonts.quicksand700(
                    18,
                    AppColors.black,
                  ),
                ),
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        // provider.changeMode();
                      },
                      icon: const Icon(Icons.lightbulb)),
                  GestureDetector(
                    onTap: () {
                      //  AppNavigator.pushNamed(
                      // profileRoute,
                      // // arguments: Icon(
                      // //   Icons.notifications_outlined,
                      // //   color: color.tertiary,
                      // // ),
                    },
                    child: const CircleAvatar(
                      radius: 24,
                      backgroundImage: AssetImage(AppImages.profile),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 32),
          SummaryHeader(
            temp: tempData.toString(),
            humi: humiData.toString(),
          ),
          const SizedBox(height: 32),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Quick Action',
                // style: theme.typography.bodyCopyMedium,
              ),
              Text(
                'Edit',
                // style: theme.typography.bodyCopy,
              )
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ...['Wake up', 'Sleep', 'Clean']
                  .map((e) => QuickAction(action: e))
            ],
          ),
          const SizedBox(height: 32),
          const Text(
            'Active Devices',
          ),
          const SizedBox(height: 16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ...devices.map(
                  (e) => DeviceCard(
                    device: e,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Rooms',
              ),
              Text(
                'Edit',
              )
            ],
          ),
          const SizedBox(height: 16),
          MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  mainAxisExtent: 100,
                ),
                itemCount: 8,
                itemBuilder: (BuildContext context, int index) {
                  return const RoomCard();
                }),
          ),
        ]),
      ),
    );
  }
}
