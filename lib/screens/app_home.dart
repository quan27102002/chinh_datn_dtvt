import 'package:datn_trung/screens/home/home_screen.dart';
import 'package:datn_trung/themes/app_colors.dart';
import 'package:flutter/material.dart';


class Dashboard extends StatefulWidget {
  final int initialTab;
  const Dashboard({super.key, this.initialTab = 0});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Widget> _children = [
    HomeScreen(),
    Container(),
    Container(),
    // RoutineHomeScreen(),
    Container(),
  ];

  @override
  void initState() {
    _tabController = TabController(length: _children.length, vsync: this);
    _tabController.index = widget.initialTab;
    super.initState();
  }

  void onTabTapped(int index) {
    _tabController.index = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _tabController,
          children: _children,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: onTabTapped,
        currentIndex: _tabController.index,
        unselectedFontSize: 14,
        elevation: 2.0,
        selectedIconTheme: const IconThemeData(
          color: AppColors.kPrimary,
        ),
        unselectedIconTheme: const IconThemeData(
          color: AppColors.grey400,
        ),
        // selectedLabelStyle: BatThemeData.of(context).typography.bodyCopyMedium,
        // unselectedLabelStyle: BatThemeData.of(context).typography.bodyCopy,
        selectedItemColor: AppColors.kPrimary,
        unselectedItemColor: AppColors.grey400,
        enableFeedback: true,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home_outlined),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.phone_iphone_rounded),
              activeIcon: Icon(Icons.phone_iphone_rounded),
              label: "Device"),
          BottomNavigationBarItem(
              icon: Icon(Icons.keyboard_voice_outlined),
              activeIcon: Icon(Icons.keyboard_voice_outlined),
              label: "Voice"),
          // BottomNavigationBarItem(
          //     icon: Icon(Icons.replay_rounded),
          //     activeIcon: Icon(Icons.replay_rounded),
          //     label: "Routine"),
          BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart_rounded),
              activeIcon: Icon(Icons.bar_chart_rounded),
              label: "Stats"),
        ],
      ),
    );
  }
}
