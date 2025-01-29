import 'package:datn_trung/model/device_model.dart';
import 'package:datn_trung/res/fonts/app_fonts.dart';
import 'package:datn_trung/res/images/app_images.dart';
import 'package:datn_trung/screens/home/device_card.dart';
import 'package:datn_trung/screens/home/device_sensor_card.dart';
import 'package:datn_trung/screens/home/quick_action.dart';
import 'package:datn_trung/screens/home/room_card.dart';
import 'package:datn_trung/screens/home/summary_header.dart';
import 'package:datn_trung/themes/app_colors.dart';
import 'package:datn_trung/util/app_function.dart';
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
  double moniHumiData = 0;
  double moniTempData = 0;
  double moniCoData = 0;
  double moniPm01Data = 0;
  double moniPm10Data = 0;
  double moniPm25Data = 0;

  Future<void> _initData() async {
    DatabaseReference tempFirebase =
        FirebaseDatabase.instance.ref('/firealarm').child('temp');
    DatabaseReference humiFirebase =
        FirebaseDatabase.instance.ref('/firealarm').child('humi');
    DatabaseReference monitorHumi =
        FirebaseDatabase.instance.ref('/monitor').child('moniHumi');
    DatabaseReference monitorTemp =
        FirebaseDatabase.instance.ref('/monitor').child('moniTemp');
    DatabaseReference monitorCO =
        FirebaseDatabase.instance.ref('/monitor').child('moniCo');
    DatabaseReference monitorPM01 =
        FirebaseDatabase.instance.ref('/monitor').child('moniPM01');
    DatabaseReference monitorPM10 =
        FirebaseDatabase.instance.ref('/monitor').child('moniPM10');
    DatabaseReference monitorPM25 =
        FirebaseDatabase.instance.ref('/monitor').child('moniPM25');
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
    //monitor
    monitorHumi.onValue.listen((event) {
      var data = event.snapshot.value;
      setState(() {
        moniHumiData = double.parse(data.toString());
      });
    });
    monitorTemp.onValue.listen((event) {
      var data = event.snapshot.value;
      setState(() {
        moniTempData = double.parse(data.toString());
      });
    });
    monitorCO.onValue.listen((event) {
      var data = event.snapshot.value;
      setState(() {
        moniCoData = double.parse(data.toString());
      });
    });
    monitorPM01.onValue.listen((event) {
      var data = event.snapshot.value;
      setState(() {
        moniPm01Data = double.parse(data.toString());
      });
    });
    monitorPM10.onValue.listen((event) {
      var data = event.snapshot.value;
      setState(() {
        moniPm10Data = double.parse(data.toString());
      });
    });
    monitorPM25.onValue.listen((event) {
      var data = event.snapshot.value;
      setState(() {
        moniPm25Data = double.parse(data.toString());
      });
    });
  }

  @override
  void initState() {
    _initializeData();
    AppFunction.hideLoading(context);
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
                  'Chào bạn, Chinh',
                  style: AppFonts.quicksand700(
                    18,
                    AppColors.black,
                  ),
                ),
              ),
              Row(
                children: [
                  // IconButton(
                  //     onPressed: () {
                  //       // provider.changeMode();
                  //     },
                  //     icon: const Icon(Icons.lightbulb)),
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
          // const Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Text(
          //       'Quick Action',
          //       // style: theme.typography.bodyCopyMedium,
          //     ),
          //     Text(
          //       'Edit',
          //       // style: theme.typography.bodyCopy,
          //     )
          //   ],
          // ),
          // const SizedBox(height: 16),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
          //   children: [
          //     ...['Wake up', 'Sleep', 'Clean']
          //         .map((e) => QuickAction(action: e))
          //   ],
          // ),
          // const SizedBox(height: 32),
          const Text(
            'Thiết bị cảm biến',
          ),
          const SizedBox(height: 16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ...devicesSensor.map((e) {
                  String value = "0";
                  IconData icon = Icons.abc;
                  if (e.room == "co") {
                    value = moniCoData.toString();
                    icon = Icons.smoke_free;
                  } else if (e.room == "temp") {
                    value = moniTempData.toString();
                    icon = Icons.thermostat;
                  } else if (e.room == "humi") {
                    value = moniHumiData.toString();
                    icon = Icons.water_drop;
                  } else if (e.room == "pm01") {
                    value = moniPm01Data.toString();
                    icon = Icons.filter_1;
                  } else if (e.room == "pm25") {
                    value = moniPm25Data.toString();
                    icon = Icons.filter_3;
                  } else if (e.room == "pm10") {
                    value = moniPm10Data.toString();
                    icon = Icons.filter_2;
                  } else {
                    value = " Không có dữ liệu";
                  }
                  return DeviceCardSensor(
                    device: e,
                    value: value,
                    icon: icon,
                  );
                }),
              ],
            ),
          ),
          const SizedBox(height: 32),
          // const Text(
          //   'Active Devices',
          // ),
          // const SizedBox(height: 16),
          // SingleChildScrollView(
          //   scrollDirection: Axis.horizontal,
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //     children: [
          //       ...devices.map(
          //         (e) => DeviceCard(
          //           device: e,
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          // const SizedBox(height: 32),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Tất cả thiết bị',
              ),
              Text(
                'Chỉnh sửa',
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
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  mainAxisExtent: 150,
                ),
                itemCount: devices.length,
                itemBuilder: (BuildContext context, int index) {
                  return DeviceCard(
                    device: devices[index],
                  );
                }),
          ),
        ]),
      ),
    );
  }
}
