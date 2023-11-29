import 'package:flutter/material.dart';
import 'package:mote_web/HomeScreen/widgets/responsive.dart';
import 'package:mote_web/constants.dart';

class SearchProcess extends StatelessWidget {
  const SearchProcess({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: SearchProcessMobile(),
      tablet: SearchProcessTablet(),
      desktop: SearchProcessDesktop(),
    );
  }
}

class SearchProcessDesktop extends StatelessWidget {
  const SearchProcessDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          const SearchHeader(
            size: 70,
          ),
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SearchCard(
                  title: "ПОИСК ЛЮДЕЙ",
                  count: 1,
                  desc: Constants.searchCardText[0],
                  cardHeight: 300,
                  cardWidth: 300,
                ),
                SearchCard(
                  title: "ВЗАИМНЫЙ",
                  subTitle: "ИНТЕРЕС",
                  count: 2,
                  desc: Constants.searchCardText[1],
                  cardHeight: 300,
                  cardWidth: 300,
                ),
                SearchCard(
                  title: "ОБЩЕНИЕ",
                  count: 3,
                  desc: Constants.searchCardText[2],
                  cardHeight: 300,
                  cardWidth: 300,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SearchCard(
                title: "ВСТРЕЧА",
                count: 4,
                desc: Constants.searchCardText[3],
                cardHeight: 300,
                cardWidth: 300,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class SearchProcessTablet extends StatelessWidget {
  const SearchProcessTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          const SearchHeader(
            size: 60,
          ),
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SearchCard(
                  title: "ПОИСК ЛЮДЕЙ",
                  count: 1,
                  desc: Constants.searchCardText[0],
                  cardHeight: 300,
                  cardWidth: 300,
                ),
                SearchCard(
                  title: "ВЗАИМНЫЙ",
                  subTitle: "ИНТЕРЕС",
                  count: 2,
                  desc: Constants.searchCardText[1],
                  cardHeight: 300,
                  cardWidth: 300,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SearchCard(
                title: "ОБЩЕНИЕ",
                count: 3,
                desc: Constants.searchCardText[2],
                cardHeight: 300,
                cardWidth: 300,
              ),
              SearchCard(
                title: "ВСТРЕЧА",
                count: 4,
                desc: Constants.searchCardText[3],
                cardHeight: 300,
                cardWidth: 300,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class SearchProcessMobile extends StatelessWidget {
  const SearchProcessMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          const SearchHeader(
            size: 27,
          ),
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SearchCard(
                  title: "ПОИСК ЛЮДЕЙ",
                  count: 1,
                  desc: Constants.searchCardText[0],
                  cardHeight: 250,
                  cardWidth: 250,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SearchCard(
                title: "ВЗАИМНЫЙ",
                subTitle: "ИНТЕРЕС",
                count: 2,
                desc: Constants.searchCardText[3],
                cardHeight: 250,
                cardWidth: 250,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SearchCard(
                title: "ОБЩЕНИЕ",
                count: 3,
                desc: Constants.searchCardText[2],
                cardHeight: 250,
                cardWidth: 250,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SearchCard(
                title: "ВСТРЕЧА",
                count: 4,
                desc: Constants.searchCardText[3],
                cardHeight: 250,
                cardWidth: 250,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class SearchCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final int count;
  final String desc;
  final double cardWidth;
  final double cardHeight;
  const SearchCard({
    super.key,
    required this.title,
    required this.count,
    required this.desc,
    this.subTitle = "",
    required this.cardWidth,
    required this.cardHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: cardHeight,
      width: cardWidth,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 20,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 25,
                  ),
                ),
                Text(
                  "$count",
                  style: const TextStyle(
                    fontSize: 25,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  subTitle,
                  style: const TextStyle(
                    fontSize: 25,
                  ),
                ),
              ],
            ),
            Expanded(
                child: Center(
              child: Text(
                desc,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}

class SearchHeader extends StatelessWidget {
  final double size;
  const SearchHeader({
    super.key,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.7,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "search ",
                      style: TextStyle(
                        color: Constants.primaryColor,
                        fontSize: size,
                      ),
                    ),
                    TextSpan(
                      text: "PROCESS",
                      style: TextStyle(
                        fontSize: size + 10,
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                height: 2,
                color: Colors.black,
              )
            ],
          ),
        )
      ],
    );
  }
}
