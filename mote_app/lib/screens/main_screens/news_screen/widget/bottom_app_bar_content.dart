import 'package:flutter/material.dart';
import 'package:mote_app/screens/main_screens/news_screen/widget/promo_card.dart';
import 'package:mote_app/utils/setColors/setcolors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BottomAppBarContent extends StatefulWidget {
  const BottomAppBarContent({
    super.key,
  });

  @override
  State<BottomAppBarContent> createState() => _BottomAppBarContentState();
}

class _BottomAppBarContentState extends State<BottomAppBarContent> {
  late final PageController pageController;
  // late final Timer carouselTimer;

  int pageNumber = 0;

  @override
  void initState() {
    pageController = PageController(initialPage: 0, viewportFraction: 1);
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final promoCards = <PromoCard>[
      const PromoCard(
        promoText: 'Оформи подписку\nСо скидкой 25%',
        buttonText: 'Оформить',
        imageName: 'promo1',
      ),
      const PromoCard(
        promoText: 'Как привлечь внимание?',
        buttonText: 'Узнать',
        imageName: 'promo2',
      ),
      const PromoCard(
        promoText: 'Есть вопросы?\nЗадай их нам',
        buttonText: 'Написать',
        imageName: 'promo3',
      ),
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
      child: Column(
        children: [
          const SizedBox(height: 15),
          Container(
            height: 140,
            child: PageView(
              onPageChanged: (value) {
                setState(() {
                  pageNumber = value;
                });
              },
              controller: pageController,
              children: promoCards,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SmoothPageIndicator(
            controller: pageController,
            count: promoCards.length,
            effect: ExpandingDotsEffect(
              dotColor: TSetColor.onBackgroundColor(context),
              dotHeight: 10,
              dotWidth: 10,
              activeDotColor: Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
