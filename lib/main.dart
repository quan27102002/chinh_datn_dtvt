import 'package:datn_trung/app/app_routers.dart';
import 'package:datn_trung/firebase_options.dart';
import 'package:datn_trung/provider/loading_provider.dart';
import 'package:datn_trung/provider/user_provider.dart';
import 'package:datn_trung/screens/app_home.dart';
import 'package:datn_trung/screens/login/login_screen.dart';
import 'package:datn_trung/screens/splash/splash_screen.dart';
import 'package:datn_trung/widget/keyboard_widget.dart';
import 'package:datn_trung/widget/loading_widget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:soundpool/soundpool.dart';

DatabaseReference _databaseReferenceFire =
    FirebaseDatabase.instance.ref('/firealarm').child('fireAlert');
DatabaseReference _databaseReferenceGas =
    FirebaseDatabase.instance.ref('/firealarm').child('gasAlert');
bool alert = false;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  _setupStream();
  runApp(
    const MyApp(),
  );
}

void _setupStream() {
  _databaseReferenceFire.onValue.listen((event) {
    final dynamic data = event.snapshot.value;

    if (data != null) {
      alert = data;
      // setState(() {
      //   nhietdo = data.toDouble();
      // });
    }
    if (alert) {
      _showFire();
    }
  });
  _databaseReferenceGas.onValue.listen((event) {
    final dynamic data = event.snapshot.value;

    if (data != null) {
      alert = data;
      // setState(() {
      //   nhietdo = data.toDouble();
      // });
    }
    if (alert) {
      _showFire();
    }
  });
}

Future<void> _sound() async {
  Soundpool pool = Soundpool(streamType: StreamType.notification);

  int soundId =
      await rootBundle.load("assets/music/coi.mp3").then((ByteData soundData) {
    return pool.load(soundData);
  });
  int streamId = await pool.play(soundId);
}

void _showFire() {
  _sound();
  // showDialog(
  //   context: context,
  //   builder: (BuildContext context) {
  //     return AlertDialog(
  //       title: const Text('Thông báo'),
  //       content: const Text('Phát hiện có cháy!!!'),
  //       actions: [
  //         TextButton(
  //           child: const Text('Đóng'),
  //           onPressed: () {
  //             Navigator.of(context).pop();
  //           },
  //         ),
  //       ],
  //     );
  //   },
  // );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoadingProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      builder: (context, _) {
        return Consumer<LoadingProvider>(
          builder: (context, loading, child) {
            return KeyboardDismiss(
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                home: Stack(
                  children: [
                    MaterialApp(
                      title: 'DATN',
                      theme: ThemeData(
                        primarySwatch: Colors.blue,
                        useMaterial3: false,
                      ),
                      debugShowCheckedModeBanner: false,
                      // Sử dụng StreamBuilder để theo dõi trạng thái đăng nhập
                      home: StreamBuilder<User?>(
                        stream: FirebaseAuth.instance.authStateChanges(),
                        builder: (ctx, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const SplashScreen();
                          }
                          if (snapshot.hasData) {
                            return const Dashboard();
                          } else {
                            return const LoginPage();
                          }
                        },
                      ),
                      // home: const Dashboard(),
                      routes: AppRouters.routes,
                    ),
                    loading.isLoading
                        ? const LoadingWidget()
                        : const SizedBox.shrink()
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
