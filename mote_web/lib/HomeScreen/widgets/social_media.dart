import 'package:flutter/material.dart';
import 'package:mote_web/HomeScreen/widgets/responsive.dart';

class AppInfo extends StatelessWidget {
  const AppInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: AppInfoMobile(),
      tablet: AppInfoDesktop(),
      desktop: AppInfoDesktop(),
    );
  }
}

class AppInfoDesktop extends StatelessWidget {
  const AppInfoDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InfoButton(
            text: "О приложении",
            onTap: () {},
          ),
          InfoButton(
            text: "Вконтакте",
            onTap: () {},
          ),
          InfoButton(
            text: "Telegram",
            onTap: () {},
          ),
          InfoButton(
            text: "Конфиденциальность",
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class AppInfoMobile extends StatelessWidget {
  const AppInfoMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          InfoButton(
            text: "О приложении",
            onTap: () {},
          ),
          InfoButton(
            text: "Вконтакте",
            onTap: () {},
          ),
          InfoButton(
            text: "Telegram",
            onTap: () {},
          ),
          InfoButton(
            text: "Конфиденциальность",
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class InfoButton extends StatelessWidget {
  final String text;
  final void Function() onTap;
  const InfoButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.grey,
        ),
      ),
    );
  }
}
