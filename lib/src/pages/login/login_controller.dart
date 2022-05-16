import 'package:flutter/material.dart';
import 'package:flutter_delivery_app/src/provide/users_provide.dart';
import 'package:flutter_delivery_app/src/models/response_api.dart';
import 'package:flutter_delivery_app/src/utils/my_snakbar.dart';
import 'package:flutter_delivery_app/src/utils/shared_pref.dart';

import '../../models/user.dart';

class LoginController {
  BuildContext context;
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  UserProvider userProvider = new UserProvider();
  SharedPref _sharePref = new SharedPref();

  Future init(BuildContext context) async {
    this.context = context;
    await userProvider.init(context);
    User user = User.fromJson(await _sharePref.read('user') ?? {});
    if (user?.sessionToken != null) {
      Navigator.pushAndRemoveUntil(
          context, 'cliente/products/list', (route) => false);
    }
  }

  void goToRegisterPage() {
    Navigator.pushNamed(context, 'register');
  }

  void login() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    ResponseApi responseApi = await userProvider.login(email, password);

    if (responseApi.success) {
      User user = User.fromJson(responseApi.data);
      _sharePref.save('user', user.toJson());
      Navigator.pushNamedAndRemoveUntil(
          context, 'cliente/products/list', (route) => false);
    } else {
      MySnackbar.show(context, responseApi.message);
    }
  }
}
