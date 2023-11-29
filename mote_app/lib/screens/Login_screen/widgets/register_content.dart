import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mote_app/models/register_user.dart';
import 'package:mote_app/screens/Login_screen/widgets/custom_form_field.dart';
import 'package:mote_app/screens/Login_screen/widgets/gender_choice_button.dart';
import 'package:mote_app/widgets/custom_elevated_buttom.dart';

class RegisterContent extends StatefulWidget {
  const RegisterContent({super.key});

  @override
  State<RegisterContent> createState() => _RegisterContentState();
}

class _RegisterContentState extends State<RegisterContent> {
  int genderSelector = 3;
  bool? isAcceptPrivacy = false;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final RegisterUser user = GetIt.I<RegisterUser>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        CustomFormField(
          icon: Icons.people,
          hintText: 'Имя',
          controller: nameController,
          keyboardType: TextInputType.name,
        ),
        const SizedBox(
          height: 10,
        ),
        CustomFormField(
          icon: Icons.password_outlined,
          hintText: 'Пароль',
          controller: passController,
          keyboardType: TextInputType.visiblePassword,
        ),
        const SizedBox(
          height: 10,
        ),
        CustomFormField(
          icon: Icons.phone,
          hintText: 'Номер Телефона',
          controller: phoneController,
          keyboardType: TextInputType.visiblePassword,
        ),
        const SizedBox(
          height: 10,
        ),
        CustomFormField(
          icon: Icons.email,
          hintText: 'Почта',
          controller: emailController,
          keyboardType: TextInputType.visiblePassword,
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: size.width * 0.4,
              child: CustomFormField(
                icon: Icons.numbers_outlined,
                hintText: 'Возраст',
                controller: ageController,
                keyboardType: TextInputType.visiblePassword,
              ),
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
              activeColor: theme.primaryColor,
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
        CustomElevatedButton(
          labelText: 'Зарегистрироваться',
          onTap: () {
            // _bloc.add(
            //   RegisterStartEvent(
            //     name: nameController.text.trim(),
            //     pass: passController.text.trim(),
            //     phone: phoneController.text.trim(),
            //     email: emailController.text.trim(),
            //     age: int.parse(ageController.text.trim()),
            //     gender: genderSelector == 1 ? 'Парень' : 'Девушка',
            //   ),
            // );
          },
        ),
      ],
    );
  }
}
