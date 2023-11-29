import 'package:flutter/material.dart';
import 'package:mote_web/HomeScreen/widgets/responsive.dart';

import '../../models/AppStat.dart';

class Statistics extends StatelessWidget {
  const Statistics({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: StatisticsMobile(),
      tablet: StatisticsTablet(),
      desktop: StatisticsDesktop(),
    );
  }
}

class StatisticsDesktop extends StatelessWidget {
  const StatisticsDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: MediaQuery.of(context).size.width,
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                const VerticalDivider(
                  color: Colors.white,
                  width: 3,
                ),
                StatBloc(
                  count: StatApp.profileCount,
                  title: "Активных анкет",
                ),
                const VerticalDivider(
                  color: Colors.white,
                  width: 3,
                ),
                StatBloc(count: StatApp.chatCount, title: "Чатов"),
                const VerticalDivider(
                  color: Colors.white,
                  width: 3,
                ),
                StatBloc(count: StatApp.dateCount, title: "Свиданий"),
                const VerticalDivider(
                  color: Colors.white,
                  width: 3,
                ),
                StatBloc(count: StatApp.meetCount, title: "Встреч"),
                const VerticalDivider(
                  color: Colors.white,
                  width: 3,
                ),
                StatBloc(count: StatApp.peopleCount, title: "Счастливых людей"),
                const VerticalDivider(
                  color: Colors.white,
                  width: 3,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class StatisticsTablet extends StatelessWidget {
  const StatisticsTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: MediaQuery.of(context).size.width,
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                const VerticalDivider(
                  color: Colors.white,
                  width: 3,
                ),
                StatBlocTablet(
                  count: StatApp.profileCount,
                  title: "Активных анкет",
                ),
                const VerticalDivider(
                  color: Colors.white,
                  width: 3,
                ),
                StatBlocTablet(count: StatApp.chatCount, title: "Чатов"),
                const VerticalDivider(
                  color: Colors.white,
                  width: 3,
                ),
                StatBlocTablet(count: StatApp.dateCount, title: "Свиданий"),
                const VerticalDivider(
                  color: Colors.white,
                  width: 3,
                ),
                StatBlocTablet(count: StatApp.meetCount, title: "Встреч"),
                const VerticalDivider(
                  color: Colors.white,
                  width: 3,
                ),
                StatBlocTablet(
                    count: StatApp.peopleCount, title: "Счастливых людей"),
                const VerticalDivider(
                  color: Colors.white,
                  width: 3,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class StatisticsMobile extends StatelessWidget {
  const StatisticsMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                const VerticalDivider(
                  color: Colors.white,
                  width: 3,
                ),
                StatBlocMobile(
                  count: StatApp.profileCount,
                  title: "Активных анкет",
                ),
                const VerticalDivider(
                  color: Colors.white,
                  width: 3,
                ),
                StatBlocMobile(count: StatApp.chatCount, title: "Чатов"),
                const VerticalDivider(
                  color: Colors.white,
                  width: 3,
                ),
                StatBlocMobile(count: StatApp.dateCount, title: "Свиданий"),
                const VerticalDivider(
                  color: Colors.white,
                  width: 3,
                ),
                StatBlocMobile(count: StatApp.meetCount, title: "Встреч"),
                const VerticalDivider(
                  color: Colors.white,
                  width: 3,
                ),
                StatBlocMobile(
                    count: StatApp.peopleCount, title: "Счастливых людей"),
                const VerticalDivider(
                  color: Colors.white,
                  width: 3,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class StatBlocTablet extends StatelessWidget {
  final int count;
  final String title;
  const StatBlocTablet({super.key, required this.count, required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 130,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "$count",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 60,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class StatBlocMobile extends StatelessWidget {
  final int count;
  final String title;
  const StatBlocMobile({super.key, required this.count, required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 52,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "$count",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 8,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class StatBloc extends StatelessWidget {
  final int count;
  final String title;
  const StatBloc({super.key, required this.count, required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "$count",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 80,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
