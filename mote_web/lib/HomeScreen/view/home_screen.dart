import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController scrollController = ScrollController();
  final contactsKey = GlobalKey();
  final aboutUsKey = GlobalKey();
  final servicesKey = GlobalKey();
  final searchProcessKey = GlobalKey();
  final joinKey = GlobalKey();

  Future scrollToItem(GlobalKey key) async {
    final context = key.currentContext!;

    await Scrollable.ensureVisible(
      context,
      alignment: 0.5,
      duration: const Duration(seconds: 1),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          CustomTextButton(
              title: "О нас",
              onTap: () {
                scrollToItem(aboutUsKey);
              }),
          CustomTextButton(
              title: "Поиск",
              onTap: () {
                scrollToItem(searchProcessKey);
              }),
          CustomTextButton(
              title: "Функции",
              onTap: () {
                scrollToItem(servicesKey);
              }),
          CustomTextButton(
              title: "Скачать",
              onTap: () {
                scrollToItem(contactsKey);
              }),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            scrollController.animateTo(0.0,
                duration: const Duration(milliseconds: 700),
                curve: Curves.easeInOut);
          });
        },
        backgroundColor: Colors.white,
        child: const Icon(
          Icons.arrow_upward,
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: [
            const Divider(
              height: 2,
              color: Colors.black,
            ),
            MainHeader(
              onTap: () {
                scrollToItem(contactsKey);
              },
            ),
            const SizedBox(
              height: 40,
            ),
            const TextBloc(),
            const SizedBox(
              height: 40,
            ),
            Container(
              key: aboutUsKey,
              child: const AboutUs(),
            ),
            const Statistics(),
            const SizedBox(
              height: 50,
            ),
            Container(
              key: servicesKey,
              child: const Services(),
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              key: searchProcessKey,
              child: const SearchProcess(),
            ),
            const SizedBox(
              height: 100,
            ),
            const Join(),
            const SizedBox(
              height: 40,
            ),
            Container(
              key: contactsKey,
              child: const AppInfo(),
            ),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
