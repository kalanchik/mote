import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mote_app/screens/forgot_pass_screen/widgets/email_input.dart';
import 'package:mote_app/screens/forgot_pass_screen/widgets/new_pass.dart';
import 'package:mote_app/screens/forgot_pass_screen/widgets/pin_code_input.dart';

@RoutePage()
class ForgotPassScreen extends StatefulWidget {
  final String email;
  const ForgotPassScreen({super.key, required this.email});

  @override
  State<ForgotPassScreen> createState() => _ForgotPassScreenState();
}

class _ForgotPassScreenState extends State<ForgotPassScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;
  late final TextEditingController emailController;
  int pageIndex = 0;
  @override
  void initState() {
    animationController = AnimationController(vsync: this);
    animationController.value = 1;
    emailController = TextEditingController();
    emailController.text = widget.email;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: _buildContent(pageIndex),
      ),
    );
  }

  Widget _buildContent(int index) {
    final content = <Widget>[
      EmailInput(
        controller: emailController,
        changePage: (int index) {
          setState(() {
            pageIndex = index;
          });
        },
      ),
      PinCodeInput(
        changeIndex: (int index) {
          setState(() {
            pageIndex = index;
          });
        },
      ),
      const NewPass(),
    ];
    return content[index];
  }
}
