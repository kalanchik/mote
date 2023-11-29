import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:mote_app/screens/help_screen/widgets/help_form_filed.dart';
import 'package:mote_app/screens/help_screen/widgets/help_header.dart';
import 'package:mote_app/screens/help_screen/widgets/help_page_controller.dart';
import 'package:mote_app/screens/main_screens/news_screen/widget/news_drawer.dart';
import 'package:mote_app/utils/setColors/setcolors.dart';
import 'package:mote_app/widgets/custom_elevated_buttom.dart';

@RoutePage()
class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;

  int contentIndex = 0;

  final themeController = TextEditingController();
  final problemController = TextEditingController();

  @override
  void initState() {
    controller = AnimationController(vsync: this);
    controller.value = 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      drawer: NewsDrawer(
        drawerIndex: 7,
        changeIndex: (index) {},
      ),
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: AnimateList(
              effects: [],
              children: [
                const HelpHeader(),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'Добро пожаловать на страницу поддержки!\nЕсли вы нашли ошибку в приложении, то обязательно сообщите нам!\nЭто поможет нам сделать приложении еще лучше!',
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodySmall,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                HelpPageContoller(
                  changeIndex: (int index) {
                    setState(() {
                      contentIndex = index;
                    });
                    controller.reset();
                    controller.forward();
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                _buildContent()
                    .animate(
                      controller: controller,
                      autoPlay: false,
                    )
                    .fade(
                      duration: 800.ms,
                      curve: Curves.fastEaseInToSlowEaseOut,
                    )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContent() {
    if (contentIndex == 1) {
      return Column(
        children: [
          HelpFormField(
            controller: themeController,
            hintText: 'Тема',
          ),
          const SizedBox(
            height: 20,
          ),
          HelpFormField(
            controller: problemController,
            hintText: 'Расскажи о своей проблеме',
          ),
          const SizedBox(
            height: 30,
          ),
          CustomElevatedButton(
            labelText: 'Отправить',
            onTap: () {},
          ),
        ],
      );
    }
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 200,
      decoration: BoxDecoration(
        color: TSetColor.onBackgroundColor(context),
        borderRadius: BorderRadius.circular(15),
      ),
      child: const Center(
        child: Text(
          'Пусто',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
