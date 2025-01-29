import 'package:datn_trung/res/images/app_images.dart';

enum DeviceType { ac, smartTv, cctv, refridgerator, microwave, light }

extension DeviceTypeExtension on DeviceType {
  String get name {
    switch (this) {
      case DeviceType.ac:
        return 'AC';
      case DeviceType.smartTv:
        return 'Smart TV';
      case DeviceType.cctv:
        return 'CCTV';
      case DeviceType.refridgerator:
        return 'Refridgerator';
      case DeviceType.microwave:
        return 'Microwave';
      case DeviceType.light:
        return 'Light';
      default:
        return 'Unknown';
    }
  }

  String? get icon {
    switch (this) {
      case DeviceType.ac:
        return AppImages.acIcon;
      case DeviceType.smartTv:
        return AppImages.tvIcon;
      case DeviceType.cctv:
        return AppImages.cctvIcon;
      case DeviceType.refridgerator:
        return AppImages.fridgeIcon;
      case DeviceType.microwave:
        return AppImages.ovenIcon;
      case DeviceType.light:
        return AppImages.lightIcon;
      default:
        return null;
    }
  }

  // String get routeName {
  //   switch (this) {
  //     case DeviceType.ac:
  //       return acRoute;
  //     case DeviceType.smartTv:
  //       return smartTvRoute;
  //     case DeviceType.cctv:
  //       return cctvRoute;
  //     case DeviceType.refridgerator:
  //       return refridgeratorRoute;
  //     case DeviceType.microwave:
  //       return microwaveRoute;
  //     case DeviceType.light:
  //       return lightRoute;
  //     default:
  //       return '/unknown';
  //   }
  // }
}
