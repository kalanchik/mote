import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:mote_app/models/constants.dart';
import 'package:mote_app/screens/company_info/widgets/Info_tile.dart';
import 'package:mote_app/screens/company_info/widgets/company_header.dart';
import 'package:mote_app/screens/main_screens/news_screen/widget/news_drawer.dart';
import 'package:mote_app/utils/setColors/setcolors.dart';

@RoutePage()
class CompanyInfoScreen extends StatefulWidget {
  const CompanyInfoScreen({super.key});

  @override
  State<CompanyInfoScreen> createState() => _CompanyInfoScreenState();
}

class _CompanyInfoScreenState extends State<CompanyInfoScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: TSetColor.backgroundColor(context),
      ),
    );
    return Scaffold(
      drawer: NewsDrawer(drawerIndex: 9, changeIndex: (index) {}),
      appBar: AppBar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: AnimateList(
            interval: 150.ms,
            effects: [
              FadeEffect(
                duration: 400.ms,
                curve: Curves.fastEaseInToSlowEaseOut,
              ),
              SlideEffect(
                duration: 400.ms,
                curve: Curves.fastEaseInToSlowEaseOut,
              ),
            ],
            children: [
              const CompanyHeader(),
              const SizedBox(
                height: 15,
              ),
              const InfoTile(
                header: 'Наша история',
                body: Constants.about1,
              ),
              const InfoTile(
                header: 'Инсайты и проблемы существующих приложений',
                body: Constants.about2,
              ),
              const InfoTile(
                header: 'Идея Mote',
                body: Constants.about3,
              ),
              const InfoTile(
                header: '"Meet by Mote" - Встречайте с особым смыслом',
                body: Constants.about4,
              ),
              const InfoTile(
                header: 'Дальнейшее развитие Mote',
                body: Constants.about5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
