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
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const MyApp(),
  );
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
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return const SplashScreen();
                          }
                          if (snapshot.hasData) {
                            return const Dashboard();
                          } else {
                            return const LoginPage();
                          }
                        },
                      ),
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
