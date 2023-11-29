import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:mote_app/screens/Login_screen/widgets/gender_choice_button.dart';
import 'package:mote_app/screens/register_screen/bloc/register_bloc.dart';
import 'package:mote_app/utils/feedback/feedback.dart';
import 'package:mote_app/utils/setColors/setcolors.dart';
import 'package:mote_app/utils/validators/age_validator.dart';
import 'package:mote_app/utils/validators/email_validate.dart';
import 'package:mote_app/utils/validators/name_validator.dart';
import 'package:mote_app/utils/validators/password_validator.dart';
import 'package:mote_app/utils/validators/phone_validator.dart';
import 'package:mote_app/utils/validators/username_validator.dart';

@RoutePage()
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final RegisterBloc _bloc = RegisterBloc();

  final _formKey = GlobalKey<FormState>();

  int genderSelector = 3;

  bool? isAcceptPrivacy = false;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  final MaskTextInputFormatter _phoneNumberFormatter = MaskTextInputFormatter(
    mask: '+# (###) ###-##-##',
    filter: {'#': RegExp(r'[0-9]')},
  );

  final MaskTextInputFormatter _usernameFormatter = MaskTextInputFormatter(
    mask: '@##########',
    filter: {'#': RegExp(r'[a-zA-Z0-9_]')},
  );

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<RegisterBloc, RegisterState>(
        bloc: _bloc,
        builder: (context, state) {
          return KeyboardDismissOnTap(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            'Регистрация',
                            style: theme.textTheme.headlineLarge,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: TextFormField(
                              controller: nameController,
                              textInputAction: TextInputAction.next,
                              textCapitalization: TextCapitalization.words,
                              decoration: const InputDecoration(
                                labelText: 'Имя',
                              ),
                              validator: RussianNameValidator.validate,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              keyboardType: TextInputType.name,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: TextFormField(
                              controller: usernameController,
                              textInputAction: TextInputAction.next,
                              decoration: const InputDecoration(
                                labelText: 'Никнейм',
                              ),
                              inputFormatters: [_usernameFormatter],
                              validator: UsernameValidator.validate,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              keyboardType: TextInputType.name,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            TextButton(
                              style: TextButton.styleFrom(
                                padding: const EdgeInsets.all(0),
                              ),
                              onPressed: () {
                                passController.text = generatePassword();
                              },
                              child: const Text('Придумать пароль'),
                            ),
                          ],
                        ),
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Пароль',
                        ),
                        textInputAction: TextInputAction.next,
                        controller: passController,
                        validator: PasswordValidator.validate,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        keyboardType: TextInputType.visiblePassword,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Номер Телефона',
                        ),
                        textInputAction: TextInputAction.next,
                        controller: phoneController,
                        inputFormatters: [_phoneNumberFormatter],
                        validator: RussianPhoneNumberValidator.validate,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        keyboardType: TextInputType.phone,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Почта',
                        ),
                        controller: emailController,
                        textInputAction: TextInputAction.next,
                        validator: EmailValidator.validate,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Возраст',
                              ),
                              textInputAction: TextInputAction.done,
                              validator: AgeValidator.validate,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              controller: ageController,
                              keyboardType: TextInputType.number,
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          GenderChoiceButton(
                            changeGender: (int index) {
                              setState(() {
                                genderSelector = index;
                              });
                            },
                            getGender: () => genderSelector,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: isAcceptPrivacy,
                            onChanged: (value) {
                              setState(() {
                                isAcceptPrivacy = value;
                              });
                            },
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          const Text('Пользовательское соглашение'),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                _registerButton(state, context);
                              },
                              child: _buildButton(state, context),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _registerButton(RegisterState state, BuildContext context) {
    if (state is RegisterStart) return;
    print('Нажато');
    if (_formKey.currentState!.validate()) {
      if (genderSelector == 3) {
        FeedBack.showToast(complete: false, msg: 'Выберите свой  пол');
        return;
      }
      _bloc.add(
        RegisterStartEvent(
          name: nameController.text.trim(),
          username: usernameController.text.trim(),
          pass: passController.text.trim(),
          phone: phoneController.text.trim(),
          email: emailController.text.trim(),
          age: int.parse(ageController.text),
          gender: genderSelector == 1 ? 'М' : 'Ж',
          context: context,
        ),
      );
    }
  }
}

Widget _buildButton(RegisterState state, BuildContext context) {
  if (state is RegisterStart) {
    return LoadingAnimationWidget.twoRotatingArc(
      color: TSetColor.buttonTextColor(context),
      size: 17,
    );
  }
  return const Text('Зарегистрироваться');
}
