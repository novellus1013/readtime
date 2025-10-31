import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:read_time/core/constants/colors.dart';
import 'package:read_time/core/constants/gaps.dart';
import 'package:read_time/core/constants/sizes.dart';
import 'package:read_time/ui/screens/analytics_screen.dart';
import 'package:read_time/ui/screens/home_screen.dart';
import 'package:read_time/ui/screens/setting_screen.dart';
import 'package:read_time/ui/screens/timeline_screen.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> with TickerProviderStateMixin {
  TabController? controller;

  @override
  void initState() {
    super.initState();

    controller = TabController(length: 4, vsync: this);

    controller!.addListener(tabListener);
  }

  void tabListener() {
    setState(() {});
  }

  @override
  void dispose() {
    controller!.removeListener(tabListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: primaryColor,
      body: TabBarView(
        controller: controller,
        children: const [
          HomeScreen(),
          TimelineScreen(),
          AnalyticsScreen(),
          SettingScreen()
        ],
      ),
      bottomNavigationBar: _renderBottomNavigation(),
    );
  }

  BottomNavigationBar _renderBottomNavigation() {
    return BottomNavigationBar(
      currentIndex: controller!.index,
      onTap: (int index) {
        setState(() {
          controller!.animateTo(index);
        });
      },
      type: BottomNavigationBarType.fixed,
      // backgroundColor: primaryColor,
      selectedItemColor: lightOrange,
      unselectedItemColor: Colors.grey[800],
      iconSize: Sizes.size18,
      items: const [
        BottomNavigationBarItem(
            icon: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FaIcon(
                  FontAwesomeIcons.hourglassHalf,
                ),
                Gaps.v6,
              ],
            ),
            label: '독서'),
        BottomNavigationBarItem(
            icon: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FaIcon(
                  FontAwesomeIcons.calendarCheck,
                ),
                Gaps.v6,
              ],
            ),
            label: '기록'),
        BottomNavigationBarItem(
            icon: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FaIcon(
                  FontAwesomeIcons.chartPie,
                ),
                Gaps.v6,
              ],
            ),
            label: '분석'),
        BottomNavigationBarItem(
            icon: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FaIcon(
                  FontAwesomeIcons.ellipsisH,
                ),
                Gaps.v6,
              ],
            ),
            label: '더보기'),
      ],
    );
  }
}
