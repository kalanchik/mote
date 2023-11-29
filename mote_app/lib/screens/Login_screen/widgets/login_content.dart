import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mote_app/router/router.dart';
import 'package:mote_app/screens/Login_screen/login_bloc/login_bloc.dart';
import 'package:mote_app/screens/Login_screen/widgets/custom_divider.dart';
import 'package:mote_app/screens/Login_screen/widgets/custom_form_field.dart';
import 'package:mote_app/screens/Login_screen/widgets/vk_button.dart';
import 'package:mote_app/widgets/custom_elevated_buttom.dart';

class LoginContent extends StatefulWidget {
  const LoginContent({
    super.key,
    required this.theme,
    required this.size,
  });

  final ThemeData theme;
  final Size size;

  @override
  State<LoginContent> createState() => _LoginContentState();
}

class _LoginContentState extends State<LoginContent> {
  bool? isRemberMe = false;
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  bool isFinished = false;
  final LoginBloc _bloc = LoginBloc();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    phoneController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      bloc: _bloc,
      builder: (context, state) {
        return ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            const SizedBox(height: 30),
            CustomFormField(
              icon: Icons.email,
              hintText: 'Почта',
              controller: phoneController,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 15),
            CustomFormField(
              icon: Icons.password,
              hintText: 'Пароль',
              controller: passController,
              keyboardType: TextInputType.visiblePassword,
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(
                      activeColor: widget.theme.primaryColor,
                      value: isRemberMe,
                      onChanged: (value) {
                        setState(() {
                          isRemberMe = value;
                        });
                      },
                    ),
                    const Text('Запомнить меня'),
                  ],
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('Не помню пароль'),
                ),
              ],
            ),
            const SizedBox(height: 15),
            CustomElevatedButton(
              labelText: 'Войти',
              onTap: _addNewUser,
            ),
            const SizedBox(height: 20),
            const CustomDivider(),
            const SizedBox(height: 20),
            VkButton(size: widget.size, theme: widget.theme),
          ],
        );
      },
    );
  }

  void _addNewUser() {
    AutoRouter.of(context).pushAndPopUntil(
      const HomeRoute(),
      predicate: (route) => false,
    );
  }
}
