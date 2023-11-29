import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:mote_app/screens/Login_screen/login_bloc/login_bloc.dart';
import 'package:mote_app/screens/Login_screen/widgets/login_action.dart';
import 'package:mote_app/screens/Login_screen/widgets/login_body.dart';
import 'package:mote_app/screens/Login_screen/widgets/login_header.dart';
import 'package:mote_app/utils/feedback/feedback.dart';
import 'package:mote_app/utils/setColors/setcolors.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isRememberMe = false;

  final emailController = TextEditingController();
  final passController = TextEditingController();

  late final LoginBloc _bloc;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _bloc = LoginBloc();
    _bloc.add(LoginAuthCheckEvent(context: context));
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: TSetColor.backgroundColor(context),
    ));
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return Scaffold(
      body: BlocBuilder<LoginBloc, LoginState>(
        bloc: _bloc,
        builder: (context, state) {
          if (state is LoginAuthState || state is LoginCheckState) {
            return Center(
              child: LoadingAnimationWidget.twoRotatingArc(
                color: Theme.of(context).primaryColor,
                size: 50,
              ),
            );
          }
          return ListView(
            children: [
              SizedBox(
                height: size.height * 0.05,
              ),
              LoginHeader(theme: theme),
              const SizedBox(
                height: 30,
              ),
              Form(
                key: _formKey,
                child: LoginBody(
                  theme: theme,
                  isRememberMe: isRememberMe,
                  emailController: emailController,
                  passController: passController,
                  onChanged: (bool? value) {
                    setState(() {
                      isRememberMe = value!;
                    });
                  },
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              LoginAction(
                onLogin: () {
                  if (_formKey.currentState!.validate()) {
                    _bloc.add(LoginAuthEvent(
                      context: context,
                      username: emailController.text.trim(),
                      password: passController.text.trim(),
                    ));
                    return;
                  }
                  FeedBack.showToast(
                    complete: false,
                    msg: 'Не все поля заполнены верно',
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
