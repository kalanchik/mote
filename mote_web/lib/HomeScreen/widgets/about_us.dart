import 'package:flutter/material.dart';
import 'package:mote_web/HomeScreen/widgets/responsive.dart';
import 'package:mote_web/constants.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
        mobile: AboutUsMobile(),
        tablet: AboutUsTablet(),
        desktop: AboutUsDesktop());
  }
}

class AboutUsDesktop extends StatelessWidget {
  const AboutUsDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 800,
            width: screenSize.width * 0.5,
            child: Image.asset(
              "assets/images/phone.png",
              fit: BoxFit.fitHeight,
            ),
          ),
          Expanded(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "what",
                        style: TextStyle(
                          fontSize: 80,
                          color: Constants.primaryColor,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "WE DO?",
                        style: TextStyle(
                          fontSize: 80,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    color: Colors.black,
                    height: 1,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "mote ",
                          style: TextStyle(
                            color: Constants.primaryColor,
                            fontSize: 40,
                          ),
                        ),
                        TextSpan(
                          text: Constants.aboutUsText,
                          style: const TextStyle(
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AboutUsTablet extends StatelessWidget {
  const AboutUsTablet({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 800,
            width: screenSize.width * 0.5,
            child: Image.asset(
              "assets/images/phone.png",
              fit: BoxFit.fitHeight,
            ),
          ),
          Expanded(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "what",
                        style: TextStyle(
                          fontSize: 60,
                          color: Constants.primaryColor,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "WE DO?",
                        style: TextStyle(
                          fontSize: 60,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    color: Colors.black,
                    height: 1,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "mote ",
                          style: TextStyle(
                            color: Constants.primaryColor,
                            fontSize: 40,
                          ),
                        ),
                        TextSpan(
                          text: Constants.aboutUsText,
                          style: const TextStyle(
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AboutUsMobile extends StatelessWidget {
  const AboutUsMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: SizedBox(
              height: 500,
              width: 300,
              child: Image.asset(
                "assets/images/phone.png",
                fit: BoxFit.cover,
                alignment: Alignment.center,
              ),
            ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Text(
                        "what",
                        style: TextStyle(
                          fontSize: 40,
                          color: Constants.primaryColor,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "WE DO?",
                        style: TextStyle(
                          fontSize: 40,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: screenSize.width * 0.8,
                  color: Colors.black,
                  height: 1,
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "mote ",
                          style: TextStyle(
                            color: Constants.primaryColor,
                            fontSize: 20,
                          ),
                        ),
                        TextSpan(
                          text: Constants.aboutUsText,
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
