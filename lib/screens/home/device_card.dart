import 'package:datn_trung/model/device_model.dart';
import 'package:datn_trung/res/images/app_images.dart';
import 'package:datn_trung/themes/app_colors.dart';
import 'package:datn_trung/util/enums.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class DeviceCard extends StatefulWidget {
  final Device device;
  const DeviceCard({
    super.key,
    required this.device,
  });

  @override
  State<DeviceCard> createState() => _DeviceCardState();
}

class _DeviceCardState extends State<DeviceCard> {
  late final DatabaseReference _databaseReference;
  late final DatabaseReference _databaseReferenceFire;
  final ValueNotifier<bool> isSwitchOn = ValueNotifier<bool>(false);
  void _initDevice(String path) {
    _databaseReference = FirebaseDatabase.instance.ref('/control').child(path);
  }

  void _setupStream() {
    _databaseReference.onValue.listen((event) {
      final dynamic data = event.snapshot.value;
      if (data != null && data is bool) {
        isSwitchOn.value = data;
      }
    });
  }

  void _initDeviceFire(String path) {
    _databaseReferenceFire =
        FirebaseDatabase.instance.ref('/firealarm').child(path);
  }

  void _setupStreamFire() {
    _databaseReferenceFire.onValue.listen((event) {
      final dynamic data = event.snapshot.value;
      if (data != null && data is bool) {
        isSwitchOn.value = data;
      }
    });
  }

  void _toggleSwitch() {
    // Đảo ngược trạng thái hiện tại và cập nhật Firebase
    final newValue = !isSwitchOn.value;
    if (widget.device.path == "fan" || widget.device.path == "pump") {
      _databaseReferenceFire.set(newValue).then((_) {
        // Cập nhật trạng thái trên UI sau khi thành công
        isSwitchOn.value = newValue;
      });
    } else {
      _databaseReference.set(newValue).then((_) {
        // Cập nhật trạng thái trên UI sau khi thành công
        isSwitchOn.value = newValue;
      });
    }
  }

  @override
  void initState() {
    if (widget.device.path == "fan" || widget.device.path == "pump") {
      _initDeviceFire(widget.device.path);
      _setupStreamFire();
    } else {
      _initDevice(widget.device.path);
      _setupStream();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        // AppNavigator.pushNamed(widget.device.type.routeName,
        // arguments: widget.device)
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSwitchOn.value ? AppColors.kPrimary : Colors.black,
            width: 1,
          ),
          // color: theme.colors.secondary.withOpacity(provider.isDark ? 1 : 0.1),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(
                  widget.device.type.icon ?? AppImages.acIcon,
                  width: 36,
                  color: isSwitchOn.value ? AppColors.kPrimary : Colors.black,
                ),
                const SizedBox(width: 32),
                ValueListenableBuilder<bool>(
                    valueListenable: isSwitchOn,
                    builder: (context, value, child) {
                      return Transform.scale(
                        scale: 1.2,
                        child: Switch.adaptive(
                          activeColor: AppColors.kPrimary,
                          value: isSwitchOn.value,
                          onChanged: (bool v) {
                            setState(() {
                              _toggleSwitch();
                              widget.device.active = v;
                            });
                          },
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                        ),
                      );
                    }),
              ],
            ),
            const SizedBox(height: 32),
            Text(
              widget.device.name ?? widget.device.type.name,
              // style: theme.typography.bodyCopy.copyWith(color: BatPalette.grey),
            ),
            const SizedBox(height: 4),
            Text(
              widget.device.room,
              // style:
              //     theme.typography.subtitle.copyWith(color: BatPalette.grey60),
            )
          ],
        ),
      ),
    );
  }
}
