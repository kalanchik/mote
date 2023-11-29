import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:mote_app/screens/settings_details/widgets/change_account.dart';
import 'package:mote_app/screens/settings_details/widgets/change_password.dart';
import 'package:mote_app/screens/settings_details/widgets/change_pavicy.dart';

@RoutePage()
class SettingsDetailsScreen extends StatefulWidget {
  final int widgetKey;
  const SettingsDetailsScreen({super.key, required this.widgetKey});

  @override
  State<SettingsDetailsScreen> createState() => _SettingsDetailsScreenState();
}

class _SettingsDetailsScreenState extends State<SettingsDetailsScreen> {
  final contents = <int, Widget>{
    0: const ChangeAccountContent(),
    1: const ChangePasswordContent(),
    2: const ChangePrivacyContent(),
  };
  @override
  Widget build(BuildContext context) {
    return contents[widget.widgetKey]!;
  }
}
