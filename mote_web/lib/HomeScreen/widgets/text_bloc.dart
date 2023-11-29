import 'package:flutter/material.dart';
import 'package:mote_web/HomeScreen/widgets/responsive.dart';
import 'package:mote_web/constants.dart';

class TextBloc extends StatelessWidget {
  const TextBloc({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: TextBlocMobile(),
      tablet: TextBlocDesktop(),
      desktop: TextBlocDesktop(),
    );
  }
}

class TextBlocDesktop extends StatelessWidget {
  const TextBlocDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          const Divider(
            height: 2,
            color: Colors.black,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "YOU WANT TO",
                  style: TextStyle(
                    fontSize: 60,
                  ),
                ),
                Text(
                  "FIND",
                  style: TextStyle(
                    fontSize: 60,
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            height: 2,
            color: Colors.black,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "love?",
                  style: TextStyle(
                    fontSize: 60,
                    color: Constants.primaryColor,
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            height: 2,
            color: Colors.black,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Row(
              children: [
                const Text(
                  "WE ARE YOUR",
                  style: TextStyle(
                    fontSize: 60,
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "ticket",
                        style: TextStyle(
                          color: Constants.primaryColor,
                          fontSize: 60,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          const Divider(
            height: 2,
            color: Colors.black,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Text(
                      "TO A",
                      style: TextStyle(
                        fontSize: 60,
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      "happy",
                      style: TextStyle(
                        fontSize: 60,
                        color: Constants.primaryColor,
                      ),
                    ),
                  ],
                ),
                const Text(
                  "LIFE",
                  style: TextStyle(
                    fontSize: 60,
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            height: 2,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}

class TextBlocMobile extends StatelessWidget {
  const TextBlocMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          const Divider(
            height: 2,
            color: Colors.black,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "YOU WANT TO",
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
                Text(
                  "FIND",
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            height: 2,
            color: Colors.black,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "love?",
                  style: TextStyle(
                    fontSize: 40,
                    color: Constants.primaryColor,
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            height: 2,
            color: Colors.black,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Row(
              children: [
                const Text(
                  "WE ARE YOUR",
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "ticket",
                        style: TextStyle(
                          color: Constants.primaryColor,
                          fontSize: 30,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          const Divider(
            height: 2,
            color: Colors.black,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Text(
                      "TO A",
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      "happy",
                      style: TextStyle(
                        fontSize: 30,
                        color: Constants.primaryColor,
                      ),
                    ),
                  ],
                ),
                const Text(
                  "LIFE",
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            height: 2,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
