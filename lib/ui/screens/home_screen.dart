import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:read_time/core/constants/colors.dart';
import 'package:read_time/core/constants/gaps.dart';
import 'package:read_time/core/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  final int goalSessionTime = 180;
  final int todaysSessionTime = 20;
  final int lastSessionTime = 35;

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: Sizes.size24,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const _StartButton(),
          Gaps.v60,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _HomeCard(
                title: "일일 목표",
                icon: FontAwesomeIcons.fire,
                time: "$todaysSessionTime / $goalSessionTime 분",
              ),
              Gaps.h20,
              _HomeCard(
                title: "마지막 세션",
                icon: FontAwesomeIcons.arrowAltCircleLeft,
                time: "$lastSessionTime 분",
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _HomeCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final String time;

  const _HomeCard({
    super.key,
    required this.title,
    required this.icon,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          decoration: BoxDecoration(
            color: darkBlue,
            borderRadius: BorderRadius.circular(
              Sizes.size10,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(
              Sizes.size14,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: tealBlue,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    FaIcon(
                      icon,
                      size: Sizes.size16,
                      color: lightOrange,
                    ),
                  ],
                ),
                Gaps.v24,
                Text(
                  time,
                  style: TextStyle(
                    color: lightWhite,
                    fontSize: Sizes.size16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _StartButton extends StatelessWidget {
  const _StartButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final double buttonSize = MediaQuery.of(context).size.width * 0.8;

    return ElevatedButton(
      onPressed: () {
        print("눌렸어용");
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: darkBlue,
        foregroundColor: lightWhite,
        minimumSize: Size(buttonSize, buttonSize),
      ),
      child: const Text(
        'Start',
        style: TextStyle(
          fontSize: Sizes.size48,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
