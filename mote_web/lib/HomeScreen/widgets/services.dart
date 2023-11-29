import 'package:flutter/material.dart';
import 'package:mote_web/HomeScreen/widgets/responsive.dart';
import 'package:mote_web/constants.dart';

class Services extends StatelessWidget {
  const Services({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: ServicesMobile(),
      tablet: ServicesTablet(),
      desktop: ServicesDesktop(),
    );
  }
}

class ServicesDesktop extends StatelessWidget {
  const ServicesDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          const Header(
            textSize: 80,
          ),
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ServicesCard(
                      title: "АНКЕТЫ",
                      desc: Constants.servicesText[0],
                      cardWidth: 300,
                      cardHeight: 150,
                    ),
                    ServicesCard(
                      title: "АНОНИМНЫЕ ЧАТЫ",
                      desc: Constants.servicesText[1],
                      cardWidth: 300,
                      cardHeight: 150,
                    ),
                    ServicesCard(
                      title: "ПОИСК",
                      desc: Constants.servicesText[2],
                      cardWidth: 300,
                      cardHeight: 150,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ServicesCard(
                      title: "СВИДАНИЯ В СЛЕПУЮ",
                      desc: Constants.servicesText[3],
                      cardWidth: 300,
                      cardHeight: 150,
                    ),
                    ServicesCard(
                      title: "ВСТРЕЧИ",
                      desc: Constants.servicesText[4],
                      cardWidth: 300,
                      cardHeight: 150,
                    ),
                    const SizedBox(
                      height: 150,
                      width: 300,
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ServicesTablet extends StatelessWidget {
  const ServicesTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          const Header(
            textSize: 80,
          ),
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ServicesCard(
                      title: "АНКЕТЫ",
                      desc: Constants.servicesText[0],
                      cardWidth: 300,
                      cardHeight: 150,
                    ),
                    ServicesCard(
                      title: "АНОНИМНЫЕ ЧАТЫ",
                      desc: Constants.servicesText[1],
                      cardWidth: 300,
                      cardHeight: 150,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ServicesCard(
                      title: "ПОИСК",
                      desc: Constants.servicesText[2],
                      cardWidth: 300,
                      cardHeight: 150,
                    ),
                    ServicesCard(
                      title: "СВИДАНИЯ В СЛЕПУЮ",
                      desc: Constants.servicesText[3],
                      cardWidth: 300,
                      cardHeight: 150,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ServicesCard(
                      title: "ВСТРЕЧИ",
                      desc: Constants.servicesText[4],
                      cardWidth: 300,
                      cardHeight: 150,
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ServicesMobile extends StatelessWidget {
  const ServicesMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          const Header(
            textSize: 35,
          ),
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ServicesCard(
                      title: "АНКЕТЫ",
                      desc: Constants.servicesText[0],
                      cardWidth: 250,
                      cardHeight: 150,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ServicesCard(
                      title: "АНОНИМНЫЕ ЧАТЫ",
                      desc: Constants.servicesText[1],
                      cardWidth: 250,
                      cardHeight: 150,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ServicesCard(
                      title: "ПОИСК",
                      desc: Constants.servicesText[2],
                      cardWidth: 250,
                      cardHeight: 150,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ServicesCard(
                      title: "СВИДАНИЯ В СЛЕПУЮ",
                      desc: Constants.servicesText[3],
                      cardWidth: 250,
                      cardHeight: 150,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ServicesCard(
                      title: "ВСТРЕЧИ",
                      desc: Constants.servicesText[4],
                      cardWidth: 250,
                      cardHeight: 150,
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ServicesCard extends StatelessWidget {
  final String title;
  final String desc;
  final double cardWidth;
  final double cardHeight;
  const ServicesCard({
    super.key,
    required this.title,
    required this.desc,
    required this.cardWidth,
    required this.cardHeight,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: cardWidth,
      height: cardHeight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Divider(
            height: 2,
            color: Colors.black,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 25,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(desc)
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  final double textSize;
  const Header({
    super.key,
    required this.textSize,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "SERVICES",
                style: TextStyle(
                  fontSize: textSize,
                ),
              ),
              const Divider(
                height: 3,
                color: Colors.black,
              )
            ],
          ),
        )
      ],
    );
  }
}
