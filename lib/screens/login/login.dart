import 'package:fast_credit/screens/login/login_viewmodel.dart';
import 'package:fast_credit/screens/login/widget.dart';
import 'package:fast_credit/utils/colors.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool enableTextFields = true;

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<LoginViewModel>.withConsumer(
        viewModelBuilder: () => LoginViewModel(),
        onModelReady: (model) {},
        builder: (context, model, child) {
          return Scaffold(
            backgroundColor: AppColors.white,
            body: LoginWidgets().content(context,model,emailController, passwordController,_formKey),
          );
        });
  }
}
